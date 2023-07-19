
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:test_student_app/show_snack_bar.dart';

import 'constants.dart';
import 'custom_bottom.dart';
import 'custom_text_form_field.dart';



class LandingPage extends StatefulWidget {
  LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  bool isloading = false;
  String? email;

  String? pass;
  GlobalKey<FormState> fromKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    double sized = MediaQuery.of(context).size.height;
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        backgroundColor: kPrimaryColorTwo,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Form(
            key: fromKey,
            child: ListView(
              //mainAxisAlignment: MainAxisAlignment.start,
              //crossAxisAlignment: CrossAxisAlignment.start,
              //   crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Spacer(
                //   flex: 2,
                // ),
                SizedBox(
                  height: sized>550?75:50,
                ),
                Image.asset(
                  'assets/images/scholar.png',
                  height: sized>550?100:75,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                       'Student Data',
                      //  textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                          fontFamily: 'Pacifico'),
                    ),
                  ],
                ),
                // Spacer(
                //   flex: 2,
                // ),
                SizedBox(
                  height: sized>550?58:30,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'LOGIN',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: sized>550?10:7,
                ),
                CustomTextFormFeild(
                  hientText: 'Email',
                  onChanged: (data) {
                    email = data;
                  },
                ),
                SizedBox(
                  height: sized>550?10:7,
                ),
                CustomTextFormFeild(
                  obscuretxxt: true,
                  hientText: 'Password',
                  onChanged: (data) {
                    pass = data;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                CustomButtom(
                  text: 'LOGIN',
                  onTap: () async {
                    if (fromKey.currentState!.validate()) {
                      isloading = true;
                      setState(() {});
                      try {
                        await loginUser();
                        showSnackBar(context, 'success');
                       Navigator.pushNamed(context, 'homePage',arguments: email);
                        //  print(user.user!.displayName);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          showSnackBar(
                              context,'No user found for that email.');
                        } else if (e.code == 'wrong-password') {
                          showSnackBar(context,
                              'Wrong password provided for that user.');
                        }
                      } catch (e) {
                        print(e);
                        showSnackBar(context, 'there was an error');
                      }
                      isloading = false;
                      setState(() {});
                    } else {}
                  },
                ),
                SizedBox(
                  height: sized>550?20:15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'don\'t have an account ?  ',
                      style: TextStyle(color: Colors.black),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) {
                        //   return RegisterPage();
                        // }));
                        Navigator.pushNamed(
                            context, 'registerPage'); //RegisterPage().id
                      },
                      child: Text(
                        'REGISTER',
                        style: TextStyle(
                           fontWeight: FontWeight.bold,
                          color: Color(0xffC7EDE6),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 25,),
                // Spacer(
                //   flex: 3,
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  //  void showSnackBar(BuildContext context, String message) {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(content: Text(message)),
  //   );
  // }

  Future<void> loginUser() async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: pass!);
  }
}
