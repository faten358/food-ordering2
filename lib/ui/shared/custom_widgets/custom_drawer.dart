import 'package:flutter/material.dart';
import 'package:food_ordering2/ui/views/main_view/home_view/home_view.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
final size=MediaQuery.of(context).size;

    return Container(
      color: Colors.white,
      width: size.width*0.65,
      child: Padding(
        padding:  EdgeInsets.symmetric(vertical: size.width*0.05),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            drawerItem(size: size, iconName: Icons.home, text: 'Home', onTap: (){
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context){
              return  HomeView(onPressed: (){},);}
              ),);

            })
          
        ],),
      )

    );
  }
  Widget drawerItem({
    required Size size,
    required IconData iconName,
    required String text,
    
    required Function onTap,
  }) {
    return InkWell(
      onTap: (){onTap ();},
      child: Row(
        children: [
          Icon(iconName),
          Text(text),
        ],
      ),
    );
  }
}


