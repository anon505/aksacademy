import 'package:aksacademy/common/app_theme.dart';
import 'package:aksacademy/common/colors.dart';
import 'package:aksacademy/presentation/component/common/app_navbar.dart';
import 'package:aksacademy/presentation/component/profile/profile_menu_item.dart';
import 'package:aksacademy/presentation/page/profile/profile_edit_page.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProfilePage extends StatefulWidget {
  static const routeName='profile_page';
  const ProfilePage({Key? key, }) : super(key: key);
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}
class _ProfilePageState extends State<ProfilePage> {

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(

      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  children: [
                    Image.asset('assets/icons/ic_profile_header.png'),
                    Positioned.fill(child:
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset('assets/dummies/ic_avatar.png',width: 94,height: 94,),
                          const SizedBox(height: 18,),
                          Text('Brenda Morena',style: AppTheme.appTextTheme
                              .interBold?.copyWith(height: 0,color: BaseColors.neutral900),),
                          const SizedBox(height: 12,),
                          Text('brenda@gmail.com',style: AppTheme.appTextTheme
                              .smallNoneReguler?.copyWith(height: 0,color: BaseColors.neutral500),)
                        ],
                      )
                    )
                  ],
                ),
                ProfileMenuItem(
                    imgMenu: 'assets/icons/ic_profile_menu_1.png',
                    caption: 'Pengaturan Akun',
                    onTap: (){

                    }
                ),
                ProfileMenuItem(
                    imgMenu: 'assets/icons/ic_profile_menu_2.png',
                    caption: 'Daftar Pembelian',
                    onTap: (){

                    }
                ),
                ProfileMenuItem(
                    imgMenu: 'assets/icons/ic_profile_menu_3.png',
                    caption: 'Tiket Saya',
                    onTap: (){

                    }
                ),
                ProfileMenuItem(
                    imgMenu: 'assets/icons/ic_profile_menu_4.png',
                    caption: 'Kebijakan Privasi',
                    onTap: (){

                    }
                ),
                ProfileMenuItem(
                    imgMenu: 'assets/icons/ic_profile_menu_5.png',
                    caption: 'Syarat & Ketentuan',
                    onTap: (){

                    }
                ),
                ProfileMenuItem(
                    imgMenu: 'assets/icons/ic_profile_menu_6.png',
                    caption: 'Bantuan',
                    onTap: (){

                    }
                ),
                ProfileMenuItem(
                    imgMenu: 'assets/icons/ic_profile_menu_7.png',
                    caption: 'Keluar',
                    onTap: (){

                    }
                ),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 80,
            child: AppNavBar(
              backColor: Colors.transparent,
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
                    Navigator.pushNamed(context, ProfileEditPage.routeName);
                  },
                ),
                const SizedBox(width: 12,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
