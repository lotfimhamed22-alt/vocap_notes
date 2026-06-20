import 'package:hive/hive.dart';
import 'package:vocap_notes/models/word_model.dart';

class WordTypeAdapter extends TypeAdapter<WordModel> {
  @override
  WordModel read(BinaryReader reader) {
    return WordModel(
      indexAtDatabase: reader.readInt(),
      text: reader.readString(),
      isArabic: reader.readBool(),
      colorCode: reader.readInt(),
      arabicSimilarWord: reader.readStringList(),
      englishSimilarWord: reader.readStringList(),
      arabicExamples: reader.readStringList(),
      englishExamples: reader.readStringList(),
    );
  }

  @override
  int get typeId => 0;

  @override
  void write(BinaryWriter writer, WordModel obj) {
    writer.writeInt(obj.indexAtDatabase);
    writer.writeInt(obj.colorCode);
    writer.writeBool(obj.isArabic);
    writer.writeString(obj.text);
    writer.writeStringList(obj.arabicSimilarWord);
    writer.writeStringList(obj.englishSimilarWord);
    writer.writeStringList(obj.arabicExamples);
    writer.writeStringList(obj.englishExamples);
  }
}
