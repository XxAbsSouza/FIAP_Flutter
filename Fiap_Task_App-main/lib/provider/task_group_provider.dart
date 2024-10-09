import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_app/models/task_group.dart';
import 'package:todo_app/repository/supabase_repository.dart';

class TaskGroupProvider extends ChangeNotifier { //classe que notifica os listeners quando houver mudanças

  final SupabaseRepo = SupabaseRepository();
  List<TaskGroup> _taskGroups = [];

  List<TaskGroup> get taskGroups => _taskGroups; //retorna a lista de taskGroups; permite que a lista seja acessada de fora da classe mas não modificada. 

  bool _isLoading = false; //variável que indica se a lista de taskGroups está sendo carregada
  bool get isLoading => _isLoading; //retorna o valor de _isLoading

  Future<void> listTaskGroups() async {
    _isLoading = true; //quando a lista de taskGroups está sendo carregada, _isLoading é true  e avisa que a tela teve mudanças
    notifyListeners(); 
    _taskGroups = await SupabaseRepo.listTaskGroups(); //chama o método listTaskGroups do SupabaseRepository e atribui o resultado a _taskGroups
    _isLoading = false; // já notifica que a lista de taskGroups foi carregada e a tela teve mudanças, e agr _isLoading é false pq a lista já foi carregada
    notifyListeners(); //notifica os listeners que houve mudanças na lista de taskGroups e lá na interface vai reagir a essa mudança

  }
}