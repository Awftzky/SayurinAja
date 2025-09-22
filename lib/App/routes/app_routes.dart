part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  // WELCOME FEATURE
  static const WELCOME = _Paths.welcome;
  static const WELCOMINGPRESENT = _Paths.welcomingpresent;
  static const FIRSTLOADING = _Paths.firstloading;

  // AUTH FEATURE
  static const REGISTER = _Paths.register;
  static const AUTHOPTION = _Paths.authOption;
  static const LOGIN = _Paths.login;
  static const EMAILVERIFICATION = _Paths.emailverification;
  static const EMAILVERIFICATIONSUCCESS = _Paths.emailverificationsuccess;
  static const FORGOTPASSWORDEMAIL = _Paths.forgotpasswordemail;
  static const FORGOTPASSWORDVERIFICATION = _Paths.forgotpasswordverification;
  static const FORGOTPASSWORDSETUP = _Paths.forgotpasswordsetup;

  // NAVIGATION FEATURE
  static const NAVIGATION = _Paths.navigation;
  static const HOME = _Paths.home;
  static const CHAT = _Paths.chat;

  // HOME FEATURE
  static const ALLSTORE = _Paths.allstore;

  // STORE FEATURE
  static const SEARCHSTORE = _Paths.searchstore;
  static const BESTSTORE = _Paths.beststore;
  static const CLOSESTSTORE = _Paths.closeststore;

  // CHECKOUT FEATURE
  static const CHECKOUT = _Paths.checkout;

  // PAYMENT FEATURE
  static const PAYMENT = _Paths.payment;

  // STORE DETAILS
  static const STOREDETAILS = _Paths.storedetails;
  static const SEARCHSTOREDETAILS = _Paths.searchstoredetails;

  // COMING SOON FEATURE
  static const COMINGSOON = _Paths.comingsoon;
}

abstract class _Paths {
  _Paths._();
  // WELCOME FEATURE
  static const firstloading = '/firstloading';
  static const welcome = '/welcome';
  static const welcomingpresent = '/welcomingpresent';

  // AUTH FEATURE
  static const register = '/register';
  static const login = '/login';
  static const authOption = '/login_or_register';
  static const emailverification = '/emailverification';
  static const emailverificationsuccess = '/emailverificationsuccess';
  static const forgotpasswordemail = '/forgotpasswordemail';
  static const forgotpasswordverification = '/forgotpasswordverification';
  static const forgotpasswordsetup = '/forgotpasswordsetup';

  // MAIN NAVIGATION FEATURE
  static const navigation = '/navigation';
  static const home = '/home';
  static const chat = '/chat';

  // HOME FEATURE
  static const allstore = '/allstore';

  // STORE FEATURE
  static const searchstore = '/searchstore';
  static const beststore = '/beststore';
  static const closeststore = '/closeststore';

  // CHECKOUT FEATURE
  static const checkout = '/checkout';

  // PAYMENT FEATURE
  static const payment = '/payment';

  // STORE DETAILS
  static const storedetails = '/storedetails';
  static const searchstoredetails = '/searchstoredetails';

  // COMING SOON FEATURE
  static const comingsoon = '/comingsoon';
}
