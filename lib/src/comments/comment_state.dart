import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:tideapp/src/model/comment.dart';

@immutable
abstract class CommentState extends Equatable {}

final class LoadingCommentsState extends CommentState {
  @override
  List<Object?> get props => [];
}

final class LoadingCommentsSuccess extends LoadingCommentsState {
  final List<Comment> comment;

  LoadingCommentsSuccess({required this.comment});

  @override
  List<Object?> get props => [comment];
}

final class LoadingCommentsError extends LoadingCommentsState {
  final Object error;

  LoadingCommentsError({required this.error});

  @override
  List<Object?> get props => [error];
}
