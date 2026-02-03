import 'package:flutter/material.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});
  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController forgetController= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(height: 60,),
                TextFormField(
                  controller: forgetController,
                  decoration: InputDecoration(
                      hint: Text('Forget Password'),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)
                      )
                  ),
                ),
                SizedBox(height: 10,),
                SizedBox(
                  width: 350,
                  height: 50,
                  child: ElevatedButton(onPressed: (){

                  },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)
                          )
                      ),
                      child: Text('Send',
                        style: TextStyle(fontSize: 18, ),)
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}
