enum WidgetType { banner, horizontalList, bannerCarousal }

WidgetType? getWidgetTypeFromString(String? widgetType) {
  switch (widgetType?.toLowerCase()) {
    case "banner":
      return WidgetType.banner;
    case "horizontal_list":
      return WidgetType.horizontalList;
    case "banner_carousal":
      return WidgetType.bannerCarousal;
  }
  return null;
}
