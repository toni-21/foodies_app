class Post {
  String id;
  String profileImageUrl;
  String foodPictureUrl;
  String comment;
  String timestamp;

  Post({
    required this.id,
    required this.profileImageUrl,
    required this.foodPictureUrl,
    required this.comment,
    required this.timestamp,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      profileImageUrl: json['profileImageUrl'],
      foodPictureUrl: json['foodPictureUrl'],
      comment: json['comment'],
      timestamp: json['timestamp'],
    );
  }
}
