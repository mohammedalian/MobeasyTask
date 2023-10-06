part of 'contest_bloc.dart';

abstract class ContestState {}

class ContestLoading extends ContestState {}

class ContestLoaded extends ContestState {
  final List<QuestionModel>? questions;
  int questionsNum;

  ContestLoaded({this.questions, this.questionsNum = 0});
}

class ContestControllerState extends ContestState {
  int page;
  ContestControllerState({this.page = 0});
}

class ContestError extends ContestState {
  final String errorMessage;

  ContestError({required this.errorMessage});
}
