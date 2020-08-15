import 'package:flutter/material.dart';
import 'package:r6_operators_info/settings/themes.dart';


class OperatorCard extends StatefulWidget {
  OperatorCard(this.name, {Key key}) : super(key: key);

  final String name;

  @override
  _OperatorCardState createState() => _OperatorCardState();
}

class _OperatorCardState extends State<OperatorCard> {
  @override
  Widget build(BuildContext context) {
    return Card(color: appTheme.primaryColor,
        child: Column(children: <Widget>[Stack(alignment: AlignmentDirectional.bottomCenter,
            children: <Widget>[Padding(padding: EdgeInsets.only(top: 4.0),
                child: Image(fit: BoxFit.contain,
                    image: AssetImage('res/OperatorsData/${widget.name}/Photo.png'))),
              Padding(padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 6.0),
                  child: Image(image: AssetImage('res/OperatorsData/${widget.name}/Icon.png')))]),                                                                              Padding(padding: EdgeInsets.only(top: 5.0),
            child: Text(widget.name.toUpperCase(), style: appTheme.textTheme.headline1))])
    );
  }
}