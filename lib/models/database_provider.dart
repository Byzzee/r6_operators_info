import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:r6_operators_info/widgets/app_info_card.dart';
import 'package:r6_operators_info/widgets/operators_card.dart';
import 'package:sqflite/sqflite.dart';


Future<dynamic> getDataFromDatabase() async {
  // Construct the path to the app's writable database file:
  var dbDir = await getDatabasesPath();
  var dbPath = join(dbDir, 'operators_database.db');

  // delete existing if any
  await deleteDatabase(dbPath);

  // Make sure the parent directory exists
  try {
    await Directory(dirname(dbPath)).create(recursive: true);
  } catch (_) {}

  // Copy from asset
  ByteData data = await rootBundle.load(join('res', 'operators_database.db'));
  List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  await new File(dbPath).writeAsBytes(bytes, flush: true);

  Database db = await openDatabase(dbPath, readOnly: true);

  List<Map> allRecordsFromTable = await db.query('operators_data');

  return allRecordsFromTable;
}

Future<dynamic> getStructuredData() async {
  List<Map> records = await getDataFromDatabase();

  List<Widget> cards = <Widget>[AppInfoCard()];

  records.forEach((element) => cards.add(OperatorCard(element)));

  return cards;
}