import 'package:flutter/material.dart';
import 'package:supa_pro/features/todo/domain/entities.dart/todo.dart';

class TodoCard extends StatefulWidget {
  final Todo todo;
  const TodoCard({super.key, required this.todo});

  @override
  State<TodoCard> createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            transitionBuilder: (child, animation) {
              return ScaleTransition(
                scale: CurvedAnimation(
                  curve: Curves.bounceOut,
                  parent: animation,
                ),
                child: child,
              );
            },
            child: widget.todo.isChecked
                ? Stack(
                    children: [
                      Image.asset(
                        key: ValueKey('checked'),
                        'assets/images/checked.png',
                      ),
                      Positioned(
                        top: 0,
                        bottom: 0,
                        left: 0,
                        right: 0,

                        child: Image.asset(
                          key: ValueKey('vector'),
                          'assets/images/Vector 1.png',
                        ),
                      ),
                    ],
                  )
                : Image.asset(
                    key: ValueKey('unchecked'),
                    'assets/images/unchecked.png',
                  ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  style: Theme.of(context).textTheme.labelLarge,
                  widget.todo.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  softWrap: true,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
