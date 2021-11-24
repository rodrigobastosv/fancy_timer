<a href="https://www.buymeacoffee.com/rodrigobastosv" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" alt="Buy Me A Coffee" style="height: 60px !important;width: 217px !important;" ></a>

#  Introduction

If you want a widget to display a timer on the screen without too much hustle? If so, fancy_timer can help you a lot.

# Basic Usage

The most simple usage is just passing the desired duration to the FancyTimer widget. Duration is the only required parameter. By just doing that you will already have a beautifull timer on your screen.

```dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          body: Center(
              child: FancyTimer(
                    duration: Duration(seconds: 10),
              ),
          ),
      ),
    );
  }
}
```

![enter image description here](https://ibb.co/pyhZknY)

# Customisation
If you want you can customise almost any aspect of the widget like the separator widget or maybe the decoration of your digits.

# End Callback
You can pass a callback function on the onTimerEnd parameter. That callback is executed after the timer ends.

![enter image description here](https://media.giphy.com/media/KLAVOQM55uBFAYHHJu/giphy.gif)

## Todo

- [ ] Tests
- [ ] Adjust for using high number of days

## Suggestions & Bugs

For any suggestions or bug report please head to [issue tracker][tracker].

[tracker]: https://github.com/rodrigobastosv/fancy_timer/issues
