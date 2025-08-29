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

}

abstract class _Paths {
  _Paths._();
  static const welcome = '/welcome';
  static const register = '/register';
  static const login = '/login';
  static const authOption = '/login_or_register';
  static const home = '/home';
  static const chat = '/chat';
  static const recommendation = '/recommendation';
  static const navigation = '/navigation';

}
