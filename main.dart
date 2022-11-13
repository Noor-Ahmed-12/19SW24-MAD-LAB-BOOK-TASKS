import 'package:flutter/material.dart';
import 'LoginScreen.dart';
import 'RegisterationScreen.dart';
import 'FormValidation.dart';
import 'LabTask.dart';
import 'ImageShow.dart';
import 'package:provider/provider.dart';
import 'ShareFilePlus.dart';
import 'URLLauncherExample.dart';
import 'FirstTask.dart';
import 'StudentData.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // is not restarted.
        primarySwatch: Colors.red,
      ),
      home: StudentData(),
    );
  }
}
