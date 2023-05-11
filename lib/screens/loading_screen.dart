import 'dart:convert';
import 'package:clima_flutter/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima_flutter/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key, });


  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   getLocationData();

  }


  void getLocationData() async{


    var weatherModel =  WeatherModel();
    var weatherData = await weatherModel.getLocationWeather();
    Navigator.push(context,MaterialPageRoute(builder:(context){
      return LocationScreen(locationWeather: weatherData,);
    }));

  }






  Widget build(BuildContext context) {
    return const Scaffold(
      body:Center(
        child: SpinKitPouringHourGlass(
          color:Colors.red,
          size: 100.0,
          duration: Duration(seconds: 1 ),

        ),
      )
    );
  }
}
