import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:r6_operators_info/settings/themes.dart';
import 'package:r6_operators_info/widgets/loadout_block_card.dart';
import 'package:r6_operators_info/widgets/loadout_element_card.dart';
import 'package:r6_operators_info/widgets/operators_full_photo_card.dart';
import 'package:r6_operators_info/widgets/two_line_information_card.dart';

import 'operators_brief_info_card.dart';


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

    final List<String> _primaryWeapon = _data['primary'].split(';');
    final List<String> _secondaryWeapon = _data['secondary'].split(';');
    final List<String> _gadget = _data['gadget'].split(';');
    final List<String> _uniqueAbility = _data['ability'].split(';');

    final String _flagPath = 'res/CountryFlags/$_flag.png';
    final String _fullPhotoPath = 'res/OperatorsData/$_name/FullPhoto.png';

    return Scaffold(
      appBar: AppBar(title: Text(_name.toUpperCase(), style: appTheme.textTheme.headline2),
                     centerTitle: true,
                     ),
      body: ListView(
        children: <Widget>[
          OperatorFullPhotoCard(
            isattacker: _isattacker,
            fullPhotoPath: _fullPhotoPath,
            division: _division,
            flagPath: _flagPath
          ),
          OperatorBriefInfoCard(
            name: _name,
            isattacker: _isattacker,
            armor: _armor,
            speed: _speed
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
          LoadoutBlockCard(
            type: LoadoutElementType.primary,
            elements: _primaryWeapon
          ),
          LoadoutBlockCard(
              type: LoadoutElementType.secondary,
              elements: _secondaryWeapon
          ),
          LoadoutBlockCard(
              type: LoadoutElementType.gadget,
              elements: _gadget
          ),
          LoadoutBlockCard(
              type: LoadoutElementType.ability,
              elements: _uniqueAbility
          )
      ])
    );
  }
}