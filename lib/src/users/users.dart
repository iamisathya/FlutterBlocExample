import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tideapp/src/model/user.dart';
import 'package:tideapp/src/users/fetc_user_bloc.dart';
import 'package:tideapp/src/users/fetc_user_event.dart';
import 'package:tideapp/src/users/fetch_users_repository.dart';
import 'package:tideapp/src/users/fetch_users_state.dart';

class AllUsers extends StatefulWidget {
  const AllUsers({super.key});

  @override
  State<AllUsers> createState() => _AllUsersState();
}

class _AllUsersState extends State<AllUsers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Users")),
      body: BlocProvider(
        create: (context) =>
            UsersBloc(repository: UsersRepository())..add(FetchUsersEvent()),
        child: BlocBuilder<UsersBloc, FetchUsersState>(
          builder: (context, state) {
            if (state is FetchUsersSuccessState) {
              final List<User> list = state.users;
              return ListView.separated(
                itemCount: list.length,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (_, index) => ListTile(
                  leading: const Icon(Icons.person),
                  title: Text(
                    list[index].name,
                    style: const TextStyle(color: Colors.black),
                  ),
                  subtitle: Text(
                    list[index].username,
                    style: const TextStyle(color: Colors.grey),
                  ),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => Navigator.pushNamed(context, '/post',
                      arguments: list[index]),
                ),
              );
            }
            if (state is FetchUsersErrorState) {
              return const Center(child: Text("Error"));
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
