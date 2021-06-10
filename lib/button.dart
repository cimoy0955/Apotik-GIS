import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key key,
    @required this.icon,
    this.color,
    @required this.width,
    @required this.height,
    this.onTap,
    this.iconSize,
  }) : super(key: key);

  final IconData icon;
  final Color color;
  final double width, height, iconSize;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material(
      color: color ?? Colors.green.withOpacity(0.8),
      borderRadius: BorderRadius.circular(100.0),
      child: InkWell(
        onTap: onTap ?? () => print("Button Control Maps"),
        borderRadius: BorderRadius.circular(100.0),
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                offset: Offset(0.0, 3.0),
                blurRadius: 15.0,
              ),
            ],
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: iconSize ?? 20.0,
          ),
        ),
      ),
    );
  }
}
