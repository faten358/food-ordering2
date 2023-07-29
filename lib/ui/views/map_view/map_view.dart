import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_ordering2/ui/views/map_view/map_controller.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapView extends StatefulWidget {
  final LocationData currentLocation;
  const MapView({super.key, required this.currentLocation});

  @override
  State<MapView> createState() => MapViewState();
}

class MapViewState extends State<MapView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: MapController(widget.currentLocation),

        builder: (mapController) {
          return Scaffold(
            body: GoogleMap(
              mapType: MapType.normal,
              //location camera in map when first open map
              initialCameraPosition: mapController.initalCameraPosition,
              onMapCreated: (GoogleMapController controller) {
                mapController.controller.complete(controller);

                mapController.addMarker(
                    imageName: 'pin.png',
                    markerId: 'Current',
                    position: LatLng(
                        mapController.currentLocation.latitude ??
                            37.43296265331129,
                        mapController.currentLocation.longitude ??
                            -122.08832357078792));

                mapController.selectedLocation = LatLng(
                    mapController.currentLocation.latitude ?? 37.43296265331129,
                    mapController.currentLocation.longitude ??
                        -122.08832357078792);
                //this need VPN
               // mapController.getStreetName();
              },
              markers: mapController.markers,
              //for add marker in multy place when user decided on map 
              onTap: (latlong) async {
                mapController.selectedLocation = latlong;

                mapController.addMarker(
                    imageName: 'pin.png',
                    //put current becouse delet old marker and put new marker 
                    markerId: 'Current',
                    position: LatLng(latlong.latitude, latlong.longitude));

               // mapController.getStreetName();
              },
            ),
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () {},
              label: Text(mapController.streetName.value),
              icon: const Icon(Icons.directions_boat),
            ),
          );
        });
  }
}