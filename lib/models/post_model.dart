class Post {
  final int id;
  final String title;
  final int likes;
  final int commentsCount;
  final DateTime createdAt;

  Post({
    required this.id,
    required this.title,
    required this.likes,
    required this.commentsCount,
    required this.createdAt,
  });
}
