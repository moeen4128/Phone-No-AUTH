import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'otp.dart';
class PhoneHome extends StatefulWidget {
  const PhoneHome({Key? key}) : super(key: key);

  @override
  State<PhoneHome> createState() => _PhoneHomeState();
}

class _PhoneHomeState extends State<PhoneHome> {
  TextEditingController phoneNumber = TextEditingController();
  sendcode() async{
    try{
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+92' + phoneNumber.text,
          verificationCompleted: (PhoneAuthCredential credential) {},
          verificationFailed: (FirebaseAuthException e){
          Get.snackbar('Error Occured', e.code);
          },
          codeSent: (String vid, int? token){
          Get.to(otpPage(vid:vid,),);
          },
          codeAutoRetrievalTimeout: (vid){
          });
    } on FirebaseAuthException catch(e){
      Get.snackbar('Error Occured', e.code);
    }catch (e){
      Get.snackbar('Error Occured', e.toString());

    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          SizedBox(
            height: 290,
          ),
          Center(
            child: Text('Your Phone !',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
          ),
          Padding(padding: EdgeInsets.symmetric(horizontal: 25,vertical: 6),
          child: Text("we will send you an one time password on this mobile number"),),
          SizedBox(
            height: 20,
          ),
          phonetext(),
          SizedBox(
            height: 50,
          ),
          button(),

        ],
      ),
    );
  }

  Widget button(){
    return Center(
      child: ElevatedButton(
        onPressed: () => sendcode(),
        style: ElevatedButton.styleFrom(
          primary: Color.fromRGBO(90, 208, 248, 1.0),
          padding: const EdgeInsets.all(16.0)
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 90),
          child: Text('Recieve OTP',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 18.0),),

        ),
      )
    );
  }
  Widget phonetext(){
    return Padding(padding: EdgeInsets.symmetric(horizontal: 50),child:
      TextField(
        controller: phoneNumber,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          prefix: Text("+92"),
          prefixIcon: Icon(Icons.phone),
          labelText: 'Enter Phone Number',
          hintStyle: TextStyle(color: Colors.grey),
          labelStyle: TextStyle(color: Colors.grey),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),

          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.blue)
          )
        ),
      ),);
  }
}
