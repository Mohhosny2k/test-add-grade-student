import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:test_student_app/show_snack_bar.dart';
import '../constants.dart';
import 'custom_bottom.dart';
import 'custom_text_form_field.dart';


class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});
  // String id = 'registerPage';
  static String id = 'registerPage';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? email;

  String? pass;

  GlobalKey<FormState> fromKey = GlobalKey();

  bool isloading = false;

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
              children: [
                SizedBox(
                  height: sized > 550 ? 75 : 50,
                ),
                Image.asset(
                  'assets/images/scholar.png',
                  height: sized > 550 ? 100 : 75,
                ),
                Text(
                  'Student Data',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                      fontFamily: 'Pacifico'),
                ),
                SizedBox(
                  height: sized > 550 ? 58 : 30,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Register',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: sized > 550 ? 10 : 7,
                ),
                CustomTextFormFeild(
                  hientText: 'Email',
                  onChanged: (data) {
                    email = data;
                  },
                ),
                SizedBox(
                  height: sized > 550 ? 10 : 7,
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
                  text: 'Register',
                  onTap: () async {
                    if (fromKey.currentState!.validate()) {
                      isloading = true;
                      setState(() {});
                      try {
                        // var auth = FirebaseAuth.instance;
                        await registerUser();
                        showSnackBar(context, 'success');
                        Navigator.pushNamed(context, 'homePage');
                        //  print(user.user!.displayName);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          showSnackBar(
                              context, 'The password provided is too weak');
                        } else if (e.code == 'email-already-in-use') {
                          showSnackBar(context,
                              'The account already exists for that email');
                        }
                        // ScaffoldMessenger.of(context).showSnackBar(
                        //   SnackBar(
                        //       content: Text('there was an error , please try agin')),
                        // );
                      } catch (e) {
                        print(e);
                        showSnackBar(context, 'there was an error');
                      }
                      isloading = false;
                      setState(() {});
                      //showSnackBar(context, 'done');
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
                      'already have an account ?  ',
                      style: TextStyle(color: Colors.black),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, 'loginPage');
                      },
                      child: Text(
                        'login',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xffC7EDE6),
                        ),
                      ),
                    ),
                  ],
                ),
                  SizedBox(height: 25,),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // void showSnackBar(BuildContext context, String message) {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(content: Text(message)),
  //   );
  //}

  Future<void> registerUser() async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: pass!);
  }
}
