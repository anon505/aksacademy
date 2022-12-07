import 'package:aksacademy/common/app_theme.dart';
import 'package:aksacademy/common/colors.dart';
import 'package:aksacademy/presentation/component/common/app_navbar.dart';
import 'package:aksacademy/presentation/component/common/button.dart';
import 'package:aksacademy/presentation/component/common/input.dart';
import 'package:aksacademy/presentation/page/payment/payment_success_page.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProfileEditPage extends StatefulWidget {
  static const routeName='profile_edit_page';
  const ProfileEditPage({Key? key, }) : super(key: key);
  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}
class _ProfileEditPageState extends State<ProfileEditPage> {

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
        titleView: Text('Pengaturan',style: AppTheme.appTextTheme
            .regulerNoneMedium?.copyWith(height: 0,color: BaseColors.neutral900),),
        actions: [
          InkWell(
            child: const Icon(Iconsax.info_circle),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const SizedBox(width: 12,),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset('assets/dummies/ic_avatar.png',width: 64,height: 64,),
                  const SizedBox(width: 20,),
                  InkWell(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: BaseColors.primary50,
                      ),
                      child: Row(
                        children: [
                          Icon(Iconsax.folder_2,size: 16,color: BaseColors.primary500,),
                          const SizedBox(width: 8,),
                          Text('Pilih Gambar',style: AppTheme.appTextTheme.xSmallNormalMedium
                            ?.copyWith(height: 0,color: BaseColors.primary500),)
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12,),
                  Container(
                    width: 32,
                    height: 32,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: BaseColors.neutral400)
                    ),
                    child: Icon(Iconsax.trash,size: 16,color: BaseColors.neutral400,),
                  ),
                ],
              ),
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
              const SizedBox(height: 14,),
              Input(
                caption: 'Kata Sandi',
                hint: '********',
                height: 40,
                obsecureText: true,
                backgroundColor: BaseColors.white,
                listener: (){

                },
              ),
              const SizedBox(height: 14,),
              Input(
                caption: 'Alamat',
                hint: 'Alamat...',
                height: 40,
                backgroundColor: BaseColors.white,
                listener: (){

                },
              ),
            ],
          ),
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
          caption: 'Simpan',
        ),
      ),
    );
  }
}
