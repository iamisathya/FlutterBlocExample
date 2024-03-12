import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:tideapp/src/model/post.dart';

@immutable
abstract class LoadPostState extends Equatable {}

class FetchPostLoadingState extends LoadPostState {
  @override
  List<Object?> get props => [];
}

class FetchPostSuccessState extends LoadPostState {
  final List<Post> posts;

  FetchPostSuccessState(this.posts);

  @override
  List<Object?> get props => [posts];
}

class FetchPostErrorState extends LoadPostState {
  final Object error;

  FetchPostErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
