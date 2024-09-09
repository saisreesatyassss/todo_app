// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:url_launcher/url_launcher.dart';
// import '../../services/api_service.dart';

// class MapScreenReq extends StatefulWidget {
//   final String type; // The type value passed from the parent widget

//   MapScreenReq({required this.type});

//   @override
//   _MapScreenReqState createState() => _MapScreenReqState();
// }

// class _MapScreenReqState extends State<MapScreenReq> {
//   final ApiService apiService = ApiService();
//   List<Map<String, dynamic>> _places = [];
//   bool _isLoading = false;
//   Position? _currentPosition;

//   @override
//   void initState() {
//     super.initState();
//     _getCurrentLocation();
//   }

//   void _getCurrentLocation() async {
//     bool serviceEnabled;
//     LocationPermission permission;

//     // Check if location services are enabled
//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       // Location services are not enabled, request user to enable it
//       return;
//     }

//     // Check for location permissions
//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         // Permissions are denied, return
//         return;
//       }
//     }

//     if (permission == LocationPermission.deniedForever) {
//       // Permissions are denied forever, return
//       return;
//     }

//     // Get the current location
//     Position position = await Geolocator.getCurrentPosition();
//     setState(() {
//       _currentPosition = position;
//     });
//   }

//   void _fetchNearbyPlaces() async {
//     if (_currentPosition == null) {
//       print('Current location is not available.');
//       return;
//     }

//     setState(() {
//       _isLoading = true;
//     });

//     try {
//       String location =
//           '${_currentPosition!.latitude},${_currentPosition!.longitude}';
//       String type = widget.type; // Use the type passed from the parent widget
//       final places = await apiService.fetchNearbyPlaces(location, type);

//       setState(() {
//         _places = places;
//         _isLoading = false;
//       });
//     } catch (error) {
//       setState(() {
//         _isLoading = false;
//       });
//       print('Error fetching places: $error');
//     }
//   }

//   Future<void> _launchGoogleMaps(double lat, double lng) async {
//     final String googleMapsUrl =
//         'https://www.google.com/maps/dir/?api=1&destination=$lat,$lng';
//     print(googleMapsUrl);
//     try {
//       if (await canLaunch(googleMapsUrl)) {
//         await launch(googleMapsUrl);
//       } else {
//         throw 'Could not launch $googleMapsUrl';
//       }
//     } catch (e) {
//       print('Error launching Google Maps: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Nearby Places'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             ElevatedButton(
//               onPressed: _fetchNearbyPlaces,
//               child: const Text('Search'),
//             ),
//             const SizedBox(height: 16),
//             _isLoading
//                 ? const Center(child: CircularProgressIndicator())
//                 : Expanded(
//                     child: ListView.builder(
//                       itemCount: _places.length,
//                       itemBuilder: (context, index) {
//                         final place = _places[index];
//                         return ListTile(
//                           title: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(place['name']),
//                               Text(
//                                 'Latitude: ${place['latitude']}, Longitude: ${place['longitude']}',
//                                 style: const TextStyle(fontSize: 12),
//                               ),
//                             ],
//                           ),
//                           onTap: () {
//                             _launchGoogleMaps(
//                                 place['latitude'], place['longitude']);
//                           },
//                         );
//                       },
//                     ),
//                   ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../services/api_service.dart';

class MapScreenReq extends StatefulWidget {
  final String type; // The type value passed from the parent widget

  MapScreenReq({required this.type});

  @override
  _MapScreenReqState createState() => _MapScreenReqState();
}

class _MapScreenReqState extends State<MapScreenReq> {
  final ApiService apiService = ApiService();
  List<Map<String, dynamic>> _places = [];
  bool _isLoading = false;
  Position? _currentPosition;
  late GoogleMapController _mapController;
  late CameraPosition _initialCameraPosition;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  void _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled, request user to enable it
      return;
    }

    // Check for location permissions
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, return
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, return
      return;
    }

    // Get the current location
    Position position = await Geolocator.getCurrentPosition();
    setState(() {
      _currentPosition = position;
      _initialCameraPosition = CameraPosition(
        target: LatLng(position.latitude, position.longitude),
        zoom: 14,
      );
    });
  }

  void _fetchNearbyPlaces() async {
    if (_currentPosition == null) {
      print('Current location is not available.');
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      String location =
          '${_currentPosition!.latitude},${_currentPosition!.longitude}';
      String type = widget.type; // Use the type passed from the parent widget
      final places = await apiService.fetchNearbyPlaces(location, type);

      setState(() {
        _places = places;
        _isLoading = false;
      });
    } catch (error) {
      setState(() {
        _isLoading = false;
      });
      print('Error fetching places: $error');
    }
  }

  Future<void> _launchGoogleMaps(double lat, double lng) async {
    final String googleMapsUrl =
        'https://www.google.com/maps/dir/?api=1&destination=$lat,$lng';
    print(googleMapsUrl);
    try {
      if (await canLaunch(googleMapsUrl)) {
        await launch(googleMapsUrl);
      } else {
        throw 'Could not launch $googleMapsUrl';
      }
    } catch (e) {
      print('Error launching Google Maps: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nearby Places'),
      ),
      body: _currentPosition == null
          ? const Center(child: CircularProgressIndicator())
          : Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: 300,
                  child: GoogleMap(
                    initialCameraPosition: _initialCameraPosition,
                    myLocationEnabled: true,
                    onMapCreated: (GoogleMapController controller) {
                      _mapController = controller;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: _fetchNearbyPlaces,
                    child: const Text('Search'),
                  ),
                ),
                const SizedBox(height: 16),
                _isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : Expanded(
                        child: ListView.builder(
                          itemCount: _places.length,
                          itemBuilder: (context, index) {
                            final place = _places[index];
                            return ListTile(
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(place['name']),
                                  Text(
                                    'Latitude: ${place['latitude']}, Longitude: ${place['longitude']}',
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                              onTap: () {
                                _launchGoogleMaps(
                                    place['latitude'], place['longitude']);
                              },
                            );
                          },
                        ),
                      ),
              ],
            ),
    );
  }
}
