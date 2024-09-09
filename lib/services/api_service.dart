import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../models/group.dart';
import '../models/task_model.dart';
import '../models/user.dart';

class ApiService {
  // static const String baseUrl = 'https://todo-nodejs-server.onrender.com';
  static const String baseUrl = 'https://todo-nodejs-server.onrender.com';
  final storage = FlutterSecureStorage();

  Future<String?> getToken() async {
    return await storage.read(key: 'jwt');
  }

  Future<void> setToken(String token) async {
    await storage.write(key: 'token', value: token);
  }

  Future<void> removeToken() async {
    await storage.delete(key: 'token');
  }

  Future<http.Response> register(
      String name, String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/register'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'name': name,
        'email': email,
        'password': password,
      }),
    );
    return response;
  }

  Future<http.Response> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      await setToken(jsonResponse['accessToken']);
    }
    return response;
  }

  Future<List<User>> getAllUsers() async {
    String? token = await getToken();
    if (token == null) {
      throw Exception('Token is null');
    }

    final response = await http.get(
      Uri.parse('$baseUrl/getalluser'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> usersJson = jsonDecode(response.body);
      List<User> users =
          usersJson.map((userJson) => User.fromJson(userJson)).toList();
      return users;
    } else {
      throw Exception('Failed to load users');
    }
  }

  Future<http.Response> getUserInfo() async {
    final token = await getToken();

    if (token == null) {
      throw Exception('Token not found');
    }

    final response = await http.get(
      Uri.parse('$baseUrl/user'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed to load user info');
    }
  }

  Future<List<Group>> getGroups() async {
    try {
      String? token = await getToken();
      if (token == null) {
        throw Exception('Token is null');
      }

      final response = await http.get(
        Uri.parse('$baseUrl/groups'),
        headers: <String, String>{
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        var groupsJson = jsonDecode(response.body) as List;
        List<Group> groups =
            groupsJson.map((groupJson) => Group.fromJson(groupJson)).toList();
        return groups;
      } else if (response.statusCode == 403) {
        // Handle forbidden error (optional)
        throw Exception(
            'Forbidden: User does not have permission to access groups');
      } else {
        print('Error fetching groups: ${response.body}');
        throw Exception('Failed to load groups');
      }
    } catch (e) {
      print('Exception during group fetching: $e');
      throw Exception('Failed to load groups');
    }
  }

  Future<List<Task>> getUserTodos() async {
    String? token = await getToken();
    if (token == null) {
      throw Exception('Token is null');
    }

    final response = await http.get(
      Uri.parse('$baseUrl/todos'),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      try {
        var todosJson = jsonDecode(response.body) as List<dynamic>;
        // print('Todos JSON: $todosJson'); // Debugging output
        return todosJson
            .map((todoJson) => Task.fromJson(todoJson as Map<String, dynamic>))
            .toList();
      } catch (e) {
        print('Error parsing todo JSON: $e');
        throw Exception('Failed to parse user todos');
      }
    } else {
      print('Error fetching user todos: ${response.body}');
      throw Exception('Failed to load user todos');
    }
  }

  Future<List<Task>> fetchTasks(List<String> userIds) async {
    String? token = await getToken();
    if (token == null) {
      throw Exception('Token is null');
    }

    final List<Task> allTasks = [];

    // Loop through each userId and fetch tasks
    for (String userId in userIds) {
      final response = await http.get(
        Uri.parse('$baseUrl/todos?user=$userId'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        try {
          var tasksJson = jsonDecode(response.body) as List<dynamic>;
          print('Tasks JSON for $userId: $tasksJson'); // Debugging output
          List<Task> tasks = tasksJson
              .map(
                  (taskJson) => Task.fromJson(taskJson as Map<String, dynamic>))
              .toList();
          allTasks.addAll(tasks);
        } catch (e) {
          print('Error parsing JSON: $e');
          throw Exception('Failed to parse tasks');
        }
      } else {
        print('Error fetching tasks for $userId: ${response.body}');
        throw Exception('Failed to load tasks');
      }
    }

    return allTasks;
  }

  Future<List<User>> fetchMembers(List<String> memberIds) async {
    String? token = await getToken();
    if (token == null) {
      throw Exception('Token is null');
    }

    // Prepare a list to store User objects
    List<User> members = [];

    // Loop through each member ID and fetch details
    for (String memberId in memberIds) {
      final response = await http.get(
        Uri.parse('$baseUrl/user?id=$memberId'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        try {
          var memberJson = jsonDecode(response.body) as Map<String, dynamic>;
          print('Member JSON: $memberJson'); // Debugging output
          // Assuming you have a User.fromJson method to convert JSON to User object
          User member = User.fromJson(memberJson);
          members.add(member);
        } catch (e) {
          print('Error parsing JSON: $e');
          throw Exception('Failed to parse members');
        }
      } else {
        print(
            'Error fetching member details for ID $memberId: ${response.body}');
        throw Exception('Failed to load member details');
      }
    }

    return members;
  }

  Future<List<Task>> getGroupTasks(String groupId) async {
    String? token = await getToken();
    if (token == null) {
      throw Exception('Token is null');
    }

    final response = await http.get(
      Uri.parse('$baseUrl/groups/$groupId/tasks'),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      try {
        var tasksJson = jsonDecode(response.body) as List<dynamic>;
        print('Tasks JSON: $tasksJson'); // Debugging output
        return tasksJson
            .map((taskJson) => Task.fromJson(taskJson as Map<String, dynamic>))
            .toList();
      } catch (e) {
        print('Error parsing JSON: $e');
        throw Exception('Failed to parse group tasks');
      }
    } else {
      print('Error fetching group tasks: ${response.body}');
      throw Exception('Failed to load group tasks');
    }
  }

  Future<http.Response> createGroup(String name, List<String> members) async {
    String? token = await getToken();
    if (token == null) {
      throw Exception('Token is null');
    }

    final response = await http.post(
      Uri.parse('$baseUrl/groups'),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        'name': name,
        'members': members,
      }),
    );
    return response;
  }

  Future<void> signOut() async {
    await storage.delete(key: 'jwt_token');
    // You might want to perform additional cleanup or logout logic here
  }

  //  Future<List<String>> fetchNearbyPlaces(String location, String type) async {
  //   final response = await http.get(Uri.parse('$baseUrl/nearbysearch/$location/$type'));

  //   if (response.statusCode == 200) {
  //     final data = json.decode(response.body) as List;
  //     return data.map((place) => place['name'] as String).toList();
  //   } else {
  //     throw Exception('Failed to load nearby places');
  //   }
  // }
  Future<List<Map<String, dynamic>>> fetchNearbyPlaces(
      String location, String type) async {
    final response =
        await http.get(Uri.parse('$baseUrl/nearbysearch/$location/$type'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List;
      List<Map<String, dynamic>> places = [];

      data.forEach((place) {
        String name = place['name'] as String;
        double lat = place['geometry']['location']['lat'] as double;
        double lng = place['geometry']['location']['lng'] as double;

        places.add({
          'name': name,
          'latitude': lat,
          'longitude': lng,
        });
      });

      return places;
    } else {
      throw Exception('Failed to load nearby places');
    }
  }
}
