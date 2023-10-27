import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMaptest extends StatefulWidget {
  const GoogleMaptest({Key? key}) : super(key: key);

  @override
  _GoogleMapTestState createState() => _GoogleMapTestState();
}

class _GoogleMapTestState extends State<GoogleMaptest> {
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();
  final TextEditingController _locationController = TextEditingController(); // حقل إدخال الموقع
  CameraPosition _initialCameraPosition = CameraPosition(
    target: LatLng(35.542051, 35.802515),
    zoom: 14.0,
  );

  @override
  void dispose() {
    _locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.82,
                  width: MediaQuery.of(context).size.width,
                  child: GoogleMap(
                    zoomGesturesEnabled: true,
                    zoomControlsEnabled: true,
                    mapType: MapType.hybrid,
                    initialCameraPosition: _initialCameraPosition,
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                    onTap: (LatLng latLng) {
                      _updateLocation(latLng); // تحديث الموقع عند النقر على الخريطة
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.02),
            TextField(
              cursorColor: const Color(0xE7E7600D),
              controller: _locationController,
              decoration: InputDecoration(
                labelText: 'Location',
                labelStyle: TextStyle(
                    color: Colors.orange,
                    fontSize: 22
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(
                    color: Colors.orange,
                  ),
                ),
                prefixIcon: Icon(
                  Icons.location_on,
                  color: Colors.orange,
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  color: Colors.orange,
                  onPressed: () {
                    setState(() {
                      _locationController.clear(); // مسح المحتوى عند الضغط على الأيقونة
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToInitialLocation,
        label: const Text('Show original site', style: TextStyle(color: Colors.white)),
        icon: const Icon(Icons.my_location, color: Colors.white),
        backgroundColor: Colors.orange,
      ),
    );
  }

  Future<void> _goToInitialLocation() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_initialCameraPosition));
  }

  void _updateLocation(LatLng latLng) {
    setState(() {
      _locationController.text = '${latLng.latitude}, ${latLng.longitude}'; // تحديث حقل إدخال الموقع
    });
  }
}