// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:url_launcher/url_launcher.dart';

// import '../../services/api_service.dart';

// class MapScreen extends StatefulWidget {
//   @override
//   _MapScreenState createState() => _MapScreenState();
// }

// class _MapScreenState extends State<MapScreen> {
//   final TextEditingController _typeController = TextEditingController();
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
//       String type = _typeController.text.trim();
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
//         print(googleMapsUrl);
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
//             TextField(
//               controller: _typeController,
//               decoration: const InputDecoration(
//                 labelText: 'Type (e.g., hotel, restaurant)',
//               ),
//             ),
//             const SizedBox(height: 16),
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
//                               place['latitude'],
//                               place['longitude'],
//                             );
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
import 'package:url_launcher/url_launcher.dart';

import '../../services/api_service.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final ApiService apiService = ApiService();
  List<Map<String, dynamic>> _places = [];
  bool _isLoading = false;
  Position? _currentPosition;
  String? _selectedType; // To store the selected place type

  final List<String> _placeTypes = [
    "locality",
    "political",
    "transit_station",
    "point_of_interest",
    "establishment",
    "bank",
    "finance",
    "lodging",
    "school",
    "university",
    "health",
    "hindu_temple",
    "place_of_worship",
    "store",
    "restaurant",
    "food",
    "atm",
    "jewelry_store",
    "sublocality_level_1",
    "sublocality"
  ];

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
    });
  }

  void _fetchNearbyPlaces() async {
    if (_currentPosition == null) {
      print('Current location is not available.');
      return;
    }

    if (_selectedType == null) {
      print('Place type is not selected.');
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      String location =
          '${_currentPosition!.latitude},${_currentPosition!.longitude}';
      String type = _selectedType!;
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DropdownButton<String>(
              value: _selectedType,
              hint: Text('Select Place Type'),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedType = newValue;
                });
              },
              items: _placeTypes.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _fetchNearbyPlaces,
              child: const Text('Search'),
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
      ),
    );
  }
}
