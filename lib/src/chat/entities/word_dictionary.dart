import 'package:freezed_annotation/freezed_annotation.dart';
part 'word_dictionary.freezed.dart';

@freezed
abstract class WordDictionary with _$WordDictionary {
  const factory WordDictionary({
    @Default('') String word,
    @Default('') String phonetic,
    @Default([]) List<Phonetic> phonetics,
    @Default('') String origin,
    @Default([]) List<Meaning> meanings,
  }) = _WordDictionary;

  const WordDictionary._();

  static const empty = WordDictionary();
  bool get isEmpty => this == WordDictionary.empty;
  bool get isNotEmpty => this != WordDictionary.empty;
}

@freezed
abstract class Phonetic with _$Phonetic {
  const factory Phonetic({
    @Default('') String text,
    @Default('') String audio,
  }) = _Phonetic;

  const Phonetic._();
  static const empty = Phonetic();
  bool get isEmpty => this == Phonetic.empty;
  bool get isNotEmpty => this != Phonetic.empty;
}

@freezed
abstract class Meaning with _$Meaning {
  const factory Meaning({
    @Default('') String partOfSpeech,
    @Default([]) List<DefinitionEntry> definitions,
  }) = _Meaning;

  const Meaning._();
  static const empty = Meaning();
  bool get isEmpty => this == Meaning.empty;
  bool get isNotEmpty => this != Meaning.empty;
}

@freezed
abstract class DefinitionEntry with _$DefinitionEntry {
  const factory DefinitionEntry({
    @Default('') String definition,
    @Default('') String example,
  }) = _DefinitionEntry;

  const DefinitionEntry._();
  static const empty = DefinitionEntry();
  bool get isEmpty => this == DefinitionEntry.empty;
  bool get isNotEmpty => this != DefinitionEntry.empty;
}
