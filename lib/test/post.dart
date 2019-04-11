import 'package:json_annotation/json_annotation.dart';

part 'post.g.dart';


@JsonSerializable()
class Post extends Object with _$PostSerializerMixin{

  @JsonKey(name: 'userId')
  int userId;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'body')
  String body;

  Post(this.userId,this.id,this.title,this.body,);

  factory Post.fromJson(Map<String, dynamic> srcJson) => _$PostFromJson(srcJson);

}
