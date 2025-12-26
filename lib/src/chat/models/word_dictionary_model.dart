import 'package:json_annotation/json_annotation.dart';
import 'package:mini_chat_app/src/src.dart';

part 'word_dictionary_model.g.dart';

@JsonSerializable()
class WordDictionaryModel {
  const WordDictionaryModel({
    this.word = '',
    this.phonetic = '',
    this.phonetics = const [],
    this.origin = '',
    this.meanings = const [],
  });

  factory WordDictionaryModel.fromJson(Map<String, dynamic> json) =>
      _$WordDictionaryModelFromJson(json);
  Map<String, dynamic> toJson() => _$WordDictionaryModelToJson(this);

  final String word;
  final String phonetic;
  final List<PhoneticModel> phonetics;
  final String origin;
  final List<MeaningModel> meanings;

  WordDictionary get toEntity => WordDictionary(
    word: word,
    phonetic: phonetic,
    phonetics: phonetics.map((e) => e.toEntity).toList(),
    origin: origin,
    meanings: meanings.map((e) => e.toEntity).toList(),
  );
}

@JsonSerializable()
class PhoneticModel {
  const PhoneticModel({
    this.text = '',
    this.audio = '',
  });

  factory PhoneticModel.fromJson(Map<String, dynamic> json) =>
      _$PhoneticModelFromJson(json);
  Map<String, dynamic> toJson() => _$PhoneticModelToJson(this);

  final String text;
  final String audio;

  Phonetic get toEntity => Phonetic(
    text: text,
    audio: audio,
  );
}

@JsonSerializable()
class MeaningModel {
  const MeaningModel({
    this.partOfSpeech = '',
    this.definitions = const [],
  });

  factory MeaningModel.fromJson(Map<String, dynamic> json) =>
      _$MeaningModelFromJson(json);
  Map<String, dynamic> toJson() => _$MeaningModelToJson(this);

  final String partOfSpeech;
  final List<DefinitionEntryModel> definitions;

  Meaning get toEntity => Meaning(
    partOfSpeech: partOfSpeech,
    definitions: definitions.map((e) => e.toEntity).toList(),
  );
}

@JsonSerializable()
class DefinitionEntryModel {
  const DefinitionEntryModel({
    this.definition = '',
    this.example = '',
    this.synonyms = const [],
    this.antonyms = const [],
  });

  factory DefinitionEntryModel.fromJson(Map<String, dynamic> json) =>
      _$DefinitionEntryModelFromJson(json);
  Map<String, dynamic> toJson() => _$DefinitionEntryModelToJson(this);

  final String definition;
  final String example;
  final List<String> synonyms;
  final List<String> antonyms;

  DefinitionEntry get toEntity => DefinitionEntry(
    definition: definition,
    example: example,
  );
}
