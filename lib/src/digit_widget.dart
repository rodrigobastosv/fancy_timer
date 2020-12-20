import 'package:flutter/material.dart';

/// Widget that represents a single digit on the timer
class DigitWidget extends StatelessWidget {
  const DigitWidget({
    Key key,
    @required this.value,
    @required this.digitContainerDecoration,
    @required this.digitContainerHeight,
    @required this.digitContainerWidth,
    @required this.digitTextStyle,
  })  : assert(value != null),
        assert(digitContainerDecoration != null),
        assert(digitContainerHeight != null),
        assert(digitContainerWidth != null),
        assert(digitTextStyle != null),
        super(key: key);

  final String value;
  final BoxDecoration digitContainerDecoration;
  final double digitContainerHeight;
  final double digitContainerWidth;
  final TextStyle digitTextStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: digitContainerHeight,
      width: digitContainerWidth,
      decoration: digitContainerDecoration,
      child: Center(
        child: Text(
          value,
          style: digitTextStyle,
        ),
      ),
    );
  }
}
