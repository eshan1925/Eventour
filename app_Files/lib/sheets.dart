import 'package:eventour/Userinfo.dart';
import 'package:gsheets/gsheets.dart';

class UserSheetsApi {
  static const _credentials = r'''
  {
  "type": "service_account",
  "project_id": "eventour-databse",
  "private_key_id": "<MY PRIVATE KEY ID>",
  "private_key": "-----BEGIN PRIVATE KEY-----\n<MY_PRIVATE_KEY>\n-----END PRIVATE KEY-----\n",
  "client_email": "eventour@eventour-databse.iam.gserviceaccount.com",
  "client_id": "110754051835123115027",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/eventour%40eventour-databse.iam.gserviceaccount.com"
}
  ''';
  static final _spreadsheetId = '1S-y9yF-vDgimDWn1WzwDWCwhtHp5NmPi-bYELQS8VXQ';
  static final _gsheets = GSheets(_credentials);
  static Worksheet? _userSheet, _orderSheet;

  static Future init() async {
    try {
      final spreadsheet = await _gsheets.spreadsheet(_spreadsheetId);
      _userSheet = await _getWorkSheet(spreadsheet, title: 'Users');
      _orderSheet = await _getWorkSheet(spreadsheet, title: 'Orders');
      final firstRow = UserFields.getFields();
      _userSheet!.values.insertRow(1, firstRow);

      final firstOrderRow = Orders.getOrders();
      _orderSheet!.values.insertRow(1, firstOrderRow);
    } catch (e) {
      print('Init Error :$e');
    }
  }

  static Future<Worksheet> _getWorkSheet(Spreadsheet spreadsheet,
      {required String title}) async {
    try {
      return await spreadsheet.addWorksheet(title);
    } catch (e) {
      return spreadsheet.worksheetByTitle(title)!;
    }
  }

  static Future insert(List<Map<String, dynamic>> rowList) async {
    if (_userSheet == null) return;
    _userSheet!.values.map.appendRows(rowList);
  }

  static Future insertOrders(List<Map<String, dynamic>> rowList) async {
    if (_orderSheet == null) return;
    _orderSheet!.values.map.appendRows(rowList);
  }
}
