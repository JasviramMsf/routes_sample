import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:routes/bst/providers/bt_provider.dart';
import 'package:routes/constants.dart';
import 'package:provider/provider.dart';

class NumberForm extends StatelessWidget {
  NumberForm({super.key});
  final _numForm = GlobalKey<FormState>();
  final TextEditingController _numController = TextEditingController();

  String? validateNum(String? value) {
    if (value == null || value.isEmpty || value == ZERO_TXT) {
      return ERROR_MSG;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final numProvider = Provider.of<BtProvider>(context);

    void onPressedAdd() {
      if (_numForm.currentState!.validate()) {
        numProvider.insertNumber(_numController.text);
        _numController.clear();
      }
    }

    return Column(
      children: [
        const Align(
          alignment: Alignment.center,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
          ),
          child: SizedBox(
            width: 180,
            child: Form(
              key: _numForm,
              // autovalidateMode: AutovalidateMode.always,
              child: TextFormField(
                controller: _numController,
                maxLength: 4,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                style: const TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  hintText: PLACEHOLDER_TXT,
                  suffixIcon: IconButton(
                    onPressed: onPressedAdd,
                    icon: const Icon(Icons.done),
                  ),
                ),
                validator: validateNum,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
