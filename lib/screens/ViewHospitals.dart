import 'package:breathalyzer_app/controllers/home_controller.dart';
import 'package:breathalyzer_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as loc;
import 'package:location/location.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

import '../utils/status.dart';

class ViewHospitals extends StatefulWidget {
  const ViewHospitals({Key? key}) : super(key: key);

  @override
  State<ViewHospitals> createState() => _ViewHospitalsState();
}

class _ViewHospitalsState extends State<ViewHospitals> {

  late GoogleMapController _googleMapController;
  List<Marker> markers = [];
  static const LatLng _center = const LatLng(28.361085, 75.587511);
  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  late LocationData _locationData;

  @override
  void dispose() {
    super.dispose();
    _googleMapController.dispose();
  }

  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final controller =  Provider.of<HomeController>(context,listen: false);
      controller.currentLocationDetermined = false;
      loc.Location location = new loc.Location();
      _serviceEnabled = await location.serviceEnabled();
      if (!_serviceEnabled) {
        _serviceEnabled = await location.requestService();
        if (!_serviceEnabled) {
          return;
        }
      }

      _permissionGranted = await location.hasPermission();
      if (_permissionGranted == PermissionStatus.denied) {
        _permissionGranted = await location.requestPermission();
        if (_permissionGranted != PermissionStatus.granted) {
          return;
        }
      }
      _locationData = await location.getLocation();

      controller.getMapMarkers();

      controller.currentLocationDetermined = true;
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BrandColor.drawerBackgroundColor,
      body: Consumer<HomeController>(
        builder: (context,controller,child){
          return Container(
              child: controller.mapMarkerStatus != Status.LOADED ? const Center(
                child: SpinKitDualRing(color: Colors.white),
              ) : controller.mapMarkerResponse.fold((l) {
                Fluttertoast.showToast(msg: l.message);
                return const Text("Error");
              }, (r) {
                for (int i = 0; i < r.length; i++) {
                  markers.add(Marker(
                      infoWindow: InfoWindow(title: r[i].title),
                      markerId: MarkerId(r[i].markerId),
                      position: LatLng(double.parse(r[i].latitude),
                          double.parse(r[i].longitude))));
                }
                return GoogleMap(
                  markers: Set.from(markers),
                  onMapCreated: (controller) =>
                  _googleMapController = controller,
                  initialCameraPosition: const CameraPosition(
                    target: _center,
                    zoom: 16.0,
                    // tilt: 90
                  ),
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                );
              })
          );
        }
      )
    );
  }
}
