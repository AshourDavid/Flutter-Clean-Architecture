import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DiscardButton extends StatefulWidget {
  const DiscardButton({super.key});

  @override
  State<DiscardButton> createState() => _DiscardButtonState();
}

class _DiscardButtonState extends State<DiscardButton> {
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
              context.pop();
            },
            style:
                Theme.of(
                  context,
                ).elevatedButtonTheme.style!.copyWith(
                  backgroundColor: WidgetStatePropertyAll(Colors.red),
                ),
            child: Text(
              'Discard',
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
        ),
      ),
    );
  }
}
