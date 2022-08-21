// ignore_for_file: overridden_fields

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum DeviceSize {
  mobile,
  tablet,
  desktop,
}
abstract class GlintsTwitterTheme {
  static DeviceSize deviceSize = DeviceSize.mobile;

  static GlintsTwitterTheme of(BuildContext context) {
    deviceSize = getDeviceSize(context);
    return LightModeTheme();
  }

  late Color primaryColor;
  late Color secondaryColor;
  late Color tertiaryColor;
  late Color alternate;
  late Color primaryBackground;
  late Color secondaryBackground;
  late Color primaryText;
  late Color secondaryText;

  late Color primaryBtnText;
  late Color lineColor;
  late Color backgroundComponents;

  String get title1Family => typography.title1Family;
  TextStyle get title1 => typography.title1;
  String get title2Family => typography.title2Family;
  TextStyle get title2 => typography.title2;
  String get title3Family => typography.title3Family;
  TextStyle get title3 => typography.title3;
  String get subtitle1Family => typography.subtitle1Family;
  TextStyle get subtitle1 => typography.subtitle1;
  String get subtitle2Family => typography.subtitle2Family;
  TextStyle get subtitle2 => typography.subtitle2;
  String get bodyText1Family => typography.bodyText1Family;
  TextStyle get bodyText1 => typography.bodyText1;
  String get bodyText2Family => typography.bodyText2Family;
  TextStyle get bodyText2 => typography.bodyText2;

  Typography get typography => {
    DeviceSize.mobile: MobileTypography(this),
    DeviceSize.tablet: TabletTypography(this),
    DeviceSize.desktop: DesktopTypography(this),
  }[deviceSize]!;
}

DeviceSize getDeviceSize(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  if (width < 479) {
    return DeviceSize.mobile;
  } else if (width < 991) {
    return DeviceSize.tablet;
  } else {
    return DeviceSize.desktop;
  }
}

class LightModeTheme extends GlintsTwitterTheme {
  @override
  late Color primaryColor = const Color(0xFF006D77);
  @override
  late Color secondaryColor = const Color(0xFF83C5BE);
  @override
  late Color tertiaryColor = const Color(0xFFEE8B60);
  @override
  late Color alternate = const Color(0xFFFF5963);
  @override
  late Color primaryBackground = const Color(0xFFF1F4F8);
  @override
  late Color secondaryBackground = const Color(0xFFFFFFFF);
  @override
  late Color primaryText = const Color(0xFF101213);
  @override
  late Color secondaryText = const Color(0xFF57636C);

  @override
  late Color primaryBtnText = const Color(0xFFFFFFFF);
  @override
  late Color lineColor = const Color(0xFFE0E3E7);
  @override
  late Color backgroundComponents = const Color(0xFF1D2428);
}

abstract class Typography {
  String get title1Family;
  TextStyle get title1;
  String get title2Family;
  TextStyle get title2;
  String get title3Family;
  TextStyle get title3;
  String get subtitle1Family;
  TextStyle get subtitle1;
  String get subtitle2Family;
  TextStyle get subtitle2;
  String get bodyText1Family;
  TextStyle get bodyText1;
  String get bodyText2Family;
  TextStyle get bodyText2;
}

class MobileTypography extends Typography {
  MobileTypography(this.theme);

  final GlintsTwitterTheme theme;

  @override
  String get title1Family => 'Roboto';
  @override
  TextStyle get title1 => GoogleFonts.getFont(
    'Roboto',
    color: theme.primaryText,
    fontWeight: FontWeight.w600,
    fontSize: 24,
  );
  @override
  String get title2Family => 'Roboto';
  @override
  TextStyle get title2 => GoogleFonts.getFont(
    'Roboto',
    color: theme.secondaryText,
    fontWeight: FontWeight.w600,
    fontSize: 22,
  );
  @override
  String get title3Family => 'Roboto';
  @override
  TextStyle get title3 => GoogleFonts.getFont(
    'Roboto',
    color: theme.primaryText,
    fontWeight: FontWeight.w600,
    fontSize: 20,
  );
  @override
  String get subtitle1Family => 'Roboto';
  @override
  TextStyle get subtitle1 => GoogleFonts.getFont(
    'Roboto',
    color: theme.primaryText,
    fontWeight: FontWeight.w600,
    fontSize: 18,
  );
  @override
  String get subtitle2Family => 'Roboto';
  @override
  TextStyle get subtitle2 => GoogleFonts.getFont(
    'Roboto',
    color: theme.secondaryText,
    fontWeight: FontWeight.w600,
    fontSize: 16,
  );
  @override
  String get bodyText1Family => 'Roboto';
  @override
  TextStyle get bodyText1 => GoogleFonts.getFont(
    'Roboto',
    color: theme.primaryText,
    fontWeight: FontWeight.w600,
    fontSize: 14,
  );
  @override
  String get bodyText2Family => 'Roboto';
  @override
  TextStyle get bodyText2 => GoogleFonts.getFont(
    'Roboto',
    color: theme.secondaryText,
    fontWeight: FontWeight.w600,
    fontSize: 14,
  );
}

class TabletTypography extends Typography {
  TabletTypography(this.theme);

  final GlintsTwitterTheme theme;

  @override
  String get title1Family => 'Roboto';
  @override
  TextStyle get title1 => GoogleFonts.getFont(
    'Roboto',
    color: theme.primaryText,
    fontWeight: FontWeight.w600,
    fontSize: 24,
  );
  @override
  String get title2Family => 'Roboto';
  @override
  TextStyle get title2 => GoogleFonts.getFont(
    'Roboto',
    color: theme.secondaryText,
    fontWeight: FontWeight.w600,
    fontSize: 22,
  );
  @override
  String get title3Family => 'Roboto';
  @override
  TextStyle get title3 => GoogleFonts.getFont(
    'Roboto',
    color: theme.primaryText,
    fontWeight: FontWeight.w600,
    fontSize: 20,
  );
  @override
  String get subtitle1Family => 'Roboto';
  @override
  TextStyle get subtitle1 => GoogleFonts.getFont(
    'Roboto',
    color: theme.primaryText,
    fontWeight: FontWeight.w600,
    fontSize: 18,
  );
  @override
  String get subtitle2Family => 'Roboto';
  @override
  TextStyle get subtitle2 => GoogleFonts.getFont(
    'Roboto',
    color: theme.secondaryText,
    fontWeight: FontWeight.w600,
    fontSize: 16,
  );
  @override
  String get bodyText1Family => 'Roboto';
  @override
  TextStyle get bodyText1 => GoogleFonts.getFont(
    'Roboto',
    color: theme.primaryText,
    fontWeight: FontWeight.w600,
    fontSize: 14,
  );
  @override
  String get bodyText2Family => 'Roboto';
  @override
  TextStyle get bodyText2 => GoogleFonts.getFont(
    'Roboto',
    color: theme.secondaryText,
    fontWeight: FontWeight.w600,
    fontSize: 14,
  );
}

class DesktopTypography extends Typography {
  DesktopTypography(this.theme);

  final GlintsTwitterTheme theme;

  @override
  String get title1Family => 'Roboto';
  @override
  TextStyle get title1 => GoogleFonts.getFont(
    'Roboto',
    color: theme.primaryText,
    fontWeight: FontWeight.w600,
    fontSize: 24,
  );
  @override
  String get title2Family => 'Roboto';
  @override
  TextStyle get title2 => GoogleFonts.getFont(
    'Roboto',
    color: theme.secondaryText,
    fontWeight: FontWeight.w600,
    fontSize: 22,
  );
  @override
  String get title3Family => 'Roboto';
  @override
  TextStyle get title3 => GoogleFonts.getFont(
    'Roboto',
    color: theme.primaryText,
    fontWeight: FontWeight.w600,
    fontSize: 20,
  );
  @override
  String get subtitle1Family => 'Roboto';
  @override
  TextStyle get subtitle1 => GoogleFonts.getFont(
    'Roboto',
    color: theme.primaryText,
    fontWeight: FontWeight.w600,
    fontSize: 18,
  );
  @override
  String get subtitle2Family => 'Roboto';
  @override
  TextStyle get subtitle2 => GoogleFonts.getFont(
    'Roboto',
    color: theme.secondaryText,
    fontWeight: FontWeight.w600,
    fontSize: 16,
  );
  @override
  String get bodyText1Family => 'Roboto';
  @override
  TextStyle get bodyText1 => GoogleFonts.getFont(
    'Roboto',
    color: theme.primaryText,
    fontWeight: FontWeight.w600,
    fontSize: 14,
  );
  @override
  String get bodyText2Family => 'Roboto';
  @override
  TextStyle get bodyText2 => GoogleFonts.getFont(
    'Roboto',
    color: theme.secondaryText,
    fontWeight: FontWeight.w600,
    fontSize: 14,
  );
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    String? fontFamily,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    FontStyle? fontStyle,
    bool useGoogleFonts = true,
    TextDecoration? decoration,
    double? lineHeight,
  }) =>
      useGoogleFonts
          ? GoogleFonts.getFont(
        fontFamily!,
        color: color ?? this.color,
        fontSize: fontSize ?? this.fontSize,
        letterSpacing: letterSpacing ?? this.letterSpacing,
        fontWeight: fontWeight ?? this.fontWeight,
        fontStyle: fontStyle ?? this.fontStyle,
        decoration: decoration,
        height: lineHeight,
      )
          : copyWith(
        fontFamily: fontFamily,
        color: color,
        fontSize: fontSize,
        letterSpacing: letterSpacing,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        decoration: decoration,
        height: lineHeight,
      );
}
