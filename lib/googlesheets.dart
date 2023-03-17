import 'package:gsheets/gsheets.dart';
import 'package:end_user/sheetscolumn.dart';

class SheetsFlutter{
  static String _sheetId = "1bUPYHYsRjNUNf4wCWMm8H0y-ms7EDbw_hxA88LFlx00";
  static const _sheetCredentials = r'''
  {
  "type": "service_account",
  "project_id": "trackit-379205",
  "private_key_id": "7e5dac8e8d96d8c08a5e07ff50faf3afb6eaeb5f",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDQwDYXG5r89GQo\nkhBHOUe3rqVtBGD1PJciy9XJnjm6yRdEdcXET1IPRVwU9M6zlOWnZd3ukoBrF/YJ\nu8RfGReoKx93LshG1CurDlQlyS9Y+jdPNnx3bDrM1OaTNYbf9driayn3z8/ZlQSh\n+Dod5GtTLSktD+pSpYQMdhH3EypUA1UTdmg5/n9vp3iMsO2zmbW7gdFsqGoR94Fu\nhv3hwDl06EXZu7cIwxiZJ3+pGlI86E9PYbJ7o/KOnhPf88mGxkjLFsBUHTcByOLi\n+ONAqb8wHV4cUpTzZfE9w/QqBeZYkplMMka6bW2e2eHh20lS5Cx3YGszXf9NBS8g\n4F6qf8tTAgMBAAECggEAJQGOFTadmS4x+0c5f4bWAegCB3t5PMBLAq4j7iQQk95G\nM6q1LoHpSC/BjS2A3zEMLUrPtxVdkp6izULuIvWtzfAnGde/RV8jhqV5oWEy9ZEV\n8QL1ua4EFn+/iGU6zcUl0nGw9O9wJ2BVe+knVFlD9XDSFdz2a0RQTm037hcFr/K9\nJ3VLZGwZMIgKhLHxFLfUytFPClEJS+KPwJGghB3+47aslwoL89QKkWpaL4b3sDuC\nhUDbZLxMz50COSa+VPm36eS1P5NreDkgTXMwdpxIKhPJKMSe2QLSV819LQ+Np7tC\nHY/1x8pGMN165vQsnWw9FliCQbzJAAtnq74UxEh2AQKBgQD2VnpKQQHM8PZ9QwA6\nZUW27D8jnBWb/7bOng43hHMQcmCG+7BuARqtq7iluhE1+x9B1xE7LNacxXsG04gd\ngwGQxutPluCMLviATfFaVuxn5WbE7+n+dItVfjGyYmvBAZd9lePbeYajbq0NKauk\nM/d9FVLnj13LGpwB6duaDUK5gQKBgQDY8FDjXckOaPtkVVvIiG+MswJ5BxX250m9\noWtPS09MI8Sv49jkVXDWVkESY7TSlx8l3iDx38wzBEg/0Cf+FBKzy05oDR7PJQje\n47+0D8FVkLJibUilWuaFer0G5ALLlfrvcr78sEOZxlPLJZZK4BAEgzO1kOVOIraR\nqw8oP1fm0wKBgQCqitxHJBJXDEvaFNTHmO1W4uAjix/6zGKHUS2OiggPTuA9E2rl\n/aW2rrg7JEJeGOle78JiMXyzNJUj+La3l8cxsEWg6Fe1NZ+dVFjPrnYkx9EKbv6U\nx6LfIWrOkQ0AplV3AJqri8sGwszT3BGUsNWap3SqE7tfraBsQrdiQ+P6AQKBgHqa\nJjy5Dh20uw6TJxIH+XL84BLiLEmjoQsopOrlVuVi+Y+mJze0Cdc4XAI2k0TI33OZ\nO+k2X8MdUm+uBkwTsBYoeiFX+Od8uKyu7fKnTM48vnPd60Z4PvuEyDuStPm1w2F7\n6fAI9ct8SHLwxSV/x82lEJ42S0GDYMamdCR82AK9AoGBAMv3BALHANyh9uoCX7Pb\n9MlQ01gA7FDcOQPCnicMSGzyYSfxG5dzgkeJ8SwR8M0MdXXwUoHOL0cA9IrGcQjh\nSDwBasQtwQsnSY+As++jxM+6n3dS8K0HBWKO8fZzMACvcvLOw1Wh40tKjIkCZNg5\nxZjB+RkkuJpeLYIrPBMb8c8W\n-----END PRIVATE KEY-----\n",
  "client_email": "trackitgsheet@trackit-379205.iam.gserviceaccount.com",
  "client_id": "100077239841313598920",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/trackitgsheet%40trackit-379205.iam.gserviceaccount.com"
  }
''';
  static Worksheet? _userSheet;
  static final _gsheets = GSheets(_sheetCredentials);

  static Future init() async {
    try{
      final spreadsheet = await _gsheets.spreadsheet(_sheetId);

      _userSheet = await _getWorkSheet(spreadsheet, title: "Users");
      final firstRow = SheetsColumn.getColumns();
      _userSheet!.values.insertRow(1, firstRow);
    } catch(e) {
      print(e);
    }
  }

  static Future<Worksheet> _getWorkSheet(
      Spreadsheet spreadsheet, {
        required String title,
      }) async {
    try{
      return await spreadsheet.addWorksheet(title);
    } catch(e) {
      return spreadsheet.worksheetByTitle(title)!;
    }
  }

  static Future insert(List<Map<String, dynamic>> rowList) async {
    _userSheet!.values.map.appendRows(rowList);
  }
}