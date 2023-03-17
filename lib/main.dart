import 'package:flutter/material.dart';
import 'package:gsheets/gsheets.dart';
import 'package:end_user/mainscreen.dart';
import 'package:end_user/googlesheets.dart';
//credentials
// const _credentials = r'''
// {
//   "type": "service_account",
//   "project_id": "trackit-379205",
//   "private_key_id": "7e5dac8e8d96d8c08a5e07ff50faf3afb6eaeb5f",
//   "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDQwDYXG5r89GQo\nkhBHOUe3rqVtBGD1PJciy9XJnjm6yRdEdcXET1IPRVwU9M6zlOWnZd3ukoBrF/YJ\nu8RfGReoKx93LshG1CurDlQlyS9Y+jdPNnx3bDrM1OaTNYbf9driayn3z8/ZlQSh\n+Dod5GtTLSktD+pSpYQMdhH3EypUA1UTdmg5/n9vp3iMsO2zmbW7gdFsqGoR94Fu\nhv3hwDl06EXZu7cIwxiZJ3+pGlI86E9PYbJ7o/KOnhPf88mGxkjLFsBUHTcByOLi\n+ONAqb8wHV4cUpTzZfE9w/QqBeZYkplMMka6bW2e2eHh20lS5Cx3YGszXf9NBS8g\n4F6qf8tTAgMBAAECggEAJQGOFTadmS4x+0c5f4bWAegCB3t5PMBLAq4j7iQQk95G\nM6q1LoHpSC/BjS2A3zEMLUrPtxVdkp6izULuIvWtzfAnGde/RV8jhqV5oWEy9ZEV\n8QL1ua4EFn+/iGU6zcUl0nGw9O9wJ2BVe+knVFlD9XDSFdz2a0RQTm037hcFr/K9\nJ3VLZGwZMIgKhLHxFLfUytFPClEJS+KPwJGghB3+47aslwoL89QKkWpaL4b3sDuC\nhUDbZLxMz50COSa+VPm36eS1P5NreDkgTXMwdpxIKhPJKMSe2QLSV819LQ+Np7tC\nHY/1x8pGMN165vQsnWw9FliCQbzJAAtnq74UxEh2AQKBgQD2VnpKQQHM8PZ9QwA6\nZUW27D8jnBWb/7bOng43hHMQcmCG+7BuARqtq7iluhE1+x9B1xE7LNacxXsG04gd\ngwGQxutPluCMLviATfFaVuxn5WbE7+n+dItVfjGyYmvBAZd9lePbeYajbq0NKauk\nM/d9FVLnj13LGpwB6duaDUK5gQKBgQDY8FDjXckOaPtkVVvIiG+MswJ5BxX250m9\noWtPS09MI8Sv49jkVXDWVkESY7TSlx8l3iDx38wzBEg/0Cf+FBKzy05oDR7PJQje\n47+0D8FVkLJibUilWuaFer0G5ALLlfrvcr78sEOZxlPLJZZK4BAEgzO1kOVOIraR\nqw8oP1fm0wKBgQCqitxHJBJXDEvaFNTHmO1W4uAjix/6zGKHUS2OiggPTuA9E2rl\n/aW2rrg7JEJeGOle78JiMXyzNJUj+La3l8cxsEWg6Fe1NZ+dVFjPrnYkx9EKbv6U\nx6LfIWrOkQ0AplV3AJqri8sGwszT3BGUsNWap3SqE7tfraBsQrdiQ+P6AQKBgHqa\nJjy5Dh20uw6TJxIH+XL84BLiLEmjoQsopOrlVuVi+Y+mJze0Cdc4XAI2k0TI33OZ\nO+k2X8MdUm+uBkwTsBYoeiFX+Od8uKyu7fKnTM48vnPd60Z4PvuEyDuStPm1w2F7\n6fAI9ct8SHLwxSV/x82lEJ42S0GDYMamdCR82AK9AoGBAMv3BALHANyh9uoCX7Pb\n9MlQ01gA7FDcOQPCnicMSGzyYSfxG5dzgkeJ8SwR8M0MdXXwUoHOL0cA9IrGcQjh\nSDwBasQtwQsnSY+As++jxM+6n3dS8K0HBWKO8fZzMACvcvLOw1Wh40tKjIkCZNg5\nxZjB+RkkuJpeLYIrPBMb8c8W\n-----END PRIVATE KEY-----\n",
//   "client_email": "trackitgsheet@trackit-379205.iam.gserviceaccount.com",
//   "client_id": "100077239841313598920",
//   "auth_uri": "https://accounts.google.com/o/oauth2/auth",
//   "token_uri": "https://oauth2.googleapis.com/token",
//   "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
//   "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/trackitgsheet%40trackit-379205.iam.gserviceaccount.com"
// }
//
// ''';
//
// //spreadsheet id
// const _spreadsheetID= '1bUPYHYsRjNUNf4wCWMm8H0y-ms7EDbw_hxA88LFlx00';
//
// void main() async {
//   //initialize gsheets
//   final gsheets = GSheets(_credentials);
//   //fetch sreadsheet by its id
//   final ss =  await gsheets.spreadsheet(_spreadsheetID);
//
//   //grab worksheet by its title
//   var sheet = ss.worksheetByTitle('Sheet1');
//
//   await sheet.values.insertValue(value, column: column, row: row);
//
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }


void main() async {

  await SheetsFlutter.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}