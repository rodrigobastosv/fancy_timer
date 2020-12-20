import 'package:flutter/material.dart';

import 'digits_widget.dart';
import 'time_separator.dart';

// Fancy widget that gives you an out of the box timer with configurable options
class FancyTimer extends StatefulWidget {
  FancyTimer({
    Key key,
    @required this.duration,
    this.timeSeparatorWidget,
    this.digitContainerDecoration,
    this.digitContainerHeight,
    this.digitContainerWidth,
    this.digitTextStyle,
    this.onTimerEnd,
  }) : super(key: key);

  /// Duration of the timer
  /// Currently this has a limitation of 3 days (in hours)
  final Duration duration;

  /// Widget that will separate hours, minutes and seconds
  final Widget timeSeparatorWidget;

  /// Decoration of the container of the widget
  final BoxDecoration digitContainerDecoration;

  /// Height of the container of the widget
  final double digitContainerHeight;

  /// Width of the container of the widget
  final double digitContainerWidth;

  /// Style of the text of the widget
  final TextStyle digitTextStyle;

  // Callback that will be executed when the timer ends
  final VoidCallback onTimerEnd;

  @override
  _FancyTimerState createState() => _FancyTimerState();
}

class _FancyTimerState extends State<FancyTimer>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  int hours;
  int minutes;
  int seconds;

  Widget timeSeparatorWidget;
  BoxDecoration digitContainerDecoration;
  double digitContainerHeight;
  double digitContainerWidth;
  TextStyle digitTextStyle;

  @override
  void initState() {
    super.initState();

    timeSeparatorWidget = widget.timeSeparatorWidget ?? TimeSeparator();
    digitContainerDecoration = widget.digitContainerDecoration ??
        BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.grey,
            width: 1,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        );
    digitContainerHeight = widget.digitContainerHeight ?? 40;
    digitContainerWidth = widget.digitContainerWidth ?? 30;
    digitTextStyle = widget.digitTextStyle ??
        TextStyle(
          fontSize: 20,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        );

    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
      value: 1,
    );

    _controller.addListener(() {
      final leftDuration = _controller.duration * _controller.value;
      setState(() {
        hours = leftDuration.inHours;
        minutes = leftDuration.inMinutes % 60;
        seconds = leftDuration.inSeconds % 60;
      });

      if (leftDuration.inSeconds == 0) {
        if (widget.onTimerEnd != null) {
          widget.onTimerEnd();
        }
        _controller?.dispose();
      }
    });
    _controller.reverse();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          DigitsWidget(
            digitOne: getFirstDigit(hours),
            digitTwo: getLastDigit(hours),
            digitContainerDecoration: digitContainerDecoration,
            digitContainerHeight: digitContainerHeight,
            digitContainerWidth: digitContainerWidth,
            digitTextStyle: digitTextStyle,
          ),
          timeSeparatorWidget,
          DigitsWidget(
            digitOne: getFirstDigit(minutes),
            digitTwo: getLastDigit(minutes),
            digitContainerDecoration: digitContainerDecoration,
            digitContainerHeight: digitContainerHeight,
            digitContainerWidth: digitContainerWidth,
            digitTextStyle: digitTextStyle,
          ),
          timeSeparatorWidget,
          DigitsWidget(
            digitOne: getFirstDigit(seconds),
            digitTwo: getLastDigit(seconds),
            digitContainerDecoration: digitContainerDecoration,
            digitContainerHeight: digitContainerHeight,
            digitContainerWidth: digitContainerWidth,
            digitTextStyle: digitTextStyle,
          ),
        ],
      ),
    );
  }

  String getFirstDigit(int number) =>
      (number == null || number < 10) ? '0' : number.toString().characters.last;

  String getLastDigit(int number) => number.toString().characters.last;
}
