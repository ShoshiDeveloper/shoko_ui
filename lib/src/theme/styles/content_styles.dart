import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SContentStyles {
  final String fontFamily;

  TextStyle heading1({FontWeight? weight, Color? color}) => TextStyle(fontFamily: fontFamily, fontSize: 24, fontWeight: weight, height: 1.2, color: color);

  TextStyle title1({FontWeight? weight, Color? color}) => TextStyle(fontFamily: fontFamily, fontSize: 20, fontWeight: weight, height: 1.2, color: color);
  TextStyle title2({FontWeight? weight, Color? color}) => TextStyle(fontFamily: fontFamily, fontSize: 18, fontWeight: weight, height: 1.2, color: color);

  TextStyle body1({FontWeight? weight, Color? color}) => TextStyle(fontFamily: fontFamily, fontSize: 16, fontWeight: weight, height: 1.4, color: color);
  TextStyle body2({FontWeight? weight, Color? color}) => TextStyle(fontFamily: fontFamily, fontSize: 14, fontWeight: weight, height: 1.4, color: color);
  
  TextStyle caption({FontWeight? weight, Color? color}) => TextStyle(fontFamily: fontFamily, fontSize: 12, fontWeight: weight, height: 1.4, color: color);


  const SContentStyles({
    this.fontFamily = ''
  });
}
