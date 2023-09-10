import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:tonyyaooo/generated/assets.dart';
import 'package:tonyyaooo/reusable_widgets/buttons/custom_elevated_button.dart';
import 'package:tonyyaooo/utils/alignment/widget_alignment.dart';
import 'package:tonyyaooo/utils/gaps/gaps.dart';
import 'package:tonyyaooo/utils/text_styles/text_styles.dart';

import '../../../../reusable_widgets/text_field/auth_form_field.dart';
import '../../../../utils/colors/app_colors.dart';
import '../../../home/stocks/stocks_landing/view/stocks_landing_screen.dart';
import '../controller/login_controller.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final logInController = Get.find<LogInController>();
    return Scaffold(
      backgroundColor: CColors.whiteColor,
      resizeToAvoidBottomInset: false,
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AnimationLimiter(
                    child: Column(
                      children: AnimationConfiguration.toStaggeredList(
                        duration: const Duration(milliseconds: 375),
                        childAnimationBuilder: (widget) => SlideAnimation(
                          horizontalOffset: 50.0,
                          child: FadeInAnimation(
                            child: widget,
                          ),
                        ),
                        children: [
                          context.isPortrait ? 80.ph : 50.ph,
                          Image.asset(
                            Assets.appLogoTonyyaoooAppLogo,
                            width: 85,
                            height: 110,
                          ),
                          15.ph,
                          const Text(
                            "Login",
                            style: CustomTextStyles.black525,
                          ),
                          10.ph,
                          Text(
                            "Professional Stock Analysis & Prediction",
                            style: CustomTextStyles.blackOpac412,
                          ),
                          40.ph,
                          AuthFormField(
                            validatorFunction: (val) {
                              return null;
                            },
                            width: context.width * 1,
                            textEditingController:
                                logInController.emailController,
                            isEmailField: true,
                          ),
                          10.ph,
                          Obx(() {
                            return AuthFormField(
                              validatorFunction: (val) {
                                return null;
                              },
                              width: context.width * 1,
                              textEditingController:
                                  logInController.passwordController,
                              isPasswordField: true,
                              obscureText:
                                  logInController.isPasswordNotVisible.value,
                              obscureTextFunction: () {
                                logInController.togglePasswordVisibility();
                              },
                            );
                          }),
                          10.ph,
                          InkWell(
                            onTap: () {},
                            child: const Text(
                              "Forgot Password?",
                              style: CustomTextStyles.black510,
                            ),
                          ).alignWidget(alignment: Alignment.centerRight),
                          30.ph,
                          CustomElevatedButton(
                            onPressedFunction: () {
                              Get.off(
                                () => const StocksLandingScreen(),
                                transition: Transition.fadeIn,
                              );
                            },
                            buttonText: "Login",
                            width: context.width * 1,
                            isBlue: true,
                          ),
                          20.ph,
                          const Text(
                            "Or Login Using",
                            style: CustomTextStyles.black613,
                          ),
                          20.ph,
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: CustomElevatedButton(
                                  onPressedFunction: () {},
                                  width: context.width * 1,
                                  isSocialMediaButton: true,
                                  isGoogleLogIn: true,
                                ),
                              ),
                              20.pw,
                              Expanded(
                                child: CustomElevatedButton(
                                  onPressedFunction: () {},
                                  width: context.width * 1,
                                  isSocialMediaButton: true,
                                  isAppleLogIn: true,
                                ),
                              ),
                            ],
                          ),
                          20.ph,
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    "Don’t have an account?",
                    style: CustomTextStyles.black513,
                  ),
                  10.ph,
                  InkWell(
                    onTap: () {},
                    child: const Text(
                      "Signup here",
                      style: CustomTextStyles.blue713,
                    ),
                  ),
                  10.ph,
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
