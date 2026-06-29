import 'package:flutter/material.dart';

class AddButton extends StatefulWidget {
  const AddButton({super.key, required this.onAdd});
  final void Function() onAdd;
  @override
  State<AddButton> createState() => _AddButtonState();
}

class _AddButtonState extends State<AddButton> {
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
              widget.onAdd();
            },

            child: Text(
              'Add',
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
        ),
      ),
    );
  }
}
