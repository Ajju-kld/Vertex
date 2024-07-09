export 'user.dart';

class User {
  final String name;
  final String email;
  final List<String> following;
  final List<String> followers;
  final bool private;
  final int time;
  final String profile;

  const User({
    required this.name,
    required this.email,
    required this.following,
    required this.followers,
    required this.private,
    required this.time,
    required this.profile,
  });

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'],
        following = json['following'].cast<String>(),
        followers = json['followers'].cast<String>(),
        private = json['private'],
        profile = json['profile'],
        time = json['time'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['following'] = this.following;
    data['followers'] = this.followers;
    data['private'] = this.private;
    data['time'] = this.time;
    data['profile'] = this.profile;

    return data;
  }

  static const empty = User(
    name: '',
    email: '',
    following: [],
    followers: [],
    private: false,
    time: 0,
    profile: '',
  );
}
