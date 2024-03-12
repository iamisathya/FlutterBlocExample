import 'package:flutter/material.dart';
import 'package:tideapp/src/comments/comments.dart';
import 'package:tideapp/src/posts/posts.dart';
import 'package:tideapp/src/users/users.dart';

Map<String, WidgetBuilder> get appRouter {
  return {
    '/': (context) => const AllUsers(),
    '/post': (context) => const AllPosts(),
    '/comments': (context) => const AllComments(),
  };
}
