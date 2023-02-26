import 'package:aksacademy/presentation/component/common/warning_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/framework.dart';

class NoInternetWidget extends StatelessWidget {
  const NoInternetWidget(
      {Key? key,
      this.asset = 'assets/icons/signal.png',
      this.title = "Jaringan Terputus",
      this.subTitle = "Jaringan anda terputus, silahkan cek koneksi anda."})
      : super(key: key);
  final String asset;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(top: 24, left: 18, right: 18, bottom: 24),
      child: WarningWidget(
        asset: asset,
        title: title,
        subTitle: subTitle,
        confirmButtonText: "Coba Lagi",
        onConfirmButtonTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
