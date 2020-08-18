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

    final String _name = _data['name'];

    final String _iconPath = 'res/OperatorsData/$_name/Icon.png';
    final String _photoPath = 'res/OperatorsData/$_name/Photo.png';

    return OpenContainer(
      closedColor: appTheme.primaryColor,
      closedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0))
      ),
      transitionDuration: Duration(milliseconds: 448),
      closedBuilder: (context, action) => Column(children: <Widget>[Stack(alignment: AlignmentDirectional.bottomCenter,
              children: <Widget>[Padding(padding: EdgeInsets.only(top: 4.0),
                                         child: Image(fit: BoxFit.contain,
                                                      image: AssetImage(_photoPath)
                                         )
                                 ),
                                 Padding(padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 6.0),
                                         child: Image(image: AssetImage(_iconPath))
                                 )
              ]
      ),
        Padding(padding: EdgeInsets.only(top: 5.0),
                child: Text(_name.toUpperCase(), style: appTheme.textTheme.headline1)
        )
      ]),
      openBuilder: (context, action) => OperatorPage(_data)
    );
  }
}