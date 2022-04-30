class RoddyProfiles {
  final String? profileName;
  final String? profileAvatar;

  RoddyProfiles({
    this.profileName,
    this.profileAvatar,
  });

  static RoddyProfiles fromJson(Map<String, dynamic> json) {
    return RoddyProfiles(
      profileName: json['profileName'],
      profileAvatar: json[' profileAvatar'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'profileName': profileName,
      ' profileAvatar': profileAvatar,
    };
  }
}
