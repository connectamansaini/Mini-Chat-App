// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'word_dictionary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WordDictionary {

 String get word; String get phonetic; List<Phonetic> get phonetics; String get origin; List<Meaning> get meanings;
/// Create a copy of WordDictionary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WordDictionaryCopyWith<WordDictionary> get copyWith => _$WordDictionaryCopyWithImpl<WordDictionary>(this as WordDictionary, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WordDictionary&&(identical(other.word, word) || other.word == word)&&(identical(other.phonetic, phonetic) || other.phonetic == phonetic)&&const DeepCollectionEquality().equals(other.phonetics, phonetics)&&(identical(other.origin, origin) || other.origin == origin)&&const DeepCollectionEquality().equals(other.meanings, meanings));
}


@override
int get hashCode => Object.hash(runtimeType,word,phonetic,const DeepCollectionEquality().hash(phonetics),origin,const DeepCollectionEquality().hash(meanings));

@override
String toString() {
  return 'WordDictionary(word: $word, phonetic: $phonetic, phonetics: $phonetics, origin: $origin, meanings: $meanings)';
}


}

/// @nodoc
abstract mixin class $WordDictionaryCopyWith<$Res>  {
  factory $WordDictionaryCopyWith(WordDictionary value, $Res Function(WordDictionary) _then) = _$WordDictionaryCopyWithImpl;
@useResult
$Res call({
 String word, String phonetic, List<Phonetic> phonetics, String origin, List<Meaning> meanings
});




}
/// @nodoc
class _$WordDictionaryCopyWithImpl<$Res>
    implements $WordDictionaryCopyWith<$Res> {
  _$WordDictionaryCopyWithImpl(this._self, this._then);

  final WordDictionary _self;
  final $Res Function(WordDictionary) _then;

/// Create a copy of WordDictionary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? word = null,Object? phonetic = null,Object? phonetics = null,Object? origin = null,Object? meanings = null,}) {
  return _then(_self.copyWith(
word: null == word ? _self.word : word // ignore: cast_nullable_to_non_nullable
as String,phonetic: null == phonetic ? _self.phonetic : phonetic // ignore: cast_nullable_to_non_nullable
as String,phonetics: null == phonetics ? _self.phonetics : phonetics // ignore: cast_nullable_to_non_nullable
as List<Phonetic>,origin: null == origin ? _self.origin : origin // ignore: cast_nullable_to_non_nullable
as String,meanings: null == meanings ? _self.meanings : meanings // ignore: cast_nullable_to_non_nullable
as List<Meaning>,
  ));
}

}


/// Adds pattern-matching-related methods to [WordDictionary].
extension WordDictionaryPatterns on WordDictionary {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WordDictionary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WordDictionary() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WordDictionary value)  $default,){
final _that = this;
switch (_that) {
case _WordDictionary():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WordDictionary value)?  $default,){
final _that = this;
switch (_that) {
case _WordDictionary() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String word,  String phonetic,  List<Phonetic> phonetics,  String origin,  List<Meaning> meanings)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WordDictionary() when $default != null:
return $default(_that.word,_that.phonetic,_that.phonetics,_that.origin,_that.meanings);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String word,  String phonetic,  List<Phonetic> phonetics,  String origin,  List<Meaning> meanings)  $default,) {final _that = this;
switch (_that) {
case _WordDictionary():
return $default(_that.word,_that.phonetic,_that.phonetics,_that.origin,_that.meanings);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String word,  String phonetic,  List<Phonetic> phonetics,  String origin,  List<Meaning> meanings)?  $default,) {final _that = this;
switch (_that) {
case _WordDictionary() when $default != null:
return $default(_that.word,_that.phonetic,_that.phonetics,_that.origin,_that.meanings);case _:
  return null;

}
}

}

/// @nodoc


class _WordDictionary extends WordDictionary {
  const _WordDictionary({this.word = '', this.phonetic = '', final  List<Phonetic> phonetics = const [], this.origin = '', final  List<Meaning> meanings = const []}): _phonetics = phonetics,_meanings = meanings,super._();
  

@override@JsonKey() final  String word;
@override@JsonKey() final  String phonetic;
 final  List<Phonetic> _phonetics;
@override@JsonKey() List<Phonetic> get phonetics {
  if (_phonetics is EqualUnmodifiableListView) return _phonetics;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_phonetics);
}

@override@JsonKey() final  String origin;
 final  List<Meaning> _meanings;
@override@JsonKey() List<Meaning> get meanings {
  if (_meanings is EqualUnmodifiableListView) return _meanings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_meanings);
}


/// Create a copy of WordDictionary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WordDictionaryCopyWith<_WordDictionary> get copyWith => __$WordDictionaryCopyWithImpl<_WordDictionary>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WordDictionary&&(identical(other.word, word) || other.word == word)&&(identical(other.phonetic, phonetic) || other.phonetic == phonetic)&&const DeepCollectionEquality().equals(other._phonetics, _phonetics)&&(identical(other.origin, origin) || other.origin == origin)&&const DeepCollectionEquality().equals(other._meanings, _meanings));
}


@override
int get hashCode => Object.hash(runtimeType,word,phonetic,const DeepCollectionEquality().hash(_phonetics),origin,const DeepCollectionEquality().hash(_meanings));

@override
String toString() {
  return 'WordDictionary(word: $word, phonetic: $phonetic, phonetics: $phonetics, origin: $origin, meanings: $meanings)';
}


}

/// @nodoc
abstract mixin class _$WordDictionaryCopyWith<$Res> implements $WordDictionaryCopyWith<$Res> {
  factory _$WordDictionaryCopyWith(_WordDictionary value, $Res Function(_WordDictionary) _then) = __$WordDictionaryCopyWithImpl;
@override @useResult
$Res call({
 String word, String phonetic, List<Phonetic> phonetics, String origin, List<Meaning> meanings
});




}
/// @nodoc
class __$WordDictionaryCopyWithImpl<$Res>
    implements _$WordDictionaryCopyWith<$Res> {
  __$WordDictionaryCopyWithImpl(this._self, this._then);

  final _WordDictionary _self;
  final $Res Function(_WordDictionary) _then;

/// Create a copy of WordDictionary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? word = null,Object? phonetic = null,Object? phonetics = null,Object? origin = null,Object? meanings = null,}) {
  return _then(_WordDictionary(
word: null == word ? _self.word : word // ignore: cast_nullable_to_non_nullable
as String,phonetic: null == phonetic ? _self.phonetic : phonetic // ignore: cast_nullable_to_non_nullable
as String,phonetics: null == phonetics ? _self._phonetics : phonetics // ignore: cast_nullable_to_non_nullable
as List<Phonetic>,origin: null == origin ? _self.origin : origin // ignore: cast_nullable_to_non_nullable
as String,meanings: null == meanings ? _self._meanings : meanings // ignore: cast_nullable_to_non_nullable
as List<Meaning>,
  ));
}


}

/// @nodoc
mixin _$Phonetic {

 String get text; String get audio;
/// Create a copy of Phonetic
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PhoneticCopyWith<Phonetic> get copyWith => _$PhoneticCopyWithImpl<Phonetic>(this as Phonetic, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Phonetic&&(identical(other.text, text) || other.text == text)&&(identical(other.audio, audio) || other.audio == audio));
}


@override
int get hashCode => Object.hash(runtimeType,text,audio);

@override
String toString() {
  return 'Phonetic(text: $text, audio: $audio)';
}


}

/// @nodoc
abstract mixin class $PhoneticCopyWith<$Res>  {
  factory $PhoneticCopyWith(Phonetic value, $Res Function(Phonetic) _then) = _$PhoneticCopyWithImpl;
@useResult
$Res call({
 String text, String audio
});




}
/// @nodoc
class _$PhoneticCopyWithImpl<$Res>
    implements $PhoneticCopyWith<$Res> {
  _$PhoneticCopyWithImpl(this._self, this._then);

  final Phonetic _self;
  final $Res Function(Phonetic) _then;

/// Create a copy of Phonetic
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? text = null,Object? audio = null,}) {
  return _then(_self.copyWith(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,audio: null == audio ? _self.audio : audio // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Phonetic].
extension PhoneticPatterns on Phonetic {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Phonetic value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Phonetic() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Phonetic value)  $default,){
final _that = this;
switch (_that) {
case _Phonetic():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Phonetic value)?  $default,){
final _that = this;
switch (_that) {
case _Phonetic() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String text,  String audio)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Phonetic() when $default != null:
return $default(_that.text,_that.audio);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String text,  String audio)  $default,) {final _that = this;
switch (_that) {
case _Phonetic():
return $default(_that.text,_that.audio);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String text,  String audio)?  $default,) {final _that = this;
switch (_that) {
case _Phonetic() when $default != null:
return $default(_that.text,_that.audio);case _:
  return null;

}
}

}

/// @nodoc


class _Phonetic extends Phonetic {
  const _Phonetic({this.text = '', this.audio = ''}): super._();
  

@override@JsonKey() final  String text;
@override@JsonKey() final  String audio;

/// Create a copy of Phonetic
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PhoneticCopyWith<_Phonetic> get copyWith => __$PhoneticCopyWithImpl<_Phonetic>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Phonetic&&(identical(other.text, text) || other.text == text)&&(identical(other.audio, audio) || other.audio == audio));
}


@override
int get hashCode => Object.hash(runtimeType,text,audio);

@override
String toString() {
  return 'Phonetic(text: $text, audio: $audio)';
}


}

/// @nodoc
abstract mixin class _$PhoneticCopyWith<$Res> implements $PhoneticCopyWith<$Res> {
  factory _$PhoneticCopyWith(_Phonetic value, $Res Function(_Phonetic) _then) = __$PhoneticCopyWithImpl;
@override @useResult
$Res call({
 String text, String audio
});




}
/// @nodoc
class __$PhoneticCopyWithImpl<$Res>
    implements _$PhoneticCopyWith<$Res> {
  __$PhoneticCopyWithImpl(this._self, this._then);

  final _Phonetic _self;
  final $Res Function(_Phonetic) _then;

/// Create a copy of Phonetic
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? text = null,Object? audio = null,}) {
  return _then(_Phonetic(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,audio: null == audio ? _self.audio : audio // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$Meaning {

 String get partOfSpeech; List<DefinitionEntry> get definitions;
/// Create a copy of Meaning
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MeaningCopyWith<Meaning> get copyWith => _$MeaningCopyWithImpl<Meaning>(this as Meaning, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Meaning&&(identical(other.partOfSpeech, partOfSpeech) || other.partOfSpeech == partOfSpeech)&&const DeepCollectionEquality().equals(other.definitions, definitions));
}


@override
int get hashCode => Object.hash(runtimeType,partOfSpeech,const DeepCollectionEquality().hash(definitions));

@override
String toString() {
  return 'Meaning(partOfSpeech: $partOfSpeech, definitions: $definitions)';
}


}

/// @nodoc
abstract mixin class $MeaningCopyWith<$Res>  {
  factory $MeaningCopyWith(Meaning value, $Res Function(Meaning) _then) = _$MeaningCopyWithImpl;
@useResult
$Res call({
 String partOfSpeech, List<DefinitionEntry> definitions
});




}
/// @nodoc
class _$MeaningCopyWithImpl<$Res>
    implements $MeaningCopyWith<$Res> {
  _$MeaningCopyWithImpl(this._self, this._then);

  final Meaning _self;
  final $Res Function(Meaning) _then;

/// Create a copy of Meaning
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? partOfSpeech = null,Object? definitions = null,}) {
  return _then(_self.copyWith(
partOfSpeech: null == partOfSpeech ? _self.partOfSpeech : partOfSpeech // ignore: cast_nullable_to_non_nullable
as String,definitions: null == definitions ? _self.definitions : definitions // ignore: cast_nullable_to_non_nullable
as List<DefinitionEntry>,
  ));
}

}


/// Adds pattern-matching-related methods to [Meaning].
extension MeaningPatterns on Meaning {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Meaning value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Meaning() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Meaning value)  $default,){
final _that = this;
switch (_that) {
case _Meaning():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Meaning value)?  $default,){
final _that = this;
switch (_that) {
case _Meaning() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String partOfSpeech,  List<DefinitionEntry> definitions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Meaning() when $default != null:
return $default(_that.partOfSpeech,_that.definitions);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String partOfSpeech,  List<DefinitionEntry> definitions)  $default,) {final _that = this;
switch (_that) {
case _Meaning():
return $default(_that.partOfSpeech,_that.definitions);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String partOfSpeech,  List<DefinitionEntry> definitions)?  $default,) {final _that = this;
switch (_that) {
case _Meaning() when $default != null:
return $default(_that.partOfSpeech,_that.definitions);case _:
  return null;

}
}

}

/// @nodoc


class _Meaning extends Meaning {
  const _Meaning({this.partOfSpeech = '', final  List<DefinitionEntry> definitions = const []}): _definitions = definitions,super._();
  

@override@JsonKey() final  String partOfSpeech;
 final  List<DefinitionEntry> _definitions;
@override@JsonKey() List<DefinitionEntry> get definitions {
  if (_definitions is EqualUnmodifiableListView) return _definitions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_definitions);
}


/// Create a copy of Meaning
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MeaningCopyWith<_Meaning> get copyWith => __$MeaningCopyWithImpl<_Meaning>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Meaning&&(identical(other.partOfSpeech, partOfSpeech) || other.partOfSpeech == partOfSpeech)&&const DeepCollectionEquality().equals(other._definitions, _definitions));
}


@override
int get hashCode => Object.hash(runtimeType,partOfSpeech,const DeepCollectionEquality().hash(_definitions));

@override
String toString() {
  return 'Meaning(partOfSpeech: $partOfSpeech, definitions: $definitions)';
}


}

/// @nodoc
abstract mixin class _$MeaningCopyWith<$Res> implements $MeaningCopyWith<$Res> {
  factory _$MeaningCopyWith(_Meaning value, $Res Function(_Meaning) _then) = __$MeaningCopyWithImpl;
@override @useResult
$Res call({
 String partOfSpeech, List<DefinitionEntry> definitions
});




}
/// @nodoc
class __$MeaningCopyWithImpl<$Res>
    implements _$MeaningCopyWith<$Res> {
  __$MeaningCopyWithImpl(this._self, this._then);

  final _Meaning _self;
  final $Res Function(_Meaning) _then;

/// Create a copy of Meaning
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? partOfSpeech = null,Object? definitions = null,}) {
  return _then(_Meaning(
partOfSpeech: null == partOfSpeech ? _self.partOfSpeech : partOfSpeech // ignore: cast_nullable_to_non_nullable
as String,definitions: null == definitions ? _self._definitions : definitions // ignore: cast_nullable_to_non_nullable
as List<DefinitionEntry>,
  ));
}


}

/// @nodoc
mixin _$DefinitionEntry {

 String get definition; String get example;
/// Create a copy of DefinitionEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DefinitionEntryCopyWith<DefinitionEntry> get copyWith => _$DefinitionEntryCopyWithImpl<DefinitionEntry>(this as DefinitionEntry, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DefinitionEntry&&(identical(other.definition, definition) || other.definition == definition)&&(identical(other.example, example) || other.example == example));
}


@override
int get hashCode => Object.hash(runtimeType,definition,example);

@override
String toString() {
  return 'DefinitionEntry(definition: $definition, example: $example)';
}


}

/// @nodoc
abstract mixin class $DefinitionEntryCopyWith<$Res>  {
  factory $DefinitionEntryCopyWith(DefinitionEntry value, $Res Function(DefinitionEntry) _then) = _$DefinitionEntryCopyWithImpl;
@useResult
$Res call({
 String definition, String example
});




}
/// @nodoc
class _$DefinitionEntryCopyWithImpl<$Res>
    implements $DefinitionEntryCopyWith<$Res> {
  _$DefinitionEntryCopyWithImpl(this._self, this._then);

  final DefinitionEntry _self;
  final $Res Function(DefinitionEntry) _then;

/// Create a copy of DefinitionEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? definition = null,Object? example = null,}) {
  return _then(_self.copyWith(
definition: null == definition ? _self.definition : definition // ignore: cast_nullable_to_non_nullable
as String,example: null == example ? _self.example : example // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [DefinitionEntry].
extension DefinitionEntryPatterns on DefinitionEntry {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DefinitionEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DefinitionEntry() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DefinitionEntry value)  $default,){
final _that = this;
switch (_that) {
case _DefinitionEntry():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DefinitionEntry value)?  $default,){
final _that = this;
switch (_that) {
case _DefinitionEntry() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String definition,  String example)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DefinitionEntry() when $default != null:
return $default(_that.definition,_that.example);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String definition,  String example)  $default,) {final _that = this;
switch (_that) {
case _DefinitionEntry():
return $default(_that.definition,_that.example);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String definition,  String example)?  $default,) {final _that = this;
switch (_that) {
case _DefinitionEntry() when $default != null:
return $default(_that.definition,_that.example);case _:
  return null;

}
}

}

/// @nodoc


class _DefinitionEntry extends DefinitionEntry {
  const _DefinitionEntry({this.definition = '', this.example = ''}): super._();
  

@override@JsonKey() final  String definition;
@override@JsonKey() final  String example;

/// Create a copy of DefinitionEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DefinitionEntryCopyWith<_DefinitionEntry> get copyWith => __$DefinitionEntryCopyWithImpl<_DefinitionEntry>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DefinitionEntry&&(identical(other.definition, definition) || other.definition == definition)&&(identical(other.example, example) || other.example == example));
}


@override
int get hashCode => Object.hash(runtimeType,definition,example);

@override
String toString() {
  return 'DefinitionEntry(definition: $definition, example: $example)';
}


}

/// @nodoc
abstract mixin class _$DefinitionEntryCopyWith<$Res> implements $DefinitionEntryCopyWith<$Res> {
  factory _$DefinitionEntryCopyWith(_DefinitionEntry value, $Res Function(_DefinitionEntry) _then) = __$DefinitionEntryCopyWithImpl;
@override @useResult
$Res call({
 String definition, String example
});




}
/// @nodoc
class __$DefinitionEntryCopyWithImpl<$Res>
    implements _$DefinitionEntryCopyWith<$Res> {
  __$DefinitionEntryCopyWithImpl(this._self, this._then);

  final _DefinitionEntry _self;
  final $Res Function(_DefinitionEntry) _then;

/// Create a copy of DefinitionEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? definition = null,Object? example = null,}) {
  return _then(_DefinitionEntry(
definition: null == definition ? _self.definition : definition // ignore: cast_nullable_to_non_nullable
as String,example: null == example ? _self.example : example // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
