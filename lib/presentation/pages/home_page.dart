import 'package:flutter/material.dart';
import '../resources/app_size.dart';
import '../resources/app_strings.dart';
import '../widgets/google_button.dart';
import '../widgets/text_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: TextWidget(
          text: AppStrings.appName,
          textSize: AppSize.s20,
          color: Colors.white,
        ),
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GoogleButton(),
        ],
      ),
    );
  }
}
