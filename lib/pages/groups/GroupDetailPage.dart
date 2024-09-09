import 'package:flutter/material.dart';
import 'package:todo_app/pages/groups/Creategrouptaskpage.dart';
import '../../../models/group.dart';
import '../../../models/task_model.dart';
import '../../../models/user.dart';
import '../../../services/api_service.dart';

class GroupDetailPage extends StatefulWidget {
  final Group group;

  const GroupDetailPage({Key? key, required this.group}) : super(key: key);

  @override
  _GroupDetailPageState createState() => _GroupDetailPageState();
}

class _GroupDetailPageState extends State<GroupDetailPage> {
  late Future<List<Task>> tasksFuture;
  late Future<List<User>> membersFuture;

  final ApiService _apiService = ApiService();

  @override
  void initState() {
    super.initState();
    tasksFuture =
        _apiService.fetchTasks(widget.group.taskIds); // Use instance method
    membersFuture =
        _apiService.fetchMembers(widget.group.memberIds); // Use instance method
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.group.name),
      ),
      body: Row(
        children: [
          Expanded(
            flex: 2,
            child: FutureBuilder<List<Task>>(
              future: tasksFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No tasks found'));
                } else {
                  final tasks = snapshot.data!;
                  return ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      final task = tasks[index];
                      return ListTile(
                        title: Text(task.task),
                        subtitle: Text(task.description ?? 'No description'),
                        trailing: task.completed
                            ? const Icon(Icons.check, color: Colors.green)
                            : const Icon(Icons.close, color: Colors.red),
                      );
                    },
                  );
                }
              },
            ),
          ),
          const VerticalDivider(),
          Expanded(
            flex: 1,
            child: FutureBuilder<List<User>>(
              future: membersFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No members found'));
                } else {
                  final members = snapshot.data!;
                  return ListView.builder(
                    itemCount: members.length,
                    itemBuilder: (context, index) {
                      final member = members[index];
                      return ListTile(
                        title: Text(member.name),
                        // subtitle: Text(member.),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  CreategroupTaskPage(groupId: widget.group.id),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
