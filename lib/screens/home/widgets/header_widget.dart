import 'package:flutter/material.dart';

import '../../../utils/utils.dart';
import 'package:food_hub_app/extensions/extension.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {},
          enableFeedback: false,
          borderRadius: BorderRadius.circular(14),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 0,
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ]),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 2,
                vertical: 5,
              ),
              child: Image.asset(
                'assets/icons/menu.png',
                width: 15,
              ),
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Text(
                  'Deliver to',
                  style: context.theme.textTheme.caption!.copyWith(
                    color: grayColor,
                    fontSize: 14,
                  ),
                ),
                Icon(
                  Icons.arrow_drop_down,
                  size: 22,
                  color: grayColor,
                ),
              ],
            ),
            const SizedBox(height: 4.0),
            Text(
              'Rukan CBD Greenlake City',
              style: context.theme.textTheme.caption!.copyWith(
                color: orangeColor,
                fontSize: 14,
              ),
            ),
          ],
        ),
        Image.asset(
          'assets/icons/user.png',
          width: 40,
        ),
      ],
    );
  }
}
