import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:r6_operators_info/settings/themes.dart';
import 'operators_page.dart';


class OperatorCard extends StatefulWidget {
  OperatorCard(this.data, {Key key}) : super(key: key);

  final Map data;

  @override
  _OperatorCardState createState() => _OperatorCardState();
}

class _OperatorCardState extends State<OperatorCard> {
  @override
  Widget build(BuildContext context) {
    final Map _data = widget.data;
    return OpenContainer(
      transitionDuration: Duration(milliseconds: 512),
      closedColor: appTheme.primaryColor,
      closedBuilder: (ctx, action) => Column(children: <Widget>[Stack(alignment: AlignmentDirectional.bottomCenter,
              children: <Widget>[Padding(padding: EdgeInsets.only(top: 4.0),
                                         child: Image(fit: BoxFit.contain,
                                                      image: AssetImage('res/OperatorsData/${_data['name']}/Photo.png'))),
                                 Padding(padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 6.0),
                                         child: Image(image: AssetImage('res/OperatorsData/${_data['name']}/Icon.png')))]),
        Padding(padding: EdgeInsets.only(top: 5.0),
                child: Text(_data['name'].toUpperCase(), style: appTheme.textTheme.headline1))]),
      openBuilder: (ctx, action) => OperatorPage(_data)
    );
  }
}