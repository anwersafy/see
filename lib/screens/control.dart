import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../adfruit/adfruit_api_helper.dart';

class Control extends StatefulWidget {
  const Control({Key? key}) : super(key: key);

  @override
  State<Control> createState() => _ControlState();
}

class _ControlState extends State<Control> {
  bool status1 = false;
  bool status2 = false;
  bool status3 = false;
  TempHumidAPI tempHumidAPIHelper =  TempHumidAPI();





  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0xff101D42),

          body:  Column(
          children: [
            Spacer(flex: 1,),
            FlutterSwitch(
              width: 150.0,
              height: 60.0,
              valueFontSize: 30.0,
              toggleSize: 60.0,
              value: status1,
              borderRadius: 25.0,
              padding: 8.0,
              showOnOff: true,
              onToggle: (val) {
                setState(() {
                  status1 = val;
                  var currentVlaue= status1 ? '1' : '0';
TempHumidAPI.updateLed1Data(currentVlaue,TempHumidAPI.button1);

                });
              },
            ),
            Spacer(flex: 1,),
            FlutterSwitch(
              width: 150.0,
              height: 60.0,
              valueFontSize: 30.0,
              toggleSize: 60.0,
              value: status2,
              borderRadius: 25.0,
              padding: 8.0,
              showOnOff: true,
              onToggle: (val) {
                setState(() {
                  status2 = val;
                 var curValue2= status2 ? '1' : '0';
                  TempHumidAPI.updateLed1Data(curValue2,TempHumidAPI.button2);
                });
              },
            ),
            Spacer(flex: 1,),
            FlutterSwitch(
              width: 150.0,
              height: 60.0,
              valueFontSize: 30.0,
              toggleSize: 60.0,
              value: status3,
              borderRadius: 25.0,
              padding: 8.0,
              showOnOff: true,
              onToggle: (val) {
                setState(() {
                  status3 = val;
                  var curValue3= status3 ? '1' : '0';
                  TempHumidAPI.updateLed1Data(curValue3,TempHumidAPI.button3);
                });
              },
            ),
            Spacer(flex: 1,),


          ])),
    );
  }
}
