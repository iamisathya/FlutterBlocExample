import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tideapp/src/comments/comment_state.dart';
import 'package:tideapp/src/comments/comments_event.dart';
import 'package:tideapp/src/comments/comments_repository.dart';
import 'package:tideapp/src/model/comment.dart';

class CommentsBloc extends Bloc<LoadCommentsEvent, CommentState> {
  final CommentsRepository _commentsRepository;

  CommentsBloc({required CommentsRepository repository})
      : _commentsRepository = repository,
        super(LoadingCommentsState()) {
    on<LoadCommentsEvent>(_onLoadingComments);
  }

  void _onLoadingComments(
      LoadCommentsEvent event, Emitter<CommentState> emit) async {
    emit(LoadingCommentsState());
    try {
      final List<Comment> comments =
          await _commentsRepository.fetchAllComments(postId: event.postId);
      return emit(LoadingCommentsSuccess(comment: comments));
    } catch (e) {
      debugPrint(e.toString());
      return emit(LoadingCommentsError(error: e));
    }
  }
}



  // CommentsBloc({required CommentsRepository commentsRepository})
  //     : _commentsRepository = commentsRepository,
  //       super(LoadingCommentsState()) {
  //   on<LoadCommentsEvent>((event, emit) async {
  //     try {
  //       final List<Comment> comments =
  //           await _commentsRepository.fetchAllComments(postId: event.postId);
  //       emit(LoadingCommentsSuccess(comments: comments));
  //     } catch (e) {
  //       emit(LoadingCommentsError(error: e.toString()));
  //     }
  //   });
  // }