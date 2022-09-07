import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class ColorPaletteGenerator {
  static Future<PaletteGenerator> generator(url) async {
    var paletteGenerator = await PaletteGenerator.fromImageProvider(
      Image.network(url).image,
    );
    return paletteGenerator;
  }
}
