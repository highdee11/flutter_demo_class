import 'package:demo/widgets/shared/country-avatar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CountryItem extends StatelessWidget {
  Map<String, String> item;
  Function(Map<String, String>)? onSelect;

  CountryItem({
    Key? key,
    required this.item,
    this.onSelect
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
               CountryAvatar(code: item['code']),
               const SizedBox(width: 20),
               Text(item['title']!, style: const TextStyle(
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
        if(onSelect != null){
          onSelect!(item);
        }
      },
    );
  }

}
