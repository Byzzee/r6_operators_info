import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:r6_operators_info/settings/themes.dart';


class InformationCard extends StatefulWidget {
  InformationCard({Key key, @required this.child}) : super(key: key);

  final Widget child;

  @override
  _InformationCardState createState() => _InformationCardState();
}

class _InformationCardState extends State<InformationCard> {
  @override
  Widget build(BuildContext context) {
    final Widget _child = widget.child;

    return Card(
        color: appTheme.primaryColor,
        elevation: 16.0,
        margin: EdgeInsets.all(16.0),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.0))
        ),
        child: _child
    );
  }
}