import 'package:get/get.dart';
import 'package:my_journey_planning/model.dart';
import 'package:my_journey_planning/service.dart';

class SearchController extends GetxController {
  final SearchService _searchService = SearchService();
  var loading = true.obs;
  var step = 0.obs;
  var journeySuggestion = [].obs;
  final currentSuggestion = Rxn<SearchResponseModel>();

  @override
  Future<void> onInit() async {
    super.onInit();
    //_authManager = Get.put(AuthenticationManager());
  }

  Future<void> getJourney(query) async {
    try {
      loading.value = true;
      final response = await _searchService.getJourney(query);
      journeySuggestion.value = response;
      loading.value = false;
      step.value = 1;
    } catch (e) {
      print('Error while getting data is $e');
    }
  }

  setStep(currentStep) => step.value = currentStep;

  setCurrentSuggestion(suggestion) {
    step.value = 2;
    currentSuggestion.value = suggestion;
  }
}
