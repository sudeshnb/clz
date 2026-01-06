import 'package:flutter/material.dart';

abstract class AppColor {
  static const Color brightGray = Color(0xFFEFECF0);

  static const Color darkJungleGreen = Color(0xFF0b1f2a);

  //0xFF272727
  static const Color white = Colors.white;

  static const Color transparent = Colors.transparent;

  static const Color black = Color(0xff000000);

  static const Color green = Color(0XFF0b6e4f);

  static const Color secondary = Color(0xFF4f2b3d);

  static const Color danger = Color(0xFFc5000f);

  static const Color light = Color(0xFFf6f8fc);

  //  For secondary information or labels.
  static const Color grey = Color(0xFFcccccc);

  static const Color accent = Color(0xFF4f2b3d);

  static const Color silverChalice = Color(0xFFAFADAD);
  static const Color quickSilver = Color(0xFFA7A4A7);
  static const Color snow = Color(0xFFF9FEFD);
  static const Color antiFlashWhite = Color(0xFFF3F0F3);

  static LinearGradient shimmerGradient = const LinearGradient(
    colors: [Color(0xFFEBEBF4), Color(0xFFF4F4F4), Color(0xFFEBEBF4)],
    stops: [0.1, 0.3, 0.4],
    begin: Alignment(-1.0, -0.3),
    end: Alignment(1.0, 0.3),
    tileMode: TileMode.clamp,
  );

  static const Color barrierColor = Colors.black45;

  static const Color primary = Color(0xFF8E6CEF);
}

// Light Theme
// The light theme provides a fresh, clean look suitable for daylight or bright settings.
class LightColor {
  ///
  /// Primary Colors
  ///
  ///  Used for primary action buttons and highlights.
  static const Color primary = Color(0XFF0b6e4f);

  static const Color icon = Color(0xFF0b1f2a);

  static const Color scrollDetective = Color(0xFFffffff);

  ///
  /// Background Colors
  ///
  //  Main background color for high contrast.
  static const Color background = Color(0xFFffffff);
  // Background for cards or list items to add subtle separation.
  static const Color card = Color(0xFFF4F4F4);
  //  Slightly tinted green background for panels or sections to add a soft color touch.
  static const Color secondary = Color(0xFFe8f5f1);

  ///
  /// Text Colors
  ///
  /// High readability for headers and primary information.
  static const Color textPrimary = Color(0xFF333333);
  //  Used for subtext or less important information.
  static const Color textSecondary = Color(0xFF767676);
  //  Used for links or emphasized elements, contrasting well with the light background.
  static const Color textHighlight = Color(0xFF0b6e4f);

  ///
  // Accent Colors
  ///
  //  Call-to-action buttons like "Order Now" stand out.
  static const Color accent = Color(0xFFff7a45);
  //  Alerts or error notifications.
  static const Color error = Color(0xFFff4d4f);
  // For promotions or warnings.
  static const Color warnings = Color(0xFFffb400);
  static const Color success = Color(0xFF4CAF50);
  static const Color info = Color(0xFF2196F3);
  static const Color divider = Color(0xFFE0E0E0);
}

// Dark Theme
// The dark theme provides a visually comfortable experience in low-light environments.
class DarkColor {
  ///
  /// Primary Colors
  ///
  //  Used for key actions, links, or highlighted text.
  static const Color primary = Color(0XFF0b6e4f);

  static const Color icon = Color(0xFFf6f8fc);

  static const Color scrollDetective = Color(0xFF1a1a1a);

  ///
  /// Background Colors
  ///
  //  Deep background to reduce glare in dark settings.
  static const Color background = Color(0xFF1a1a1a);
  //  A slightly lighter shade for card sections or pop-ups.
  static const Color card = Color(0xFF2a2a2a);
  //  A muted green for subtle backgrounds in pop-ups or panels.
  static const Color secondary = Color(0xFF09573f);

  ///
  /// Text Colors
  ///
  /// High readability for text against the dark background.
  static const Color textPrimary = Color(0xFFf5f5f5);
  //  For secondary information or labels.
  static const Color textSecondary = Color(0xFFcccccc);
  //  Used for links or emphasized elements, contrasting well with the dark background.
  static const Color textHighlight = Color(0xFF89d1b1);

  ///
  // Accent Colors
  ///
  //  Call-to-action buttons like "Order Now" stand out.
  static const Color accent = Color(0xFFff7a45);
  //  Alerts or error notifications.
  static const Color error = Color(0xFFff4d4f);
  //  For promotions or warnings.
  static const Color warnings = Color(0xFFffb400);
}
