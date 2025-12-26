// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word_dictionary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WordDictionaryModel _$WordDictionaryModelFromJson(Map<String, dynamic> json) =>
    WordDictionaryModel(
      word: json['word'] as String? ?? '',
      phonetic: json['phonetic'] as String? ?? '',
      phonetics:
          (json['phonetics'] as List<dynamic>?)
              ?.map((e) => PhoneticModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      origin: json['origin'] as String? ?? '',
      meanings:
          (json['meanings'] as List<dynamic>?)
              ?.map((e) => MeaningModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$WordDictionaryModelToJson(
  WordDictionaryModel instance,
) => <String, dynamic>{
  'word': instance.word,
  'phonetic': instance.phonetic,
  'phonetics': instance.phonetics,
  'origin': instance.origin,
  'meanings': instance.meanings,
};

PhoneticModel _$PhoneticModelFromJson(Map<String, dynamic> json) =>
    PhoneticModel(
      text: json['text'] as String? ?? '',
      audio: json['audio'] as String? ?? '',
    );

Map<String, dynamic> _$PhoneticModelToJson(PhoneticModel instance) =>
    <String, dynamic>{'text': instance.text, 'audio': instance.audio};

MeaningModel _$MeaningModelFromJson(Map<String, dynamic> json) => MeaningModel(
  partOfSpeech: json['partOfSpeech'] as String? ?? '',
  definitions:
      (json['definitions'] as List<dynamic>?)
          ?.map((e) => DefinitionEntryModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$MeaningModelToJson(MeaningModel instance) =>
    <String, dynamic>{
      'partOfSpeech': instance.partOfSpeech,
      'definitions': instance.definitions,
    };

DefinitionEntryModel _$DefinitionEntryModelFromJson(
  Map<String, dynamic> json,
) => DefinitionEntryModel(
  definition: json['definition'] as String? ?? '',
  example: json['example'] as String? ?? '',
  synonyms:
      (json['synonyms'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  antonyms:
      (json['antonyms'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
);

Map<String, dynamic> _$DefinitionEntryModelToJson(
  DefinitionEntryModel instance,
) => <String, dynamic>{
  'definition': instance.definition,
  'example': instance.example,
  'synonyms': instance.synonyms,
  'antonyms': instance.antonyms,
};
