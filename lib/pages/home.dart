// import 'package:flutter/material.dart';
// import 'package:todo_app/models/group.dart';
// import '../services/api_service.dart';

// class Home extends StatefulWidget {
//   @override
//   _HomeState createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   final ApiService _apiService = ApiService();
//   late Future<List<Group>> _groups;

//   @override
//   void initState() {
//     super.initState();
//     _groups = _apiService.getGroups();
//   }

//   void _createGroup() {
//     // Navigate to create group screen
//     Navigator.pushNamed(context, '/createGroup');
//   }

//   void _viewGroupTasks(String groupId) {
//     // Navigate to group tasks screen
//     print(groupId);
//     Navigator.pushNamed(context, '/groupTasks', arguments: groupId);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Home')),
//       body: FutureBuilder<List<Group>>(
//         future: _groups,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Errorrr: ${snapshot.error}'));
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return Center(child: Text('No groups found'));
//           } else {
//             return ListView.builder(
//               itemCount: snapshot.data!.length,
//               itemBuilder: (context, index) {
//                 final group = snapshot.data![index];
//                 return ListTile(
//                   title: Text(group.name),
//                   onTap: () => _viewGroupTasks(group.id),
//                 );
//               },
//             );
//           }
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _createGroup,
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:todo_app/models/group.dart';
import '../services/api_service.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ApiService _apiService = ApiService();
  late Future<List<Group>> _groups;

  @override
  void initState() {
    super.initState();
    _groups = _apiService.getGroups();
  }

  void _createGroup() {
    // Navigate to create group screen
    Navigator.pushNamed(context, '/createGroup');
  }

  void _viewGroupTasks(String groupId) {
    // Navigate to group tasks screen
    print(groupId);
    Navigator.pushNamed(context, '/groupTasks', arguments: groupId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: FutureBuilder<List<Group>>(
        future: _groups,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No groups found'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final group = snapshot.data![index];
                return ListTile(
                  title: Text(group.name),
                  onTap: () => _viewGroupTasks(group.id),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _createGroup,
        child: Icon(Icons.add),
      ),
    );
  }
}
