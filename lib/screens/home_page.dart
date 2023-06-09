import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'contact.dart';
import 'control.dart';


class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);


  @override
  State<HomePage> createState() => _ResultState();
}

class _ResultState extends State<HomePage> {

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff101D42),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(flex: 1,),
            Container(
                width: 300,
                height: 300,
                child: IconButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Control()));


                }, icon: Image.asset('images/remote.png'))),
            Spacer(flex: 1,),
            Container(
                width: 200,
                height: 200,
                child: IconButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ContactWithUs()));
                }, icon: Image.asset('images/customer-service.png'))),
            Spacer(flex: 1,),



          ],
        ),
      ),
    );
  }
}
