// ignore_for_file: constant_identifier_names

import 'package:flutter_setup/src/views/dashboard/component/change_language_screen/binding/change_language_screen.dart';
import 'package:flutter_setup/src/views/dashboard/component/change_language_screen/change_language_screen_view.dart';
import 'package:flutter_setup/src/views/dashboard/component/more_screen/about_us_screen/about_us_view.dart';
import 'package:flutter_setup/src/views/dashboard/component/more_screen/binding/more_screen.dart';
import 'package:flutter_setup/src/views/dashboard/component/more_screen/more_screen_view.dart';
import 'package:flutter_setup/src/views/authorization/select_language_screen/select_language_screen_view.dart';
import 'package:flutter_setup/src/views/edit_profile/binding/edit_profile.dart';
import 'package:flutter_setup/src/views/edit_profile/edit_profile_view.dart';
import 'package:flutter_setup/src/views/home_page/binding/home_page.dart';
import 'package:flutter_setup/src/views/home_page/home_page_view.dart';
import 'package:get/get.dart';

import '../views/dashboard/binding/dashboard.dart';
import '../views/dashboard/component/more_screen/about_us_screen/binding/about_us.dart';
import '../views/dashboard/component/terms_privacy/binding/terms_privacy.dart';
import '../views/dashboard/component/terms_privacy/terms_privacy_view.dart';
import '../views/dashboard/dashboard_view.dart';
import '../views/authorization/forgot_password/binding/forgot_password.dart';
import '../views/authorization/forgot_password/forgot_password_view.dart';
import '../views/authorization/login_screen/binding/login_screen.dart';
import '../views/authorization/login_screen/login_screen_view.dart';
import '../views/authorization/onboard/binding/onboard.dart';
import '../views/authorization/onboard/onboard_view.dart';
import '../views/authorization/otp_screen/binding/otp_screen.dart';
import '../views/authorization/otp_screen/otp_screen_view.dart';
import '../views/authorization/reset_password/binding/reset_password.dart';
import '../views/authorization/reset_password/reset_password_screen_view.dart';
import '../views/authorization/select_language_screen/binding/select_language_screen.dart';
import '../views/authorization/signup_screen/binding/signup_screen.dart';
import '../views/authorization/signup_screen/signup_screen_view.dart';
import '../views/authorization/splash_screen/binding/splash.dart';
import '../views/authorization/splash_screen/splash_view.dart';
import '../views/authorization/welcome_screen/binding/welcome_screen.dart';
import '../views/authorization/welcome_screen/welcome_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.splash;

  static final routes = [
    GetPage(
        name: Routes.splash,
        page: () => SplashView(),
        transition: Transition.downToUp,
        binding: SplashBinding()),
    GetPage(
        transition: Transition.downToUp,
        name: _Paths.selectLanguage,
        page: () => const SelectLanguageScreenView(),
        binding: SelectLanguageBinding()),
    GetPage(
        transition: Transition.downToUp,
        name: _Paths.onboard,
        page: () => const OnBoardView(),
        binding: OnBoardBinding()),
    GetPage(
        transition: Transition.downToUp,
        name: _Paths.welcomeScreen,
        page: () => const WelcomeScreenView(),
        binding: WelcomeScreenBinding()),
    GetPage(
        transition: Transition.downToUp,
        name: _Paths.loginScreen,
        page: () => const LoginScreenView(),
        binding: LoginScreenBinding()),
    GetPage(
        transition: Transition.downToUp,
        name: _Paths.forgotPasswordScreen,
        page: () => const ForgotPasswordView(),
        binding: ForgotPasswordScreenBinding()),
    GetPage(
        transition: Transition.downToUp,
        name: _Paths.otpScreen,
        page: () => OtpScreenView(),
        binding: OtpScreenBinding()),
    GetPage(
        transition: Transition.downToUp,
        name: _Paths.resetPasswordScreen,
        page: () => ResetPasswordView(),
        binding: ResetPasswordBinding()),
    GetPage(
        transition: Transition.downToUp,
        name: _Paths.signupScreen,
        page: () => const SignupScreenView(),
        binding: SignupScreenBinding()),
    GetPage(
        transition: Transition.downToUp,
        name: _Paths.termsPrivacyScreen,
        page: () => const TermsPrivacyView(),
        binding: TermsPrivacyBinding()),
    GetPage(
        transition: Transition.downToUp,
        name: _Paths.dashboardScreen,
        page: () => DashboardScreen(),
        binding: DashboradBinding()),
    GetPage(
        transition: Transition.downToUp,
        name: _Paths.editProfileScreen,
        page: () => EditProfile(),
        binding: EditProfileBinding()),
    GetPage(
        transition: Transition.downToUp,
        name: _Paths.changeLanguage,
        page: () => const ChangeLanguageScreenView(),
        binding: ChangeLanguageBinding()),
    GetPage(
        transition: Transition.downToUp,
        name: _Paths.moreScreen,
        page: () => const MoreScreenView(),
        binding: MoreScreenBinding()),
    GetPage(
        transition: Transition.downToUp,
        name: _Paths.aboutUs,
        page: () => const AboutUsScreen(),
        binding: AboutUsBinding()),
    GetPage(
        transition: Transition.downToUp,
        name: _Paths.home,
        page: () => HomePageView(),
        binding: HomePageBinding()),

  ];
}
