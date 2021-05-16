import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opencommerce/second_view.dart';

import 'counter_controller.dart';

class CounterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CounterController>(
      builder: (controller) => Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              controller.increment();
            },
            child: Icon(Icons.plus_one),
          ),
          body: Container(
            child: controller.loading
                ? Center(child: CircularProgressIndicator())
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(child: Text("${controller?.counter}")),
                      ElevatedButton(
                        onPressed: () {
                          Get.to(SecondView());
                        },
                        child: Text("Goto 2nd"),
                      )
                    ],
                  ),
          )),
    );
  }
}
