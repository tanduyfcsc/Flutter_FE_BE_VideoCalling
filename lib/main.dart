import 'package:flutter/material.dart';
import 'package:video_calling/utils.dart';
import 'dart:math' as math;

import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

final String localUserId = math.Random().nextInt(10000).toString();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.all(15),
                  child: TextFormField(
                    controller: textEditingController,
                    decoration: InputDecoration(
                        labelText: "Join a call by id",
                        border: OutlineInputBorder()),
                  )),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              CallScreen(callId: textEditingController.text),
                        ));
                  },
                  child: Text("Join"))
            ],
          ),
        ),
      ),
    );
  }
}

class CallScreen extends StatelessWidget {
  final String callId;

  const CallScreen({super.key, required this.callId});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ZegoUIKitPrebuiltCall(
            appID: Utils.appId,
            appSign: Utils.appSignin,
            userID: localUserId,
            userName: 'user_$localUserId',
            callID: callId,
            config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()));
  }
}
