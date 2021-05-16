import 'package:get/get.dart';

class CounterController extends GetxController {
  int _counter = 0;

  int get counter => _counter;

  /// all events
  void increment() {
    _counter++;

    /// notify the ui
    update();
  }
}
