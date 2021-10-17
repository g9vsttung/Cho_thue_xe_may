//Change every restart the server
// ignore_for_file: constant_identifier_names, non_constant_identifier_names

const URL_SERVER = "http://52.74.12.123:80/";
// ignore: prefer_const_declarations
final _VERSION = "v1";

// ignore: prefer_const_declarations
final _URL_API = URL_SERVER + "api/" + _VERSION;

class AreaApiPath {
  // get all areas
  static String GET_ALL = _URL_API + "/areas";
  // get a area by id
  static String GET_BY_ID = "";
}

class BikeApiPath {
  // get all bikes
  static String GET_ALL = _URL_API + "/bikes";
  // get a bike by id
  static String GET_BY_ID = "";
}

class CustomerApiPath {
  // get all customers
  static String GET_ALL = "";
  // get a customer by phone
  static String GET_BY_PHONE = _URL_API + "/customers/phone/";
  //login
  static String LOGIN = _URL_API + "/customers/login";
}

class OwnerApiPath {
  static String GET_ALL = _URL_API + "/owners";
  //Get owner by id
  static String GET_BY_ID = _URL_API + "/owners/";
}

class AdminApiPath {
  static String GET_ALL = "";
}

class BookingApiPath {
  static String BOOKING_BIKE = _URL_API + '/bookings';
}
