import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import 'model.dart';

class TempHumidAPI {
  static String username = 'fisherman2022';
  static String aioKey='aio_SaFO80Bbk2fQ1aYCZrqBkTAjxoUw';
 // static String aioKey = dotenv.env['aio_SaFO80Bbk2fQ1aYCZrqBkTAjxoUw'].toString();
  static String tempFeed = 'temperature';
  static String humidFeed = 'humidity';
  static String led1Feed = 'button1';
  static String rgbFeed = 'color';
  static String mainURL = 'https://io.adafruit.com/api';
  var url_angle = 'https://io.adafruit.com/api/fisherman2022/feeds/button1';
  static String button1 = 'raspberry.button1';
  static String button2 = 'raspberry.button2';
  static String button3= 'raspberry.button3';

  // static Future<bool> updateLed1Data(String value) async {
  //   http.Response response = await http.post(
  //     Uri.parse(mainURL + '$username/feeds/$led1Feed/data'),
  //     headers: <String, String>{
  //       'X-AIO-Key': aioKey!,
  //       'Content-Type': 'application/json',
  //     },
  //     body: jsonEncode({
  //       "datum": {"value": value}
  //     }),
  //   );
  //   if (response.statusCode == 200) {
  //     return true;
  //   } else {
  //     throw Error();
  //   }
  // }

  // static Future<AdafruitGET> getTempData() async {
  //   http.Response response = await http.get(
  //     Uri.parse(mainURL + '$username/feeds/$tempFeed'),
  //
  //     headers: <String, String>{'X-AIO-Key': aioKey!},
  //   );
  //   if (response.statusCode == 200) {
  //     return AdafruitGET.fromRawJson(response.body);
  //   } else {
  //     throw Error();
  //   }
  // }
  // static Future<AdafruitGET> getAngleData() async {
  //   http.Response response = await http.get(
  //     Uri.parse(mainURL + '$username/feeds/$angleFeed'),
  //
  //     headers: <String, String>{'X-AIO-Key': aioKey!},
  //   );
  //   if (response.statusCode == 200) {
  //     return AdafruitGET.fromRawJson(response.body);
  //   } else {
  //     throw Error();
  //   }
  // }
//   static Future<AdafruitGET> getHumidData() async {
//     http.Response response = await http.get(
//       Uri.parse(mainURL + '$username/feeds/$humidFeed'),
//       headers: <String, String>{'X-AIO-Key': aioKey!},
//     );
//     if (response.statusCode == 200) {
//       return AdafruitGET.fromRawJson(response.body);
//     } else {
//       throw Error();
//     }
//   }
//
//   static Future<AdafruitGET> getLed1Data() async {
//     http.Response response = await http.get(
//       Uri.parse(mainURL + '$username/feeds/$led1Feed'),
//       headers: <String, String>{'X-AIO-Key': aioKey!},
//     );
//     if (response.statusCode == 200) {
//       return AdafruitGET.fromRawJson(response.body);
//     } else {
//       throw Error();
//     }
//   }
//
  static Future updateLed1Data( value,
      String ledFeed,

      ) async {
    http.Response response = await http.post(
      //Uri.parse(mainURL + '$username/feeds/$led1Feed/data'),
      Uri.parse('https://io.adafruit.com/api/v2/fisherman2022/feeds/$ledFeed/data'),

      headers: <String, String>{
        'X-AIO-Key': aioKey!,
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        "datum": {"value": value}
      }),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      print(response.statusCode);
      throw Error();
    }
  }
//
//   static Future<AdafruitGET> getRGBstatus() async {
//     http.Response response = await http.get(
//       Uri.parse(mainURL + '$username/feeds/$rgbFeed'),
//       headers: <String, String>{'X-AIO-Key': aioKey!},
//     );
//     if (response.statusCode == 200) {
//       return AdafruitGET.fromRawJson(response.body);
//     } else {
//       throw Error();
//     }
//   }
//
//   static Future<bool> updateRGBdata(String value) async {
//     http.Response response = await http.post(
//       Uri.parse(mainURL + '$username/feeds/$rgbFeed/data'),
//       headers: <String, String>{
//         'X-AIO-Key': aioKey!,
//         'Content-Type': 'application/json',
//       },
//       body: jsonEncode({
//         "datum": {"value": value}
//       }),
//     );
//     if (response.statusCode == 200) {
//       return true;
//     } else {
//       throw Error();
//     }
//   }
// }
}