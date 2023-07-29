import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_ordering2/core/enums/buttom_navigation.dart';
import 'package:food_ordering2/ui/shared/color.dart';



class BottomNavigationWidget extends StatefulWidget {
final ButtomNavigationEnum buttonNavication;
final Function (ButtomNavigationEnum, int) onTap;

  const BottomNavigationWidget({super.key, required this.buttonNavication, required this.onTap});

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: size.width * 0.17),
          child: InkWell(
            onTap: () {
              widget.onTap(ButtomNavigationEnum.HOME,2);
            },
            child: CircleAvatar(
              radius: size.width * 0.1,
              backgroundColor: widget.buttonNavication==ButtomNavigationEnum.HOME ? 
              AppColors.mainOrangeColor : 
              AppColors.grayColor,
              child: SvgPicture.asset(
                "images/ic_home.svg",
                color: AppColors.mainWhiteColor,
              ),
            ),
          ),
        ),
        // SvgPicture.asset(
        //   "images/bg_bottom_navigation.svg",
        //   fit: BoxFit.fitWidth,
        // ),
        CustomPaint(
          painter: ClipShadowShadowPainter(
            shadow: Shadow(
              blurRadius: 12,
              offset: Offset(0, 1),
              color: AppColors.grayColor
            ),
            clipper: BottomClip(),
          ),
          child: ClipPath(
            clipper: BottomClip(),
            child: Container(
              width: size.width,
              height: size.width * 0.23,
              color: AppColors.mainWhiteColor,
            ),
          ),
        ),
        Positioned(
          bottom: size.width * 0.05,
          left: size.width * 0.05,
          right: size.width * 0.05,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    navItem(
                        onTap: (){
                          widget.onTap(ButtomNavigationEnum.MENU,0);
                        },
                        size: size,
                        imageName: "ic_menu",
                        text: "Menu",
                        isSelected: widget.buttonNavication==ButtomNavigationEnum.MENU,
                        ),
                    SizedBox(
                      width: size.width * 0.1,
                    ),
                    navItem(
                      onTap: (){
                          widget.onTap(ButtomNavigationEnum.OFFERS,1);
                        },
                        size: size,
                        imageName: "ic_shopping",
                        text: "Offers",
                        isSelected: widget.buttonNavication==ButtomNavigationEnum.OFFERS,
                        ),
                  ],
                ),
                Row(
                  children: [
                    navItem(
                      onTap: (){
                          widget.onTap(ButtomNavigationEnum.PROFILE,3);
                        },
                        size: size,
                        imageName: "ic_user",
                        text: "Profile",
                        isSelected: widget.buttonNavication==ButtomNavigationEnum.PROFILE,
                        ),
                    SizedBox(
                      width: size.width * 0.1,
                    ),
                    navItem(
                        size: size,
                        imageName: "ic_more",
                        text: "More",
                        isSelected: widget.buttonNavication==ButtomNavigationEnum.MORE,
                         onTap: (){widget.onTap(ButtomNavigationEnum.MORE,4);}),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget navItem({
    required Size size,
    required String imageName,
    required String text,
    required bool isSelected,
    required Function onTap,
  }) {
    return InkWell(
      onTap: ()
      //we return on tap again bacause we don't nav auto
      {onTap ();},
      child: Column(
        children: [
          SvgPicture.asset(
            "images/$imageName.svg",
            width: size.width * 0.06,
            color:
            isSelected ? AppColors.mainOrangeColor : AppColors.grayColor,
          ),
          Text(text, style: TextStyle(color: isSelected? AppColors.mainOrangeColor : AppColors.grayColor),),
        ],
      ),
    );
  }
}


class BottomClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path0 = Path();
    path0.moveTo(0, 0);
    path0.lineTo(size.width * 0.3381500, 0);
    path0.quadraticBezierTo(size.width * 0.3731500, size.height * 0.0069000,
        size.width * 0.3757000, size.height * 0.1236000);
    path0.quadraticBezierTo(size.width * 0.4022000, size.height * 0.5633000,
        size.width * 0.5006000, size.height * 0.5896000);
    path0.quadraticBezierTo(size.width * 0.5955500, size.height * 0.5727000,
        size.width * 0.6200000, size.height * 0.1240000);
    path0.quadraticBezierTo(size.width * 0.6204500, size.height * -0.0157000,
        size.width * 0.6646000, 0);
    path0.lineTo(size.width, 0);
    path0.lineTo(size.width, size.height);
    path0.lineTo(0, size.height);
    path0.lineTo(0, 0);
    path0.lineTo(size.width * 0.6225000, size.height * 0.6100000);
    return path0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class ClipShadowShadowPainter extends CustomPainter {
  final Shadow shadow;
  final CustomClipper<Path> clipper;

  ClipShadowShadowPainter({required this.shadow, required this.clipper});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = shadow.toPaint();
    var clipPath = clipper.getClip(size).shift(shadow.offset);
    canvas.drawPath(clipPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}