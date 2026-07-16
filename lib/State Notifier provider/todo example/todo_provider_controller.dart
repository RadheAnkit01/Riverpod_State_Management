import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_statemanagement/State%20Notifier%20provider/todo%20example/todo_model.dart';

final todoListProvider = StateNotifierProvider<TodoListNotifier, List<Todo>>((
  ref,
) {
  return TodoListNotifier([]);
});

class TodoListNotifier extends StateNotifier<List<Todo>> {
  TodoListNotifier(super.state);

  void add(String title) {
    final newTodo = Todo(
      id: state.isEmpty ? 0 : state.first.id + 1,
      title: title,
      completed: false,
    );
    state = [newTodo, ...state];
  }

  void removeTodo(int id) {
    state = state.where((t) => t.id != id).toList();
  }

  void toggleCompleted(int id) {
    final todos = [...state];
    final index = todos.indexWhere((test) => test.id == id);
    final todo = todos[index];
    todos[index] = todo.copyWith(completed: !todo.completed);
    state = todos;
  }
}
