import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? id;
  final String username;
  final String email; // Added email
  final List<String> followers; // Changed to List<String>
  final List<String> following; // Changed to List<String>
  final bool private; // Added private
  final String profile; // If this is meant to be the profile description
  

  const User({
    required this.username,
    required this.email, // Include email in constructor
    required this.followers,
    required this.following,
    required this.private, // Include private in constructor
    required this.profile,
    this.id,
  });

  // Factory method
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'] ?? '',
      username: json['username'],
      email: json['email'], // Extract email from JSON
      followers:
          List<String>.from(json['followers'] ?? []), // Convert to List<String>
      following:
          List<String>.from(json['following'] ?? []), // Convert to List<String>
      private: json['private'] ?? false, // Extract private
      profile: json['profile'] ?? '', // Use default if profile is missing
   
    );
  }

  // toJson method
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'username': username,
      'email': email,
      'followers': followers,
      'following': following,
      'private': private,
      'profile': profile,
  
    };
  }

  // Empty user
  static const User empty = User(
    username: '',
    email: '',
    followers: [],
    following: [],
    private: false,
    profile: '',
 
  );

  @override
  List<Object?> get props => [
        id,
        username,
        email,
        followers,
        following,
        private,
        profile,
  
     
      ];
}
