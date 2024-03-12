import 'dart:convert';

import 'package:tideapp/src/model/post.dart';
import 'package:http/http.dart' as http;

class PostRepository {
  Future<List<Post>> fetchAllPosts({required int userId}) async {
    final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/users/$userId/posts'));
    if (response.statusCode != 200) {
      throw Exception('Failed to load data');
    }
    final Iterable parsedRespose = json.decode(response.body);
    final List<Post> postList =
        List<Post>.from(parsedRespose.map((e) => Post.fromJson(e)));
    return postList;
  }
}
