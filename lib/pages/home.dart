import 'package:demo/pages/weather.dart';
import 'package:demo/services/country-service.dart';
import 'package:demo/widgets/home/country-item.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List countries = [];

  @override
  void initState() {
    super.initState();

    countries = CountryService().getCountries();

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
                    itemCount: countries.length,
                    itemBuilder: (BuildContext context, int index){
                      Map<String, String> country = countries[index];

                      return CountryItem(
                          item: country,
                          onSelect: onCountrySelected,
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

  void onCountrySelected(Map<String, String> country){
    Navigator.push(context,
        MaterialPageRoute(builder: (context)=> WeatherDetailsScreen(
          country: country,
        )));
  }

// Widget countryItem({String? code, required String name}){
//   return Container(
//     padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//     decoration: const BoxDecoration(color: Colors.red),
//     child:  Row(
//       children: [
//         CircleAvatar(
//           child: Text(code ?? ""),
//           // child: Text(code == null ? "":code),
//           backgroundColor: Colors.black54,
//         ),
//         SizedBox(width: 20),
//         Text("$name", style: TextStyle(
//             fontSize: 16,
//             color: Colors.white
//         ))
//       ],
//     ),
//   );
// }

// Widget countryItem(String code, String name){
//   return Container(
//     padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//     decoration: BoxDecoration(
//         color: Colors.red
//     ),
//     child:  Row(
//       children: [
//         CircleAvatar(
//           child: Text("$code"),
//           backgroundColor: Colors.black54,
//         ),
//         SizedBox(width: 20),
//         Text("$name", style: TextStyle(
//             fontSize: 16,
//             color: Colors.white
//         ))
//       ],
//     ),
//   );
// }
}
