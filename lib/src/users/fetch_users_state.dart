import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:tideapp/src/model/user.dart';

@immutable
abstract class FetchUsersState extends Equatable {}

class FetchUsersLoadingState extends FetchUsersState {
  @override
  List<Object?> get props => [];
}

class FetchUsersSuccessState extends FetchUsersState {
  final List<User> users;

  FetchUsersSuccessState(this.users);

  @override
  List<Object?> get props => [];
}

class FetchUsersErrorState extends FetchUsersState {
  final Object error;

  FetchUsersErrorState(this.error);

  @override
  List<Object?> get props => [];
}
