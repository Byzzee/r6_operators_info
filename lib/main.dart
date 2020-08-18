import 'package:flutter/material.dart';
import 'models/database_provider.dart';
import 'settings/portrait_mode.dart';
import 'settings/themes.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget with PortraitModeMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return MaterialApp(
      title: 'R6 Operators',
      theme: appTheme,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Padding(padding: EdgeInsets.all(78.0), child: Image.asset('res/R6_Logo.png', fit: BoxFit.contain)),
        ),
        body: Container(margin: EdgeInsets.all(8.0),
            child: FutureBuilder(future: getStructuredData(),
                                          builder: (context, snapshot) {
                                          if (snapshot.hasError) {
                                            return Center(child: Text('Возникла ошибка', style: appTheme.textTheme.overline));
                                          }
                                          else {
                                          if (snapshot.hasData) {
                                            return GridView.count(childAspectRatio: 250/500,
                                                mainAxisSpacing: 8.0,
                                                crossAxisSpacing: 8.0,
                                                crossAxisCount: 4,
                                                scrollDirection: Axis.vertical,
                                                children: snapshot.data);
                                          }
                                          else {
                                              return Center(child: CircularProgressIndicator());
                                            }
                                          }}))
        );
  }
}