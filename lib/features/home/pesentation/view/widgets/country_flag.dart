import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CountryFlag extends StatelessWidget {
  const CountryFlag({
    super.key,
    required this.imagePath,
  });
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 26,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
      child:  SvgPicture.asset(imagePath),
    );
  }
}