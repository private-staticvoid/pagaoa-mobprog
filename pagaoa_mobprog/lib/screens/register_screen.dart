import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';
import '../widgets/custom_font.dart';
import '../widgets/custom_inkwell_button.dart';
import '../widgets/custom_textformfield.dart';
import '../widgets/custom_dialogs.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController mobilenumController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();

  Future<void> register() async {
    if (!_formKey.currentState!.validate()) return;

    if (passwordController.text != confirmpasswordController.text) {
      CustomDialogs.showErrorDialog(context, 'Passwords do not match');
      return;
    }

    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('firstName', firstnameController.text);
    await prefs.setString('lastName', lastnameController.text);
    await prefs.setString('username', usernameController.text);
    await prefs.setString('password', passwordController.text);

    CustomDialogs.showSuccessDialog(
      context,
      'Registration successful',
      onPressed: () {
        Navigator.popAndPushNamed(context, '/login');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: ScreenUtil().setWidth(25),
            vertical: ScreenUtil().setHeight(20),
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: 40),
                    CustomFont(
                      text: "Register Here",
                      fontSize: ScreenUtil().setSp(36),
                      fontWeight: FontWeight.bold,
                      color: FB_DARK_PRIMARY,
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        size: 28.sp,
                        color: FB_DARK_PRIMARY,
                      ),
                      onPressed: () {
                        Navigator.pop(context, '/login');
                      },
                    ),
                  ],
                ),

                SizedBox(height: ScreenUtil().setHeight(25)),

                CustomTextFormField(
                  controller: firstnameController,
                  hintText: 'First name',
                  validator: (v) => v!.isEmpty ? 'First name required' : null,
                  fontSize: ScreenUtil().setSp(15),
                  hintTextSize: ScreenUtil().setSp(15),
                ),

                SizedBox(height: ScreenUtil().setHeight(10)),

                CustomTextFormField(
                  controller: lastnameController,
                  hintText: 'Last name',
                  validator: (v) => v!.isEmpty ? 'Last name required' : null,
                  fontSize: ScreenUtil().setSp(15),
                  hintTextSize: ScreenUtil().setSp(15),
                ),

                SizedBox(height: ScreenUtil().setHeight(10)),

                CustomTextFormField(
                  controller: usernameController,
                  hintText: 'Username',
                  validator: (v) => v!.isEmpty ? 'Username required' : null,
                  fontSize: ScreenUtil().setSp(15),
                  hintTextSize: ScreenUtil().setSp(15),
                ),

                SizedBox(height: ScreenUtil().setHeight(10)),

                CustomTextFormField(
                  controller: passwordController,
                  isObscure: true,
                  hintText: 'Password',
                  validator: (v) =>
                      v!.length < 8 ? 'Minimum 8 characters' : null,
                  fontSize: ScreenUtil().setSp(15),
                  hintTextSize: ScreenUtil().setSp(15),
                ),

                SizedBox(height: ScreenUtil().setHeight(10)),

                CustomTextFormField(
                  controller: confirmpasswordController,
                  isObscure: true,
                  hintText: 'Confirm Password',
                  validator: (v) => v!.isEmpty ? 'Confirm password' : null,
                  fontSize: ScreenUtil().setSp(15),
                  hintTextSize: ScreenUtil().setSp(15),
                ),

                SizedBox(height: ScreenUtil().setHeight(25)),

                CustomInkwellButton(
                  onTap: register,
                  height: ScreenUtil().setHeight(45),
                  width: double.infinity,
                  buttonName: "Submit",
                  fontSize: ScreenUtil().setSp(15),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
