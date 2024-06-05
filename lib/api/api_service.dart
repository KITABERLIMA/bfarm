import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../model/user_model.dart';

class ApiService {
  final String baseUrl = "http://bfarm.ahmadyaz.my.id/api/users";

  Future<User> fetchUser(int userId) async {
    final response = await http.get(Uri.parse('$baseUrl/$userId'));

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      if (jsonResponse['success']) {
        return User.fromJson(jsonResponse['data']);
      } else {
        throw Exception('Failed to load user');
      }
    } else {
      throw Exception('Failed to load user');
    }
  }
}
