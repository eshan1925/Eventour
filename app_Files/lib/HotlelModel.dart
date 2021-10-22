// ignore_for_file: file_names

class HotelModel {
  // ignore: non_constant_identifier_names
  late String NameofOwner;
  late String designation;
  late String CompanyName;
  late String location;
  late String email;
  late var rates;

  // ignore: non_constant_identifier_names
  HotelModel(
      {required this.NameofOwner,
      required this.designation,
      required this.CompanyName,
      required this.location,
      required this.email,
      this.rates});

  factory HotelModel.fromJson(dynamic json) {
    return HotelModel(
        NameofOwner: "${json['contact_person']}",
        designation: "${json['designation']}",
        CompanyName: "${json['company_name']}",
        location: "${json['location']}",
        email: "${json['email']}",
        rates: "${json['rate']}");
  }

  Map toJson() => {
        "contact_person": NameofOwner,
        "designation": designation,
        "company_name": CompanyName,
        "location": location,
        "email": email,
        "rates": rates,
      };
}
