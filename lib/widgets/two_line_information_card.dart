import 'package:flutter/cupertino.dart';
import 'package:r6_operators_info/settings/themes.dart';
import 'information_card.dart';


class TwoLineInformationCard extends StatefulWidget {
  TwoLineInformationCard({Key key, @required this.topText, @required this.bottomText}) : super(key: key);

  final String topText;
  final String bottomText;

  @override
  _TwoLineInformationCardState createState() => _TwoLineInformationCardState();
}

class _TwoLineInformationCardState extends State<TwoLineInformationCard> {
  @override
  Widget build(BuildContext context) {
    final String _topText = widget.topText;
    final String _bottomText = widget.bottomText;

    return InformationCard(
        child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Expanded(
                child: Padding(
                    padding: EdgeInsets.only(top: 10.0, left: 16.0, right: 16.0, bottom: 10.0),
                    child: Column(
                        mainAxisAlignment:MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.only(bottom: 4.0),
                              child: Opacity(
                                  opacity: 0.3,
                                  child: Text(_topText, style: appTheme.textTheme.subtitle2)
                              )
                          ),
                          Text(_bottomText, style: appTheme.textTheme.headline2, overflow: TextOverflow.fade,)
                        ]
                    )
                )
              )
            ]
        )
    );
  }
}