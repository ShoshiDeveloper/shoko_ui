import 'package:flutter/material.dart';

Future<T?> showMBS<T>(context, {required Widget base, bool isScrollControlled = true}) async {
  return showModalBottomSheet<T>(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: isScrollControlled,
    builder: (context) => base,
  );
}