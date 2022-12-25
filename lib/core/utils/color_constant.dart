import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color gray600 = fromHex('#7a7a7a');

  static Color gray700 = fromHex('#6e6969');

  static Color gray500 = fromHex('#9c8787');

  static Color gray701 = fromHex('#595959');

  static Color gray900 = fromHex('#1f1f1f');

  static Color lightGreen100 = fromHex('#e0e0cc');

  static Color yellowA200Bf = fromHex('#bffaff00');

  static Color lightGreen3003f = fromHex('#3fc4c473');

  static Color yellowA200 = fromHex('#faff0d');

  static Color black900 = fromHex('#000000');

  static Color indigoA700Aa = fromHex('#aa001aff');

  static Color indigoA400 = fromHex('#4a5ced');

  static Color whiteA700 = fromHex('#ffffff');

  static Color yellow200 = fromHex('#ffff9c');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
