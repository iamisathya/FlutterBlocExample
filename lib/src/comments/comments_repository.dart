import 'dart:convert';

import 'package:tideapp/src/model/comment.dart';
import 'package:http/http.dart' as http;

class CommentsRepository {
  Future<List<Comment>> fetchAllComments({required int postId}) async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));
    if (response.statusCode != 200) {
      throw Exception('Failed to load data');
    }
    final Iterable parsedRespose = json.decode(response.body);
    final List<Comment> commentList =
        List<Comment>.from(parsedRespose.map((e) => Comment.fromJson(e)));
    return commentList;
  }
}
