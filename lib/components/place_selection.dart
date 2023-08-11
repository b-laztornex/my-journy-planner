import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_journey_planning/controller.dart';

class PlaceSelection extends StatefulWidget {
  const PlaceSelection({super.key});

  @override
  State<PlaceSelection> createState() => _PlaceSelectionState();
}

class _PlaceSelectionState extends State<PlaceSelection> {
  final SearchController _searchController = Get.put(SearchController());
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: const Image(
              image: AssetImage('assets/travel_banner.jpg'),
            ),
          ),
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              controller: _controller,
              decoration:
                  const InputDecoration(hintText: "Fill in the starting point"),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlue,
                padding: const EdgeInsets.all(20.0),
                elevation: 2,
              ),
              onPressed: () {
                _searchController.getJourney(_controller.text);
              },
              child: const Text(
                "Start my Journy!",
                style: TextStyle(fontSize: 22.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
