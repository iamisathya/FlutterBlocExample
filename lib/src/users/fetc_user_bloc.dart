import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tideapp/src/users/fetc_user_event.dart';
import 'package:tideapp/src/users/fetch_users_repository.dart';
import 'package:tideapp/src/users/fetch_users_state.dart';

class UsersBloc extends Bloc<UsersEvent, FetchUsersState> {
  final UsersRepository _usersRepository;

  UsersBloc({required UsersRepository repository})
      : _usersRepository = repository,
        super(FetchUsersLoadingState()) {
    on<FetchUsersEvent>(_onFetchingPpost);
  }

  void _onFetchingPpost(
      FetchUsersEvent event, Emitter<FetchUsersState> emit) async {
    emit(FetchUsersLoadingState());
    try {
      final users = await _usersRepository.fetchUsers();
      return emit(FetchUsersSuccessState(users));
    } catch (e) {
      debugPrint(e.toString());
      return emit(FetchUsersErrorState(e));
    }
  }
}
