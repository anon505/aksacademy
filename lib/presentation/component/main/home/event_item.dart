import 'package:aksacademy/common/app_theme.dart';
import 'package:aksacademy/common/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class EventItem extends StatelessWidget {
  const EventItem({Key? key, required this.index, required this.onTap})
      : super(key: key);
  final Function onTap;
  final int index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius:
              const BorderRadius.all(Radius.circular(18)),
              child: Image.asset((index+1) % 2==0 ? 'assets/dummies/ic_tutorial_1.png':'assets/dummies/ic_tutorial_2.png',fit: BoxFit.cover,),
            ),
            Positioned.fill(child: Container(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: BaseColors.white,
                      borderRadius: BorderRadius.circular(8)
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 8),
                    child: Column(
                      children: [
                        Text('24',style: AppTheme.appTextTheme.largeNormalBold
                            ?.copyWith(height: 0,color: BaseColors.neutral900),),
                        const SizedBox(height: 3,),
                        Text('DEC',style: AppTheme.appTextTheme.regulerTightMedium
                            ?.copyWith(height: 0,color: BaseColors.secondary500),)
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Design Event',maxLines:1,style: AppTheme.appTextTheme.tinyNormalReguler
                          ?.copyWith(color: BaseColors.white,height: 0,overflow: TextOverflow.ellipsis),),
                      const SizedBox(height: 4,),
                      Text('Refactoring UI',maxLines:1,style: AppTheme.appTextTheme.largeNormalBold
                        ?.copyWith(color: BaseColors.white,height: 0,overflow: TextOverflow.ellipsis),),
                      const SizedBox(height: 8,),
                      Row(children: [
                        Icon(Iconsax.location5,size: 16,color: BaseColors.white,),
                        const SizedBox(width: 6,),
                        Text('Pamekasan',style: AppTheme.appTextTheme.smallNoneReguler
                            ?.copyWith(color: BaseColors.white,height: 0),),
                        const SizedBox(width: 13,),
                        Icon(Iconsax.clock5,size: 16,color: BaseColors.white,),
                        const SizedBox(width: 6,),
                        Text('12:00 AM',style: AppTheme.appTextTheme.smallNoneReguler
                            ?.copyWith(color: BaseColors.white,height: 0),),
                      ],)
                    ],
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
