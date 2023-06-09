import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactWithUs extends StatefulWidget {
  const ContactWithUs({Key? key}) : super(key: key);

  @override
  State<ContactWithUs> createState() => _ContactWithUsState();
}

class _ContactWithUsState extends State<ContactWithUs> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff101D42),
      body: Center(
        child:   Card(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ListTile(
            leading: Icon(
              Icons.phone,
              size: 32,
              color: Color(0xFF2B475E),
            ),
            title: Text(
              '(+20) 1154604970',
              style: TextStyle(fontSize: 24),
            ),
          ),
        ),

     ),


    );
  }
}
