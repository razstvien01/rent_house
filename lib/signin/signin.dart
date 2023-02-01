import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:rent_house/constant.dart';
import 'package:rent_house/forgot/forgot.dart';
import 'package:rent_house/signin/components/clear_full_button.dart';
import 'package:rent_house/ud_widgets/default_textfield.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isObscure = true;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Center(
                  child: Text(
                    'Rent Boarding House',
                    style: kHeadTextStyle,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DefaultTextField(
                        validator: emailValidator,
                        controller: _emailController,
                        hintText: 'Email Address',
                        icon: Icons.email,
                        keyboardType: TextInputType.emailAddress,
                        obscureText: false,
                      ),
                      SizedBox(
                        height: kFixPadding,
                      ),
                      DefaultTextField(
                        validator: passwordValidator,
                        controller: _passwordController,
                        hintText: 'Password',
                        icon: Icons.lock,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: _isObscure,
                        isObscure: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                      ),
                      SizedBox(
                        height: kFixPadding,
                      ),
                      ClearFullButton(
                        whiteText: 'I forgot my ',
                        colorText: 'Password',
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return Forgot();
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}