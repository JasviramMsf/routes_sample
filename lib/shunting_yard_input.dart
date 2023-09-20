import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:routes/constant.dart';
import 'package:routes/logic.dart';
import 'package:routes/format_string.dart';
import 'package:provider/provider.dart';
import 'package:routes/provider.dart';

final regex = RegExp(NUMERIC_VALIDATION);

class ShuntingYardAlgorithm extends StatelessWidget {
  const ShuntingYardAlgorithm({super.key});

  @override
  Widget build(BuildContext context) {
    final inputProvider = Provider.of<InputProvider>(context);

    void showError() {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(ERROR_MSG),
        ),
      );
    }

    void onInputChange(String val) {
      inputProvider.setOutputVisibility(false);
      inputProvider.setInputtxt(val);
    }

    void convertToPostfix() {
      try {
        String formattedExpression =
            formatMathExpression(inputProvider.inputTxt);
        String postfix = infixToPostfix(formattedExpression);
        double result = evaluatePostfix(postfix);
        inputProvider.setInputtxt(result.toString());
        inputProvider.setOutputVisibility(true);
      } catch (e) {
        showError();
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(TITLE),
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              height: 80,
              width: 200,
              child: TextField(
                  onChanged: onInputChange,
                  decoration: const InputDecoration(labelText: PLACEHOLDER_TXT),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                      RegExp(NUMERIC_VALIDATION),
                    ),
                  ]),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
              onPressed: () {
                convertToPostfix();
              },
              child: const Text(CONVERT_TO_POSTFIX),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Output: ",
                  style: TextStyle(fontSize: 18),
                ),
                inputProvider.showOutput
                    ? Text(
                        inputProvider.inputTxt,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      )
                    : const Text("--"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
