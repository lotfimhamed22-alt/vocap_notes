class WordModel {
  final int indexAtDatabase;
  final String text;
  final bool isArabic;
  final int colorCode;
  final List<String> arabicSimilarWord;
  final List<String> englishSimilarWord;
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
}
