import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phone_number_auth/wrapper.dart';
import 'package:pinput/pinput.dart';
class otpPage extends StatefulWidget {
  final String vid;
  const otpPage({Key? key, required this.vid}) : super(key: key);

  @override
  State<otpPage> createState() => _otpPageState();
}

class _otpPageState extends State<otpPage> {
  var code = '';
  signIn() async{
    PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: widget.vid, smsCode: code);
    try{
      await FirebaseAuth.instance.signInWithCredential(credential).then((value) => Get.offAll(Wrapper()));
    }on FirebaseAuthException catch(e){
      Get.snackbar('Error Occured', e.code);
    }catch (e){
      Get.snackbar('Error Occured', e.toString());

    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: ListView(
          shrinkWrap: true,
          children: [
            Center(
              child: Text("OTP Verification",style: TextStyle(fontSize: 30),),
            ),
            Padding(padding: EdgeInsets.symmetric(horizontal: 25,vertical: 6),
            child: Text("Enter OTP sent to + 92 3071464925",textAlign: TextAlign.center,),),
            SizedBox(
              height: 20,
            ),
            textcode(),
            SizedBox(height: 80,),
            button()
          ],
        ),
      ),
    );
  }
  Widget button(){
    return Center(
        child: ElevatedButton(
          onPressed: () => signIn(),
          style: ElevatedButton.styleFrom(
              primary: Color.fromRGBO(140, 178, 241, 1),
              padding: const EdgeInsets.all(16.0)
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 80),
            child: Text('Verify & Proceed ',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 18.0),),

          ),
        )
    );
  }
  Widget textcode(){
    return Center(
      child: Padding(
        padding: EdgeInsets.all(6.0),
        child: Pinput(
          length: 6,
          onChanged: (value) {
            setState(() {
              code = value;
            });
          },
        ),
      ),
    );
  }
}
