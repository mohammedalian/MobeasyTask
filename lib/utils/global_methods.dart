import 'package:flutter/material.dart';
import '../presentation/resources/app_colors.dart';
import '../presentation/resources/app_size.dart';
import '../presentation/resources/app_strings.dart';
import '../presentation/widgets/text_widget.dart';

class GlobalMethods {
  static Future<void> errorDialog({
    required String subtitle,
    required BuildContext context,
  }) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Row(
            children: [
              Image.asset(
                'assets/images/warning-sign.png',
                height: AppSize.s20,
                width: AppSize.s20,
                fit: BoxFit.fill,
              ),
              const SizedBox(
                width: AppSize.s8,
              ),
              const Text(AppStrings.errorOccured),
            ],
          ),
          content: Text(subtitle),
          actions: [
            TextButton(
              onPressed: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              },
              child: TextWidget(
                color: AppColors.cyan,
                text: AppStrings.ok,
                textSize: AppSize.s24,
              ),
            ),
          ],
        );
      },
    );
  }
}
