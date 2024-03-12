import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tideapp/src/model/post.dart';
import 'package:tideapp/src/model/user.dart';
import 'package:tideapp/src/posts/fetch_post_bloc.dart';
import 'package:tideapp/src/posts/fetch_post_event.dart';
import 'package:tideapp/src/posts/fetch_post_repository.dart';
import 'package:tideapp/src/posts/fetch_post_state.dart';

class AllPosts extends StatefulWidget {
  const AllPosts({super.key});

  @override
  State<AllPosts> createState() => _AllPostsState();
}

class _AllPostsState extends State<AllPosts> {
  @override
  Widget build(BuildContext context) {
    final User arguments = ModalRoute.of(context)!.settings.arguments as User;
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(arguments.name,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: Colors.black)),
              Text(arguments.username,
                  style: Theme.of(context).textTheme.caption),
            ],
          )),
      body: BlocProvider(
        create: (context) => PostBloc(repository: PostRepository())
          ..add(LoadPostEvent(userId: arguments.id)),
        child: BlocBuilder<PostBloc, LoadPostState>(
          builder: (context, state) {
            if (state is FetchPostSuccessState) {
              final List<Post> posts = state.posts;
              return InkWell(
                child: ListView.separated(
                  itemCount: posts.length,
                  separatorBuilder: (context, index) => const Divider(),
                  itemBuilder: (_, index) => ListTile(
                    leading: const Icon(Icons.message),
                    title: Text(
                      posts[index].title,
                      style: const TextStyle(color: Colors.black),
                      maxLines: 2,
                    ),
                    subtitle: Text(
                      posts[index].body,
                      style: const TextStyle(color: Colors.grey),
                      maxLines: 3,
                    ),
                    onTap: () => Navigator.pushNamed(context, '/comments',
                        arguments: posts[index]),
                  ),
                ),
              );
            }
            if (state is FetchPostErrorState) {
              return const Center(
                child: Text("Error"),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
