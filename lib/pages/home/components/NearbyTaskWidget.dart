import 'package:flutter/material.dart';

import '../../maps/nearbytask.dart';

class NearbyTaskWidget extends StatefulWidget {
  @override
  _NearbyTaskWidgetState createState() => _NearbyTaskWidgetState();
}

class _NearbyTaskWidgetState extends State<NearbyTaskWidget> {
  bool _isVisible = true;

  void _closeWidget() {
    setState(() {
      _isVisible = false;
    });
  }

  void _openNearbyTask() {
    // Navigate to the NearByTask page
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => NearbyTasksPage()));
    print("Open NearByTask Page"); // Replace this with navigation code
  }

  @override
  Widget build(BuildContext context) {
    return _isVisible
        ? Container(
            padding: EdgeInsets.all(16.0),
            margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'You have a nearby task!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        'Open NearByTask to view details.',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.close, color: Colors.white),
                  onPressed: _closeWidget,
                ),
                TextButton(
                  onPressed: _openNearbyTask,
                  child: Text(
                    'Open',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          )
        : Container();
  }
}
