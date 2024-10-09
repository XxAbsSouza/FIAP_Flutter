import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_app/models/task_group.dart';

class SupabaseRepository {
  Future<List<TaskGroup>> listTaskGroups() async {
    final client = Supabase.instance.client; //criar um objeto para acessar o banco de dados supabase
    final response = await client
        .from('task_groups')
        .select();

    final taskGroups = response.map((m) => TaskGroup.fromMap(m)).toList(); //faz o mapeamento dos dados e retorna uma lista de TaskGroup pra cada item do response

    return taskGroups;
  }
}