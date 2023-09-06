import 'package:routes/provider_samples/text_visibility_provider.dart';
import 'package:routes/provider_samples/dynamic_txt_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderEx extends StatelessWidget {
  const ProviderEx({super.key});

  @override
  Widget build(BuildContext context) {
    final counterModal = Provider.of<VisiblityProvider>(context);
    Widget conditionedText() {
      if (counterModal.visibility) {
        return const Text("Hide");
      } else {
        return const Text("Show");
      }
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Text(context.watch<CounterEx>().header),
          Text(
            'Try adding dynamic ${context.watch<DynamicTextProvider>().dynamicLabel}',
            style: const TextStyle(fontSize: 20),
          ),
          TextButton(
            onPressed: () {
              context.read<DynamicTextProvider>().concatLabel("text ");
              // counterModal.increment();
            },
            child: const Text("Add"),
          ),
          const SizedBox(
            height: 50,
          ),
          if (context.watch<VisiblityProvider>().visibility)
            const Text(
              'Tap below to Show or hide this text',
              style: TextStyle(fontSize: 20),
            ),
          TextButton(
            onPressed: () {
              context.read<VisiblityProvider>().changeVisibility();
            },
            child: conditionedText(),
          ),
        ],
      ),
    );
  }
}
