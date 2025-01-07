import '../../base/viewModel/base_view_model.dart';
import '../model/counter_model.dart';

class CounterViewModel extends BaseViewModel<CounterModel> {
  int? count;
  String? errorMessage;

  CounterViewModel(super.model);

  Future<void> init() async {
    try {
      count = (await model.loadCountFromServer()).count;
    } catch (e) {
      errorMessage = 'Could not initialize counter';
    }
    notifyListeners();
  }

  Future<void> increment() async {
    if (count == null) {
      throw ('Not initialized');
    }
    try {
      count = (await model.updateCountOnServer(count!)).count;
    } catch (e) {
      errorMessage = 'Count not update count';
    }
    notifyListeners();
  }
}
