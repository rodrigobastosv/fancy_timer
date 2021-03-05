import 'package:flutter/material.dart';

import 'digit_widget.dart';

/// Widget that represents the digits that will be shown
class DigitsWidget extends StatelessWidget {
  const DigitsWidget({
    Key? key,
    required this.digitOne,
    required this.digitTwo,
    required this.digitContainerDecoration,
    required this.digitContainerHeight,
    required this.digitContainerWidth,
    required this.digitTextStyle,
  }) : super(key: key);

  final String digitOne;
  final String digitTwo;
  final BoxDecoration digitContainerDecoration;
  final double digitContainerHeight;
  final double digitContainerWidth;
  final TextStyle digitTextStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DigitWidget(
          value: digitOne,
          digitContainerDecoration: digitContainerDecoration,
          digitContainerHeight: digitContainerHeight,
          digitContainerWidth: digitContainerWidth,
          digitTextStyle: digitTextStyle,
        ),
        SizedBox(width: 4),
        DigitWidget(
          value: digitTwo,
          digitContainerDecoration: digitContainerDecoration,
          digitContainerHeight: digitContainerHeight,
          digitContainerWidth: digitContainerWidth,
          digitTextStyle: digitTextStyle,
        ),
      ],
    );
  }
}
