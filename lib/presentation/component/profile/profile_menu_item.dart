import 'package:aksacademy/common/app_theme.dart';
import 'package:aksacademy/common/colors.dart';
import 'package:flutter/material.dart';

class ProfileMenuItem extends StatelessWidget {
  const ProfileMenuItem({Key? key, required this.imgMenu,required this.caption, required this.onTap})
      : super(key: key);
  final Function onTap;
  final String imgMenu;
  final String caption;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){

      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 18),
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: BaseColors.neutral300))
        ),
        child: Row(
          children: [
            Image.asset(imgMenu,width: 32,height: 32,),
            const SizedBox(width: 12,),
            Expanded(child: Text(caption,style:
            AppTheme.appTextTheme.regulerNormalRegular?.copyWith(height: 0,color: BaseColors.neutral500),),),
            const SizedBox(width: 12,),
            Image.asset('assets/icons/ic_profile_arrow_right.png',width: 24,height: 24,),
          ],
        ),
      ),
    );
  }
}
