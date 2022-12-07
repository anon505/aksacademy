
import 'package:aksacademy/common/app_theme.dart';
import 'package:aksacademy/common/colors.dart';
import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  int? index;
  String? caption;
  bool isSelected;
  Icon? icon;
  Function? onTap;
  Category({Key? key,this.index,this.caption,this.icon,this.isSelected=false,this.onTap}): super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onTap!(index);
      },
      child: Container(
        height: 30,
        margin: EdgeInsets.only(left: index==0 ? 13:0,right: 13),
        padding: EdgeInsets.symmetric(horizontal: 14),
        decoration: BoxDecoration(
          color: isSelected ? BaseColors.neutral900:BaseColors.white,
          borderRadius:BorderRadius.circular(14),
          border: Border.all(color: isSelected ? BaseColors.neutral900:BaseColors.primary50,)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            (icon!=null ? Align(
              alignment: Alignment.centerLeft,
              child: icon,
            ):SizedBox()),
            (icon!=null ? SizedBox(width: 8,):SizedBox()),
            Text('$caption',style: AppTheme.appTextTheme.smallNormalReguler
                ?.copyWith(height: 0,color: isSelected ? BaseColors.white:
            BaseColors.neutral500),),
          ],
        ),
      ),
    );
  }
}