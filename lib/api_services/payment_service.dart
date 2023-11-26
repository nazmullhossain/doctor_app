import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../local_save.dart';



class PaymentService {
  static const String apiUrl = 'https://www.treatmenticwl.com/api/store/payment/bkash';
  static Future sendResponse ({
    required String doctorID,
    required String fullName,
    required String age,
    required String weight,
    required String reason,
    required String description,
    required String amount,
    required String customerMisdn,
    required String invoiceNumber,
    required String paymentID,
    required String trxID,


  }) async {
    final pref = await SharedPreferences.getInstance();
    final token = pref.getString('token');
    String ? firebaseToken;

    await SharedData().getToken().then((value) {
      firebaseToken = value;
    });
    print(token);
    print("ID__${doctorID}");
    final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Authorization': 'Bearer $token'},
        body: {
          'is_scheduled' : "0",
          'time' : "",
          'doctor_id' : doctorID,
          'full_name' : fullName,
          'age' : age,
          'weight': weight,
          'main_reason' : reason,
          'descriptions' : description,
          'amount' : amount,
          'full_address' : "Dhaka Bangladesh",
          'customerMsisdn' : customerMisdn,
          'merchantInvoiceNumber' : invoiceNumber,
          'paymentID' : paymentID,
          'trxID' : trxID,
          // 'device_token' : firebaseToken.toString(),
        }
    );
    if(response.statusCode == 200){
      print('Data Stored');
      print("__${response.body}");
    } else{
      print("error__${response.body}");
      throw Exception(
          'Store failed. Error: ${response.statusCode} ${response.body}');
    }
  }
}

class PaymentService222 {
  static const String apiUrl = 'https://www.treatmenticwl.com/api/store/payment/bkash';
  static Future sendResponse ({
    required String doctorID,
    required String fullName,
    required String age,
    required String weight,
    required String reason,
    required String description,
    required String amount,
    required String customerMisdn,
    required String invoiceNumber,
    required String paymentID,
    required String trxID,
    required int  schdule,
    required String time,


  }) async {
    final pref = await SharedPreferences.getInstance();
    final token = pref.getString('token');
    String ? firebaseToken;

     await SharedData().getToken().then((value) {
       firebaseToken = value;
     });
    print(token);
    var body =
      {
        'is_scheduled' : "1",
        'time' : "$time",
        'doctor_id' : doctorID,
        'full_name' : fullName,
        'age' : age,
        'weight': weight,
        'main_reason' : reason,
        'descriptions' : description,
        'amount' : amount,
        'full_address' : "Dhaka Bangladesh",
        'customerMsisdn' : customerMisdn,
        'merchantInvoiceNumber' : invoiceNumber,
        'paymentID' : paymentID,
        'trxID' : trxID,
      };
    print("Bosy--${body}");
    final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Authorization': 'Bearer $token'},
        body: body
    );
    if(response.statusCode == 200){
      print('Data Stored');
      print("RESS_${response.body}");
    } else{
      throw Exception(
          'Store failed. Error: ${response.statusCode} ${response.body}');
    }
  }
}