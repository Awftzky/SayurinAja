part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const WELCOME = _Paths.welcome;
  static const REGISTER = _Paths.register;
  static const AUTHOPTION = _Paths.authOption;
  static const LOGIN = _Paths.login;
  static const HOME = _Paths.home;
  static const RECOMMENDATION = _Paths.recommendation;
  static const NAVIGATION = _Paths.navigation;
  static const CHAT = _Paths.chat;
  static const FIRSTLOADING = _Paths.firstloading;
  static const WELCOMINGPRESENT = _Paths.welcomingpresent;
  static const EMAILVERIFICATION = _Paths.emailverification;
  static const EMAILVERIFICATIONSUCCESS = _Paths.emailverificationsuccess;
  static const FORGOTPASSWORDEMAIL = _Paths.forgotpasswordemail;
  static const FORGOTPASSWORDVERIFICATION = _Paths.forgotpasswordverification;
  static const FORGOTPASSWORDSETUP = _Paths.forgotpasswordsetup;


}

abstract class _Paths {
  _Paths._();
  static const firstloading = '/firstloading';
  static const welcome = '/welcome';
  static const register = '/register';
  static const login = '/login';
  static const authOption = '/login_or_register';
  static const home = '/home';
  static const chat = '/chat';
  static const recommendation = '/recommendation';
  static const navigation = '/navigation';
  static const welcomingpresent = '/welcomingpresent';
  static const emailverification = '/emailverification';
  static const emailverificationsuccess = '/emailverificationsuccess';
  static const forgotpasswordemail = '/forgotpasswordemail';
  static const forgotpasswordverification = '/forgotpasswordverification';
  static const forgotpasswordsetup = '/forgotpasswordsetup';




}
