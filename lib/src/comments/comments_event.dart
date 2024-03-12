import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class CommentsEvent extends Equatable {}

final class LoadCommentsEvent extends CommentsEvent {
  final int postId;

  LoadCommentsEvent({required this.postId});

  @override
  List<Object?> get props => [];
}
