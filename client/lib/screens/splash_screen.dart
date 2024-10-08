import 'package:client/constants/app_colors.dart';
import 'package:client/helpers/asset_images.dart';
import 'package:client/helpers/helper_function.dart';
import 'package:client/screens/home/home_screen.dart';
import 'package:client/screens/auth/signin_screen.dart';
import 'package:client/screens/settings/lorem_screen.dart';
import 'package:client/widgets/button_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    redirectScreen();
  }

  redirectScreen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool? ignoreScreen = prefs.getBool('ignoreScreen');
    final String? token = prefs.getString('token');

    await Future.delayed(const Duration(seconds: 1));

    if (ignoreScreen != null && ignoreScreen) {
      (token != null && (JwtDecoder.isExpired(token) == false))
          // ignore: use_build_context_synchronously
          ? nextScreen(context, HomeScreen(token: token))
          // ignore: use_build_context_synchronously
          : nextScreen(context, const SigninScreen());
    } else {
      await prefs.setBool('ignoreScreen', true);
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            Image.asset(AssetImages.logo),
            const SizedBox(height: 100),
            _isLoading
                ? const CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  )
                : Column(
                    children: [
                      const Text(
                        'Welcome to Chatify',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text.rich(
                          textAlign: TextAlign.center,
                          TextSpan(
                            text: "Read our ",
                            style: const TextStyle(
                              color: AppColors.blackColor,
                              fontSize: 14,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: "Privacy Policy",
                                style: const TextStyle(
                                  color: AppColors.blueColor,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    nextScreen(
                                      context,
                                      const LoremScreen(
                                        title: 'Privacy Policy',
                                      ),
                                    );
                                  },
                              ),
                              const TextSpan(
                                text: '. Tap “Agree and Continue” to accept ',
                                style: TextStyle(
                                  color: AppColors.blackColor,
                                ),
                              ),
                              TextSpan(
                                text: "Terms of Services.",
                                style: const TextStyle(
                                  color: AppColors.blueColor,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    nextScreen(
                                      context,
                                      const LoremScreen(
                                        title: 'Terms & Conditions',
                                      ),
                                    );
                                  },
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 60),
                        child: ButtonWidget(
                          text: 'Agree and Continue',
                          func: () {
                            nextScreen(context, const SigninScreen());
                          },
                        ),
                      ),
                    ],
                  ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
