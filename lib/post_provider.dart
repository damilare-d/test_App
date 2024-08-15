import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/models/comment_model.dart';
import 'package:test_app/models/post_model.dart';
import 'package:test_app/services/api_service.dart';

class PostProvider extends ChangeNotifier {
  final _posts = <Post>[];
  final _comments = <int, List<Comment>>{};

  List<Post> get posts => _posts.toList();
  Map<int, List<Comment>> get comments => _comments;

  Future<void> fetchPosts() async {
    final apiService = ApiService();
    _posts.clear(); // Clear previous data
    _comments.clear(); // Clear previous comments

    _posts.addAll(await apiService.fetchPosts());
    notifyListeners(); // Notify UI about updated data
  }

  Future<void> fetchComments(int postId) async {
    final apiService = ApiService();
    _comments[postId] = await apiService.fetchComments(postId);
    notifyListeners(); // Notify UI about updated comments
  }
}