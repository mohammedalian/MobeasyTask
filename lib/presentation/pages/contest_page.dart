import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/contest_bloc.dart';
import '../resources/app_colors.dart';
import '../resources/app_size.dart';
import '../resources/app_strings.dart';
import '../widgets/question_widget.dart';
import '../widgets/text_widget.dart';

class ContestPage extends StatelessWidget {
  ContestPage({super.key});
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    final contestBloc = BlocProvider.of<ContestBloc>(context);
    contestBloc.add(ContestEventLoadQuestions());
    contestBloc.add(ContestEventControlPage());

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading:false ,
        centerTitle: true,
        title: TextWidget(
          text: AppStrings.contest,
          color: AppColors.white,
          textSize: AppSize.s20,
        ),
      ),
      body: BlocBuilder<ContestBloc, ContestState>(
        builder: (context, state) {
          if (state is ContestLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ContestLoaded) {
            // Display contest questions and answers
            return Column(
              children: [
                const SizedBox(
                  height: AppSize.s16,
                ),
                Expanded(
                  child: PageView.builder(
                    onPageChanged: (value) {
                      state.questionsNum = value;
                    },
                    controller: _controller,
                    itemCount: state.questions?.length ?? 0,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final question = state.questions![index];
                      return QuestionWidget(
                        questionModel: question,
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: AppSize.s16,
                ),
                ElevatedButton(
                  onPressed: () {
                    _controller.nextPage(
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.bounceIn);
                    if (_controller.page!.toInt() + 1 ==
                        state.questions!.length) {
                      Navigator.pushReplacementNamed(
                          context, AppStrings.resultPage);
                    }
                  },
                  child: TextWidget(
                    text: AppStrings.next,
                    textSize: AppSize.s24,
                    color: AppColors.black,
                  ),
                ),
              ],
            );
          } else if (state is ContestError) {
            return Center(
              child: Text(
                '${AppStrings.errorLoadingQuestions}${state.errorMessage}',
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
