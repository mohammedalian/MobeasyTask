import 'package:flutter/material.dart';
import '../../data/models/option_model.dart';
import '../../data/models/question_model.dart';
import '../resources/app_colors.dart';
import '../resources/app_size.dart';

class OptionsWidget extends StatelessWidget {
  const OptionsWidget({
    super.key,
    required this.questionModel,
    required this.onClickedOption,
  });
  final QuestionModel questionModel;
  final ValueChanged<OptionModel> onClickedOption;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: questionModel.options!
            .map(
              (option) => buildOption(context, option),
            )
            .toList(),
      ),
    );
  }

  Widget buildOption(BuildContext context, OptionModel optionModel) {
    final color = getColorForOption(optionModel, questionModel);
    return GestureDetector(
      onTap: () => onClickedOption(optionModel),
      child: Container(
        height: AppSize.s50,
        padding: const EdgeInsets.all(AppSize.s12),
        margin: const EdgeInsets.symmetric(vertical: AppSize.s8),
        decoration: BoxDecoration(
          color: AppColors.grey200,
          borderRadius: BorderRadius.circular(AppSize.s16),
          border: Border.all(color: color),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              optionModel.text.toString(),
            ),
          ],
        ),
      ),
    );
  }

  Color getColorForOption(
      OptionModel optionModel, QuestionModel questionModel) {
    final isSelcted = optionModel == questionModel.selectedOption;
    if (isSelcted) {
      return AppColors.green;
    } else {
      return AppColors.grey200;
    }
  }
}
