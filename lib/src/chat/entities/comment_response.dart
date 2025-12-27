import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment_response.freezed.dart';

@freezed
abstract class CommentsResponse with _$CommentsResponse {
  const factory CommentsResponse({
    @Default(<Comment>[]) List<Comment> comments,
    @Default(0) int total,
    @Default(0) int skip,
    @Default(0) int limit,
  }) = _CommentsResponse;

  const CommentsResponse._();

  static const empty = CommentsResponse();
  bool get isEmpty => this == CommentsResponse.empty;
  bool get isNotEmpty => this != CommentsResponse.empty;
}

@freezed
abstract class Comment with _$Comment {
  const factory Comment({
    @Default(0) int id,
    @Default('') String body,
    @Default(0) int postId,
    @Default(0) int likes,
    @Default(CommentUser.empty) CommentUser user,
  }) = _Comment;

  const Comment._();

  static const empty = Comment();
  bool get isEmpty => this == Comment.empty;
  bool get isNotEmpty => this != Comment.empty;
}

@freezed
abstract class CommentUser with _$CommentUser {
  const factory CommentUser({
    @Default(0) int id,
    @Default('') String username,
    @Default('') String fullName,
  }) = _CommentUser;

  const CommentUser._();

  static const empty = CommentUser();
  bool get isEmpty => this == CommentUser.empty;
  bool get isNotEmpty => this != CommentUser.empty;
}
