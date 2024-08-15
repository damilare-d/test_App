class Comment {
  final int id;
  final int postId;
  final String content;
  final int likes;
  final DateTime createdAt;
  final String userName;
  final String userProfilePictureUrl;

  Comment({
    required this.id,
    required this.postId,
    required this.content,
    required this.likes,
    required this.createdAt,
    required this.userName,
    required this.userProfilePictureUrl,
  });
}
