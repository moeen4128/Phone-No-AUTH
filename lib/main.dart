import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phone_number_auth/wrapper.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

   await Firebase.initializeApp(

  );
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Phone Number Auth',
      theme: ThemeData(fontFamily: 'cv'),
      home: Wrapper(),
    );
  }
}
