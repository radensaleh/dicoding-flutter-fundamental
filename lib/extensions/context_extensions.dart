import 'package:flash/flash.dart';
import 'package:flutter/material.dart';

import '../utils/utils.dart';

extension ContextExtensions on BuildContext {
  void showCustomFlashMessage({
    String title = 'Coming Soon!',
    String message = 'We will notify you once this feature is ready 🙌',
    bool positionBottom = true,
    required String status,
  }) {
    showFlash(
      context: this,
      duration: const Duration(seconds: 2),
      builder: (_, controller) {
        return Padding(
          padding: const EdgeInsets.all(18.0),
          child: Flash(
            controller: controller,
            behavior: FlashBehavior.floating,
            position: positionBottom ? FlashPosition.bottom : FlashPosition.top,
            borderRadius: BorderRadius.circular(8.0),
            borderColor: statusColor(status.toLowerCase()),
            backgroundGradient: LinearGradient(
              colors: [
                whiteColor,
                grayColor20,
              ],
            ),
            forwardAnimationCurve: Curves.easeInCirc,
            reverseAnimationCurve: Curves.easeOutBack,
            child: DefaultTextStyle(
              style: TextStyle(color: orangeColor),
              child: FlashBar(
                title: Text(
                  title,
                  style: theme.textTheme.headline4!.copyWith(
                    color: statusColor(status.toLowerCase()),
                    fontSize: 16,
                  ),
                ),
                content: Text(
                  message,
                  style: theme.textTheme.headline4!.copyWith(
                    color: statusColor(status.toLowerCase()),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                indicatorColor: statusColor(status.toLowerCase()),
                icon: Icon(
                  status.toLowerCase() == 'success'
                      ? Icons.check_circle
                      : status == 'failed'
                          ? Icons.warning_rounded
                          : Icons.info,
                  color: statusColor(status.toLowerCase()),
                ),
                primaryAction: TextButton(
                  onPressed: () => controller.dismiss(),
                  child: Text(
                    'DISMISS',
                    style: theme.textTheme.bodyText1!.copyWith(
                      color: statusColor(status.toLowerCase()),
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Color? statusColor(status) => status == 'success'
      ? Colors.green[600]
      : status == 'failed'
          ? Colors.red[600]
          : Colors.blue[600];

  ThemeData get theme => Theme.of(this);
}
