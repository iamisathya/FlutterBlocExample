import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tideapp/src/model/user.dart';

class UsersRepository {
  Future<List<User>> fetchUsers() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if (response.statusCode != 200) {
      throw Exception('Failed to load data');
    }
    final Iterable parsedRespose = json.decode(response.body);
    final List<User> postList =
        List<User>.from(parsedRespose.map((e) => User.fromJson(e)));
    return postList;
  }
}
