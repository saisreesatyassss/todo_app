import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../models/group.dart';
import '../models/task_model.dart';

class ApiService {
  static const String baseUrl =
      'http://192.168.1.7:3000'; // Update this with your actual server address
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

  // Future<Group> getGroupTasks(String groupId) async {
  //   String? token = await getToken();
  //   if (token == null) {
  //     throw Exception('Token is null');
  //   }

  //   final response = await http.get(
  //     Uri.parse('$baseUrl/groups/$groupId/tasks'),
  //     headers: <String, String>{
  //       'Authorization': 'Bearer $token',
  //     },
  //   );

  //   if (response.statusCode == 200) {
  //     var groupJson = jsonDecode(response.body) as Map<String, dynamic>;
  //     print('Group JSON: $groupJson'); // Debugging output

  //     return Group.fromJson(groupJson);
  //   } else {
  //     throw Exception('Failed to load group tasks');
  //   }
  // }
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
}
