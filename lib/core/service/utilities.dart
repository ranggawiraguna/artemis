import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final utils = Utilities();

class Utilities {
  Utilities._internal();

  static final Utilities _instance = Utilities._internal();
  factory Utilities() => _instance;

  void noAction() {}

  String jsonString(dynamic data) => data.toString();

  int jsonInt(dynamic data) => int.tryParse((data ?? 0).toString()) ?? 0;

  double jsonDouble(dynamic data) =>
      double.tryParse((data ?? 0.0).toString()) ?? 0.0;

  bool jsonBool(dynamic data) => data is bool ? data : false;

  Map<String, dynamic> jsonMap(dynamic data) {
    try {
      return Map<String, dynamic>.from(data ?? {});
    } catch (_) {
      return {};
    }
  }

  List<dynamic> jsonList(dynamic data) {
    try {
      return List<dynamic>.from(data ?? []);
    } catch (_) {
      return [];
    }
  }

  String moneyFormatter(dynamic value) {
    String money = value.toString().split("").reversed.join();

    List text = [];
    for (int i = 1; i <= (money.length / 3).floor() + 1; i++) {
      if (money.length > (((i - 1) * 3) + 3)) {
        text.addAll([money.substring(((i - 1) * 3), (((i - 1) * 3) + 3)), ","]);
      } else if (money.length == (((i - 1) * 3) + 3)) {
        text.add(money.substring(((i - 1) * 3), (((i - 1) * 3) + 3)));
      } else {
        text.add(money.substring((money.length / 3).floor() * 3, money.length));
      }
    }

    return "Rp. ${text.join().split("").reversed.join()}";
  }

  String welcomeText(BuildContext context) {
    final hour = DateTime.now().hour;

    if (hour >= 6 && hour <= 11) {
      return AppLocalizations.of(context).text_welcome_morning;
    } else if (hour >= 12 && hour <= 15) {
      return AppLocalizations.of(context).text_welcome_afternoon;
    } else if (hour >= 16 && hour <= 17) {
      return AppLocalizations.of(context).text_welcome_evening;
    } else {
      return AppLocalizations.of(context).text_welcome_night;
    }
  }

  String dateFormatter(
    dynamic value,
    String formatter,
    String locale, [
    String orElse = "",
  ]) =>
      DateTime.tryParse(value) != null
          ? DateFormat(formatter, locale).format(DateTime.parse(value))
          : orElse;

  String stringCapitalize(String text) {
    return text.isNotEmpty
        ? text
            .split(' ')
            .map((_) => _.isNotEmpty
                ? _[0].toUpperCase() + (_.length > 1 ? _.substring(1) : "")
                : "")
            .join(' ')
        : "";
  }

  double getFullWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  double getFullHeight(BuildContext context) =>
      MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

  double getSizeConstraint(BuildContext context, double value) =>
      utils.getFullWidth(context) * (value / 1080);
}
