import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:r6_operators_info/settings/themes.dart';
import 'package:r6_operators_info/widgets/circular_rating_bar.dart';
import 'package:r6_operators_info/widgets/information_card.dart';
import 'package:r6_operators_info/widgets/two_line_information_card.dart';


class OperatorPage extends StatefulWidget {
  OperatorPage(this.data, {Key key}) : super(key: key);

  final Map data;

  @override
  _OperatorPageState createState() => _OperatorPageState();
}

class _OperatorPageState extends State<OperatorPage> {
  @override
  Widget build(BuildContext context) {
    final Map _data = widget.data;

    final String _name = _data['name'];
    final String _division = _data['division'];
    final String _flag = _data['flag'];
    final bool _isattacker = _data['isattacker'] == 1;
    final int _armor = _data['armor'];
    final int _speed = _data['speed'];
    final String _realname = _data['realname'];
    final String _dateofbirth = _data['dateofbirth'];
    final String _placeofbirth = _data['placeofbirth'];

    final String _flagPath = 'res/CountryFlags/$_flag.png';
    final String _iconPath = 'res/OperatorsData/$_name/Icon.png';
    final String _fullPhotoPath = 'res/OperatorsData/$_name/FullPhoto.png';
    final String _attackerIconPath = 'res/AttackerIcon.png';
    final String _defenderIconPath = 'res/DefenderIcon.png';
    final String _miniAttackerIconPath = 'res/MiniAttackerIcon.png';
    final String _miniDefenderIconPath = 'res/MiniDefenderIcon.png';

    return Scaffold(
      appBar: AppBar(title: Text(_name.toUpperCase(), style: appTheme.textTheme.headline2),
                     centerTitle: true,
                     ),
      body: ListView(
        children: <Widget>[
          InformationCard(
            child: Padding(padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                           child: Stack(
                             alignment: AlignmentDirectional.topStart,
                             children: <Widget>[
                               Builder(builder: (context) {
                                 if (_isattacker) return Image(width: 64.0, image: AssetImage(_attackerIconPath));
                                 else return Image(width: 64.0, image: AssetImage(_defenderIconPath));
                               }),
                               Stack(
                                 alignment: AlignmentDirectional.topEnd,
                                 children: <Widget>[
                                   Image(image: AssetImage(_fullPhotoPath), fit: BoxFit.contain),
                                   Column(crossAxisAlignment: CrossAxisAlignment.end,
                                          children: <Widget>[
                                            Opacity(
                                              opacity: 0.3,
                                              child: Text(_division, style: appTheme.textTheme.subtitle1)
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(top: 8.0),
                                              child: Image(image: AssetImage(_flagPath))
                                            )
                                          ]
                                   )
                                 ]
                               )
                             ],
                           )
        )),
        InformationCard(
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
                        );//Text('SIDE - ATTACKER', style: appTheme.textTheme.headline2);
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
                        );//Text('SIDE - DEFENDER', style: appTheme.textTheme.headline2);
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
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TwoLineInformationCard(
                topText: 'Real Name',
                bottomText: _realname
            ),
            TwoLineInformationCard(
                topText: 'Date of Birth',
                bottomText: _dateofbirth
            ),
            TwoLineInformationCard(
                topText: 'Place of Birth',
                bottomText: _placeofbirth
            )
          ]
        ),
      ])
    );
  }
}