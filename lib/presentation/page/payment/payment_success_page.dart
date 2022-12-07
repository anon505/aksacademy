import 'package:aksacademy/common/colors.dart';
import 'package:aksacademy/presentation/component/common/button.dart';
import 'package:aksacademy/presentation/component/common/warning_widget.dart';
import 'package:aksacademy/presentation/page/ticket/ticket_detail_page.dart';
import 'package:flutter/material.dart';

class PaymentSuccessPage extends StatefulWidget {
  static const routeName='payment_success_page';
  const PaymentSuccessPage({Key? key, }) : super(key: key);
  @override
  State<PaymentSuccessPage> createState() => _PaymentSuccessState();
}
class _PaymentSuccessState extends State<PaymentSuccessPage> {

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Padding(padding:const EdgeInsets.all(18),child: Column(
        children: [
          const Expanded(child: Center(child: WarningWidget(
            asset: 'assets/icons/ic_payment_success.png',
            title: 'Berhasil',
            subTitle: 'Pembayaran anda sudah berhasil',
          ),)),
          Button(
            listener: (){
              Navigator.pushNamed(context, PaymentSuccessPage.routeName);
            },
            height: 48,
            borderRadius: 12,
            buttonType: ButtonType.solid,
            backgroundColor: BaseColors.neutral100,
            captionColor: BaseColors.neutral600,
            caption: 'Kembali',
          ),
          const SizedBox(height: 14,),
          Button(
            listener: (){
              Navigator.pushNamed(context, TicketDetailPage.routeName);
            },
            height: 48,
            borderRadius: 12,
            buttonType: ButtonType.solid,
            backgroundColor: BaseColors.neutral900,
            captionColor: BaseColors.white,
            caption: 'Lihat Tiket',
          ),
        ],
      ),),
    );
  }
}
