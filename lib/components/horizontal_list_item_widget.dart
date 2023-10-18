import 'package:flutter/material.dart';
import 'package:ui_renderer/enums/horizontal_list_item_type.dart';
import 'package:ui_renderer/models/horizontal_list.dart';

class HorizontalListItemWidget extends StatelessWidget {
  final HorizontalListItem horizontalListItem;

  const HorizontalListItemWidget({
    super.key,
    required this.horizontalListItem,
  });

  @override
  Widget build(BuildContext context) {
    if (horizontalListItem.type == HorizontalListItemType.circularItem) {
      return Column(
        children: [
          Container(
            height: 100,
            width: 100,
            padding: EdgeInsets.all(horizontalListItem.padding ?? 12),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(2.0, 3.0),
                  blurRadius: 4.0,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(
                horizontalListItem.image!,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          Text(
            horizontalListItem.text ?? "",
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      );
    } else if (horizontalListItem.type == HorizontalListItemType.boxItem) {
      return Container(
        width: 100,
        padding: EdgeInsets.symmetric(
          vertical: 18,
          horizontal: horizontalListItem.padding ?? 6,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(2.0, 3.0),
              blurRadius: 4.0,
            ),
          ],
        ),
        child: Column(
          children: [
            SizedBox(
              height: 80,
              width: 80,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  horizontalListItem.image!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            Text(
              horizontalListItem.text ?? "",
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
          ],
        ),
      );
    }
    return const SizedBox.shrink();
  }
}
