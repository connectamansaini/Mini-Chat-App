// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentsResponseModel _$CommentsResponseModelFromJson(
  Map<String, dynamic> json,
) => CommentsResponseModel(
  comments:
      (json['comments'] as List<dynamic>?)
          ?.map((e) => CommentModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  total: (json['total'] as num?)?.toInt() ?? 0,
  skip: (json['skip'] as num?)?.toInt() ?? 0,
  limit: (json['limit'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$CommentsResponseModelToJson(
  CommentsResponseModel instance,
) => <String, dynamic>{
  'comments': instance.comments,
  'total': instance.total,
  'skip': instance.skip,
  'limit': instance.limit,
};

CommentModel _$CommentModelFromJson(Map<String, dynamic> json) => CommentModel(
  id: (json['id'] as num?)?.toInt() ?? 0,
  body: json['body'] as String? ?? '',
  postId: (json['postId'] as num?)?.toInt() ?? 0,
  likes: (json['likes'] as num?)?.toInt() ?? 0,
  user: json['user'] == null
      ? const CommentUserModel()
      : CommentUserModel.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CommentModelToJson(CommentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'body': instance.body,
      'postId': instance.postId,
      'likes': instance.likes,
      'user': instance.user,
    };

CommentUserModel _$CommentUserModelFromJson(Map<String, dynamic> json) =>
    CommentUserModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      username: json['username'] as String? ?? '',
      fullName: json['fullName'] as String? ?? '',
    );

Map<String, dynamic> _$CommentUserModelToJson(CommentUserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'fullName': instance.fullName,
    };
