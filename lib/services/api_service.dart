import 'dart:async';
import 'package:flutter/material.dart';
import 'package:test_app/models/comment_model.dart';
import 'package:test_app/models/post_model.dart';

class ApiService with ChangeNotifier {
  // Simulate fetching posts from an API
  Future<List<Post>> fetchPosts() async {
    await Future.delayed(const Duration(seconds: 2));
    return [
      Post(
        id: 1,
        title: 'Flutter State Management',
        likes: 120,
        commentsCount: 5,
        createdAt: DateTime.now().subtract(Duration(hours: 2)),
      ),
      Post(
        id: 2,
        title: 'Understanding Async/Await in Dart',
        likes: 95,
        commentsCount: 3,
        createdAt: DateTime.now().subtract(Duration(days: 1)),
      ),
      Post(
        id: 3,
        title: 'Building Responsive UIs in Flutter',
        likes: 200,
        commentsCount: 10,
        createdAt: DateTime.now().subtract(Duration(days: 2)),
      ),

    ];
  }

  // Simulate fetching comments for a specific post
  Future<List<Comment>> fetchComments(int postId) async {
    await Future.delayed(const Duration(seconds: 2));
    return [
      Comment(
        id: 1,
        postId: postId,
        content: 'Great article!',
        likes: 10,
        createdAt: DateTime.now().subtract(Duration(minutes: 30)),
        userName: 'Jane Doe',
        userProfilePictureUrl: 'assets/empty_person_img.png',
      ),
      Comment(
        id: 2,
        postId: postId,
        content: 'Very informative, thanks!',
        likes: 15,
        createdAt: DateTime.now().subtract(Duration(minutes: 45)),
        userName: 'John Smith',
        userProfilePictureUrl: 'assets/empty_person_img.png',
      ),
    ];
  }


}
