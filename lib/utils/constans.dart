import 'package:firebase_auth/firebase_auth.dart';
import '../data/models/question_model.dart';

final FirebaseAuth authInstance = FirebaseAuth.instance;
List<QuestionModel> userListAnswers = [];
