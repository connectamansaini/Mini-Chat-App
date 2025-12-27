// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CommentsResponse {

 List<Comment> get comments; int get total; int get skip; int get limit;
/// Create a copy of CommentsResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommentsResponseCopyWith<CommentsResponse> get copyWith => _$CommentsResponseCopyWithImpl<CommentsResponse>(this as CommentsResponse, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommentsResponse&&const DeepCollectionEquality().equals(other.comments, comments)&&(identical(other.total, total) || other.total == total)&&(identical(other.skip, skip) || other.skip == skip)&&(identical(other.limit, limit) || other.limit == limit));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(comments),total,skip,limit);

@override
String toString() {
  return 'CommentsResponse(comments: $comments, total: $total, skip: $skip, limit: $limit)';
}


}

/// @nodoc
abstract mixin class $CommentsResponseCopyWith<$Res>  {
  factory $CommentsResponseCopyWith(CommentsResponse value, $Res Function(CommentsResponse) _then) = _$CommentsResponseCopyWithImpl;
@useResult
$Res call({
 List<Comment> comments, int total, int skip, int limit
});




}
/// @nodoc
class _$CommentsResponseCopyWithImpl<$Res>
    implements $CommentsResponseCopyWith<$Res> {
  _$CommentsResponseCopyWithImpl(this._self, this._then);

  final CommentsResponse _self;
  final $Res Function(CommentsResponse) _then;

/// Create a copy of CommentsResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? comments = null,Object? total = null,Object? skip = null,Object? limit = null,}) {
  return _then(_self.copyWith(
comments: null == comments ? _self.comments : comments // ignore: cast_nullable_to_non_nullable
as List<Comment>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,skip: null == skip ? _self.skip : skip // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CommentsResponse].
extension CommentsResponsePatterns on CommentsResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CommentsResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CommentsResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CommentsResponse value)  $default,){
final _that = this;
switch (_that) {
case _CommentsResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CommentsResponse value)?  $default,){
final _that = this;
switch (_that) {
case _CommentsResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Comment> comments,  int total,  int skip,  int limit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CommentsResponse() when $default != null:
return $default(_that.comments,_that.total,_that.skip,_that.limit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Comment> comments,  int total,  int skip,  int limit)  $default,) {final _that = this;
switch (_that) {
case _CommentsResponse():
return $default(_that.comments,_that.total,_that.skip,_that.limit);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Comment> comments,  int total,  int skip,  int limit)?  $default,) {final _that = this;
switch (_that) {
case _CommentsResponse() when $default != null:
return $default(_that.comments,_that.total,_that.skip,_that.limit);case _:
  return null;

}
}

}

/// @nodoc


class _CommentsResponse extends CommentsResponse {
  const _CommentsResponse({final  List<Comment> comments = const <Comment>[], this.total = 0, this.skip = 0, this.limit = 0}): _comments = comments,super._();
  

 final  List<Comment> _comments;
@override@JsonKey() List<Comment> get comments {
  if (_comments is EqualUnmodifiableListView) return _comments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_comments);
}

@override@JsonKey() final  int total;
@override@JsonKey() final  int skip;
@override@JsonKey() final  int limit;

/// Create a copy of CommentsResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CommentsResponseCopyWith<_CommentsResponse> get copyWith => __$CommentsResponseCopyWithImpl<_CommentsResponse>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CommentsResponse&&const DeepCollectionEquality().equals(other._comments, _comments)&&(identical(other.total, total) || other.total == total)&&(identical(other.skip, skip) || other.skip == skip)&&(identical(other.limit, limit) || other.limit == limit));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_comments),total,skip,limit);

@override
String toString() {
  return 'CommentsResponse(comments: $comments, total: $total, skip: $skip, limit: $limit)';
}


}

/// @nodoc
abstract mixin class _$CommentsResponseCopyWith<$Res> implements $CommentsResponseCopyWith<$Res> {
  factory _$CommentsResponseCopyWith(_CommentsResponse value, $Res Function(_CommentsResponse) _then) = __$CommentsResponseCopyWithImpl;
@override @useResult
$Res call({
 List<Comment> comments, int total, int skip, int limit
});




}
/// @nodoc
class __$CommentsResponseCopyWithImpl<$Res>
    implements _$CommentsResponseCopyWith<$Res> {
  __$CommentsResponseCopyWithImpl(this._self, this._then);

  final _CommentsResponse _self;
  final $Res Function(_CommentsResponse) _then;

/// Create a copy of CommentsResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? comments = null,Object? total = null,Object? skip = null,Object? limit = null,}) {
  return _then(_CommentsResponse(
comments: null == comments ? _self._comments : comments // ignore: cast_nullable_to_non_nullable
as List<Comment>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,skip: null == skip ? _self.skip : skip // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$Comment {

 int get id; String get body; int get postId; int get likes; CommentUser get user;
/// Create a copy of Comment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommentCopyWith<Comment> get copyWith => _$CommentCopyWithImpl<Comment>(this as Comment, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Comment&&(identical(other.id, id) || other.id == id)&&(identical(other.body, body) || other.body == body)&&(identical(other.postId, postId) || other.postId == postId)&&(identical(other.likes, likes) || other.likes == likes)&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,id,body,postId,likes,user);

@override
String toString() {
  return 'Comment(id: $id, body: $body, postId: $postId, likes: $likes, user: $user)';
}


}

/// @nodoc
abstract mixin class $CommentCopyWith<$Res>  {
  factory $CommentCopyWith(Comment value, $Res Function(Comment) _then) = _$CommentCopyWithImpl;
@useResult
$Res call({
 int id, String body, int postId, int likes, CommentUser user
});


$CommentUserCopyWith<$Res> get user;

}
/// @nodoc
class _$CommentCopyWithImpl<$Res>
    implements $CommentCopyWith<$Res> {
  _$CommentCopyWithImpl(this._self, this._then);

  final Comment _self;
  final $Res Function(Comment) _then;

/// Create a copy of Comment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? body = null,Object? postId = null,Object? likes = null,Object? user = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,postId: null == postId ? _self.postId : postId // ignore: cast_nullable_to_non_nullable
as int,likes: null == likes ? _self.likes : likes // ignore: cast_nullable_to_non_nullable
as int,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as CommentUser,
  ));
}
/// Create a copy of Comment
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CommentUserCopyWith<$Res> get user {
  
  return $CommentUserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [Comment].
extension CommentPatterns on Comment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Comment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Comment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Comment value)  $default,){
final _that = this;
switch (_that) {
case _Comment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Comment value)?  $default,){
final _that = this;
switch (_that) {
case _Comment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String body,  int postId,  int likes,  CommentUser user)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Comment() when $default != null:
return $default(_that.id,_that.body,_that.postId,_that.likes,_that.user);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String body,  int postId,  int likes,  CommentUser user)  $default,) {final _that = this;
switch (_that) {
case _Comment():
return $default(_that.id,_that.body,_that.postId,_that.likes,_that.user);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String body,  int postId,  int likes,  CommentUser user)?  $default,) {final _that = this;
switch (_that) {
case _Comment() when $default != null:
return $default(_that.id,_that.body,_that.postId,_that.likes,_that.user);case _:
  return null;

}
}

}

/// @nodoc


class _Comment extends Comment {
  const _Comment({this.id = 0, this.body = '', this.postId = 0, this.likes = 0, this.user = CommentUser.empty}): super._();
  

@override@JsonKey() final  int id;
@override@JsonKey() final  String body;
@override@JsonKey() final  int postId;
@override@JsonKey() final  int likes;
@override@JsonKey() final  CommentUser user;

/// Create a copy of Comment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CommentCopyWith<_Comment> get copyWith => __$CommentCopyWithImpl<_Comment>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Comment&&(identical(other.id, id) || other.id == id)&&(identical(other.body, body) || other.body == body)&&(identical(other.postId, postId) || other.postId == postId)&&(identical(other.likes, likes) || other.likes == likes)&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,id,body,postId,likes,user);

@override
String toString() {
  return 'Comment(id: $id, body: $body, postId: $postId, likes: $likes, user: $user)';
}


}

/// @nodoc
abstract mixin class _$CommentCopyWith<$Res> implements $CommentCopyWith<$Res> {
  factory _$CommentCopyWith(_Comment value, $Res Function(_Comment) _then) = __$CommentCopyWithImpl;
@override @useResult
$Res call({
 int id, String body, int postId, int likes, CommentUser user
});


@override $CommentUserCopyWith<$Res> get user;

}
/// @nodoc
class __$CommentCopyWithImpl<$Res>
    implements _$CommentCopyWith<$Res> {
  __$CommentCopyWithImpl(this._self, this._then);

  final _Comment _self;
  final $Res Function(_Comment) _then;

/// Create a copy of Comment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? body = null,Object? postId = null,Object? likes = null,Object? user = null,}) {
  return _then(_Comment(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,postId: null == postId ? _self.postId : postId // ignore: cast_nullable_to_non_nullable
as int,likes: null == likes ? _self.likes : likes // ignore: cast_nullable_to_non_nullable
as int,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as CommentUser,
  ));
}

/// Create a copy of Comment
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CommentUserCopyWith<$Res> get user {
  
  return $CommentUserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

/// @nodoc
mixin _$CommentUser {

 int get id; String get username; String get fullName;
/// Create a copy of CommentUser
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommentUserCopyWith<CommentUser> get copyWith => _$CommentUserCopyWithImpl<CommentUser>(this as CommentUser, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommentUser&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.fullName, fullName) || other.fullName == fullName));
}


@override
int get hashCode => Object.hash(runtimeType,id,username,fullName);

@override
String toString() {
  return 'CommentUser(id: $id, username: $username, fullName: $fullName)';
}


}

/// @nodoc
abstract mixin class $CommentUserCopyWith<$Res>  {
  factory $CommentUserCopyWith(CommentUser value, $Res Function(CommentUser) _then) = _$CommentUserCopyWithImpl;
@useResult
$Res call({
 int id, String username, String fullName
});




}
/// @nodoc
class _$CommentUserCopyWithImpl<$Res>
    implements $CommentUserCopyWith<$Res> {
  _$CommentUserCopyWithImpl(this._self, this._then);

  final CommentUser _self;
  final $Res Function(CommentUser) _then;

/// Create a copy of CommentUser
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? username = null,Object? fullName = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CommentUser].
extension CommentUserPatterns on CommentUser {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CommentUser value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CommentUser() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CommentUser value)  $default,){
final _that = this;
switch (_that) {
case _CommentUser():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CommentUser value)?  $default,){
final _that = this;
switch (_that) {
case _CommentUser() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String username,  String fullName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CommentUser() when $default != null:
return $default(_that.id,_that.username,_that.fullName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String username,  String fullName)  $default,) {final _that = this;
switch (_that) {
case _CommentUser():
return $default(_that.id,_that.username,_that.fullName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String username,  String fullName)?  $default,) {final _that = this;
switch (_that) {
case _CommentUser() when $default != null:
return $default(_that.id,_that.username,_that.fullName);case _:
  return null;

}
}

}

/// @nodoc


class _CommentUser extends CommentUser {
  const _CommentUser({this.id = 0, this.username = '', this.fullName = ''}): super._();
  

@override@JsonKey() final  int id;
@override@JsonKey() final  String username;
@override@JsonKey() final  String fullName;

/// Create a copy of CommentUser
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CommentUserCopyWith<_CommentUser> get copyWith => __$CommentUserCopyWithImpl<_CommentUser>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CommentUser&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.fullName, fullName) || other.fullName == fullName));
}


@override
int get hashCode => Object.hash(runtimeType,id,username,fullName);

@override
String toString() {
  return 'CommentUser(id: $id, username: $username, fullName: $fullName)';
}


}

/// @nodoc
abstract mixin class _$CommentUserCopyWith<$Res> implements $CommentUserCopyWith<$Res> {
  factory _$CommentUserCopyWith(_CommentUser value, $Res Function(_CommentUser) _then) = __$CommentUserCopyWithImpl;
@override @useResult
$Res call({
 int id, String username, String fullName
});




}
/// @nodoc
class __$CommentUserCopyWithImpl<$Res>
    implements _$CommentUserCopyWith<$Res> {
  __$CommentUserCopyWithImpl(this._self, this._then);

  final _CommentUser _self;
  final $Res Function(_CommentUser) _then;

/// Create a copy of CommentUser
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? username = null,Object? fullName = null,}) {
  return _then(_CommentUser(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
