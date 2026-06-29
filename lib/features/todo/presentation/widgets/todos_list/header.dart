import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> with SingleTickerProviderStateMixin {
  double oldValue = 0;
  double newValue = 0.5;

  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
      lowerBound: 0,
      upperBound: 1,
    );
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 100),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your Todos',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            SizedBox(width: 50),
            AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                double progressValue =
                    Tween<double>(
                          begin: oldValue,
                          end: newValue,
                        )
                        .animate(
                          CurvedAnimation(
                            parent: _animationController,
                            curve: Curves.bounceOut,
                          ),
                        )
                        .value;

                double backgroundValue =
                    Tween<double>(
                          begin: (1 - oldValue - 0.14),
                          end: (1 - newValue - 0.14),
                        )
                        .animate(
                          CurvedAnimation(
                            parent: _animationController,
                            curve: Curves.bounceOut,
                          ),
                        )
                        .value;

                return Stack(
                  clipBehavior: Clip.none,
                  children: [
                    CircularProgressIndicator(
                      constraints: BoxConstraints(minHeight: 50, minWidth: 50),
                      strokeWidth: 8,
                      color: Theme.of(
                        context,
                      ).colorScheme.secondaryContainer,
                      strokeCap: StrokeCap.round,

                      value: progressValue,
                    ),
                    Transform.rotate(
                      angle: -0.4,
                      child: Transform.scale(
                        scaleX: -1,
                        child: CircularProgressIndicator(
                          constraints: BoxConstraints(
                            minHeight: 50,
                            minWidth: 50,
                          ),
                          strokeWidth: 8,
                          color: Theme.of(context).colorScheme.secondary,
                          strokeCap: StrokeCap.round,

                          value: backgroundValue,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          '${(progressValue * 100).round()}%',
                          style: Theme.of(
                            context,
                          ).textTheme.displayMedium!.copyWith(fontSize: 10),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),

        SizedBox(
          width: MediaQuery.of(context).size.width - 50,
          child: Divider(
            radius: BorderRadius.circular(30),
          ),
        ),
      ],
    );
  }
}
