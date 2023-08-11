import 'package:geocoding/geocoding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:my_journey_planning/components/chart_indicator.dart';
import 'package:my_journey_planning/components/return_button.dart';
import 'package:my_journey_planning/controller.dart';
import 'package:my_journey_planning/model.dart';
import 'package:url_launcher/url_launcher.dart';

class MapCard extends StatefulWidget {
  const MapCard({super.key, required this.currentSuggestion});
  final dynamic currentSuggestion;

  @override
  State<MapCard> createState() => _MapCardState();
}

class _MapCardState extends State<MapCard> {
  final SearchController _searchController = Get.put(SearchController());
  late Location currentLocation;
  bool isLoaded = false;
  MapController mc = MapController();

  getLocation() async {
    List<Location> locations = await locationFromAddress(
        _searchController.currentSuggestion.value?.name as String);

    setState(() {
      currentLocation = Location(
        latitude: locations.first.latitude,
        longitude: locations.first.longitude,
        timestamp: locations.first.timestamp,
      );

      isLoaded = true;
    });
  }

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    SearchResponseModel? suggestion = _searchController.currentSuggestion.value;

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            child: Column(
              children: [
                const ReturnButton(selectedStep: 1),
                Text(
                  'We are excited to have you here, here you can find the details and all neccesary information for your next Journey:',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 20.0),
                RichText(
                  text: TextSpan(
                    text:
                        'Based in your starting point, the next stop recomendations will be ',
                    style: DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                      TextSpan(
                        text: '${suggestion?.name} ',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const TextSpan(
                        text:
                            'in order to five you the best expirience possible, this location is recognized as ',
                        style: TextStyle(fontWeight: FontWeight.normal),
                      ),
                      TextSpan(
                        text:
                            ' ${suggestion?.isBest.toString()} match for you! ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const TextSpan(
                        text: ' the type of the terrain is considered ',
                        style: TextStyle(fontWeight: FontWeight.normal),
                      ),
                      TextSpan(
                        text: '${suggestion?.type}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const TextSpan(
                        text: ' so precation is adviced! ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const TextSpan(
                        text:
                            ' for better approach the stret name is the follow: ',
                        style: TextStyle(fontWeight: FontWeight.normal),
                      ),
                      TextSpan(
                        text: '${suggestion?.streetName}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    const Expanded(
                      flex: 4,
                      child:
                          Text('Based in your search, your Match quality is: '),
                    ),
                    Expanded(
                      flex: 6,
                      child: ChartIndicator(
                        percentage: suggestion?.matchQuality?.toDouble(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Text(
            'Take a look to the next Journey:',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Container(
            height: MediaQuery.of(context).size.height / 2,
            child: (isLoaded)
                ? FlutterMap(
                    options: MapOptions(
                      center: LatLng(
                          currentLocation.latitude, currentLocation.longitude),
                      zoom: 15.0,
                    ),
                    mapController: mc,
                    children: [
                      TileLayer(
                        urlTemplate:
                            'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                        userAgentPackageName: 'com.my_journey_planning.app',
                      ),
                      CircleLayer(
                        circles: [
                          CircleMarker(
                            borderColor: Colors.black,
                            borderStrokeWidth: 5.0,
                            color: Colors.red.withOpacity(0.5),
                            point: LatLng(currentLocation.latitude,
                                currentLocation.longitude),
                            radius: 100,
                            useRadiusInMeter: true,
                          ),
                        ],
                      ),
                    ],
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
          ),
        ],
      ),
    );
  }
}
