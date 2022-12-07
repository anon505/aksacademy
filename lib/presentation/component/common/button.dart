
import 'package:aksacademy/common/colors.dart';
import 'package:flutter/material.dart';

enum ButtonType { solid, outline }

/*Button(
              caption: 'Daftar',
              captionColor: BaseColors.primary500,
              borderColor: BaseColors.primary500,
              listener: (){

              },

              buttonType: ButtonType.outline,
              height: 40,
            ),
            Button(
              isLoading: true,
              caption: 'Daftar',
              loadingColor: BaseColors.white,
              backgroundColor: BaseColors.primary500,
              listener: (){

              },

              buttonType: ButtonType.solid,
              height: 40,
            ),
            Button(
              isLoading: true,
              caption: 'Daftar',
              loadingColor: BaseColors.primary500,
              borderColor: BaseColors.primary500,
              listener: (){

              },

              buttonType: ButtonType.outline,
              height: 40,
            )*/
class Button extends StatefulWidget {
  Function listener;
  String? caption;
  double? width;
  double borderWidth;

  double? borderRadius;
  FontWeight fontWeight;
  bool? isLoading;
  bool? isDisabled;
  Color? captionColor;
  Color? borderColor;
  Color? backgroundColor;
  Color? loadingColor;
  int? height;
  ButtonType buttonType;
  Button({
    Key? key,
    required this.listener,
    required this.buttonType,
    this.caption = "",
    this.width,
    this.isLoading = false,
    this.captionColor,
    this.borderColor,
    this.borderRadius,
    this.backgroundColor,
    this.loadingColor,
    this.borderWidth = 0.4,
    this.fontWeight = FontWeight.w500,
    this.height = 40,
    this.isDisabled = false,
  }) : super(key: key);

  @override
  _Button createState() => _Button();
}

class _Button extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          if (widget.isDisabled!) {
            return;
          }
          widget.listener();
        },
        child: (widget.buttonType == ButtonType.solid)
            ? Container(
                width: widget.width ?? double.infinity,
                height: widget.height!.toDouble(),
                decoration: BoxDecoration(
                  color: widget.backgroundColor,
                  borderRadius: BorderRadius.circular(widget.height! / 4),
                ),
                child: (widget.isLoading == true
                    ? (Center(
                        child: SizedBox(
                        width: widget.height! / 2,
                        height: widget.height! / 2,
                        child: CircularProgressIndicator(
                          color: BaseColors.white,
                        ),
                      )))
                    : (Center(
                        child: Text(
                          widget.caption!,
                          style: TextStyle(
                              color: widget.captionColor,
                              fontSize: widget.height! / 2.5,
                              fontWeight: FontWeight.w500),
                        ),
                      ))),
              )
            : Container(
                width: widget.width ?? double.infinity,
                height: widget.height!.toDouble(),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: widget.borderColor!, width: widget.borderWidth),
                  borderRadius: BorderRadius.circular(
                      widget.borderRadius ?? widget.height! / 4),
                ),
                child: (widget.isLoading == true
                    ? (Center(
                        child: SizedBox(
                        width: widget.height! / 2,
                        height: widget.height! / 2,
                        child: CircularProgressIndicator(),
                      )))
                    : (Center(
                        child: Text(
                        widget.caption!,
                        style: TextStyle(
                            color: widget.captionColor,
                            fontSize: widget.height! / 2.5,
                            fontWeight: widget.fontWeight),
                      )))),
              ));
  }
}
