import 'package:flutter/material.dart';

extension textExtension on BuildContext {
  TextStyle get headMedium => Theme.of(this).textTheme.headlineMedium!;
  TextStyle get titleLarge => Theme.of(this).textTheme.titleLarge!;

  TextStyle get titleMedium => Theme.of(this).textTheme.titleMedium!;
  TextStyle get bodyMedium => Theme.of(this).textTheme.bodyMedium!;
  TextStyle get bodyLarge => Theme.of(this).textTheme.bodyLarge!;
}
