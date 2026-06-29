import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supa_pro/features/todo/presentation/riverpod/providers/todos_action_provider.dart';
import 'package:supa_pro/features/todo/presentation/riverpod/providers/todos_list_provider.dart';
import 'package:supa_pro/features/todo/presentation/widgets/todos_list/add_todo_button.dart';
import 'package:supa_pro/features/todo/presentation/widgets/todos_list/header.dart';
import 'package:supa_pro/features/todo/presentation/widgets/todos_list/todo_card.dart';

class TodosListPage extends ConsumerStatefulWidget {
  const TodosListPage({super.key});

  @override
  ConsumerState<TodosListPage> createState() => _TodosListPageState();
}

class _TodosListPageState extends ConsumerState<TodosListPage> {
  @override
  Widget build(BuildContext context) {
    late Widget content;
    final todosAsync = ref.watch(todosListProvider);
    ref.listen(
      todosActionProvider,
      (previous, next) {
        next.whenOrNull(
          error: (error, stackTrace) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(
              SnackBar(
                content: Text(error as String),
              ),
            );
          },
        );
      },
    );
    todosAsync.when(
      data: (data) {
        if (data.isNotEmpty) {
          content = ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 15),
            itemCount: data.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () async {
                  ref
                      .read(todosActionProvider.notifier)
                      .deleteTodo(data[index].id);
                },
                child: AnimatedScale(
                  scale: data[index].isChecked ? 0 : 1,
                  alignment: Alignment.center,
                  duration: const Duration(seconds: 1),
                  curve: Curves.bounceIn,
                  child: TodoCard(
                    todo: data[index],
                  ),
                ),
              );
            },
          );
        } else {
          content = SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height - 240,
                  child: Center(
                    child: Text('No todos'),
                  ),
                ),
              ],
            ),
          );
        }
      },
      loading: () {
        content = Center(
          child: CircularProgressIndicator(
            strokeCap: StrokeCap.round,
          ),
        );
      },
      error: (err, st) {
        content = SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height - 240,
                child: Center(
                  child: Text(err as String),
                ),
              ),
            ],
          ),
        );
      },
    );

    return Scaffold(
      body: SafeArea(
        top: true,
        bottom: true,
        child: Stack(
          children: [
            Column(
              children: [
                Header(),
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      ref.read(todosListProvider.notifier).loadTodos();
                    },
                    child: content,
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 40,
              left: 0,
              right: 0,
              child: const AddTodoButton(),
            ),
          ],
        ),
      ),
    );
  }
}
