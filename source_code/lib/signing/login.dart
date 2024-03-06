import 'package:lenser/widgets/custom_text_form_field.dart';
import 'package:lenser/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:lenser/core/app_export.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key})
      : super(
          key: key,
        );


  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: SizedBox(
            width: double.maxFinite,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      height: 206.v,
                      width: 266.h,
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgShape,
                            height: 183.v,
                            width: 206.h,
                            alignment: Alignment.topLeft,
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              "Welcome Back!",
                              style: theme.textTheme.titleMedium,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 32.v),
                  CustomImageView(
                    imagePath: ImageConstant.imgGroup5,
                    height: 170.v,
                    width: 171.h,
                  ),
                  SizedBox(height: 46.v),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.h),
                    child: CustomTextFormField(
                      controller: emailController,
                      hintText: "Enter your email",
                      textInputType: TextInputType.emailAddress,
                    ),
                  ),
                  SizedBox(height: 21.v),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.h),
                    child: CustomTextFormField(
                      controller: passwordController,
                      hintText: "Enter password",
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.visiblePassword,
                      obscureText: true,
                    ),
                  ),
                  SizedBox(height: 23.v),
                  Text(
                    "Forgot Password",
                    style: CustomTextStyles.bodyMediumCyan300,
                  ),
                  SizedBox(height: 20.v),
                  _buildFour(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


  Widget _buildFour(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: SizedBox(
        height: 321.v,
        width: 350.h,
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgShape,
              height: 270.v,
              width: 145.h,
              alignment: Alignment.bottomRight,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 36.h,
                  top: 84.v,
                ),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Don’t have an account ? ",
                        style: CustomTextStyles.bodyMediumffffffff,
                      ),
                      TextSpan(
                        text: "Sign up",
                        style: theme.textTheme.titleSmall,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            CustomElevatedButton(
              width: 325.h,
              text: "Sign in",
              alignment: Alignment.topLeft,
            ),
          ],
        ),
      ),
    );
  }
}
