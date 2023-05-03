import 'dart:async';

import 'package:covid_tracker_app/home_screen.dart';
import 'package:flutter/material.dart';

class Utils {
  void splashUtils(BuildContext context) {
    Timer(const Duration(seconds: 30), () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ));
    });
  }
}
