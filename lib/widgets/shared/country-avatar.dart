import 'package:flutter/material.dart';

class CountryAvatar extends StatelessWidget {
  String? code;
  double size;
  CountryAvatar({Key? key, this.code, this.size = 20}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.black54,
      radius: size,
      child: Text(code?.toUpperCase() ?? ""),
    );
  }
}
