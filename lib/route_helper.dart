import 'package:auria_ai/screens/ChangePassword/ChangePasswordScreen.dart';
import 'package:auria_ai/screens/ChangePassword/ChangePasswordVM.dart';
import 'package:auria_ai/screens/Chat/ChatScreen.dart';
import 'package:auria_ai/screens/Chat/ChatVM.dart';
import 'package:auria_ai/screens/EditProfile/EditProfileScreen.dart';
import 'package:auria_ai/screens/EditProfile/EditProfileVM.dart';
import 'package:auria_ai/screens/Faq/FaqScreen.dart';
import 'package:auria_ai/screens/Faq/FaqVM.dart';
import 'package:auria_ai/screens/ForgotPassword/ForgoPasswordScreen.dart';
import 'package:auria_ai/screens/ForgotPassword/ForgotPasswordVM.dart';
import 'package:auria_ai/screens/Home/HomeScreen.dart';
import 'package:auria_ai/screens/Home/HomeVM.dart';
import 'package:auria_ai/screens/Login/LoginScreen.dart';
import 'package:auria_ai/screens/Login/LoginVM.dart';
import 'package:auria_ai/screens/Onboarding/OnBoardingScreen.dart';
import 'package:auria_ai/screens/SaveChat/SaveChatScreen.dart';
import 'package:auria_ai/screens/SaveChat/SaveChatVM.dart';
import 'package:auria_ai/screens/Settings/SettingsScreen.dart';
import 'package:auria_ai/screens/Settings/SettingsVM.dart';
import 'package:auria_ai/screens/SignUp/SignUpScreen.dart';
import 'package:auria_ai/screens/SignUp/SignUpVM.dart';
import 'package:auria_ai/screens/Subscription/CardInfo/CardInfoScreen.dart';
import 'package:auria_ai/screens/Subscription/CardInfo/CardInfoVM.dart';
import 'package:auria_ai/screens/Subscription/SubscriptionScreen.dart';
import 'package:auria_ai/screens/Subscription/SubscriptionVM.dart';
import 'package:auria_ai/screens/Welcome/WelcomeScreen.dart';
import 'package:auria_ai/screens/Welcome/WelcomeScreenVM.dart';
import 'package:auria_ai/utils/transitions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RouteHelper with Transitions {
  ///common view models
  final _signUpViewModel = SignUpVM();
  final _loginViewModel = LoginVM();
  final _homeViewModel = HomeVM();
  final _changePasswordViewModel = ChangePasswordVM();
  final _faqsViewModel = FaqVM();
  final _forgotPasswordViewModel = ForgotPasswordVM();
  final _savedViewModel = SaveChatVM();
  final _settingViewModel = SettingsVM();
  final _subscriptionViewModel = SubscriptionVM();
  final _cardInfoViewModel = CardInfoVM();
  final _welcomeViewModel = WelcomeScreenVM();

  Map<String, WidgetBuilder> createRoutes() {

    return {
      OnBoardingScreen.route: (_) => const OnBoardingScreen(),

      LoginScreen.route: (_) => ChangeNotifierProvider(
            create: (_) => _loginViewModel,
            child: const LoginScreen(),
          ),

      SignUpScreen.route: (_) => ChangeNotifierProvider(
            create: (_) => _signUpViewModel,
            child: const SignUpScreen(),
          ),

      HomeScreen.route: (_) => ChangeNotifierProvider(
            create: (_) => _homeViewModel,
            child: const HomeScreen(),
          ),

     ChangePasswordScreen.route: (_) => ChangeNotifierProvider(
            create: (_) => _changePasswordViewModel,
            child: const ChangePasswordScreen(),
          ),

    /* ChatScreen.route: (_) => ChangeNotifierProvider(
            create: (_) => _chatViewModel,
            child: const ChatScreen(),
          ),*/

     /*EditProfileScreen.route: (_) => ChangeNotifierProvider(
            create: (_) => _editProfileViewModel,
            child: const EditProfileScreen(),
          ),*/

     FaqScreen.route: (_) => ChangeNotifierProvider(
            create: (_) => _faqsViewModel,
            child: const FaqScreen(),
          ),

     SaveChatScreen.route: (_) => ChangeNotifierProvider(
            create: (_) => _savedViewModel,
            child: const SaveChatScreen(),
          ),

     SettingsScreen.route: (_) => ChangeNotifierProvider(
            create: (_) => _settingViewModel,
            child: const SettingsScreen(),
          ),

     SubscriptionScreen.route: (_) => ChangeNotifierProvider(
            create: (_) => _subscriptionViewModel,
            child: const SubscriptionScreen(),
          ),

     CardInfoScreen.route: (_) => ChangeNotifierProvider(
            create: (_) => _cardInfoViewModel,
            child: const CardInfoScreen(),
          ),

     WelcomeScreen.route: (_) => ChangeNotifierProvider(
            create: (_) => _welcomeViewModel,
            child: const WelcomeScreen(),
          ),

      ForgotPasswordScreen.route: (_) => ChangeNotifierProvider(
            create: (_) => _forgotPasswordViewModel,
            child: const ForgotPasswordScreen(),
          ),

    };
  }

  ///the routes that require custom transitions are defined below instead of [createRoutes] method


}
