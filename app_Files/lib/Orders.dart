// ignore_for_file: unused_import, file_names

import 'sheets.dart';
import 'Userinfo.dart';
import 'LoginScreen.dart';
import 'select_service.dart';
import 'services.dart';
import 'DateTime.dart';
import 'hotels.dart';

void gettingOrders() {
  var uid = extraction["user_id"].toString();
  var email = extraction["identifier"].toString();
  var name = extraction["customFieldInputValues"]["Name"].toString();
  var vToken = extraction["verification_token"].toString();
  var selectedFunction = userSelectedService.toString();
  var selectedSubService = finalSubServices.toString();
  var date = finalSelectedDay.toString();
  var time = finalSelectedTime.toString();
  var extraServices = FinalSubServices.toString();
  var bill = selectedRates.toString();
  var hotel = selectedHotelName.toString();
  final o = {
    Orders.id: uid,
    Orders.email_phone: email,
    Orders.Name: name,
    Orders.VerificationToken: vToken,
    Orders.Selected_Event: selectedFunction,
    Orders.SelectedServices: selectedSubService,
    Orders.Date: date,
    Orders.Time: time,
    Orders.ExtraService: extraServices,
    Orders.Bill: bill,
    Orders.Hotel: hotel,
  };
  UserSheetsApi.insertOrders([o]);
}
