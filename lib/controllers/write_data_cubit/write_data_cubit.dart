// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:vocap_notes/constants/hive_constants.dart';
import 'package:vocap_notes/controllers/write_data_cubit/write_data_cubit_state.dart';
import 'package:vocap_notes/models/word_model.dart';

class WriteDataCubit extends Cubit<WriteDataCubitState> {
  WriteDataCubit() : super(WriteDataCubitInitial());
  static WriteDataCubit get(BuildContext context) => BlocProvider.of(context);
  // attributes collected from UI
  final Box box = Hive.box(HiveConstants.wordsBox);
  String text = '';
  bool isArabic = true;
  int colorCode = 0xFF2196F3;
  // methodes
  void updateText(String text) {
    this.text = text;
    emit(WriteDataCubitInitial());
  }

  //

  void updateIsArabic(bool isArabic) {
    this.isArabic = isArabic;
    emit(WriteDataCubitInitial());
  }

  //
  void updateColorCode(int colorCode) {
    this.colorCode = colorCode;
    emit(WriteDataCubitInitial());
  }

  // add word
  void addWord() {
    _tryAndCatchMethod(() {
      List<WordModel> words = _getBoxFromDatabase();
      words.add(
        WordModel(
          indexAtDatabase: words.length,
          text: text,
          isArabic: isArabic,
          colorCode: colorCode,
        ),
      );
      box.put(HiveConstants.wordsList, words);
    });
  }

  // remove item at database
  void deleteWord(int indexAtDatabase) {
    _tryAndCatchMethod(() {
      List<WordModel> words = _getBoxFromDatabase();
      words.removeAt(indexAtDatabase);
      for (var i = indexAtDatabase; i < words.length; i++) {
        words[i] = words[i].decrementIndexAtDatabase();
      }
      box.put(HiveConstants.wordsList, words);
    });
  }

  void addSimilarWord(int indexAtDatabase) {
    _tryAndCatchMethod(() {
      List<WordModel> words = _getBoxFromDatabase();
      words[indexAtDatabase] = words[indexAtDatabase].addSimilarWords(
        text,
        isArabic,
      );
      box.put(HiveConstants.wordsList, words);
    });
  }

  // add example
  void addExample(int indexAtDatabase) {
    _tryAndCatchMethod(() {
      List<WordModel> words = _getBoxFromDatabase();
      words[indexAtDatabase] = words[indexAtDatabase].addExampleWord(
        text,
        isArabic,
      );
      box.put(HiveConstants.wordsList, words);
    });
  }

  // delete similar word
  void deleteSimilarWord(
    int indexAtDatabase,
    int indexAtSimilarWord,
    bool isArabicSimilarWord,
  ) {
    _tryAndCatchMethod(() {
      List<WordModel> words = _getBoxFromDatabase();
      words[indexAtDatabase] = words[indexAtDatabase].deleteSimilarWord(
        indexAtSimilarWord,
        isArabicSimilarWord,
      );
      box.put(HiveConstants.wordsList, words);
    });
  }

  // delete example
  void deleteExample(
    int indexAtDatabase,
    int indexAtExampleWord,
    bool isArabicSimilarWord,
  ) {
    _tryAndCatchMethod(() {
      List<WordModel> words = _getBoxFromDatabase();
      words[indexAtDatabase] = words[indexAtDatabase].deleteExampleWord(
        indexAtExampleWord,
        isArabicSimilarWord,
      );
      box.put(HiveConstants.wordsList, words);
    });
  }

  // refactor code
  List<WordModel> _getBoxFromDatabase() => List.from(
    box.get(HiveConstants.wordsBox, defaultValue: []),
  ).cast<WordModel>();
  //
  void _tryAndCatchMethod(VoidCallback methodToExecute) {
    emit(WriteDataCubitLoading());
    try {
      methodToExecute();
      emit(WriteDataCubitSuccess());
    } catch (e) {
      emit(WriteDataCubitFailure(errorMessage: e.toString()));
    }
  }
}
