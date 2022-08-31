import 'dart:convert';
import 'dart:developer';
import 'package:demo/pages/weather.dart';
import 'package:demo/services/country-service.dart';
import 'package:demo/widgets/home/country-item.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../widgets/shared/country-avatar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List cities = [];

  @override
  void initState() {
    super.initState();

    // countries = CountryService().getCountries();

    getCities();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Country list", style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold
              )),
              const SizedBox(height: 15),
              Flexible(
                child: ListView.separated(
                    itemCount: cities.length,
                    itemBuilder: (BuildContext context, int index){
                      Map city = cities[index];

                      return GestureDetector(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(5)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  CountryAvatar(code: city['countryCode']),
                                  const SizedBox(width: 20),
                                  Text(city['name'], style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.white
                                  ))
                                ],
                              ),
                              const Icon(Icons.chevron_right, color: Colors.white)
                            ],
                          ),
                        ),
                        onTap: (){

                        },
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(height: 10);
                    }
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void getCities()async {
    print("Getting Cities");
    Uri endpoint = Uri.parse("https://wft-geo-db.p.rapidapi.com/v1/geo/cities?limit=10");
    Map<String, String> headers = {
      "X-RapidAPI-Key": "TnZPXMcVRNmsh5fJbTxb1TDSdYkcp1DDZx2jsntIMsE04lUY0C",
      "X-RapidAPI-Host": "wft-geo-db.p.rapidapi.com",
    };


    print("Request about to be sent");
    var response = await http.get(endpoint, headers: headers);
    if(response.statusCode == 200){
      Map result = jsonDecode(response.body);
      setState((){
        cities = result['data'];
      });
      print("Data Arrived");
    }else{
      print("Error occured");
    }

    print("Request has been sent but i'm not sure it has arrived");


    // print("Request about to be sent");
    // http.get(endpoint, headers: headers)
    // .then((response){
    //   if(response.statusCode == 200){
    //     Map result = jsonDecode(response.body);
    //     setState((){
    //       cities = result['data'];
    //     });
    //     print("Data Arrived");
    //   }else{
    //     print("Error occured");
    //   }
    // }).catchError((error){
    //   print("Error occured");
    //   print(error);
    // });
    //
    // print("Request has been sent but i'm not sure it has arrived");


    // http.get(endpoint, headers: headers)
    // .then((response){
    //   if(response.statusCode == 200){
    //     Map result = jsonDecode(response.body);
    //     setState((){
    //       cities = result['data'];
    //     });
    //   }else{
    //     print("Error occured");
    //   }
    // }).catchError((error){
    //   print("Error occured");
    //   print(error);
    // });
  }

  void onCountrySelected(Map<String, String> country){
    Navigator.push(context,
        MaterialPageRoute(builder: (context)=> WeatherDetailsScreen(
          country: country,
        )));
  }


}
