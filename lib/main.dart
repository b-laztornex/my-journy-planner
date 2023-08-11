import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_journey_planning/components/map_card.dart';
import 'package:my_journey_planning/components/place_selection.dart';
import 'package:my_journey_planning/controller.dart';
import 'dart:convert' show utf8;

import 'components/suggestion_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          labelSmall: TextStyle(
              fontSize: 22.0, color: Colors.white, fontWeight: FontWeight.bold),
          bodySmall: TextStyle(
              fontSize: 18.0, color: Colors.grey, fontWeight: FontWeight.bold),
        ),
      ),
      home: const MyHomePage(title: 'My Plan Journey'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late SearchController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = Get.put(SearchController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Obx(
            () {
              if (_searchController.step.value == 0) {
                return const PlaceSelection();
              } else if (_searchController.step.value == 1) {
                return const SuggestionList();
              } else if (_searchController.step.value == 2) {
                return MapCard(
                    currentSuggestion: _searchController.currentSuggestion);
              } else {
                return const Center();
              }
            },
          ),
        ),
      ),
    );
  }
}
