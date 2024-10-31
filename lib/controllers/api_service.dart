import 'dart:convert';
import 'package:http/http.dart' as http;
import '../components/models/todo.dart';

Future<List<Todo>> fetchTodos() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));

  if (response.statusCode == 200) {
    List<dynamic> jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => Todo.fromJson(data)).toList();
  } else {
    throw Exception('Failed to load todos');
  }
}
