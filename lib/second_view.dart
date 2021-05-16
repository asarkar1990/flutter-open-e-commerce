import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opencommerce/counter_controller.dart';

class SecondView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CounterController>(
      builder: (controller) => Scaffold(
          appBar: AppBar(),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              controller.increment();
            },
            child: Icon(Icons.plus_one),
          ),
          body: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: Text("${controller.counter}")),
                ElevatedButton(
                  onPressed: () => Get.back(),
                  child: Text("Goto 1st"),
                )
              ],
            ),
          )),
    );
  }
}
