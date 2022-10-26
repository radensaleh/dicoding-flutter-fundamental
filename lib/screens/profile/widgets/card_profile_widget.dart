import 'package:flutter/material.dart';
import 'package:food_hub_app/extensions/extension.dart';
import 'package:food_hub_app/utils/utils.dart';

class CardProfileWidget extends StatelessWidget {
  const CardProfileWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = context.theme;

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.person_pin_rounded,
              color: grayColor80,
              size: 18,
            ),
            const SizedBox(width: 5),
            Text(
              'Data Profile',
              style: theme.textTheme.headline4!.copyWith(
                fontSize: 18,
                color: grayColor,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                blurRadius: 5,
                spreadRadius: 0,
                color: grayColor50,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            children: const [
              DataProfile(
                icon: Icon(
                  Icons.credit_card,
                  size: 15,
                  color: whiteColor,
                ),
                title: 'User FoodHub',
              ),
              SizedBox(height: 12),
              DataProfile(
                icon: Icon(
                  Icons.email,
                  size: 15,
                  color: whiteColor,
                ),
                title: 'user@foodhub.id',
              ),
              SizedBox(height: 12),
              DataProfile(
                icon: Icon(
                  Icons.phone,
                  size: 15,
                  color: whiteColor,
                ),
                title: '(+62) 221-232-329',
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class DataProfile extends StatelessWidget {
  const DataProfile({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  final Icon icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = context.theme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: yellowColor,
            boxShadow: [
              BoxShadow(
                blurRadius: 5,
                spreadRadius: 0,
                color: orangeColor20,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: icon,
        ),
        const SizedBox(width: 8),
        Flexible(
          child: Text(
            title,
            style: theme.textTheme.headline4!.copyWith(
              fontSize: 14,
              color: grayColor,
            ),
          ),
        )
      ],
    );
  }
}
