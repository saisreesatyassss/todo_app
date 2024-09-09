// import 'package:flutter/material.dart';
// import 'package:http/src/response.dart';
// import 'package:todo_app/models/group.dart';
// import 'package:todo_app/models/user.dart';
// import 'package:todo_app/services/api_service.dart';

// class GroupsWidget extends StatefulWidget {
//   final ApiService apiService = ApiService();

//   @override
//   _GroupsWidgetState createState() => _GroupsWidgetState();
// }

// class _GroupsWidgetState extends State<GroupsWidget> {
//   final TextEditingController _groupNameController = TextEditingController();
//   List<String> selectedMembers = []; // List to store selected member IDs
//   List<User> allUsers = []; // List to store all users fetched from API

//   @override
//   void initState() {
//     super.initState();
//     fetchAllUsers();
//   }

//   Future<void> fetchAllUsers() async {
//     try {
//       List<User> users = await widget.apiService.getAllUsers();
//       setState(() {
//         allUsers = users;
//       });
//     } catch (error) {
//       print('Error fetching users: $error');
//       // Handle error if needed
//     }
//   }

//   void addOrRemoveMember(String memberId) {
//     if (selectedMembers.contains(memberId)) {
//       setState(() {
//         selectedMembers.remove(memberId);
//       });
//     } else {
//       setState(() {
//         selectedMembers.add(memberId);
//       });
//     }
//   }

//   Future<void> createGroup() async {
//     String groupName = _groupNameController.text.trim();
//     if (groupName.isEmpty || selectedMembers.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Please enter group name and select members')),
//       );
//       return;
//     }

//     try {
//       // Send request to create group
//       Response newGroup =
//           await widget.apiService.createGroup(groupName, selectedMembers);
//       // Optionally, navigate to a new screen or show a success message
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Group created successfully')),
//       );
//     } catch (error) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Failed to create group: $error')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Create Group')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             TextField(
//               controller: _groupNameController,
//               decoration: InputDecoration(labelText: 'Group Name'),
//             ),
//             SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: () {
//                 showModalBottomSheet(
//                   context: context,
//                   builder: (BuildContext context) {
//                     return ListView.builder(
//                       itemCount: allUsers.length,
//                       itemBuilder: (context, index) {
//                         User user = allUsers[index];
//                         bool isSelected = selectedMembers.contains(user.id);
//                         return ListTile(
//                           title: Text(user.name),
//                           subtitle: Text(user.email),
//                           trailing: IconButton(
//                             icon: Icon(
//                                 isSelected ? Icons.check_circle : Icons.circle),
//                             onPressed: () {
//                               addOrRemoveMember(user.id);
//                             },
//                           ),
//                         );
//                       },
//                     );
//                   },
//                 );
//               },
//               child: Text('Select Members'),
//             ),
//             SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: createGroup,
//               child: Text('Create Group'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:todo_app/models/group.dart';
import 'package:todo_app/models/user.dart';
import 'package:todo_app/services/api_service.dart';

class GroupsWidget extends StatefulWidget {
  final ApiService apiService = ApiService();

  @override
  _GroupsWidgetState createState() => _GroupsWidgetState();
}

class _GroupsWidgetState extends State<GroupsWidget> {
  final TextEditingController _groupNameController = TextEditingController();
  List<String> selectedMembers = []; // List to store selected member IDs
  List<User> allUsers = []; // List to store all users fetched from API

  @override
  void initState() {
    super.initState();
    fetchAllUsers();
  }

  Future<void> fetchAllUsers() async {
    try {
      List<User> users = await widget.apiService.getAllUsers();
      setState(() {
        allUsers = users;
      });
    } catch (error) {
      print('Error fetching users: $error');
      // Handle error if needed
    }
  }

  void toggleMemberSelection(String memberId) {
    setState(() {
      if (selectedMembers.contains(memberId)) {
        selectedMembers.remove(memberId);
      } else {
        selectedMembers.add(memberId);
      }
    });
  }

  Future<void> createGroup() async {
    String groupName = _groupNameController.text.trim();
    if (groupName.isEmpty || selectedMembers.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter group name and select members')),
      );
      return;
    }

    try {
      // Send request to create group
      Response response =
          await widget.apiService.createGroup(groupName, selectedMembers);
      if (response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Group created successfully')),
        );
        // Optionally, navigate to a new screen after group creation
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to create group')),
        );
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to create group: $error')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create Group')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _groupNameController,
              decoration: InputDecoration(labelText: 'Group Name'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return ListView.builder(
                      itemCount: allUsers.length,
                      itemBuilder: (context, index) {
                        User user = allUsers[index];
                        bool isSelected = selectedMembers.contains(user.id);
                        return ListTile(
                          title: Text(user.name),
                          subtitle: Text(user.email),
                          trailing: IconButton(
                            icon: Icon(
                              isSelected
                                  ? Icons.check_circle
                                  : Icons.circle_outlined,
                              color: isSelected ? Colors.green : null,
                            ),
                            onPressed: () {
                              toggleMemberSelection(
                                  user.id); // Toggle selection on tap
                            },
                          ),
                          onTap: () {
                            toggleMemberSelection(
                                user.id); // Toggle selection on tap
                            Navigator.pop(
                                context); // Close bottom sheet after selection
                          },
                        );
                      },
                    );
                  },
                );
              },
              child: Text('Select Members'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: createGroup,
              child: Text('Create Group'),
            ),
          ],
        ),
      ),
    );
  }
}
