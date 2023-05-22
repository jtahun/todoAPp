import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:lesson17/providers/todo_provider.dart';
import 'package:lesson17/state/todo_list_state.dart';



class TodoListCubit extends Cubit<TodoListState>{
  final _todoProvider = TodoProvider();
  TodoListCubit():super(TodoListLoadingState()){
    _load();
  }

  void _load() async {
    try{
      // throw ('Shalala lala lala la');
      final todos = await _todoProvider.getAllTodos();
      if(todos.isEmpty){
        emit (TodoListEmptyState());
        return;
      }
      
      emit(TodoListLoadedState(todos));

    } catch(e, stack){
      // print(e.toString());
      // print(stack.toString());
      emit(TodoListErrorState('Error'));
      rethrow;
    }
    // _todoProvider.getAllTodos();
    // // emit (TodoListEmptyState());
    // emit (TodoListLoadedState([
    //   Todo(title: 'Title', description: 'Description', priority: 1,dueDate:DateTime.now()),
    //   const Todo(title: 'Title2', description: 'Description2', priority: 2,),
    // ]));


  }
  


}