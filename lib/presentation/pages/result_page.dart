
import 'package:flutter/material.dart';
import '../../data/models/option_model.dart';
import '../resources/app_colors.dart';
import '../resources/app_size.dart';
import '../resources/app_strings.dart';
import '../widgets/text_widget.dart';
import '../../utils/constans.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: TextWidget(
          text: AppStrings.result,
          color: AppColors.white,
          textSize: AppSize.s20,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSize.s16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: userListAnswers.map(
                  (e) {
                    final OptionModel correctAnswer = e.options!
                        .where((element) => element.isCorrect == true)
                        .first;

                    return e.selectedOption!.isCorrect == false
                        ? Column(
                            children: [
                              const Text(AppStrings.question),
                              const SizedBox(
                                height: AppSize.s16,
                              ),
                              Text(
                                e.questionTittle.toString(),
                              ),
                              const SizedBox(
                                height: AppSize.s16,
                              ),
                              const Text(AppStrings.wrongAnswer),
                              const SizedBox(
                                height: AppSize.s16,
                              ),
                              Text(
                                e.selectedOption!.isCorrect == true
                                    ? ''
                                    : e.selectedOption!.text.toString(),
                              ),
                              const SizedBox(
                                height: AppSize.s16,
                              ),
                              const Text(AppStrings.correctAnswer),
                              const SizedBox(
                                height: AppSize.s16,
                              ),
                              Text(
                                correctAnswer.text.toString(),
                              ),
                              const SizedBox(
                                height: AppSize.s16,
                              ),
                              const Divider(),
                            ],
                          )
                        : const SizedBox.shrink();
                  },
                ).toList(),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(
                    context, AppStrings.leaderBoardPage);
              },
              child: TextWidget(
                text: AppStrings.showLeaderBoard,
                color: AppColors.black,
                textSize: AppSize.s24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
