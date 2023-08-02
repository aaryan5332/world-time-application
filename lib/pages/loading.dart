import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'dart:core';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  void setupWorldTime() async{  // If we have to use await inside a function it should be async.
    WorldTime instance=WorldTime(location: 'Kolkata',flag: 'Kolkata.png',url:'Asia/Kolkata');
        await instance.getTime();
        Navigator.pushReplacementNamed(context,'/home',arguments: {
          'location':instance.location,
          'flag':instance.flag,
        'time':instance.time,
         'isDayTime':instance.isDayTime,
        }); // Replaces the current screen with the home screen
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitFadingCube(
           color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }
}
