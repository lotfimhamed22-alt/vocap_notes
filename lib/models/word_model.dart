class WordModel {
  final int indexAtDatabase;
  final String text;
  final bool isArabic;
  final int colorCode;
  final List<String> arabicSimilarWord; // ["احمد","محمد"]
  final List<String> englishSimilarWord; //["ahmed","mohamed"]
  final List<String> arabicExamples;
  final List<String> englishExamples;

  WordModel({
    required this.indexAtDatabase,
    required this.text,
    required this.isArabic,
    required this.colorCode,
    this.arabicSimilarWord = const [],
    this.arabicExamples = const [],
    this.englishExamples = const [],
    this.englishSimilarWord = const [],
  });
  // Add Similar Words
  WordModel addSimilarWords(String similarWord, bool isArabicSimilarWord) {
    List<String> newSimilarWord = _initializeSimilarWord(isArabicSimilarWord);

    newSimilarWord.add(similarWord); //["ahmed","mohamed", "new similar word"]
    return _getWordAfterSimilarWord(newSimilarWord, isArabicSimilarWord);
  }

  // delete similar word
  WordModel deleteSimilarWord(int indexAtDatabase, bool isArabicSimilarWord) {
    List<String> newSimilarWord = _initializeSimilarWord(isArabicSimilarWord);

    newSimilarWord.removeAt(indexAtDatabase);
    return _getWordAfterSimilarWord(newSimilarWord, isArabicSimilarWord);
  }

  // Add Example word
  WordModel addExampleWord(String example, bool isArabicExample) {
    List<String> newExample = _initializeNewExample(isArabicExample);
    newExample.add(example);
    return _getWordAfterExampleWord(newExample, isArabicExample);
  }

  // delete example word
  WordModel deleteExampleWord(int indexAtDatabase, bool isArabicExample) {
    List<String> newExample = _initializeNewExample(isArabicExample);
    newExample.removeAt(indexAtDatabase);
    return _getWordAfterExampleWord(newExample, isArabicExample);
  }

  // decrement index
  WordModel decrementIndexAtDatabase() {
    return WordModel(
      indexAtDatabase: indexAtDatabase - 1,
      text: text,
      isArabic: isArabic,
      colorCode: colorCode,
      arabicSimilarWord: arabicSimilarWord,
      englishSimilarWord: englishSimilarWord,

      arabicExamples: arabicExamples,
      englishExamples: englishExamples,
    );
  }

  // reference code to similar word
  List<String> _initializeSimilarWord(bool isArabicSimilarWord) {
    if (isArabicSimilarWord) {
      return List.from(arabicSimilarWord);
    } else {
      return List.from(englishSimilarWord);
    }
  }

  WordModel _getWordAfterSimilarWord(
    List<String> newSimilarWord,
    bool isArabicSimilarWord,
  ) {
    return WordModel(
      indexAtDatabase: indexAtDatabase,
      text: text,
      isArabic: isArabic,
      colorCode: colorCode,
      arabicExamples: arabicExamples,
      englishExamples: englishExamples,
      arabicSimilarWord: isArabicSimilarWord
          ? newSimilarWord
          : arabicSimilarWord,
      englishSimilarWord: !isArabicSimilarWord
          ? newSimilarWord
          : englishSimilarWord,
    );
  }

  // reference code to example word
  List<String> _initializeNewExample(bool isArabicExample) {
    if (isArabicExample) {
      return List.from(arabicExamples);
    } else {
      return List.from(englishExamples);
    }
  }

  WordModel _getWordAfterExampleWord(
    List<String> newExample,
    bool isArabicExample,
  ) {
    return WordModel(
      indexAtDatabase: indexAtDatabase,
      text: text,
      isArabic: isArabic,
      colorCode: colorCode,
      arabicSimilarWord: arabicSimilarWord,
      englishSimilarWord: englishSimilarWord,
      arabicExamples: isArabicExample ? newExample : arabicExamples,
      englishExamples: isArabicExample ? newExample : englishExamples,
    );
  }
}
