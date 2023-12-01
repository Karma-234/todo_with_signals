import 'package:flutter/material.dart';

extension Gap on num {
  SizedBox get v => SizedBox(
        height: toDouble(),
      );
  SizedBox get h => SizedBox(
        width: toDouble(),
      );
}
