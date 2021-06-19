import 'package:flutter/material.dart';
import 'package:polynomial/helpers/helpers.dart';
import 'package:polynomial/models/models.dart';
import 'package:polynomial/utilities/utilities.dart';
import 'package:polynomial/widgets/widgets.dart';

class SignInForm extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  SignInForm({Key? key, required this.scaffoldKey}) : super(key: key);

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _signInFormKey = GlobalKey<FormState>();

  String? identificationValue, passwordValue, polynomialValue;
  final List<String> errors = [];

  DerivativeCalculator? calculator;
  LoginModel? loginModel;

  final _focusPassword = FocusNode();
  final _focusPolynomial = FocusNode();

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error!);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  TextFormField buildIdentificationField() {
    return TextFormField(
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => identificationValue = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: Constants.kIdNumberNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: Constants.kIdNumberNullError);
          return '';
        }
        return null;
      },
      onFieldSubmitted: (value) {
        FocusScope.of(context).requestFocus(_focusPassword);
      },
      decoration: InputDecoration(
        labelText: 'Identification Number',
        hintText: 'Enter your identification number',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: GlobalIcon(svgIcon: "assets/icons/userIcon.svg"),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.text,
      focusNode: _focusPassword,
      onFieldSubmitted: (value) {
        FocusScope.of(context).requestFocus(_focusPolynomial);
      },
      onSaved: (newValue) => passwordValue = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: Constants.kPassNullError);
        } else if (value.length < 6) {
          removeError(error: Constants.kShortPassError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: Constants.kPassNullError);
          return '';
        } else if (value.length < 5) {
          addError(error: Constants.kShortPassError);
          return '';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Enter your password',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: GlobalIcon(svgIcon: "assets/icons/lock.svg"),
      ),
    );
  }

  TextFormField buildPolynomialField() {
    return TextFormField(
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.text,
      focusNode: _focusPolynomial,
      onFieldSubmitted: (value) {
        KeyboardUtil.hideKeyboard(context);
        loginButtonPressed();
      },
      onSaved: (newValue) => polynomialValue = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: Constants.kPolyNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: Constants.kPolyNullError);
          return '';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'Polynomial',
        hintText: 'Enter your polynomial',
        helperText: 'Please use x\nPlease use * to signify the power of x',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: GlobalIcon(svgIcon: "assets/icons/lock.svg"),
      ),
    );
  }

  Future loginHandler(LoginModel model) {
    calculator = DerivativeCalculator(polynomial: model.polynomialValue);
    return Future.value(calculator!.calculateDerivative());
  }

  loginButtonPressed() {
    final FormState _formState = _signInFormKey.currentState!;
    if (_formState.validate()) {
      _formState.save();

      loginModel = LoginModel(
        identificationValue: identificationValue,
        passwordValue: passwordValue,
        polynomialValue: polynomialValue,
      );

      loginHandler(loginModel!).then((value) {
        String? msg;
        if (value.contains('Error')) {
          msg = value.split('Error:')[1];
        } else {
          msg = 'The derivate of the polynomial is: $value';
        }
        Future.delayed(Duration(milliseconds: 100), () {
          dialogInfo(
            widget.scaffoldKey.currentContext!,
            msg!,
          );
        });
      }).catchError((error) {
        Future.delayed(Duration(milliseconds: 100), () {
          dialogInfo(
            widget.scaffoldKey.currentContext!,
            '${error.toString()}',
          );
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _signInFormKey,
      child: Column(
        children: [
          buildIdentificationField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPolynomialField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          GlobalActionButton(
            action: 'Continue',
            onPressed: loginButtonPressed,
          ),
          SizedBox(height: DeviceConfig.screenHeight! * 0.01),
        ],
      ),
    );
  }
}
