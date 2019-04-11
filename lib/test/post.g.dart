// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) {
  return new Post(json['userId'] as int, json['id'] as int,
      json['title'] as String, json['body'] as String);
}

abstract class _$PostSerializerMixin {
  int get userId;
  int get id;
  String get title;
  String get body;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'userId': userId,
        'id': id,
        'title': title,
        'body': body
      };
}
