import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class PostEvent extends Equatable {}

class LoadPostEvent extends PostEvent {
  final int userId;

  LoadPostEvent({required this.userId});

  @override
  List<Object?> get props => [];
}


//