import 'package:challenges_app/timer_challenge/counter_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController {
  HomeController({required Widget page}) {
    body.value = page;
  }

  Rx<Widget> body = Rx(CounterPage());
  setBody(Widget newBody) => body.value = newBody;
}
