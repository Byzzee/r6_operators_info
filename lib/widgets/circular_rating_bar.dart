import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CircularRatingBar extends StatefulWidget {
  CircularRatingBar(this.value, {Key key}) : super(key: key);

  final int value;

  @override
  _CircularRatingBarState createState() => _CircularRatingBarState();
}

class _CircularRatingBarState extends State<CircularRatingBar> {
  @override
  Widget build(BuildContext context) {
    final int _value = widget.value;
    final List _ratingStars = <Widget>[];
    final Icon _checked = Icon(
      Icons.radio_button_checked,
      color: Colors.white
    );
    final Icon _unchecked = Icon(
      Icons.radio_button_unchecked,
      color: Colors.white
    );

    if (1 <= _value && _value <= 3) {
      for (int i = 1; i <= 3; i++) {
        if (i <= _value) {
          _ratingStars.add(_checked);
        }
        else {
          _ratingStars.add(_unchecked);
        }
      }
    }
    else {
      for (int i = 1; i <= 3; i++) {
        _ratingStars.add(_unchecked);
      }
    }

    return Row(
      children: _ratingStars
    );
  }
}