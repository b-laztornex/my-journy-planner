import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_journey_planning/components/return_button.dart';
import 'package:my_journey_planning/controller.dart';

class SuggestionList extends StatefulWidget {
  const SuggestionList({super.key});

  @override
  State<SuggestionList> createState() => _SuggestionListState();
}

class _SuggestionListState extends State<SuggestionList> {
  final SearchController _searchController = Get.put(SearchController());
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    List suggestionList = _searchController.journeySuggestion.value;
    return _searchController.loading.value
        ? const Center(child: CircularProgressIndicator())
        : SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Column(
              children: <Widget>[
                const ReturnButton(selectedStep: 0),
                Text(
                  'Choose one of the following suggestion:',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                ListView.builder(
                  controller: _scrollController,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(10),
                  itemCount: suggestionList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return OutlinedButton(
                      onPressed: () {
                        _searchController
                            .setCurrentSuggestion(suggestionList[index]);
                      },
                      child: Text(
                        suggestionList[index].name,
                        textAlign: TextAlign.center,
                      ),
                    );
                  },
                ),
              ],
            ),
          );
  }
}
