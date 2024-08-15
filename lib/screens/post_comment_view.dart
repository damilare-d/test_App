import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/models/comment_model.dart';
import 'package:test_app/services/api_service.dart';

class PostCommentView extends StatelessWidget {
  final int postId;

  const PostCommentView({super.key, required this.postId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Comments for Post $postId"),
      ),
      body: StreamBuilder<List<Comment>>(
        stream: Stream.periodic(const Duration(seconds: 2)).asyncMap((_) =>
            Provider.of<ApiService>(context, listen: false)
                .fetchComments(postId)),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (snapshot.hasData) {
            final comments = snapshot.data!;
            return ListView.builder(
              itemCount: comments.length,
              itemBuilder: (context, index) {
                final comment = comments[index];
                return ListTile(
                  leading: const CircleAvatar(
                    backgroundImage:
                        AssetImage("assets/empty_person_img.png"),
                  ),
                  title: Text(comment.userName),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(comment.content),
                      Text('Likes: ${comment.likes}'),
                      Text('Created: ${comment.createdAt.toLocal()}'),
                    ],
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text("No comments available"));
          }
        },
      ),
    );
  }
}
