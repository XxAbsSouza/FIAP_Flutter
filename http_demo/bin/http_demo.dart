

import 'dart:convert';

import 'package:http/http.dart' as http;

void main(List<String> arguments) async {
  final response = await getTodo(4);

  print(response);
  // print(response['title']);
  // print(response['completed']);
  print(response.title);
  print(response.completed);
}

Future<Todo> getTodo(int id) async{
  final url = Uri.parse('https://jsonplaceholder.typicode.com/todos/$id');
  final response = await http.get(url); //coloca o await para aguardar a resposta e quando essa resposta chegar vai ser atribuido. Pq p get é um Future response e n a resposta em si
  final Map<String, dynamic> map = jsonDecode(response.body); //quebra o json pra map {chave e valor} e podemos tipar o map

  // return map['title'];//retorna o valor da chave title
  return Todo(userId: map['userId'], id: map['id'], title: map['title'], completed: map['completed']);
}

class Todo {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  Todo({required this.userId, required this.id, required this.title, required this.completed});
}
