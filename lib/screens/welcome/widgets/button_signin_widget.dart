import 'package:flutter/material.dart';
import 'package:food_hub_app/extensions/extension.dart';

import '../../../utils/utils.dart';
import '../../../widgets/widgets.dart';

class ButtonSigninWith extends StatelessWidget {
  final bool positionButtom;

  const ButtonSigninWith({
    Key? key,
    required this.positionButtom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: ButtonSigninWidget(
            onPress: () => context.showCustomFlashMessage(
              status: 'info',
              positionBottom: positionButtom,
            ),
            title: 'FACEBOOK',
            icon: 'assets/icons/facebook.png',
            buttonColor: whiteColor,
            titleColor: blackColor,
          ),
        ),
        const SizedBox(
          width: 30.0,
        ),
        Expanded(
          child: ButtonSigninWidget(
            onPress: () => context.showCustomFlashMessage(
              status: 'info',
              positionBottom: positionButtom,
            ),
            title: 'GOOGLE',
            icon: 'assets/icons/google.png',
            buttonColor: whiteColor,
            titleColor: blackColor,
          ),
        ),
      ],
    );
  }
}
