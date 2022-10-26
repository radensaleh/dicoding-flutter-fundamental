import 'package:flutter/material.dart';
import 'package:food_hub_app/extensions/extension.dart';
import 'package:food_hub_app/utils/helper/notification_helper.dart';
import 'package:food_hub_app/utils/provider/notification_scheduling_provider.dart';
import 'package:food_hub_app/utils/provider/preference_settings_provider.dart';
import 'package:food_hub_app/utils/utils.dart';
import 'package:provider/provider.dart';

import '../../../main.dart';

class CardSettingWidget extends StatelessWidget {
  final PreferenceSettingsProvider preferenceSettingsProvider;

  const CardSettingWidget({
    super.key,
    required this.preferenceSettingsProvider,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = context.theme;

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.settings,
              color: grayColor80,
              size: 18,
            ),
            const SizedBox(width: 5),
            Text(
              'Setting',
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
            children: [
              Consumer<NotificationSchedulingProvider>(
                builder: (context, notificationSchedulingProvider, _) {
                  return DataSetting(
                    icon: const Icon(
                      Icons.alarm,
                      size: 15,
                      color: whiteColor,
                    ),
                    title: 'Daily Reminder',
                    switchValue:
                        preferenceSettingsProvider.isDailyNotificationActive,
                    switchOnChanged: (p0) {
                      notificationSchedulingProvider.notifScheduleNews(p0!);
                      preferenceSettingsProvider.enableDailyNotification(p0);
                      return null;
                    },
                  );
                },
              ),
              const SizedBox(height: 10),
              DataSetting(
                icon: const Icon(
                  Icons.light_mode_sharp,
                  size: 15,
                  color: whiteColor,
                ),
                title: 'Dark Mode Theme',
                switchValue: true,
                switchOnChanged: (p0) {
                  print('$p0 dark');
                },
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: orangeColor,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5,
                          spreadRadius: 0,
                          color: orangeColor20,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.notifications_active,
                      size: 15,
                      color: whiteColor,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Try Notification',
                    style: theme.textTheme.headline4!.copyWith(
                      fontSize: 14,
                      color: grayColor,
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      NotificationHelper notificationHelper =
                          NotificationHelper();
                      notificationHelper.tryNotification(
                          flutterLocalNotificationsPlugin,
                          'Hello There!',
                          'This is example Notification:)');
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.blue[700],
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5,
                            spreadRadius: 0,
                            color: orangeColor20,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Text(
                        'Try',
                        style: theme.textTheme.headline4!.copyWith(
                          fontSize: 11,
                          color: whiteColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class DataSetting extends StatelessWidget {
  const DataSetting({
    Key? key,
    required this.icon,
    required this.title,
    required this.switchValue,
    required this.switchOnChanged,
  }) : super(key: key);

  final Icon icon;
  final String title;
  final bool switchValue;
  final VoidCallback? Function(bool?)? switchOnChanged;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = context.theme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: orangeColor,
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
        Text(
          title,
          style: theme.textTheme.headline4!.copyWith(
            fontSize: 14,
            color: grayColor,
          ),
        ),
        const Spacer(),
        SizedBox(
          width: 40,
          height: 32,
          child: FittedBox(
            fit: BoxFit.fill,
            child: Switch.adaptive(
              value: switchValue,
              onChanged: (value) => switchOnChanged!(value),
            ),
          ),
        ),
      ],
    );
  }
}
