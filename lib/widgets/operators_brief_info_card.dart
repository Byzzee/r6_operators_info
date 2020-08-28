import 'package:flutter/cupertino.dart';
import 'package:r6_operators_info/settings/themes.dart';
import 'circular_rating_bar.dart';
import 'information_card.dart';


class OperatorBriefInfoCard extends StatefulWidget {
  OperatorBriefInfoCard({Key key, @required this.name, @required this.isattacker, @required this.armor, @required this.speed}) : super(key: key);

  final String name;
  final bool isattacker;
  final int armor;
  final int speed;

  @override
  _OperatorBriefInfoCardState createState() => _OperatorBriefInfoCardState();
}

class _OperatorBriefInfoCardState extends State<OperatorBriefInfoCard> {
  @override
  Widget build(BuildContext context) {
    final String _name = widget.name;
    final bool _isattacker = widget.isattacker;
    final int _armor = widget.armor;
    final int _speed = widget.speed;

    final String _iconPath = 'res/OperatorsData/$_name/Icon.png';
    final String _miniAttackerIconPath = 'res/MiniAttackerIcon.png';
    final String _miniDefenderIconPath = 'res/MiniDefenderIcon.png';

    return InformationCard(
        child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image(image: AssetImage(_iconPath), width: 64.0),
                        Padding(
                            padding: EdgeInsets.only(top: 4.0, left: 8.0),
                            child: Text(_name.toUpperCase(), style: appTheme.textTheme.headline6)
                        )
                      ]
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 12.0, left: 8.0, right: 8.0),
                      child: Builder(builder: (context) {
                        if (_isattacker) return Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text('SIDE', style: appTheme.textTheme.headline2),
                              Padding(
                                  padding: EdgeInsets.only(left: 8.0, right: 8.0),
                                  child: Image(
                                      image: AssetImage(_miniAttackerIconPath),
                                      width: 24.0
                                  )
                              ),
                              Text('ATTACKER', style: appTheme.textTheme.headline2)
                            ]
                        );
                        else return Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text('SIDE', style: appTheme.textTheme.headline2),
                              Padding(
                                  padding: EdgeInsets.only(left: 8.0, right: 8.0),
                                  child: Image(
                                      image: AssetImage(_miniDefenderIconPath),
                                      width: 24.0
                                  )
                              ),
                              Text('DEFENDER', style: appTheme.textTheme.headline2)
                            ]
                        );
                      })
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 16.0, left: 8.0, right: 8.0, bottom: 4.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Column(
                                children: <Widget>[
                                  Text('ARMOR', style: appTheme.textTheme.headline2),
                                  Padding(
                                      padding: EdgeInsets.only(top: 4.0),
                                      child: CircularRatingBar(_armor)
                                  )
                                ]
                            ),
                            Column(
                                children: <Widget>[
                                  Text('SPEED', style: appTheme.textTheme.headline2),
                                  Padding(
                                      padding: EdgeInsets.only(top: 4.0),
                                      child: CircularRatingBar(_speed)
                                  )
                                ]
                            )
                          ]
                      )
                  )
                ]
            )
        )
    );
  }
}