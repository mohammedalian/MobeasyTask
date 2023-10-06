part of 'contest_bloc.dart';

sealed class ContestEvent {}

class ContestEventLoadQuestions extends ContestEvent {}

class ButtonClickedEvent extends ContestEvent {
  int questionsNum = 0;
  ButtonClickedEvent(this.questionsNum);
}

class ContestEventControlPage extends ContestEvent {}
