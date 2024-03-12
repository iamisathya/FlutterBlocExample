import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tideapp/src/posts/fetch_post_event.dart';
import 'package:tideapp/src/posts/fetch_post_repository.dart';
import 'package:tideapp/src/posts/fetch_post_state.dart';

class PostBloc extends Bloc<PostEvent, LoadPostState> {
  final PostRepository _postRepository;

  PostBloc({required PostRepository repository})
      : _postRepository = repository,
        super(FetchPostLoadingState()) {
    on<LoadPostEvent>(_onFetchingPost);
  }

  void _onFetchingPost(LoadPostEvent event, Emitter<LoadPostState> emit) async {
    emit(FetchPostLoadingState());
    try {
      final post = await _postRepository.fetchAllPosts(userId: event.userId);
      return emit(FetchPostSuccessState(post));
    } catch (e) {
      debugPrint(e.toString());
      return emit(FetchPostErrorState(e));
    }
  }
}
