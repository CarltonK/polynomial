import 'package:flutter/material.dart';
import 'package:polynomial/screens/screens.dart';
import 'package:polynomial/utilities/utilities.dart';

class SignInBody extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  SignInBody({Key? key, required this.scaffoldKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => KeyboardUtil.hideKeyboard(context),
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: DeviceConfig.screenHeight! * 0.04),
                  Text(
                    'Welcome',
                    style: Constants.kHeadlineStyle,
                  ),
                  SizedBox(height: DeviceConfig.screenHeight! * 0.005),
                  Text(
                    'Sign in with your Identification number and Password',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: DeviceConfig.screenHeight! * 0.08),
                  SignInForm(scaffoldKey: scaffoldKey),
                  SizedBox(height: DeviceConfig.screenHeight! * 0.08),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
