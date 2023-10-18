extension DoubleExtension on double? {
  static double? toDouble(Object? source) {
    if (source == null) {
      return null;
    } else if (source is double) {
      return source;
    } else if (source is int) {
      return source.toDouble();
    } else if (source is String) {
      try {
        return double.parse(source);
      } catch (e) {
        return null;
      }
    } else {
      return null;
    }
  }

}