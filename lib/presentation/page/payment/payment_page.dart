import 'package:aksacademy/common/app_theme.dart';
import 'package:aksacademy/common/colors.dart';
import 'package:aksacademy/presentation/component/common/app_navbar.dart';
import 'package:aksacademy/presentation/component/common/button.dart';
import 'package:aksacademy/presentation/component/common/input.dart';
import 'package:aksacademy/presentation/page/payment/payment_success_page.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class PaymentPage extends StatefulWidget {
  static const routeName='payment_page';
  const PaymentPage({Key? key, }) : super(key: key);
  @override
  State<PaymentPage> createState() => _PaymentPageState();
}
class _PaymentPageState extends State<PaymentPage> {

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
            child: const Icon(Iconsax.setting),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const SizedBox(width: 12,),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 14,horizontal: 12),
              margin: const EdgeInsets.symmetric(horizontal: 18),
              decoration: BoxDecoration(
                color: BaseColors.neutral100,
                borderRadius: BorderRadius.circular(14)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Peserta',style: AppTheme.appTextTheme.regulerNormalMedium
                    ?.copyWith(height: 0,color: BaseColors.neutral900),),
                  const SizedBox(height: 14,),
                  Input(
                    caption: 'Nama Lengkap',
                    hint: 'Nama Lengkap',
                    height: 40,
                    backgroundColor: BaseColors.white,
                    listener: (){

                    },
                  ),
                  const SizedBox(height: 14,),
                  Input(
                    caption: 'Email',
                    hint: 'email@domain.com',
                    height: 40,
                    backgroundColor: BaseColors.white,
                    listener: (){

                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24,),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 18),
              child:Row(
                children: [
                  Text('Harga Tiket',
                    style: AppTheme.appTextTheme.smallTightReguler?.copyWith(height: 0,color: BaseColors.neutral500),),
                  Expanded(
                      child: Text('Rp300.000,00',
                        textAlign: TextAlign.end,
                        style: AppTheme.appTextTheme.regulerNormalMedium?.copyWith(height: 0,color: BaseColors.neutral900),
                      ),
                  )
                ],
              )
            ),
            const SizedBox(height: 14,),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 18),
                child:Row(
                  children: [
                    Text('Diskon',
                      style: AppTheme.appTextTheme.smallTightReguler?.copyWith(height: 0,color: BaseColors.neutral500),),
                    Expanded(
                      child: Text('0%',
                        textAlign: TextAlign.end,
                        style: AppTheme.appTextTheme.regulerNormalMedium?.copyWith(height: 0,color: BaseColors.neutral900),
                      ),
                    )
                  ],
                )
            ),
            const SizedBox(height: 14,),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 18),
                child:Row(
                  children: [
                    Text('Pajak',
                      style: AppTheme.appTextTheme.smallTightReguler?.copyWith(height: 0,color: BaseColors.neutral500),),
                    Expanded(
                      child: Text('11%',
                        textAlign: TextAlign.end,
                        style: AppTheme.appTextTheme.regulerNormalMedium?.copyWith(height: 0,color: BaseColors.neutral900),
                      ),
                    )
                  ],
                )
            ),
            const SizedBox(height: 14,),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 18),
                child:Row(
                  children: [
                    Text('Total',
                      style: AppTheme.appTextTheme.smallTightReguler?.copyWith(height: 0,color: BaseColors.neutral500),),
                    Expanded(
                      child: Text('Rp333.000,00',
                        textAlign: TextAlign.end,
                        style: AppTheme.appTextTheme.regulerNormalMedium?.copyWith(height: 0,color: BaseColors.neutral900),
                      ),
                    )
                  ],
                )
            ),
            const SizedBox(height: 18,),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Text('Pembayaran',style: AppTheme.appTextTheme.largeTightMedium?.copyWith(height: 0,color: BaseColors.neutral900),),
            ),
            ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(18),
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/dummies/ic_payment_apple.png',height: 36,width: 36,),
                    const SizedBox(width: 12,),
                    Expanded(child:Text('Apple Pay',style: AppTheme.appTextTheme.largeTightMedium?.copyWith(height: 0,color: BaseColors.neutral900),)),
                    const SizedBox(width: 12,),
                    Image.asset('assets/dummies/ic_payment_radio_off.png',height: 24,width: 24,)
                  ],
                ),
                const SizedBox(height: 14,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/dummies/ic_payment_google.png',height: 36,width: 36,),
                    const SizedBox(width: 12,),
                    Expanded(child:Text('Google Pay',style: AppTheme.appTextTheme.largeTightMedium?.copyWith(height: 0,color: BaseColors.neutral900),)),
                    const SizedBox(width: 12,),
                    Image.asset('assets/dummies/ic_payment_radio_on.png',height: 24,width: 24,)
                  ],
                ),
              ],
            )

          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(18),
        child: Button(
          listener: (){
            Navigator.pushNamed(context, PaymentSuccessPage.routeName);
          },
          buttonType: ButtonType.solid,
          backgroundColor: BaseColors.neutral900,
          captionColor: BaseColors.white,
          caption: 'Bayar',
        ),
      ),
    );
  }
}
