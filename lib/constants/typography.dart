import 'package:flutter/material.dart';


class StoicTypography {
  // Version info in settings
  static TextStyle textStyleVersion() {
    return const TextStyle(
        fontSize: AppFontSizes.caption,
        fontWeight: FontWeight.w200,
        letterSpacing: 1.0);
  }

  // Text style for headline four text.
  static TextStyle textStyleHeadLineFour() {
    return const TextStyle(
      fontSize: AppFontSizes.headlineFour,
      fontWeight: FontWeight.bold,
    );
  }

  // Text style for headline five text.
  static TextStyle textStyleHeadLineFive() {
    return const TextStyle(
      fontSize: AppFontSizes.headlineFive,
      fontWeight: FontWeight.bold,
    );
  }

  // Text style for headline six text.
  static TextStyle textStyleHeadLineSix() {
    return const TextStyle(
      fontSize: AppFontSizes.headlineSix,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle textStyleSubTitleOne() {
    return const TextStyle(
      fontSize: AppFontSizes.subtitleOne,
      letterSpacing: 1.2,
      fontWeight: FontWeight.w300,
    );
  }

  static TextStyle textStyleSubTitleTwo() {
    return const TextStyle(
      fontSize: AppFontSizes.subtitleTwo,
      letterSpacing: 1.2,
      fontWeight: FontWeight.w200,
    );
  }

  static TextStyle textStyleBodyOne() {
    return const TextStyle(
      fontSize: AppFontSizes.bodyOne,
      fontWeight: FontWeight.w300,
    );
  }

  static TextStyle textStyleBodyTwo() {
    return const TextStyle(
      fontSize: AppFontSizes.bodyTwo,
    );
  }

  // custom styles

  // Text style philosopher bio
  static TextStyle textStylePhilosopherBio() {
    return const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w300,
      height: 1.2,
    );
  }

  // Text style for quote text.
  static TextStyle textStyleQuote() {
    return const TextStyle(
      fontSize: AppFontSizes.headlineFive,
      height: 1.2,
      fontWeight: FontWeight.w300,
    );
  }

  // Text style for app motto in splash
  static TextStyle textStyleAppMotto() {
    return const TextStyle(
      letterSpacing: 1.2,
      fontSize: AppFontSizes.headlineSix,
      fontWeight: FontWeight.w100,
      fontStyle: FontStyle.italic,
    );
  }

  // Text style for name name in splash
  static TextStyle textStyleAppNameSplash() {
    return const TextStyle(
        fontFamily: "Megrim",
        letterSpacing: 1.0,
        fontSize: AppFontSizes.headlineTwo,
        fontWeight: FontWeight.bold);
  }

  // Text style for app name
  static TextStyle textStyleAppBarTitle() {
    return const TextStyle(
      fontFamily: "Megrim",
      fontSize: AppFontSizes.headlineFive,
      letterSpacing: 1.0,
      fontWeight: FontWeight.w200,
    );
  }

  // static TextStyle textStyleSideMenuTitle() {
  //   return const TextStyle(
  //     fontSize: AppFontSizes.subtitleOne,
  //     letterSpacing: 1.2,
  //     fontWeight: FontWeight.w300,
  //   );
  // }
}

class AppFontSizes {
  static const double overline = 10.0;

  static const double caption = 12.0;

  static const double button = 14.0;

  static const double subtitleTwo = 14.0;
  static const double subtitleOne = 16.0;

  static const double bodyTwo = 14.0;
  static const double bodyOne = 16.0;

  static const double headlineSix = 20.0;
  static const double headlineFive = 24.0;
  static const double headlineFour = 34.0;
  static const double headlineThree = 48.0;
  static const double headlineTwo = 60.0;
  static const double headlineOne = 96.0;
}
