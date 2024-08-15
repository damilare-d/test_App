import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/screens/post_list_view.dart';
import 'package:test_app/services/api_service.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ApiService(),
      child: const MaterialApp(
        home: PostListView(),
      ),
    ),
  );
}
