import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tideapp/src/comments/comment_state.dart';
import 'package:tideapp/src/comments/comments_bloc.dart';
import 'package:tideapp/src/comments/comments_event.dart';
import 'package:tideapp/src/comments/comments_repository.dart';
import 'package:tideapp/src/model/comment.dart';
import 'package:tideapp/src/model/post.dart';

class AllComments extends StatefulWidget {
  const AllComments({super.key});

  @override
  State<AllComments> createState() => _AllCommentsState();
}

class _AllCommentsState extends State<AllComments> {
  @override
  Widget build(BuildContext context) {
    final Post arguments = ModalRoute.of(context)!.settings.arguments as Post;
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text("All Comments")),
      body: BlocProvider(
        create: (context) => CommentsBloc(repository: CommentsRepository())
          ..add(LoadCommentsEvent(postId: arguments.id)),
        child: BlocBuilder<CommentsBloc, CommentState>(
          builder: (context, state) {
            if (state is LoadingCommentsSuccess) {
              final List<Comment> comments = state.comment;
              return InkWell(
                child: ListView.separated(
                  itemCount: comments.length,
                  separatorBuilder: (context, index) => const Divider(),
                  itemBuilder: (_, index) => ListTile(
                      title: Text(
                        comments[index].name,
                        style: const TextStyle(color: Colors.black),
                        maxLines: 2,
                      ),
                      subtitle: Text(
                        comments[index].email,
                        style: const TextStyle(color: Colors.grey),
                        maxLines: 3,
                      )),
                ),
              );
            }
            if (state is LoadingCommentsError) {
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
