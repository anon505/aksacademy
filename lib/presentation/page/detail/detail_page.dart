import 'package:aksacademy/common/app_theme.dart';
import 'package:aksacademy/common/colors.dart';
import 'package:aksacademy/common/utils.dart';
import 'package:aksacademy/presentation/component/common/app_navbar.dart';
import 'package:aksacademy/presentation/component/common/button.dart';
import 'package:aksacademy/presentation/page/payment/payment_page.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class DetailPage extends StatefulWidget {
  static const routeName='detail_page';
  const DetailPage({Key? key, }) : super(key: key);
  @override
  State<DetailPage> createState() => _DetailPageState();
}
class _DetailPageState extends State<DetailPage> {

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppNavBar(
        foreColor: BaseColors.neutral900,
        leadingView: InkWell(
          child: const Icon(Iconsax.arrow_left),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          InkWell(
            child: const Icon(Iconsax.menu),
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/dummies/ic_tutorial_2.png'),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 14,horizontal: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Desain Grafis',style: AppTheme.appTextTheme.tinyNormalReguler
                      ?.copyWith(height: 0,color: BaseColors.primary500,),textAlign: TextAlign.start,),
                  const SizedBox(height: 8,),
                  Row(
                    children: [
                      Expanded(child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Refactoring UI',maxLines:1,style: AppTheme.appTextTheme.extraLargeNormalBold
                              ?.copyWith(color: BaseColors.neutral900,height: 0,overflow: TextOverflow.ellipsis),),
                          const SizedBox(height: 8,),
                          Row(children: [
                            Icon(Iconsax.location5,size: 16,color: BaseColors.neutral500,),
                            const SizedBox(width: 6,),
                            Text('Pamekasan',style: AppTheme.appTextTheme.smallNoneReguler
                                ?.copyWith(color: BaseColors.neutral500,height: 0),),
                            const SizedBox(width: 13,),
                            Icon(Iconsax.clock5,size: 16,color: BaseColors.neutral500,),
                            const SizedBox(width: 6,),
                            Text('12:00 AM',style: AppTheme.appTextTheme.smallNoneReguler
                                ?.copyWith(color: BaseColors.neutral500,height: 0),),
                          ],)
                        ],
                      )),
                      Container(
                        decoration: BoxDecoration(
                            color: BaseColors.white,
                            borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: BaseColors.neutral100,width: 1)
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
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 18),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: BaseColors.white,
                boxShadow: [BoxShadow(color: HexColor.fromHex('#2729371f'),blurRadius: 40),],
              ),
              padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 12),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: BaseColors.neutral700
                    ),
                    child: Text('Speaker',style: AppTheme
                      .appTextTheme.regulerNoneReguler?.copyWith(height: 0,color: BaseColors.white),),
                  ),
                  const SizedBox(width: 14,),
                  Image.asset('assets/dummies/ic_avatar.png',height: 38,width: 38,),
                  const SizedBox(width: 12,),
                  Expanded(child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Rebecca Ivanov',style: AppTheme.appTextTheme.smallNoneMedium
                          ?.copyWith(height: 0,color: BaseColors.neutral900),),
                      const SizedBox(height: 8,),
                      Text('Head of Design Tesla Corp',style: AppTheme.appTextTheme.tinyNormalReguler
                          ?.copyWith(height: 0,color: BaseColors.neutral900),)
                    ],
                  )),

                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(18),
              child: Text(lorem(),style: AppTheme.appTextTheme.smallNormalReguler?.copyWith(color: BaseColors.neutral500,height: 0),),
            ),
            Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: BaseColors.neutral100,width: 1),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text('Ticket',style: AppTheme.appTextTheme.xSmallTightReguler
                          ?.copyWith(height: 0,color: BaseColors.neutral900),),
                      Expanded(child: Text('IDR 300K',textAlign:TextAlign.end,style: AppTheme.appTextTheme
                          .smallNoneMedium?.copyWith(height: 0,
                          color: BaseColors.neutral900),))
                    ],
                  ),
                  const SizedBox(height: 14,),
                  Button(listener: (){
                    Navigator.pushNamed(context, PaymentPage.routeName);
                  }, buttonType: ButtonType.solid,backgroundColor: BaseColors.neutral900,captionColor: BaseColors.white,caption: 'Beli Tiket',)
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
