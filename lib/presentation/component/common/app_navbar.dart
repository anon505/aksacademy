
import 'package:aksacademy/common/app_theme.dart';
import 'package:flutter/material.dart';

class AppNavBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final Widget? titleView;
  final Widget? leadingView;
  final List<Widget>? actions;
  final Color backColor;
  final Color foreColor;
  final bool isShowLeading;
  final bool centerTitle;

  AppNavBar({
    this.isShowLeading = true,
    this.leadingView,
    this.title = '',
    this.titleView,
    this.backColor = Colors.white,
    required this.foreColor,
    this.actions,
    this.centerTitle = true,
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      titleSpacing: 0,
      centerTitle: centerTitle,
      backgroundColor: backColor,
      foregroundColor: foreColor,
      leadingWidth: 36,
      leading: isShowLeading
          ? Padding(padding: const EdgeInsets.only(left: 12),child: leadingView,)
          : null,
      automaticallyImplyLeading: isShowLeading,
      title: Padding(
        padding: EdgeInsets.only(left: isShowLeading ? 0 : 18),
        child: titleView ??
            Text(
              title,
              style: AppTheme.appTextTheme.smallTightReguler,
            ),
      ),
      actions: actions,
    );
  }
}
