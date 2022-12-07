
import 'package:aksacademy/common/app_theme.dart';
import 'package:aksacademy/common/colors.dart';
import 'package:aksacademy/presentation/component/common/button.dart';
import 'package:flutter/material.dart';
class WarningWidget extends StatelessWidget {
  const WarningWidget({
    Key? key,
    required this.asset,
    this.icon,
    this.title = "",
    this.subTitle = "",
    this.confirmButtonText = "",
    this.size = 124,
    this.onConfirmButtonTap,
    this.confirmButtonColor,
    this.cancelButtonText = "",
    this.onCancelButtonTap,
    this.cancelButtonColor,
    this.isHorizontalButton = false,
  }) : super(key: key);
  final String asset;
  final Widget? icon;
  final String title;
  final String subTitle;
  final String confirmButtonText;
  final Color? confirmButtonColor;
  final Function? onConfirmButtonTap;
  final String cancelButtonText;
  final Color? cancelButtonColor;
  final Function? onCancelButtonTap;
  final double size;
  final bool isHorizontalButton;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        icon ??
            Image.asset(
              asset,
              width: size,
              height: size,
            ),
        const SizedBox(
          height: 4,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: AppTheme.appTextTheme.extraLargeNormalBold,
        ),
        const SizedBox(
          height: 4,
        ),
        Container(
          padding: const EdgeInsets.only(left: 24, right: 24),
          child: Text(
            subTitle,
            textAlign: TextAlign.center,
            style: AppTheme.appTextTheme.tinyNormalReguler
                ?.copyWith(color: BaseColors.neutral600),
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        // isHorizontalButton
        //     ? SizedBox(
        //         height: 100,
        //         child: HorizontalButtonGroup(
        //             confirmWidget: onConfirmButtonTap != null
        //                 ? Button(
        //                     listener: onConfirmButtonTap!,
        //                     buttonType: ButtonType.solid,
        //                     caption: confirmButtonText,
        //                     width: 100,
        //                     backgroundColor: confirmButtonColor,
        //                     captionColor: BaseColors.white,
        //                   )
        //                 : const SizedBox(),
        //             cancelWidget: onCancelButtonTap != null
        //                 ? Button(
        //                     listener: onCancelButtonTap!,
        //                     buttonType: ButtonType.outline,
        //                     caption: cancelButtonText,
        //                     width: 100,
        //                     borderColor: cancelButtonColor,
        //                     captionColor: cancelButtonColor,
        //                   )
        //                 : const SizedBox()),
        //       )
        //     : const SizedBox(),
        isHorizontalButton
            ? Wrap(
                children: [
                  onCancelButtonTap != null
                      ? Button(
                          listener: onCancelButtonTap!,
                          buttonType: ButtonType.outline,
                          caption: cancelButtonText,
                          width: 100,
                          borderColor: cancelButtonColor,
                          captionColor: cancelButtonColor,
                        )
                      : const SizedBox(),
                  const SizedBox(
                    width: 8,
                  ),
                  onConfirmButtonTap != null
                      ? Button(
                          listener: onConfirmButtonTap!,
                          buttonType: ButtonType.solid,
                          caption: confirmButtonText,
                          width: 100,
                          backgroundColor: confirmButtonColor,
                          captionColor: BaseColors.white,
                        )
                      : const SizedBox(),
                ],
              )
            : Column(
                children: [
                  onConfirmButtonTap != null
                      ? Button(
                          listener: onConfirmButtonTap!,
                          buttonType: ButtonType.solid,
                          caption: confirmButtonText,
                          // width: 120,
                          backgroundColor: confirmButtonColor,
                          captionColor: BaseColors.white,
                        )
                      : const SizedBox(),
                  const SizedBox(
                    height: 8,
                  ),
                  onCancelButtonTap != null
                      ? Button(
                          listener: onCancelButtonTap!,
                          buttonType: ButtonType.outline,
                          caption: cancelButtonText,
                          // width: 120,
                          borderColor: cancelButtonColor,
                          captionColor: cancelButtonColor,
                        )
                      : const SizedBox(),
                ],
              ),
      ],
    );
  }
}

class HorizontalButtonGroup extends StatelessWidget {
  const HorizontalButtonGroup(
      {Key? key,
      required,
      required this.confirmWidget,
      required this.cancelWidget})
      : super(key: key);
  final Widget confirmWidget;
  final Widget cancelWidget;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        confirmWidget,
        const SizedBox(
          width: 8,
        ),
        cancelWidget,
      ],
    );
  }
}

class VerticalButtonGroup extends StatelessWidget {
  const VerticalButtonGroup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [],
    );
  }
}
