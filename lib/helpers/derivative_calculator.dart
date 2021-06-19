import 'package:math_expressions/math_expressions.dart';

class DerivativeCalculator {
  String? polynomial;
  DerivativeCalculator({required this.polynomial});

  final Parser p = Parser();

  String calculateDerivative() {
    try {
      // Parse the polynomial
      Expression exp = p.parse(polynomial!);
      // Differentiate
      Expression expDerived = exp.derive('x');

      return expDerived.simplify().toString();
    } on FormatException catch (exc) {
      return 'Error:${exc.message}';
    }
  }
}
