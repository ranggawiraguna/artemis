import "package:flutter/material.dart";

extension CustomColor on ThemeData {
  Color get backgroundSecondary => const Color(0xFFEFF2FF);
  Color get colorReschedule => const Color(0xFFF88E2C);
  Color get backgroundColorReschedule => const Color(0x33F88E2C);
  Color get buttonSecondary => const Color(0xFF455FE7);
  Color get backgroundColorDone => const Color(0xFFE9FFEA);
  Color get colorDone => const Color(0xFF4CAF50);
  Color get backgroundColorCancelled => const Color(0xFFFEE6E6);
  Color get colorCancelled => const Color(0xFFF9F9F9);
  Color get backgroundColorProcess => const Color(0xFFDEE3FF);
  Color get backgroundColorDelivery => const Color(0x33AF4CAB);
  Color get colorDelivery => const Color(0xFFAF4CAB);
  Color get colorBackground => const Color(0xB5E6E4E4);
  Color get colorRed => const Color(0xFFE83131);
  Color get colorOrange => const Color(0xFFEF8828);
  Color get colorLabelGreen => const Color(0xFFEAFCE4);
  Color get colorLabelPurple => const Color(0xFFEFDBEE);
  Color get colorLabelRed => const Color(0xFFFCE4E4);
  Color get colorLabelWarning => const Color(0xFFFFB432);
  Color get colorLabelSuccess => const Color(0xFF43A047);
  Color get colorLabelInfo => const Color(0xFF1976D2);
  Color get colorLabelError => const Color(0xFFB00020);
  Color get colorBorder => const Color(0xFFACABAB);
  Color get colorBlack => const Color(0xFF000000);
  Color get colorHint => const Color(0xFFACABAB);
  Color get colorGrey => const Color(0xFFF9F9F9);
  Color get colorPurpleLight => const Color(0xFFD6DCFF);
  Color get colorPurpleDark => const Color(0xFF001689);
  Color get colorBlueLight => const Color(0xFFEFF2FF);
  Color get colorBlueDark => const Color(0xFF001689);
  Color get labelRedBackground => const Color(0xFFFBDCDC);
  Color get labelRedText => const Color(0xFFE83131);
  Color get labelPurpleBackground => const Color(0xFFEFDBEE);
  Color get labelPurpleText => const Color.fromRGBO(165, 79, 161, 1);
  Color get labelOrangeBackground => const Color(0xFFFEEAD7);
  Color get labelOrangeText => const Color(0xFFF88E2C);
  Color get labelGreenBackground => const Color(0xFFEAFCE4);
  Color get labelGreenText => const Color(0xFF4CAF50);
  Color get labelBlueBackground => const Color(0xFFDEE3FF);
  Color get labelBlueText => const Color(0xFF001689);
  Color get colorPurple => const Color(0xFF585AFF);
  Color get backgroundReplaceImage => const Color(0x4B000000);
  Color get inActiveColor => const Color(0xFFDEE3FF);
  Color get baseColorShimmer => const Color(0xFFE0E0E0);
  Color get highlightColorShimmer => Colors.grey[100]!;
}

extension CustomTextTheme on TextTheme {
  TextStyle get subHead1 => const TextStyle(
      fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black);
  TextStyle get subHead2 => const TextStyle(
      fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black);
  TextStyle get subHead3 => const TextStyle(
      fontSize: 12, fontWeight: FontWeight.w500, color: Colors.black);
  TextStyle get subHead4 => const TextStyle(
      fontSize: 10, fontWeight: FontWeight.w500, color: Colors.black);
  TextStyle get textLink => TextStyle(
      fontSize: 14, fontWeight: FontWeight.w500, color: BaseAccentColor[200]);
  TextStyle get paragraph1 => const TextStyle(
      fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black);
  TextStyle get paragraph2 => const TextStyle(
      fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black);
  TextStyle get paragraph3 => const TextStyle(
      fontSize: 12, fontWeight: FontWeight.w400, color: Colors.black);
  TextStyle get paragraph4 => const TextStyle(
      fontSize: 10, fontWeight: FontWeight.w400, color: Colors.black);
  TextStyle get textButton => const TextStyle(
      fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white);
  TextStyle get statusCancelled => const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: Color.fromRGBO(232, 49, 49, 1));
  TextStyle get statusDeliverd => const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: Color.fromRGBO(76, 175, 80, 1));
  TextStyle get cancelled => const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Color.fromRGBO(232, 49, 49, 1));
  TextStyle get deliverd => const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Color.fromRGBO(76, 175, 80, 1));
  TextStyle get onProgres => TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: BaseAccentColor[200],
      );
  TextStyle get textPrice => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: BaseAccentColor[200],
      );
  TextStyle get textButtonRed => const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: Color.fromRGBO(232, 49, 49, 1));
  TextStyle get textButtonBlue => const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: Color.fromRGBO(88, 90, 255, 1));
}

const MaterialColor BaseColor = MaterialColor(
  BasePrimaryColor,
  <int, Color>{
    50: Color(0xFFE0E3F1),
    100: Color(0xFFB3B9DC),
    200: Color(0xFF808BC4),
    300: Color(0xFF4D5CAC),
    400: Color(0xFF26399B),
    500: Color(BasePrimaryColor),
    600: Color(0xFF001381),
    700: Color(0xFF001076),
    800: Color(0xFF000C6C),
    900: Color(0xFF000659),
  },
);

const int BasePrimaryColor = 0xFF001689;

const MaterialColor BaseAccentColor =
    MaterialColor(_BaseAccentValue, <int, Color>{
  100: Color(0xFF8B8CFF),
  200: Color(_BaseAccentValue),
  400: Color(0xFF2528FF),
  700: Color(0xFF0B0FFF),
});
const int _BaseAccentValue = 0xFF585AFF;

ThemeData getThemeData() {
  return ThemeData(
    primarySwatch: BaseColor,
    primaryColor: BaseColor[BasePrimaryColor],
    dividerColor: const Color(0xFFACABAB),
    fontFamily: "Folks",
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontSize: 22, fontWeight: FontWeight.w600, color: Colors.black),
      displayMedium: TextStyle(
          fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),
      displaySmall: TextStyle(
          fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
      headlineMedium: TextStyle(
          fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
      headlineSmall: TextStyle(
          fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black),
      titleLarge: TextStyle(
          fontSize: 12, fontWeight: FontWeight.w600, color: Colors.black),
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      toolbarHeight: 34,
      backgroundColor: Colors.white,
    ),
    navigationBarTheme: NavigationBarThemeData(
        elevation: 0,
        height: 60,
        backgroundColor: Colors.white,
        indicatorColor: Colors.white,
        iconTheme: MaterialStateProperty.all(
            const IconThemeData(color: Color(0xFFACABAB), size: 24)),
        labelTextStyle: MaterialStateProperty.all(
            const TextStyle(fontWeight: FontWeight.w500, fontSize: 12)),
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all<Color?>(BaseColor[BasePrimaryColor]),
        minimumSize: MaterialStateProperty.all<Size>(const Size(0, 0)),
        padding:
            MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(8.0)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    ),
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: BaseColor,
      primaryColorDark: BaseColor,
    ).copyWith(
      primary: BaseColor,
      error: Colors.red,
      background: Colors.white,
    ),
  );
}
