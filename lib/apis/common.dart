//Change every restart the server
// ignore_for_file: constant_identifier_names, non_constant_identifier_names

const URL_SERVER = "http://18.138.110.46/";
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
  static String FIND_BIKE = URL_SERVER + "api/" + 'v2' + '/owners/find';
}

class CustomerApiPath {
  // get all customers
  static String GET_ALL = "";
  // get a customer by phone
  static String GET_BY_PHONE = _URL_API + "/customers/phone/";
  //login
  static String LOGIN = _URL_API + "/customers/login";
  //Get profile
  static String VIEW_PROFILE = _URL_API + '/customers/';
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
  static String GET_ALL_TRANSACTIONS = _URL_API + '/bookings';
}

class MotorTypeApiPath {
  static String GET_ALL_BY_AREA = _URL_API + '/pricelists/listByArea?areaId=';
}

class PriceListApiPath {
  static String GET_ALL = _URL_API + '/';
  static String GET_BY_AREA_ID_AND_TYPE_ID = _URL_API + '/pricelists/';
}

class VoucherApiPath {
  static String GET_ALL =
      'http://18.138.110.46/api/v2/voucherItems/customerId/';
  static String GET_VOUCHERS_TO_EXCHANGE =
      _URL_API + '/vouchers/GetByAreaId?areaId=';
  //exchange points to get voucher item
  static String EXCHANGE_POINTS_TO_GET_VOUCHER = _URL_API + '/voucherItems';
}

class CategoryApiPath {
  static String GET_ALL = _URL_API + '/categories';
}
