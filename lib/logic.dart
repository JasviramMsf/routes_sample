import 'dart:collection';
import 'dart:math';

String infixToPostfix(String infix) {
  const operators = "-+/*^";
  final stringBuffer = StringBuffer();
  final queue = Queue<int>();

  for (var token in infix.split(RegExp(r'\s+'))) {

    if (token.isNotEmpty) {
      final tokenIndex = token[0];
      final index = operators.indexOf(tokenIndex);
      if (index != -1) {
        if (queue.isEmpty) {
          queue.addLast(index);
        } else {
          while (queue.isNotEmpty) {
            final val2 = queue.last ~/ 2;
            final val1 = index ~/ 2;
            if (val2 > val1 || (val2 == val1 && tokenIndex != '^')) {
              stringBuffer.write(operators[queue.removeLast()]);
              stringBuffer.write(' ');
            } else {
              break;
            }
          }
          queue.addLast(index);
        }
      } else if (tokenIndex == '(') {
        queue.addLast(-2);
      } else if (tokenIndex == ')') {
        while (queue.last != -2) {
          stringBuffer.write(operators[queue.removeLast()]);
          stringBuffer.write(' ');
        }
        queue.removeLast();
      } else {
        stringBuffer.write(token);
        stringBuffer.write(' ');
      }
    }
  }

  while (queue.isNotEmpty) {
    stringBuffer.write(operators[queue.removeLast()]);
    stringBuffer.write(' ');
  }

  return stringBuffer.toString();
}

double evaluatePostfix(String postfix) {
  final tokens = postfix.trim().split(RegExp(r'\s+'));
  final stack = [];

  for (var token in tokens) {
    if (token.isEmpty) continue;
    if (isNumeric(token)) {
      stack.add(double.parse(token));
    } else {
      final b = stack.removeLast();
      final a = stack.removeLast();
      switch (token) {
        case '+':
          stack.add(a + b);
          break;
        case '-':
          stack.add(a - b);
          break;
        case '*':
          stack.add(a * b);
          break;
        case '/':
          stack.add(a / b);
          break;
        case '^':
          stack.add(pow(a, b));
          break;
        default:
          throw Exception("Invalid operator: $token");
      }
    }
  }
  if (stack.length != 1) {
    throw Exception("Invalid postfix expression");
  }
  return stack.single;
}

bool isNumeric(String str) {
  return double.tryParse(str) != null;
}
