//Change every restart the server
// ignore_for_file: constant_identifier_names, non_constant_identifier_names

const URL_SERVER = "http://52.74.12.123:80/";
// ignore: prefer_const_declarations
final _VERSION = "v1.0";

class AreaApiPath {
  // get all areas
  static String GET_ALL = "";
  // get a area by id
  static String GET_BY_ID = "";
}

class BikeApiPath {
  // get all bikes
  static String GET_ALL = "api/" + _VERSION + "/bikes";
  // get a bike by id
  static String GET_BY_ID = "";
}

class CustomerApiPath {
  // get all customers
  static String GET_ALL = "";
  // get a customer by phone
  static String GET_BY_PHONE = "api/" + _VERSION + "/customers/phone/";
}

class OwnerApiPath {
  static String GET_ALL = "";
}

class AdminApiPath {
  static String GET_ALL = "";
}
