class User {
  late int id;
  late int albumid;
  late String firstName;
  late String lastName;
  late String bio;
  late String profilePicture;
  late String email;

  User.fromJson(Map<String, dynamic> json)
      : albumid = json['Album_id'] ?? 0,
        id = json['id'] ?? 0,
        firstName = json['First_name'] ?? '',
        lastName = json['Last_name'] ?? '',
        bio = json['bio'] ?? '',
        profilePicture = json['Profile_pictore'] ?? '',
        email = json['email'] ?? '';
}
