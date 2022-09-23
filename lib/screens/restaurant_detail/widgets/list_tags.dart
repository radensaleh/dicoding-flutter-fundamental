import 'package:flutter/material.dart';
import 'package:food_hub_app/extensions/extension.dart';

import '../../../utils/utils.dart';
import '../../../widgets/widgets.dart';

class ListTags extends StatelessWidget {
  final List restaurantList;
  final String title;
  final Color color;

  const ListTags({
    super.key,
    required this.restaurantList,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = context.theme;

    return Container(
      margin: const EdgeInsets.only(
        left: 5,
        right: 5,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.fastfood,
                color: color,
                size: 18,
              ),
              const SizedBox(width: 8.0),
              Text(
                title,
                style: theme.textTheme.headline4!.copyWith(
                  fontSize: 18,
                  color: blackColor.withOpacity(0.85),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14.0),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: restaurantList.map((data) {
              return TagWidget(tagName: data['name'], tagColor: color);
            }).toList(),
          ),
        ],
      ),
    );
  }
}
