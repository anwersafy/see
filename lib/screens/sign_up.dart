import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUp extends StatefulWidget {
   SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String? email;
  bool isMale = true ;


  String? password;

  String? username;

  bool  isLoading = false ;

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
                Text('Welcome  !',style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 27


                ),),
                Text('Create your account',style: TextStyle(
                    color: Colors.white38,
                    fontSize: 24


                ),),
                SizedBox(height: 70,),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            isMale = true ;
                          });
                        },
                        child: Container(

                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Image(image: AssetImage('images/man.png'),
                                height: 90,
                                width: 90,),
                              SizedBox(height: 15,),
                              Text('MALE',
                                style: TextStyle(
                                    fontSize: 36,
                                    fontWeight: FontWeight.bold
                                ),
                              )],
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40.0),
                              color: isMale? Colors.blue :Colors.grey[300]

                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20,),
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            isMale = false ;
                          });
                        },
                        child: Container(

                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Image(image: AssetImage('images/woman.png'),
                                height: 90,
                                width: 90,),
                              SizedBox(height: 15,),
                              Text('FEMALE',
                                style: TextStyle(
                                    fontSize: 36,
                                    fontWeight: FontWeight.bold
                                ),
                              )],
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40.0),
                              color: !isMale ?Colors.blue : Colors.grey[300]

                          ),
                        ),
                      ),
                    ),


                  ],

                ),

                // Padding(
                //   padding: const EdgeInsets.only(right: 12.0),
                //   child: TextFormField(
                //     validator: (value){
                //       if(value!.isEmpty){
                //         return 'Please Enter Your Username';
                //       }
                //     },
                //     onChanged: (data){
                //       username = data ;
                //     },
                //
                //     decoration: InputDecoration(
                //         hintText: '  Username',
                //         icon: Padding(
                //           padding: const EdgeInsets.only(left: 15.0),
                //           child: Image.asset('images/user.png',width: 40,height: 40,),
                //         ),
                //         fillColor: Colors.white,
                //         filled: true,
                //         border: OutlineInputBorder(
                //             borderRadius: BorderRadius.circular(25)
                //         )
                //     ),
                //
                //   ),
                // ),
                SizedBox(height: 25,),
                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: TextFormField(
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Please Enter Your Email';
                      }
                    },
                    onChanged: (data){
                      email = data ;
                    },

                    decoration: InputDecoration(
                        hintText: '  Enter Your Email',
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
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Please Enter Your Password';
                      }
                    },
                    onChanged:  (data){
                      password = data ;
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
                SizedBox(height: 75,),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0,right: 20),
                  child: ElevatedButton(
                    onPressed: () async {

                      if(formKey.currentState!.validate()){
                        isLoading = true;
                        setState(() {

                        });
                        try{
                          var auth = FirebaseAuth.instance ;
                          UserCredential user = await auth.createUserWithEmailAndPassword(email: email!, password: password!);
                        }on FirebaseAuthException  catch(e){
                          if (e.code == 'weak-password') {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Weak Password')));
                          } else if (e.code == 'email-already-in-use') {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('This Email is already exist')));


                          }
                        }
                        isLoading = false ;
                        setState(() {

                        });
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Success')));


                      }else{

                      }



                    },
                    child: Text('Sign Up',style: TextStyle(
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
                SizedBox(height: 15,),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text('Already have an account ? ',style: TextStyle(
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
                        Navigator.pop(context);
                      }, child: Text('Sign In',style: TextStyle(
                          color: Colors.white,
                          fontSize: 20
                      ),) ),
                    )
                  ],
                ),




              ],
            ),
          ),
        ),

      ),
    );
  }
}
