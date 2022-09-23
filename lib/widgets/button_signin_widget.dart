import 'package:flutter/material.dart';
import 'package:food_hub_app/extensions/extension.dart';
import 'package:food_hub_app/utils/style.dart';

class ButtonSigninWidget extends StatelessWidget {
  final VoidCallback onPress;
  final String title;
  final String icon;
  final Color buttonColor, titleColor;

  const ButtonSigninWidget({
    super.key,
    required this.onPress,
    required this.title,
    required this.buttonColor,
    required this.icon,
    required this.titleColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        alignment: Alignment.center,
        shadowColor: grayColor20,
        elevation: 1,
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 16,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28),
        ),
      ),
      child: SizedBox(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              icon,
              width: 28,
              height: 28,
            ),
            const SizedBox(width: 8.0),
            Text(
              title,
              textAlign: TextAlign.center,
              style: context.theme.textTheme.button?.copyWith(
                fontWeight: FontWeight.w700,
                color: titleColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
