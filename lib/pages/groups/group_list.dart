
import 'package:flutter/material.dart';
import '../../models/group.dart';
import '../../services/responsive.dart';
import '../../services/api_service.dart';
import 'group_detail_container.dart';

class GroupList extends StatelessWidget {
  const GroupList({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Group>>(
      future: ApiService().getGroups(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No groups found'));
        } else {
          List<Group> groups = snapshot.data!;

          return Responsive(
            tablet: Grid(
              crossAsis: 2,
              ratio: 3,
              groups: groups,
              ind: index,
            ),
            largeTablet: Grid(
              crossAsis: 3,
              ratio: 3,
              groups: groups,
              ind: index,
            ),
            mobile: Grid(
              ratio: 3,
              crossAsis: 1,
              groups: groups,
              ind: index,
            ),
          );
        }
      },
    );
  }
}

class Grid extends StatelessWidget {
  final int crossAsis;
  final double ratio;
  final int ind;
  final List<Group> groups;

  Grid({
    Key? key,
    required this.crossAsis,
    required this.ratio,
    required this.groups,
    required this.ind,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Group> groupList = groups;

    return groupList.isEmpty
        ? const Center(
            child: Text(
              'No Group Today',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        : GridView.builder(
            padding: const EdgeInsets.only(top: 40),
            itemCount: groupList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAsis,
              childAspectRatio: ratio,
            ),
            itemBuilder: (context, index) {
              Group group = groupList[index];
              return GroupDetailContainer(
                ind: ind,
                group: group,
              );
            },
          );
  }
}
