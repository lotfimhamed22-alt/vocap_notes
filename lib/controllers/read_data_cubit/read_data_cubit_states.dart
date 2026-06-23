import 'package:vocap_notes/models/word_model.dart';

abstract class ReadDataCubitStates {}

class ReadDataCubitInitial extends ReadDataCubitStates {}

class ReadDataCubitLoading extends ReadDataCubitStates {}

class ReadDataCubitSuccess extends ReadDataCubitStates {
  final List<WordModel> words;
  ReadDataCubitSuccess({required this.words});
}

class ReadDataCubitFailure extends ReadDataCubitStates {
  final String errorMessage;

  ReadDataCubitFailure({required this.errorMessage});
}
