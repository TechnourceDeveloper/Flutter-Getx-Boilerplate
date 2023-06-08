part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const splash = _Paths.splash;
  static const home = _Paths.home;
  static const onboard = _Paths.onboard;
  static const welcomeScreen = _Paths.welcomeScreen;
  static const loginScreen = _Paths.loginScreen;
  static const forgotPasswordScreen = _Paths.forgotPasswordScreen;
  static const resetPasswordScreen = _Paths.resetPasswordScreen;
  static const editProfileScreen = _Paths.editProfileScreen;
  static const signupScreen = _Paths.signupScreen;
  static const termsPrivacyScreen = _Paths.termsPrivacyScreen;
  static const otpScreen = _Paths.otpScreen;
  static const moreScreen = _Paths.moreScreen;
  static const dashboardScreen = _Paths.dashboardScreen;
  static const selectLanguage = _Paths.selectLanguage;
  static const changeLanguage = _Paths.changeLanguage;
  static const aboutUs = _Paths.aboutUs;
}

abstract class _Paths {
  _Paths._();

  static const splash = '/splash';
  static const home = '/home';
  static const onboard = '/onboard';
  static const welcomeScreen = '/welcomescreen';
  static const loginScreen = "/login_screen";
  static const forgotPasswordScreen = "/forgot_password";
  static const resetPasswordScreen = "/reset_password";
  static const signupScreen = "/signup_screen";
  static const termsPrivacyScreen = "/terms_privacy_screen";
  static const otpScreen = "/otp_screen";
  static const editProfileScreen = "/edit_profile_screen";
  static const moreScreen = "/more_screen";
  static const dashboardScreen = "/dashboard_screen";
  static const selectLanguage = "/selectLanguage";
  static const changeLanguage = "/changeLanguage";
  static const aboutUs = "/aboutUs";
}
