import 'package:flutter/cupertino.dart';
import 'package:r6_operators_info/settings/themes.dart';
import 'information_card.dart';


class OperatorFullPhotoCard extends StatefulWidget {
  OperatorFullPhotoCard({Key key, @required this.isattacker, @required this.fullPhotoPath, @required this.division, @required this.flagPath}) : super(key: key);

  final bool isattacker;
  final String fullPhotoPath;
  final String division;
  final String flagPath;

  @override
  _OperatorFullPhotoCardState createState() => _OperatorFullPhotoCardState();
}

class _OperatorFullPhotoCardState extends State<OperatorFullPhotoCard> {
  @override
  Widget build(BuildContext context) {
    final bool _isattacker = widget.isattacker;
    final String _attackerIconPath = 'res/AttackerIcon.png';
    final String _defenderIconPath = 'res/DefenderIcon.png';
    final String _fullPhotoPath = widget.fullPhotoPath;
    final String _division = widget.division;
    final String _flagPath = widget.flagPath;

    return InformationCard(
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
        )
    );
  }
}