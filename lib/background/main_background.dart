import 'package:flutter/material.dart';

class MainBackground extends StatelessWidget {
  final Widget child;
  const MainBackground({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF652AB2),
            Color(0xFF2B124C),
          ],
        ),
      ),
      child: child,
    );
  }
}
