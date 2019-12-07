import 'package:chorus/global/constants.dart';
import 'package:chorus/global/global_translations.dart';
import 'package:flutter/material.dart';

class SplashBloc {
  Future<void> loadData(BuildContext context) async {
    await _loadStrings(context);
    await Future.delayed(const Duration(milliseconds: kSplashDelay));
  }

  Future<void> _loadStrings(BuildContext context) {
    return translations.loadLocalizationStrings(context);
  }
}
