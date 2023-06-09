import 'package:chat/screens/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'home_page.dart';

class LoginScreen extends StatefulWidget {
   LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool  isLoading = false ;
  String? email ;
  String? password ;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall:isLoading ,
      child: Scaffold(
        backgroundColor: Color(0xff101D42),
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Center(
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                        radius: 130,
                        child: Image.asset('images/new.jpg',width: 180,height: 180,)),
                  ),
                ),
                SizedBox(height: 10,),
                Text('Welcome Back !',style: TextStyle(
                    color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 27


                ),),
                Text('Login to your account',style: TextStyle(
                    color: Colors.white38,
                  fontSize: 24


                ),),
                SizedBox(height: 70,),
                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: TextFormField(
                    onChanged: (data){
                      email = data ;
                    },
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Please Enter Your Email';
                      }
                    },


                    decoration: InputDecoration(
                      hintText: 'Email',
                      icon: Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Image.asset('images/user.png',width: 40,height: 40,),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25)
                      )
                    ),

                  ),
                ),
                SizedBox(height: 25,),
                Padding(

                  padding: const EdgeInsets.only(right: 12.0),
                  child: TextFormField(
                    onChanged: (data){
                      password = data ;
                    },
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Please Enter Your Password';
                      }
                    },

                    decoration: InputDecoration(
                      hintText: '  Password ',
                      icon: Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Image.asset('images/lock.png',width: 40,height: 40,),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25)
                      )
                    ),

                  ),
                ),
                SizedBox(height: 40,),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0,right: 20),
                  child: ElevatedButton(
                    onPressed: () async{

                      if(formKey.currentState!.validate()){
                        isLoading = true;
                        setState(() {


                        });

                        try{
                          var auth = FirebaseAuth.instance ;
                          UserCredential user = await auth.signInWithEmailAndPassword(email: email!, password: password!);
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage( )));

                        }on FirebaseAuthException  catch(e){
                          if (e.code == 'email-not-found') {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('No email found for that email.')));
                          } else if (e.code == 'wrong-password') {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Wrong password provided for that user.')));


                          }
                        }
                        isLoading = false ;
                        setState(() {



                        });


                      }else{




                      }









                    },
                    child: Text('Login',style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,fontWeight: FontWeight.bold
                    ),),
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(300, 50) ,
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)
                      )
                    ),
                  ),
                ),
                SizedBox(height: 70,),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text('Don`t have an account ? ',style: TextStyle(
                        color: Colors.white,
                        fontSize: 20
                      ),),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()),);
                      }, child: Text('Sign Up',style: TextStyle(
                        color: Colors.white,
                        fontSize: 20
                      ),) ),
                    )
                  ],
                ),
                SizedBox(height: 20,),



              ],
            ),
          ),
        ),

      ),
    );
  }
}
