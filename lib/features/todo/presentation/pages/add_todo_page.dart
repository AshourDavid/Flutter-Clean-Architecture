import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:supa_pro/features/todo/presentation/riverpod/providers/todos_action_provider.dart';
import 'package:supa_pro/features/todo/presentation/widgets/add_todo/add_button.dart';
import 'package:supa_pro/features/todo/presentation/widgets/add_todo/discard_button.dart';

class AddTodoPage extends ConsumerStatefulWidget {
  const AddTodoPage({super.key});

  @override
  ConsumerState<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends ConsumerState<AddTodoPage> {
  late double _currentScale;
  final titleController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _currentScale = 0;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (context.mounted) {
        setState(() {
          _currentScale = 1;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    late final Widget content;
    final asyncTodosAction = ref.watch(todosActionProvider);
    ref.listen(todosActionProvider, (previous, next) {
      next.when(
        data: (data) {
          if (data == 'successful') {
            context.pop();
          }
        },
        error: (error, stackTrace) {
          context.pop();
          SchedulerBinding.instance.addPostFrameCallback((_) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(
              SnackBar(
                content: Text(error as String),
              ),
            );
          });
        },
        loading: () {},
      );
    });

    asyncTodosAction.when(
      loading: () {
        content = Padding(
          padding: EdgeInsets.all(20),
          child: Center(
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
      data: (data) {
        if (data == 'initial') {
          content = SingleChildScrollView(
            child: AnimatedScale(
              duration: const Duration(milliseconds: 500),

              scale: _currentScale,
              curve: Curves.bounceOut,
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: Card(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 30,
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Configure your todo',
                          style: Theme.of(context).textTheme.displayLarge,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        TextField(
                          controller: titleController,
                          minLines: 5,
                          maxLines: 5,
                          cursorColor: Colors.white,
                          cursorHeight: 20,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.labelLarge,
                          decoration: InputDecoration(
                            hintText: 'type something',
                          ),
                        ),
                        SizedBox(height: 20),
                        DiscardButton(),
                        SizedBox(height: 20),
                        AddButton(
                          onAdd: () {
                            debugPrint(titleController.text);
                            ref
                                .read(todosActionProvider.notifier)
                                .addTodo(titleController.text);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        } else {
          content = SizedBox.shrink();
        }
      },
      error: (error, stackTrace) {
        content = SizedBox.shrink();
      },
    );
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      switchInCurve: Curves.bounceOut,
      switchOutCurve: Curves.bounceOut,
      transitionBuilder: (Widget child, Animation<double> animation) {
        return ScaleTransition(
          scale: animation,
          child: child,
        );
      },
      child: content,
    );
  }
}
