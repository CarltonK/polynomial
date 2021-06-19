class LoginModel {
  String? identificationValue;
  String? passwordValue;
  String? polynomialValue;

  LoginModel({
    this.identificationValue,
    this.passwordValue,
    this.polynomialValue,
  });

  factory LoginModel.fromJson(Map<String, dynamic> data) {
    return LoginModel(
      identificationValue: data['identificationValue'] ?? '',
      passwordValue: data['passwordValue'] ?? '',
      polynomialValue: data['polynomialValue'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'identificationValue': identificationValue,
        'passwordValue': passwordValue,
        'polynomialValue': polynomialValue,
      };
}
