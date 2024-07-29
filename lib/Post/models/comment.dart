class Comment {
  final String id;
  final String postId;
  final String username;
  final String userProfileUrl;
  final String comment;
  final String createdAt;
  final int numberOfLikes;
  final bool isLiked;

  Comment({
    required this.id,
    required this.postId,
    required this.username,
    required this.comment,
    required this.createdAt,
    required this.numberOfLikes,
    required this.isLiked,
    required this.userProfileUrl,
  });

  // factory
  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['id'],
      postId: json['postId'],
      username: json['username'],
      comment: json['comment'],
      createdAt: json['createdAt'],
      numberOfLikes: json['numberOfLikes'],
      isLiked: json['isLiked'],
      userProfileUrl: json['userProfileUrl'],
    );
  }
  // to json
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'postId': postId,
      'username': username,
      'comment': comment,
      'createdAt': createdAt,
      'numberOfLikes': numberOfLikes,
      'isLiked': isLiked,
      'userProfileUrl': userProfileUrl,
    };
  }
}
