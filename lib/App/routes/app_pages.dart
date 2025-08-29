import 'package:get/get.dart';
import '../features/welcome/views/welcoming_page.dart';
import 'package:sayurinaja/App/features/welcome/bindings/welcome_binding.dart';
import '../features/auth/views/register/register_page.dart';
import '../features/auth/bindings/register/register_binding.dart';
import 'package:sayurinaja/App/features/option/views/login_or_register_page.dart';
import '../features/auth/views/login/login_page.dart';
import 'package:sayurinaja/App/features/auth/bindings/login/login_binding.dart';
import 'package:sayurinaja/App/features/home/views/home_page.dart';
import 'package:sayurinaja/App/features/recommendation/views/recommendation_page.dart';
import 'package:sayurinaja/App/features/navigation/views/navigation_page.dart';
import 'package:sayurinaja/App/features/navigation/bindings/navigation_binding.dart';
import 'package:sayurinaja/App/features/home/bindings/home_binding.dart';
import 'package:sayurinaja/App/features/recommendation/bindings/recommendation_binding.dart';
import 'package:sayurinaja/App/features/chat/binding/chat_binding.dart';
import 'package:sayurinaja/App/features/chat/views/chat_page.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.WELCOME;

  static final routes = [

    /// NOTE: Navigation
    GetPage(
      name: _Paths.navigation,
      page: () => const NavigationPage(),
      binding: NavigationBinding(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: Duration(milliseconds: 350),
      children: [
        GetPage(
            name: _Paths.home,
            page: () => const HomePage(),
            bindings: [
              HomeBinding(),
              RecommendationBinding(),
            ],
            transition: Transition.fade,
            transitionDuration: Duration(milliseconds: 350)
        ),

        // ACTIVITY

        GetPage(
            name: _Paths.chat,
            page: () => const ChatPage(),
            binding: ChatBinding(),
            transition: Transition.fade,
            transitionDuration: Duration(milliseconds: 350)
        ),

        // SETTINGS
      ]
  ),

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
        name: _Paths.recommendation,
        page: () => const RecommendationPage(),
        binding: RecommendationBinding(),
        transition: Transition.rightToLeftWithFade,
        transitionDuration: Duration(milliseconds: 350)
    ),


  ];
}
