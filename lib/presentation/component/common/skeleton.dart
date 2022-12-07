import 'package:flutter/material.dart';


class Skeleton extends StatelessWidget {
  const Skeleton({Key? key, this.height, this.width,this.radius,this.color}) : super(key: key);

  final double? height, width,radius;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(radius!))),
    );
  }
}