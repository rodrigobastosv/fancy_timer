import 'package:flutter/material.dart';

/// Widget that represents a basic time separator. You don't need to use this, 
/// you can create your own
class TimeSeparator extends StatelessWidget {
  const TimeSeparator({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6),
      child: Text(
        ':',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }
}
