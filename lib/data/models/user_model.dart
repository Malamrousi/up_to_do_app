// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  final String name;
  final String email;

  final String uid;
  UserModel({
    required this.name,
    required this.email,
    required this.uid,
  });

  factory UserModel.fromJson(Map json) {
    return UserModel(
        name: json['userName'], email: json['email'], uid: json['uid']);
  }

  Map<String, dynamic> toJson() =>
      {'user_name': name, 'email': email, 'uid': uid};
}
