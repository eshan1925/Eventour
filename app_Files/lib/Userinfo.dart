// ignore_for_file: file_names, prefer_const_declarations, non_constant_identifier_names

class UserFields {
  static late final String id = 'id';
  static final String email_phone = 'email/phone';
  static final String Identifier = 'identifier';
  static final String VerificationTken = 'Verification Token';
  static final String Name = 'Name';
  static List<String> getFields() =>
      [id, email_phone, Identifier, VerificationTken, Name];
}

class Orders {
  static late final String id = 'id';
  static final String email_phone = 'email/phone';
  static final String Name = 'Name';
  static final String VerificationToken = 'Verification Token';
  static final String Selected_Event = 'SelectedEvent';
  static final String SelectedServices = 'SubServices';
  static final String Date = 'Date';
  static final String Time = 'Time';
  static final String ExtraService = 'ExtraServices';
  static final String Bill = 'Bill';
  static final String Hotel = 'Selected Hotel';
  static List<String> getOrders() => [
        id,
        email_phone,
        Name,
        VerificationToken,
        Selected_Event,
        SelectedServices,
        Date,
        Time,
        ExtraService,
        Bill,
        Hotel,
      ];
}
