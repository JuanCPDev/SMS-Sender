import 'package:flutter/material.dart';
import 'package:smssender/message.dart';
import 'package:twilio_flutter/twilio_flutter.dart';

import 'app.dart';
import 'keys.dart';

TwilioFlutter twilioFlutter = twilioFlutter = TwilioFlutter(
    accountSid: accountSid, authToken: authToken, twilioNumber: twilioNum);

final List<Messages> messageList=[];
void main() async {
  runApp(const MaterialApp(home: App()));
}
