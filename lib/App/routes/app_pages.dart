import 'package:get/get.dart';
import 'package:sayurinaja/App/features/auth/bindings/verification/email_verification_binding.dart';
import 'package:sayurinaja/App/features/auth/views/verification/email_verification_page.dart';
import 'package:sayurinaja/App/features/cart/bindings/cart_bindings.dart';
import 'package:sayurinaja/App/features/checkout/bindings/checkout_bindings.dart';
import 'package:sayurinaja/App/features/checkout/views/checkout_page.dart';
import 'package:sayurinaja/App/features/coming_soon/views/coming_soon_page.dart';
import 'package:sayurinaja/App/features/loading/binding/loading_binding.dart';
import 'package:sayurinaja/App/features/loading/views/loading_page.dart';
import 'package:sayurinaja/App/features/payment/bindings/payment_binding.dart';
import 'package:sayurinaja/App/features/payment/views/payment_method_page.dart';
import 'package:sayurinaja/App/features/product/binding/product_binding.dart';
import 'package:sayurinaja/App/features/store/binding/search_store_binding.dart';
import 'package:sayurinaja/App/features/store/view/allstore_page.dart';
import 'package:sayurinaja/App/features/store/view/best_store_page.dart';
import 'package:sayurinaja/App/features/store/view/closest_store_page.dart';
import 'package:sayurinaja/App/features/store/view/search_store_page.dart';
import 'package:sayurinaja/App/features/store_detail/bindings/search_store_details_binding.dart';
import 'package:sayurinaja/App/features/store_detail/bindings/store_details_binding.dart';
import 'package:sayurinaja/App/features/store_detail/views/search_store_details_page.dart';
import 'package:sayurinaja/App/features/store_detail/views/store_details_page.dart';
import 'package:sayurinaja/App/features/welcome/views/welcoming_present_page.dart';
import '../features/welcome/views/welcoming_page.dart';
import 'package:sayurinaja/App/features/welcome/bindings/welcome_binding.dart';
import '../features/auth/views/register/register_page.dart';
import '../features/auth/bindings/register/register_binding.dart';
import 'package:sayurinaja/App/features/option/views/login_or_register_page.dart';
import '../features/auth/views/login/login_page.dart';
import 'package:sayurinaja/App/features/auth/bindings/login/login_binding.dart';
import 'package:sayurinaja/App/features/home/views/home_page.dart';
import 'package:sayurinaja/App/features/navigation/views/navigation_page.dart';
import 'package:sayurinaja/App/features/navigation/bindings/navigation_binding.dart';
import 'package:sayurinaja/App/features/home/bindings/home_binding.dart';
import 'package:sayurinaja/App/features/chat/binding/chat_binding.dart';
import 'package:sayurinaja/App/features/chat/views/chat_page.dart';
import 'package:sayurinaja/App/features/auth/views/verification/email_verification_success_page.dart';
import 'package:sayurinaja/App/features/auth/views/forgot/forgot_password_email_page.dart';
import 'package:sayurinaja/App/features/auth/bindings/forgot/forgot_password_binding.dart';
import 'package:sayurinaja/App/features/auth/views/forgot/forgot_password_verification_page.dart';
import 'package:sayurinaja/App/features/auth/views/forgot/forgot_password_setup_page.dart';
import 'package:sayurinaja/App/features/store/binding/store_binding.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.FIRSTLOADING;

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
                StoreBinding(),
                CartBindings()

                /// ADD BINDING LAIN JIKA INGIN MENAMPILKAN PRODUCT
              ],
              transition: Transition.fade,
              transitionDuration: Duration(milliseconds: 350)),

          // ACTIVITY

          GetPage(
              name: _Paths.chat,
              page: () => const ChatPage(),
              binding: ChatBinding(),
              transition: Transition.fade,
              transitionDuration: Duration(milliseconds: 350)),

          // SETTINGS
        ]),

    /// WELCOMING PAGESS

    GetPage(
        name: _Paths.welcome,
        page: () => const WelcomingPage(),
        binding: WelcomingBinding(),
        transition: Transition.fade,
        transitionDuration: Duration(milliseconds: 1500)),

    GetPage(
        name: _Paths.welcomingpresent,
        page: () => const WelcomingPresentPage(),
        binding: WelcomingBinding(),
        transition: Transition.fade,
        transitionDuration: Duration(milliseconds: 300)),

    GetPage(
        name: _Paths.firstloading,
        page: () => const LoadingPage(),
        binding: LoadingBinding(),
        transition: Transition.fade,
        transitionDuration: Duration(milliseconds: 300)),

    /// AUTHENTICATOR PAGES

    GetPage(
        name: _Paths.register,
        page: () => const RegisterPage(),
        binding: RegisterBinding(),
        transition: Transition.fade,
        transitionDuration: Duration(milliseconds: 350)),

    GetPage(
        name: _Paths.emailverification,
        page: () => const EmailVerificationPage(),
        binding: EmailVerificationBinding(),
        transition: Transition.fade,
        transitionDuration: Duration(milliseconds: 300)),

    GetPage(
        name: _Paths.emailverificationsuccess,
        page: () => const EmailVerificationSuccessPage(),
        // binding: EmailVerificationBinding(),
        transition: Transition.fade,
        transitionDuration: Duration(milliseconds: 300)),

    GetPage(
        name: _Paths.login,
        page: () => const LoginPage(),
        binding: LoginBinding(),
        transition: Transition.fade,
        transitionDuration: Duration(milliseconds: 350)),

    GetPage(
        name: _Paths.forgotpasswordemail,
        page: () => const ForgotPasswordEmailPage(),
        binding: ForgotPasswordBinding(),
        transition: Transition.fade,
        transitionDuration: Duration(milliseconds: 350)),

    GetPage(
        name: _Paths.forgotpasswordverification,
        page: () => const ForgotPasswordVerificationPage(),
        binding: ForgotPasswordBinding(),
        transition: Transition.fade,
        transitionDuration: Duration(milliseconds: 350)),

    GetPage(
        name: _Paths.forgotpasswordsetup,
        page: () => const ForgotPasswordSetupPage(),
        binding: ForgotPasswordBinding(),
        transition: Transition.fade,
        transitionDuration: Duration(milliseconds: 350)),

    GetPage(
        name: _Paths.authOption,
        page: () => const LoginOrRegisterPage(),
        // binding: ,
        transition: Transition.fade,
        transitionDuration: Duration(milliseconds: 350)),

    /// HOME FEATURE PAGES

    GetPage(
        name: _Paths.allstore,
        page: () => const AllStorePage(),
        binding: StoreBinding(),
        transition: Transition.fade,
        transitionDuration: Duration(milliseconds: 300)),

    /// STORE FEATURE
    GetPage(
        name: _Paths.searchstore,
        page: () => const SearchStorePage(),
        binding: SearchStoreBinding(),
        transition: Transition.fade,
        transitionDuration: Duration(milliseconds: 300)),

    GetPage(
        name: _Paths.beststore,
        page: () => const BestStorePage(),
        binding: StoreBinding(),
        transition: Transition.fade,
        transitionDuration: Duration(milliseconds: 300)),

    GetPage(
        name: _Paths.closeststore,
        page: () => const ClosestStorePage(),
        binding: StoreBinding(),
        transition: Transition.fade,
        transitionDuration: Duration(milliseconds: 300)),

    /// STORE DETAILS
    GetPage(
        name: _Paths.storedetails,
        page: () => const StoreDetailsPage(),
        bindings: [StoreDetailsBinding(), ProductBinding(), CartBindings()],
        transition: Transition.fade,
        transitionDuration: Duration(milliseconds: 300)),

    GetPage(
        name: _Paths.searchstoredetails,
        page: () => const SearchStoreDetailsPage(),
        bindings: [
          SearchStoreDetailsBinding(), // UTAMA
          ProductBinding(),
          StoreDetailsBinding()
        ],
        transition: Transition.fade,
        transitionDuration: Duration(milliseconds: 300)),

    /// CHECKOUT  FEATURE
    GetPage(
        name: _Paths.checkout,
        page: () => const CheckoutPage(),
        binding: CheckoutBindings(),
        transition: Transition.fade,
        transitionDuration: Duration(milliseconds: 300)),

    /// PAYMENT FEATURE
    GetPage(
        name: _Paths.payment,
        page: () => const PaymentMethodPage(),
        binding: PaymentBinding(),
        transition: Transition.fade,
        transitionDuration: Duration(milliseconds: 300)),

    /// COMING SOON FEATURE
    GetPage(
        name: _Paths.comingsoon,
        page: () => const ComingSoonPage(),
        binding: StoreBinding(),
        transition: Transition.fade,
        transitionDuration: Duration(milliseconds: 300)),
  ];
}
