import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex/core/design_system/imports.dart';

class AppImage {
  AppImage._();

  static const String _pngDir = 'assets/imgs/png';
  static const String _svgDir = 'assets/imgs/svg';

  static String _pngPath(PngImgs img) => '$_pngDir/${img.name}.png';
  static String _svgPath(SvgImgs img) => '$_svgDir/${img.name}.svg';

  static Widget png(PngImgs img, {double? width, double? height, BoxFit? fit}) {
    return Image.asset(_pngPath(img), width: width, height: height, fit: fit);
  }

  static Widget svg(SvgImgs svg, {double? width, double? height, BoxFit fit = BoxFit.contain}) {
    final path = _svgPath(svg);
    return SvgPicture.asset(path, width: width, height: height, fit: fit);
  }
}
