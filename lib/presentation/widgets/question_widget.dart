import 'package:flutter/material.dart';
import '../../data/models/option_model.dart';
import '../../data/models/question_model.dart';
import '../resources/app_colors.dart';
import '../resources/app_size.dart';
import '../../utils/constans.dart';
import 'options_widget.dart';
import 'text_widget.dart';

class QuestionWidget extends StatefulWidget {
  const QuestionWidget({super.key, required this.questionModel});
  final QuestionModel questionModel;

  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          text: widget.questionModel.questionTittle.toString(),
          color: AppColors.black,
          textSize: AppSize.s24,
        ),
        const SizedBox(
          height: AppSize.s16,
        ),
        Expanded(
          child: OptionsWidget(
            questionModel: widget.questionModel,
            onClickedOption: (OptionModel value) {
              userListAnswers.add(
                QuestionModel(
                  questionTittle: widget.questionModel.questionTittle,
                  selectedOption: value,
                  options: widget.questionModel.options,
                ),
              );
              setState(() {
                widget.questionModel.selectedOption = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
