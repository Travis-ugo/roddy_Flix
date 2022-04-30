// userName
// email
// avatar / profile pics
// user profiles

import 'roddy_user_profiles.dart';

class RoddyUser {
  final String? userName;
  final String? email;
  final String? avatar;
  final RoddyProfiles? profiles;

  RoddyUser({
    this.userName,
    this.email,
    this.avatar,
    this.profiles,
  });

  static RoddyUser fromJson(Map<String, dynamic> json) {
    return RoddyUser(
      userName: json['userName'],
      email: json['email'],
      avatar: json['avatar'],
      profiles: json['profiles'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'email': email,
      'avatar': avatar,
      'profiles': profiles,
    };
  }
}
