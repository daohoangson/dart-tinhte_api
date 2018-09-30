import 'dart:async';
import '../api.dart';
import '../model/post.dart';

Future<Post> getPostById(Api api, int postId) async {
  final json = await api.getJson("posts/${postId}");
  return Post.fromJson(json['post']);
}
