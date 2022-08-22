import 'package:demo/widgets/shared/country-avatar.dart';
import 'package:flutter/material.dart';

class WeatherDetailsScreen extends StatefulWidget {
  Map<String, String> country;

  WeatherDetailsScreen({Key? key, required this.country}) : super(key: key);

  @override
  State<WeatherDetailsScreen> createState() => _WeatherDetailsScreenState();
}

class _WeatherDetailsScreenState extends State<WeatherDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CountryAvatar(code: widget.country['code'], size: 50),
              const SizedBox(height: 20),
              Text(widget.country['title']!, style: const TextStyle(
                  fontSize: 16,
              ))
            ],
          ),
        )
      ),
    );
  }
}
