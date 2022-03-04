import 'package:flutter/material.dart';
import 'package:twilio_flutter/twilio_flutter.dart';

import 'app.dart';
import 'keys.dart';
TwilioFlutter twilioFlutter= twilioFlutter = TwilioFlutter(
      accountSid: accountSid,
      authToken: authToken,
      twilioNumber: twilioNum);
void main() async {
 
  runApp(App());
}
