import 'dart:ui';

class AppColors{
  static const Color primaryLight = Color(0xFF19B3E7);
  static const Color  secondaryLight = Color(0xFF11284A);
  static const Color accentLight = Color(0xFF000000);
  static const Color backgroundLight = Color(0xFFFFFFFF);
  static const Color btnShadowColorLight = Color(0xFF1E4D94);
  static const Color cardLight = Color(0xFFFFFFFF);

  static const Color boxStyleLight = Color.fromRGBO(3, 185, 252, 0.904);

//------------------dark Mode------------------------------------
  static const Color primaryDark = Color(0xFF19B3E7);
  static const Color secondaryDark = Color(0xFF11284A);
  static const Color accentDark = Color(0xFFFFFFFF);
  static const Color backgroundDark = Color(0xFF101828);
  static const Color borderColorDark = Color(0xFFFFFFFF);
  static const Color cardDark = Color(0xFF191919);
  static const Color ctaDark = Color(0xFF007AFF);
  static const Color ctaActiveDark = Color(0xFF0066D7);
  static const Color ctaTextDark = Color(0xFFFFFFFF);
  static const Color ctaTextActiveDark = Color(0xFFFFE609);

  static List<Color> getCountColors(bool dark) {
    return [
      dark ? AppColors.primaryDark : AppColors.borderColorDark,
      dark ? AppColors.ctaDark : AppColors.borderColorDark,
      dark ? AppColors.ctaActiveDark : AppColors.borderColorDark,
      dark ? AppColors.ctaTextActiveDark : AppColors.borderColorDark,
    ];
  }
}