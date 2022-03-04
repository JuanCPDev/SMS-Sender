import 'main.dart';

void sendSMS(String toNum, String body){
  
     twilioFlutter.sendSMS(toNumber: toNum, messageBody: body);
  }