import 'package:aksacademy/common/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pattern_formatter/numeric_formatter.dart';

class Input extends StatefulWidget {
  Function listener;
  TextEditingController? controller;
  String? value = "";
  String? caption = "";
  String? errCaption = "";
  String? preCaption = "";
  String? hint = "";
  bool obsecureText;
  Image? leftIcon;
  Widget? rightIcon;
  int? height = 40;
  double? width;
  Color? borderColor;
  Color? backgroundColor;
  double? borderRadius;
  bool enableValidation;
  TextInputAction? textInputAction;
  TextInputType? textInputType;
  bool alwayShowIcon;
  Input(
      {Key? key,
      required this.listener,
      this.controller,
      this.value,
      this.caption,
      this.errCaption,
      this.preCaption,
      this.leftIcon,
      this.rightIcon,
      this.hint,
      this.height,
      this.width,
      this.borderRadius,
      this.textInputAction,
      this.textInputType,
      this.enableValidation = true,
      this.alwayShowIcon = false,
        this.obsecureText=false,
      this.borderColor,
      this.backgroundColor,})
      : super(key: key);

  @override
  _Input createState() => _Input(
    controller: controller,
    value: value,
    caption: caption,
    errCaption: errCaption,
    preCaption: preCaption,
    leftIcon: leftIcon,
    rightIcon: rightIcon,
    hint: hint,
    height: height,
    borderColor: borderColor,
    backgroundColor: backgroundColor,
  );
}

class _Input extends State<Input> {
  bool isInit = true;
  TextEditingController? controller;
  String? value = "";
  String? caption = null;
  String? errCaption = "";
  String? preCaption = "";
  String? hint = "";
  Image? leftIcon;
  Widget? rightIcon;
  int? height = 40;
  double? width;
  Color? borderColor;
  Color? backgroundColor;
  _Input(
      {this.controller,
      this.value,
      this.caption,
      this.errCaption,
      this.preCaption,
      this.leftIcon,
      this.rightIcon,
      this.hint,
      this.height,
      this.width,
      this.borderColor,
      this.backgroundColor,});
  @override
  void initState() {
    super.initState();
    isInit = true;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            caption ?? '',
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: BaseColors.neutral900,
                decoration: TextDecoration.none),
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        Container(
          height: height?.toDouble(),
          width: width,
          decoration: BoxDecoration(
            border: Border.all(
                color: (errCaption != '' && !isInit && widget.enableValidation
                    ? BaseColors.danger500
                    : widget.borderColor ?? BaseColors.neutral300),
                width: 1.0,
                style: BorderStyle.solid),
            borderRadius:
                BorderRadius.circular(widget.borderRadius ?? height! / 4),
            color: widget.backgroundColor
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              (leftIcon != null
                  ? Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: leftIcon,
                    )
                  : const SizedBox(width: 0)),
              (preCaption != ''
                  ? Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Text(
                        preCaption ?? '',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: BaseColors.neutral900,
                            decoration: TextDecoration.none),
                      ),
                    )
                  : const SizedBox(width: 0)),
              (preCaption != ''
                  ? SizedBox(width: height! / 5)
                  : const SizedBox(width: 0)),
              Expanded(
                  child: TextField(
                    obscureText: widget.obsecureText,
                controller: controller,
                textInputAction: widget.textInputAction,
                keyboardType: widget.textInputType,
                inputFormatters: widget.textInputType==TextInputType.number ? [ThousandsFormatter()]:[],
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                  border: InputBorder.none,
                  hintText: hint,
                  hintStyle: TextStyle(color: BaseColors.neutral500),
                ),
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                onChanged: (keyword) {
                  if (kDebugMode) {
                    print(keyword);
                  }
                  if (widget.enableValidation) {
                    setState(() => {isInit = false});
                    setState(() => {value = keyword});
                    //validasi bisa dilakukan di baris ini
                    var varErrCaption = '';
                    if (keyword == '') {
                      varErrCaption = '$caption harap diisi';
                    }
                    setState(() => {errCaption = varErrCaption});
                    widget.listener(keyword, (varErrCaption == ''));
                  }
                },
              )),
              widget.alwayShowIcon
                  ? (rightIcon != null
                      ? GestureDetector(
                          onTap: () {
                            controller?.clear();
                            setState(() => {isInit = false});
                            setState(() => {value = ''});
                            var varErrCaption = '$caption harap diisi';
                            setState(() => {errCaption = varErrCaption});
                            widget.listener('', false);
                          },
                          child: Container(
                            padding:
                                EdgeInsets.only(left: 10, right: height! / 5),
                            child: rightIcon,
                          ))
                      : const SizedBox(width: 0))
                  : (rightIcon != null
                      ? (value != '' && !isInit
                          ? GestureDetector(
                              onTap: () {
                                controller?.clear();
                                setState(() => {isInit = false});
                                setState(() => {value = ''});
                                var varErrCaption =
                                    '$caption harap diisi';
                                setState(() => {errCaption = varErrCaption});
                                widget.listener('', false);
                              },
                              child: Container(
                                padding: EdgeInsets.only(
                                    left: 10, right: height! / 5),
                                child: rightIcon,
                              ))
                          : const SizedBox(width: 0))
                      : const SizedBox(width: 0)),
            ],
          ),
        ),
        errCaption != '' && !isInit
            ? Container(
                margin: const EdgeInsets.only(top: 6),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    errCaption!,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: BaseColors.danger500,
                        decoration: TextDecoration.none),
                  ),
                ),
              )
            : const SizedBox(
                height: 0,
              ),
      ],
    );
  }
}
