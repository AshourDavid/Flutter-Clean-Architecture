import 'package:flutter/material.dart';
import 'package:supa_pro/features/todo/presentation/pages/add_todo_page.dart';

class AddTodoButton extends StatefulWidget {
  const AddTodoButton({super.key});

  @override
  State<AddTodoButton> createState() => _AddTodoButtonState();
}

class _AddTodoButtonState extends State<AddTodoButton> {
  double _currentScale = 1;

  void _onTapDown() {
    setState(() {
      _currentScale = 0.8;
    });
  }

  void _onTapUp() {
    setState(() {
      _currentScale = 1;
    });
  }

  void _showAddTodoDialog() {
    showGeneralDialog(
      context: context,
      barrierDismissible: false, // Matches your requirement
      fullscreenDialog: false,

      transitionDuration: const Duration(milliseconds: 500), // Your duration
      pageBuilder: (context, anim1, anim2) {
        return Dialog(
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: AddTodoPage(),
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return ScaleTransition(
          scale: CurvedAnimation(
            parent: anim1,
            curve: Curves.bounceOut,
          ),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Listener(
        onPointerUp: (details) {
          _onTapUp();
        },
        onPointerDown: (details) {
          _onTapDown();
        },
        child: AnimatedScale(
          scale: _currentScale,
          duration: const Duration(milliseconds: 100),
          curve: Curves.bounceOut,
          alignment: Alignment.center,
          child: ElevatedButton(
            onPressed: () {
              _showAddTodoDialog();
            },

            child: Text(
              'add',
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
        ),
      ),
    );
  }
}
