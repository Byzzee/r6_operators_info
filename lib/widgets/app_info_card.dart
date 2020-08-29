import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:r6_operators_info/settings/themes.dart';
import 'package:r6_operators_info/widgets/app_info_page.dart';


class AppInfoCard extends StatefulWidget {
  AppInfoCard({Key key}) : super(key: key);

  @override
  _AppInfoCardState createState() => _AppInfoCardState();
}

class _AppInfoCardState extends State<AppInfoCard> {
  @override
  Widget build(BuildContext context) {
    return OpenContainer(
        closedColor: appTheme.primaryColor,
        closedShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0))
        ),
        transitionDuration: Duration(milliseconds: 448),
        closedBuilder: (context, action) => Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 48.0),
              child: Icon(
                  Icons.info_outline,
                  color: Colors.white,
                  size: 32.0
              )
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 6.0),
              child: Text(
                  'APP INFO',
                  style: appTheme.textTheme.headline1
              )
            )
          ]
        ),
        openBuilder: (context, action) => AppInfoPage()
    );
  }
}