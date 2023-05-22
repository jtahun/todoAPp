import 'package:dio/dio.dart';
import 'package:lesson17/models/todo.dart';
import 'package:lesson17/widgets/todo_item.dart';

class TodoProvider{
  final _http = Dio(BaseOptions(
    baseUrl: 'https://api.todoist.com/rest/v2/',
    headers:{
      'Authorization': 'Bearer 005aa84f87b7dda1109a34e838c5dec30e317c0f'
    }
  ));

  TodoProvider(){
    _http.interceptors.add(LogInterceptor(
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
    ));
  }

  Future<List<Todo>> getAllTodos() async{
   // final response = await _http.get('/tasks');
   // return (response.data as List).map((e));
   final response = await _http.get<List>('/tasks');
   return response.data!.map((todoJson) => Todo.fromJson(todoJson)).toList() ?? [];
  }
}