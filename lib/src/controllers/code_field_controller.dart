import 'package:flutter/widgets.dart';

class CodeTextFieldController {
  List<TextEditingController> textFieldControllers = [];
  
  String get text {
    return textFieldControllers.map((e) => e.text).join();
  }
  String textWithSeparator(String separator) {
    return textFieldControllers.map((e) => e.text).join(separator);
  }

  void clear() {
    textFieldControllers.map((e) => e.clear());
  }
}