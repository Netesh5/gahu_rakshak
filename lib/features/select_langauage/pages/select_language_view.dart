import 'package:flutter/material.dart';
import 'package:gahurakshak/core/injector/injector.dart';
import 'package:gahurakshak/features/select_langauage/widgets/select_language_body.dart';

class SelectLanguageView extends StatelessWidget {
  const SelectLanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    return SelectLanguageBody(
      userToken: DI.instance(),
    );
  }
}
