import 'package:flutter/material.dart';

import '../../../utils/utils.dart';
import '../../../widgets/widgets.dart';

class FoodSearchWidget extends StatelessWidget {
  final TextEditingController searchRestaurant;

  const FoodSearchWidget({
    Key? key,
    required this.searchRestaurant,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: FormFieldWidget(
            hintText: 'Find for Food or Restaurant...',
            controller: searchRestaurant,
          ),
        ),
        const SizedBox(width: 14.0),
        InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(12),
          enableFeedback: false,
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
                horizontal: 4,
                vertical: 4,
              ),
              child: Image.asset(
                'assets/icons/setting.png',
                width: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
