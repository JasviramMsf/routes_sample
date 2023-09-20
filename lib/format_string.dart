import 'package:routes/constant.dart';

String formatMathExpression(String input) {
  String formattedExpression = input.replaceAllMapped(
    RegExp(SPACE_AROUND_OPERATORS),
    (match) => ' ${match.group(0)} ',
  );
  formattedExpression = formattedExpression.replaceAllMapped(
    RegExp(SPACE_AROUND_PARANTHESES),
    (match) => ' ${match.group(0)} ',
  );
  formattedExpression =
      formattedExpression.replaceAll(RegExp(REMOVE_SPACE), ' ').trim();

  return formattedExpression;
}
