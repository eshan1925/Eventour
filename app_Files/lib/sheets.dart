import 'package:eventour/Userinfo.dart';
import 'package:gsheets/gsheets.dart';

class UserSheetsApi {
  static const _credentials = r'''
  {
  "type": "service_account",
  "project_id": "eventour-databse",
  "private_key_id": "1bc7894138094993f2978db2017ab3f97a38a541",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQC3m4/EjJJrY0Zz\nVXMpF67NAQo0b/go6KmN7tsxEd6Yfg9sVExolBElphzmKBwiMp7BxgXmgICVF6Gk\n74jYJSwFpzqVRZ7bNXaHPxC0rn5SSeHIB93G7Ng+tUQygsSm7w8owObGB7rmx/zj\n6/9YJlrQjUMiHom9/iCwtBewPgWQ5xYH1FsN0kqHrDk4DTHvC9cDDfkP8VEH9Zv5\nX7F6ZgoNByVU3conxhUZki+O+QW2B1vJoTngfo+MmSMPzEpazEdlUn9tQtdAF1iP\n4EOR4DQxLaap6dmIPugWKX+GkTxTJ5K1LnzAr8o1/3jX0yh2H8JZ+YhQ7hCWaKgf\nks29MmRDAgMBAAECggEAIQiU6ijcYwO+dhuml3sSUQHh4yNOA5Ywgz+5Ie/0G316\nquPTx3D0UNC9HE+VGDYBSB2njBwMhkZ1J6aM+U5eyDmZGagn94p748Nd7xQB2C5A\nt+tqZFLSaR3VwjyywtH56TwjiPd1EfZjMmKQUzy7VBBGRso1wAALw57zMBtIhxQu\nIyajMiGP10D/Y4izXodPsH3G14/pW7p+azome/wqFjvkTHnsyYPNbs8jnBDu1bB8\nuLny0VHnct3uWVvmIqyapSCECPtnzFH4nc7u31oUIrxfJYYAbQEhX/xdFrraZ+RV\nAZAxnaQHsBgSHgBQPENfxz2IUE/UUAfT52XwqyoRyQKBgQDrmdOW2ZLIZXdCQJ9G\nGqkUqug+cLSlvWNFBydBAySWmIz9yCOvwZmbLslxFE+OZy83nQ2d5WZ91XFn+Ayl\nS9Ce1F5yUaHDWF4hadaQoF9qKSDqM5Vr4+OlaPuUdgF/u7Y40tNAC/JrJCxgtkMr\np7zmLR+zhPBCzi6kYcfuHOkqNwKBgQDHgUmk8dD0QM1HSZVqnqKWDqTXqiQ5RTvc\nELZ1f/3GVzt2Pu4Njt609YTX2vvoG3fMbvSrY+EwB5aFEX2FyBQ6mnsuDh13snLU\nBM6xsxr5Nunva9yVATnhteQvNwkURJ6DYIoFf1DDcGeu2cDVTO3bJDP3GrbQwnhT\n9draC0OgVQKBgQDfauxfrMupBa9mQGnJzRZx5vB95dspIMO2feYXnKdhuCBbuSM+\nVFUZ9/BHL3+SBv+buW9kQFpFEdeNRIiZZ5/aPoGh3w+Lc40wGnHCjJJu1bnE3k3g\nFieWgEuyqYUaYCOZFzQFFE86kv8SZ0SjbVmQ3VGmp3Y/o85PS/qQLxJdWQKBgE+o\n1/b8dyqQFWc5gmeoH9M61acnUH9tnZEpOzF/gZ0Ih72XMwZG3bXzsq9dyOfMz/DY\n/OjSYMAEx50qdqxMT4d212h0Sl/Y6PCvWripg0OvIYlv0AvPCYWOUyZnG0D0hTZ/\n/ZxkUaM35q5yVATXSsINmpI4IHcKr3EW4ePeS4phAoGAYl9S6tm5r1La5HgTNB7m\nQHU8LPgM0C1RJ/EckCiowFWbLM8i+G52TOPdLTvQGmxIo8pcZpT9yfbF5X2Zz/6j\nTfhO1mVZYd/FQicTDuCgh047I/Rw3FUJpRO+eyXI7iRUDQbYk0ghUygVit6PpETq\nw2u7SgtowCWRRGWab2SB6ZM=\n-----END PRIVATE KEY-----\n",
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
