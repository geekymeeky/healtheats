import 'package:flutter/material.dart';
import 'package:healtheats/util/const.dart';

class FallbackFood extends StatelessWidget {
  const FallbackFood({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Constants.kFallbackImage,
      fit: BoxFit.cover,
    );
  }
}
