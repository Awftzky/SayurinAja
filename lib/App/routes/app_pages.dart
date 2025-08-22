import 'package:get/get.dart';
import '../features/welcome/views/welcoming_page.dart';
import 'package:sayurinaja/App/features/welcome/bindings/welcome_binding.dart';
import '../features/auth/views/register/register_page.dart';
import '../features/auth/bindings/register/register_binding.dart';
import 'package:sayurinaja/App/features/option/views/login_or_register_page.dart';
import '../features/auth/views/login/login_page.dart';
import 'package:sayurinaja/App/features/auth/bindings/login/login_binding.dart';
import 'package:sayurinaja/App/features/home/views/home_page.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.WELCOME;

  static final routes = [
    GetPage(
      name: _Paths.welcome,
      page: () => const WelcomingPage(),
      binding: WelcomingBinding(),
      transition: Transition.noTransition,
    ),

    GetPage(
      name: _Paths.register,
      page: () => const RegisterPage(),
      binding: RegisterBinding(),
      transition: Transition.fade,
      transitionDuration: Duration(milliseconds: 350)
    ),

    GetPage(
        name: _Paths.login,
        page: () => const LoginPage(),
        binding: LoginBinding(),
        transition: Transition.fade,
        transitionDuration: Duration(milliseconds: 350)
    ),

    GetPage(
        name: _Paths.authOption,
        page: () => const LoginOrRegisterPage(),
        // binding: ,
        transition: Transition.fade,
        transitionDuration: Duration(milliseconds: 350)
    ),

    GetPage(
        name: _Paths.home,
        page: () => const HomePage(),
        // binding: ,
        transition: Transition.fade,
        transitionDuration: Duration(milliseconds: 350)
    ),
  ];
}
