class Post {
  final String title;
  final String caption;
  final String url;
  final String _id;
  final String type;

  Post({
    required this.title,
    required this.caption,
    required this.url,
    required String id,
    required this.type,
  }) : _id = id;

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      title: json['title'],
      caption: json['caption'],
      url: json['url'],
      id: json['_id'],
      type: json['type'],
    );
  }
  // toJson method
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'caption': caption,
      'url': url,
      '_id': _id,
      'type': type,
    };
  }
}
