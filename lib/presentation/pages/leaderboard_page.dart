import 'package:flutter/material.dart';
import '../resources/app_colors.dart';
import '../resources/app_size.dart';
import '../resources/app_strings.dart';
import '../widgets/text_widget.dart';
import '../../utils/constans.dart';

class LeaderBoardPage extends StatelessWidget {
  const LeaderBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: TextWidget(
            text: AppStrings.leaderBoard,
            color: AppColors.white,
            textSize: AppSize.s20),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSize.s16),
        child: Column(
          children: userListAnswers
              .map((questionModel) => _buildScoreWidget())
              .toList(),
        ),
      ),
    );
  }

  Widget _buildScoreWidget() {
    return const Padding(
      padding:  EdgeInsets.all(AppSize.s12),
      child:  Row(
    
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FlutterLogo(
            size: AppSize.s20,
          ),
          Text('Mohammed Alian'),
          Text('3'),
        ],
      ),
    );
  }
}
