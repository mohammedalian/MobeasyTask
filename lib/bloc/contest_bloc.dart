import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobeasytask/presentation/resources/app_strings.dart';
import '../data/models/question_model.dart';
import '../data/remoteDataSource/firebase_provider.dart';
part 'contest_event.dart';
part 'contest_state.dart';

class ContestBloc extends Bloc<ContestEvent, ContestState> {
  ContestBloc() : super(ContestLoading()) {
    on<ContestEventLoadQuestions>(_loadQuestions);
    on<ButtonClickedEvent>(_changeBtnText);
    on<ContestEventControlPage>((event, emit) {
      emit(ContestControllerState(page: questionsNum));
    });
  }
  final int questionsNum = 0;

  Future<void> _changeBtnText(
      ButtonClickedEvent event, Emitter<ContestState> emit) async {
    emit(ContestLoaded());
  }

  Future<void> _loadQuestions(
    ContestEventLoadQuestions event,
    Emitter<ContestState> emit,
  ) async {
    emit(ContestLoading());
    try {
      final questions = await FirebaseProvider().fetchProducts();
      emit(
        ContestLoaded(
          questions: questions,
        ),
      );
    } catch (e) {
      emit(ContestError(errorMessage: AppStrings.errorLoadingQuestions));
    }
  }
}
