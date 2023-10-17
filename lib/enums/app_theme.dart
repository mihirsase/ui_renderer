enum AppTheme { light, dark }

AppTheme getAppThemeFromString(String? appTheme) {
  switch (appTheme?.toLowerCase()) {
    case "light":
      return AppTheme.light;
    case "dark":
      return AppTheme.dark;
    default:
      return AppTheme.light;
  }
}
