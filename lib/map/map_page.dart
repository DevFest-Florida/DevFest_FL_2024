import 'dart:math';

import 'package:devfestfl/config/config_bloc.dart';
import 'package:devfestfl/universal/dev_scaffold.dart';
import 'package:devfestfl/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  static const String routeName = "/map";

  const MapPage({Key? key}) : super(key: key);
  @override
  MapPageState createState() => MapPageState();
}

class MapPageState extends State<MapPage> {
  bool isMapCreated = false;
  static const LatLng eventLocation = LatLng(28.663151, -81.233940);
  String? mapStyle;

  @override
  void initState() {
    super.initState();
    loadMapStyle();
  }

  final CameraPosition _neowareStudios = const CameraPosition(
    target: eventLocation,
    zoom: 14,
  );

//   void setMapStyle(String mapStyle) {
//   _controller.setMapStyle(mapStyle);
// }

  Future<void> loadMapStyle() async {
    mapStyle = await DefaultAssetBundle.of(context)
        .loadString('assets/map_style.json');
    setState(() {});
  }

  Set<Marker> _createMarker() {
    return <Marker>{
      Marker(
        markerId: const MarkerId("neoware_marker_1"),
        position: eventLocation,
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueOrange,
        ),
        infoWindow: const InfoWindow(
          title: 'DevFest 2019 🌴🏖️ (Neoware Studios)',
          snippet: "1485 Oviedo Mall Boulevard, Oviedo, FL 32765",
        ),
      ),
    };
  }

void changeMapMode() {
    getJsonFile(ConfigBloc().darkModeOn
        ? "assets/maptheme/nightmode.json"
        : "assets/maptheme/daymode.json"
    ).then((style) {
      setState(() {
        mapStyle = style;
      });
    });
  }

  Future<String> getJsonFile(String path) async {
    return await rootBundle.loadString(path);
  }

  @override
  Widget build(BuildContext context) {
    // Call changeMapMode if the map is created
    if (isMapCreated) {
      changeMapMode();
    }

    return DevScaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 1.0),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            GoogleMap(
              mapType: MapType.normal,
              zoomGesturesEnabled: true,
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
              markers: _createMarker(),
              initialCameraPosition: _neowareStudios,
              onMapCreated: (GoogleMapController controller) {
                isMapCreated = true;
                changeMapMode();
                setState(() {});
              },
              // Added these two parameters that were missing before
              mapToolbarEnabled: false,
              zoomControlsEnabled: false,
              // Removed the 'styles' parameter as it's not a valid parameter for GoogleMap
            ),
            IgnorePointer(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: "Neoware Studios, Oviedo Mall\n",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                    children: [
                      TextSpan(
                        text: "1485 Oviedo Mall Boulevard, Oviedo, FL 32765",
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Tools.multiColors[Random().nextInt(4)],
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      title: "Location",
    );
  }
}
