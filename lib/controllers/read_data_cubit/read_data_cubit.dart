// ignore_for_file: strict_top_level_inference

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:vocap_notes/constants/hive_constants.dart';
import 'package:vocap_notes/controllers/read_data_cubit/read_data_cubit_states.dart';
import 'package:vocap_notes/models/word_model.dart';

class ReadDataCubit extends Cubit<ReadDataCubitStates> {
  static ReadDataCubit get(BuildContext context) => BlocProvider.of(context);
  ReadDataCubit() : super(ReadDataCubitInitial());
  Box box = Hive.box(HiveConstants.wordsBox);
  LanguageFilter languageFilter = LanguageFilter.allWords;
  SortedBy sortedBy = SortedBy.time;
  SortingType sortingType = SortingType.ascending;

  // update language
  void updateLanguage(LanguageFilter languageFilter) {
    this.languageFilter = languageFilter;
  }

  // update sorted by
  void updateSortedBy(SortedBy sortedBy) {
    this.sortedBy = sortedBy;
  }

  // update sorting type
  void updateSortingType(SortingType sortingType) {
    this.sortingType = sortingType;
  }

  // get word
  void getWords() {
    emit(ReadDataCubitLoading());
    try {
      List<WordModel> wordsToReturn = List.from(
        box.get(HiveConstants.wordsList, defaultValue: []),
      ).cast<WordModel>();
      _removeUnwantedWords(wordsToReturn);
      _applySorting(wordsToReturn);
      emit(ReadDataCubitSuccess(words: wordsToReturn));
    } catch (e) {
      emit(ReadDataCubitFailure(errorMessage: e.toString()));
    }
  }

  // remove unwanted words
  void _removeUnwantedWords(List<WordModel> wordsToReturn) {
    if (languageFilter == LanguageFilter.allWords) {
      return;
    }
    for (var i = 0; i < wordsToReturn.length; i++) {
      if ((languageFilter == LanguageFilter.arabicOnly &&
              wordsToReturn[i].isArabic == false) ||
          (languageFilter == LanguageFilter.englishOnly &&
              wordsToReturn[i].isArabic == true)) {
        wordsToReturn.removeAt(i);
        i--;
      }
    }
  }

  // sorting
  void _applySorting(List<WordModel> wordsToReturn) {
    if (sortedBy == SortedBy.time) {
      if (sortingType == SortingType.ascending) {
        return;
      } else {
        _reverse(wordsToReturn);
      }
    } else {
      wordsToReturn.sort(
        (WordModel a, WordModel b) => a.text.length.compareTo(b.text.length),
      );
      if (sortingType == SortingType.ascending) {
        return;
      } else {
        _reverse(wordsToReturn);
      }
    }
  }

  // reverse
  void _reverse(List<WordModel> wordsToReturn) {
    for (var i = 0; i < wordsToReturn.length / 2; i++) {
      WordModel temp = wordsToReturn[i];
      wordsToReturn[i] = wordsToReturn[wordsToReturn.length - 1 - i];
      wordsToReturn[wordsToReturn.length - 1 - i] = temp;
    }
  }
}

enum LanguageFilter { arabicOnly, allWords, englishOnly }

enum SortedBy { time, wordLength }

enum SortingType { ascending, descending }
