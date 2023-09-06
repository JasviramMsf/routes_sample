import 'package:flutter/material.dart';
import 'package:routes/provider_samples/dynamic_txt_provider.dart';
import 'package:routes/provider_samples/text_visibility_provider.dart';
import 'package:provider/provider.dart';
import 'package:routes/state_main_app.dart';

void main() {
   runApp(
     MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (a) => DynamicTextProvider()),
        ChangeNotifierProvider(create: (a) => VisiblityProvider())
      ],
       child:const StateMainApp()
    ),
   
  ); 
}
