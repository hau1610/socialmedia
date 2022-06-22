import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  final num size;
  final Color? color;
  const LoadingIndicator({this.size = 20.0, this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(color ?? Colors.green),
        ),
        height: size.toDouble(),
        width: size.toDouble(),
      ),
    );
  }
}
