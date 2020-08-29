import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:r6_operators_info/settings/themes.dart';


class AppInfoPage extends StatefulWidget {
  AppInfoPage({Key key}) : super(key: key);

  @override
  _AppInfoPageState createState() => _AppInfoPageState();
}

class _AppInfoPageState extends State<AppInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('APP INFO', style: appTheme.textTheme.headline2),
        centerTitle: true
        ),
        body: Center(
          child: Icon(
            Icons.info_outline,
            color: Colors.white,
            size: 64.0,
          )
        )
    );
  }
}