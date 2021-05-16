import 'package:get/get.dart';

class CounterController extends GetxController {
  final CounterService _counterService = CounterService();
  int _counter;

  int get counter => _counter;
  bool loading = false;

  @override
  void onReady() async {
    loading = true;
    update();
    _counter = await _counterService.fetchCounter();
    loading = false;
    update();
    super.onReady();
  }

  /// all events
  void increment() {
    _counter++;

    /// notify the ui
    update();
  }
}

class CounterService {
  Future<int> fetchCounter() async{
    await Future.delayed(Duration(seconds: 5));
    return Future.value(1);
  }
}
