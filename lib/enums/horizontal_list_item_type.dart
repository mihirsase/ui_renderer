enum HorizontalListItemType { circularItem, boxItem }

HorizontalListItemType? getHorizontalListItemTypeFromString(String? itemType) {
  switch (itemType?.toLowerCase()) {
    case "circular_item":
      return HorizontalListItemType.circularItem;
    case "box_item":
      return HorizontalListItemType.boxItem;
  }
  return null;
}
