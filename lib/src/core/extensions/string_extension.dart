import 'package:easy_localization/easy_localization.dart';

extension StringExtension on String {
  String get toCamelCase => "${this[0].toUpperCase()}${substring(1).toLowerCase()}";

  String get translate => this.tr();
}
