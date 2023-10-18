import 'package:ui_renderer/enums/horizontal_list_item_type.dart';
import 'package:ui_renderer/enums/widget_type.dart';
import 'package:ui_renderer/extensions/double_extenstion.dart';
import 'package:ui_renderer/models/custom_widget.dart';

class HorizontalList extends CustomWidget {
  final String? title;
  final List<HorizontalListItem> items;

  HorizontalList({
    super.widgetType,
    this.title,
    required this.items,
  });

  static HorizontalList fromJson(final Map<String, dynamic> json) {
    return HorizontalList(
      widgetType: getWidgetTypeFromString(json['type']),
      title: json['title'],
      items: HorizontalListItem.listFromJson(json['items']),
    );
  }
}

class HorizontalListItem {
  final HorizontalListItemType? type;
  final String? text;
  final String? image;
  final double? padding;

  HorizontalListItem({
    this.type,
    this.text,
    this.image,
    this.padding,
  });

  static HorizontalListItem fromJson(final Map<String, dynamic> json) {
    return HorizontalListItem(
      type: getHorizontalListItemTypeFromString(json['type']),
      text: json['text'],
      image: json['image'],
      padding: DoubleExtension.toDouble(json['padding']),
    );
  }

  static List<HorizontalListItem> listFromJson(final List<dynamic>? jsons) {
    if (jsons == null) {
      return <HorizontalListItem>[];
    } else {
      return jsons.map<HorizontalListItem>((final dynamic json) {
        return HorizontalListItem.fromJson(json);
      }).toList();
    }
  }

  bool get isValid {
    return type!=null && text!=null && image!=null;
  }
}
