import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/option_model.dart';
import '../models/question_model.dart';

class FirebaseProvider {
  static final List<QuestionModel> _questionList = [];
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<List<QuestionModel>> fetchProducts() async {
    CollectionReference collection = firestore.collection('questions');

    try {
      QuerySnapshot querySnapshot = await collection.get();
      _questionList.clear();
      for (int index = 0; index <= querySnapshot.docs.length; index++) {
        if (querySnapshot.docs[index].exists) {
          Map<String, dynamic> data =
              querySnapshot.docs[index].data() as Map<String, dynamic>;

          String? questionTittle =
              data.values.first['questionTittle'] as String?;
          List<dynamic> listOfMaps =
              data.values.first['options'] as List<dynamic>;
          List<OptionModel> optionsList =
              []; // Create a new options list for each question
          for (var mapData in listOfMaps) {
            Map<String, dynamic> map = mapData as Map<String, dynamic>;

            String text = map['text'];
            bool isCorrect = map['isCorrect'];
            optionsList.add(
              OptionModel(
                text: text,
                isCorrect: isCorrect,
              ),
            );
          }
          _questionList.add(
            QuestionModel(
              questionTittle: questionTittle,
              options: optionsList,
            ),
          );
        }
      }
    } catch (e) {
      log(e.toString());
    }

    return _questionList;
  }
}