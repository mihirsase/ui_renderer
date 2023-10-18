import 'package:flutter/material.dart';
import 'package:ui_renderer/components/horizontal_list_item_widget.dart';
import 'package:ui_renderer/models/horizontal_list.dart';

class HorizontalListWidget extends StatelessWidget {
  final HorizontalList horizontalList;

  const HorizontalListWidget({
    super.key,
    required this.horizontalList,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          horizontalList.title ?? "",
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...horizontalList.items.map((final HorizontalListItem item) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: HorizontalListItemWidget(horizontalListItem: item),
                );
              }).toList(),
            ],
          ),
        ),
      ],
    );
  }
}
