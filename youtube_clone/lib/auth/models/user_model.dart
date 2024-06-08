import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String displayName;
  final String userName;
  final String email;
  final String profilePic;
  final List<String> subscriptions;
  final int videos;
  final String userId;
  final String description;
  final String type;

  UserModel({
    required this.displayName,
    required this.userName,
    required this.email,
    required this.profilePic,
    required this.subscriptions,
    required this.videos,
    required this.userId,
    required this.description,
    required this.type,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
