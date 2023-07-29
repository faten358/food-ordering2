import 'package:flutter/material.dart';
import 'package:food_ordering2/ui/shared/color.dart';
import 'package:food_ordering2/ui/shared/color.dart';


class CustomDropdownButton extends StatefulWidget {
  
  final String dropdownValue;
  final String labelTeaxt;

  

  CustomDropdownButton({ required this.dropdownValue, required this.labelTeaxt});

  @override
  _CustomDropdownButtonState createState() => _CustomDropdownButtonState();
}
const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  

  @override
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return  Container(height: size.height*0.09,width: size.width,
      child: 
      DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: 'Delivering to',
          labelStyle: TextStyle(color: Colors.grey,fontSize: 20)
        ),
        value: dropdownValue,
        icon: Padding(
          padding:  EdgeInsets.only(right: size.width*0.5),
          child: 
           const Icon(Icons.keyboard_arrow_down_outlined, color: Colors.orange,),
        ),
        style: const TextStyle(color:Colors.black,fontSize:25),
        
        onChanged: (String? value) {
          // This is called when the user selects an item.
          setState(() {
            dropdownValue = value as String;
          });
        },
        items: list.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
    
  }
}
 
