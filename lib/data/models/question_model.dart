import 'option_model.dart';

class QuestionModel {
  String? questionTittle;
  List<OptionModel>? options;
  OptionModel? selectedOption;

  QuestionModel({
    this.options,
    this.questionTittle,
    this.selectedOption,
  });
}
