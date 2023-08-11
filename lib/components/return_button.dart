import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_journey_planning/controller.dart';
import 'dart:convert' show utf8;

class ReturnButton extends StatefulWidget {
  final num? selectedStep;
  const ReturnButton({super.key, this.selectedStep});

  @override
  State<ReturnButton> createState() => _ReturnButtonState();
}

class _ReturnButtonState extends State<ReturnButton> {
  final SearchController _searchController = Get.put(SearchController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(15),
        ),
        onPressed: () {
          _searchController.setStep(widget.selectedStep);
        },
        child: Text(
          'Return'.toUpperCase(),
          style: Theme.of(context).textTheme.labelSmall,
        ),
      ),
    );
  }
}
