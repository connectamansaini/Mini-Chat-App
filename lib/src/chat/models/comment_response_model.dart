import 'package:json_annotation/json_annotation.dart';
import 'package:mini_chat_app/src/src.dart';

part 'comment_response_model.g.dart';

@JsonSerializable()
class CommentsResponseModel {
  const CommentsResponseModel({
    this.comments = const [],
    this.total = 0,
    this.skip = 0,
    this.limit = 0,
  });

  factory CommentsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CommentsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CommentsResponseModelToJson(this);

  final List<CommentModel> comments;
  final int total;
  final int skip;
  final int limit;

  CommentsResponse get toEntity => CommentsResponse(
    comments: comments.map((e) => e.toEntity).toList(),
    total: total,
    skip: skip,
    limit: limit,
  );
}

@JsonSerializable()
class CommentModel {
  const CommentModel({
    this.id = 0,
    this.body = '',
    this.postId = 0,
    this.likes = 0,
    this.user = const CommentUserModel(),
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) =>
      _$CommentModelFromJson(json);

  Map<String, dynamic> toJson() => _$CommentModelToJson(this);

  final int id;
  final String body;
  final int postId;
  final int likes;
  final CommentUserModel user;

  Comment get toEntity => Comment(
    id: id,
    body: body,
    postId: postId,
    likes: likes,
    user: user.toEntity,
  );
}

@JsonSerializable()
class CommentUserModel {
  const CommentUserModel({
    this.id = 0,
    this.username = '',
    this.fullName = '',
  });

  factory CommentUserModel.fromJson(Map<String, dynamic> json) =>
      _$CommentUserModelFromJson(json);

  Map<String, dynamic> toJson() => _$CommentUserModelToJson(this);

  final int id;
  final String username;
  final String fullName;

  CommentUser get toEntity => CommentUser(
    id: id,
    username: username,
    fullName: fullName,
  );
}
