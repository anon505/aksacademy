
import 'dart:ui';

import 'package:aksacademy/common/app_theme.dart';
import 'package:aksacademy/common/colors.dart';
import 'package:aksacademy/presentation/component/common/app_navbar.dart';
import 'package:aksacademy/presentation/component/common/bottom_navbar.dart';
import 'package:aksacademy/presentation/page/main/discover/discover_page.dart';
import 'package:aksacademy/presentation/page/main/home/home_page.dart';
import 'package:aksacademy/presentation/page/main/ticket/ticket_page.dart';
import 'package:aksacademy/presentation/page/profile/profile_page.dart';
import 'package:aksacademy/presentation/page/upload/upload_page.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class MainPage extends StatefulWidget {

  const MainPage({Key? key, }) : super(key: key);
  @override
  State<MainPage> createState() => _MainPageState();
}
class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  double _heightBar=0;
  void _onItemTapped(int index) {
    if(index==3){
      Navigator.pushNamed(context, UploadPage.routeName);
    }else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }
  late var pages;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pages = [
      HomePage(heightBar: _heightBar,),
      const DiscoverPage(),
      const TicketPage(),
    ];
  }
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
          child: const Icon(Iconsax.menu_1),
          onTap: () {
          },
        ),
        titleView: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/icons/ic_logo_android.png', width: 24,height: 24,),
            const SizedBox(width: 8,),
            Text('Aksacademy',style: AppTheme.appTextTheme.regulerTightMedium?.copyWith(color: BaseColors.neutral900,height: 0),)
          ],
        ),
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                child: Stack(
                  children: [
                    const Icon(Iconsax.notification_bing),
                    Positioned(left:13,top:3,child: Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(4)),
                        color: BaseColors.danger500,
                      ),
                    )),
                  ],
                ),
                onTap: (){
                },
              ),
            ],
          ),
          const SizedBox(width: 12,),
        ],
      ),
      body: Stack(
        children: [
          HomePage(heightBar: _heightBar,),
          Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child:ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 10.0,
                      sigmaY: 10.0,
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      height: _heightBar,
                    ),
                  ),
                ),
              ),

              Align(
                alignment: Alignment.bottomCenter,
                child:BottomNavbar(
                  child: BottomNavigationBar(
                    currentIndex: _selectedIndex,
                    type: BottomNavigationBarType.fixed,
                    backgroundColor: BaseColors.white.withOpacity(0.8),
                    selectedItemColor: BaseColors.primary500,
                    onTap: _onItemTapped,
                    showSelectedLabels: false,
                    showUnselectedLabels: false,
                    items: [
                      BottomNavigationBarItem(
                          label:'',
                          icon: Icon(() {
                            if (_selectedIndex == 0) {
                              return Iconsax.home_25;
                            } else {
                              return Iconsax.home_2;
                            }
                          }())
                      ),
                      BottomNavigationBarItem(
                          label:'',
                          icon: Icon(() {
                            if (_selectedIndex == 1) {
                              return Iconsax.discover_14;
                            } else {
                              return Iconsax.discover;
                            }
                          }())
                      ),
                      BottomNavigationBarItem(
                          label:'',
                          icon: Icon(() {
                            if (_selectedIndex == 2) {
                              return Iconsax.ticket_star;
                            } else {
                              return Iconsax.ticket_star;
                            }
                          }())
                      ),
                      BottomNavigationBarItem(
                        label:'',
                        icon: Image.asset('assets/dummies/ic_avatar.png',width: 24,height: 24,),
                      ),
                    ],
                  ),
                  onChange: (size){
                    if(size==null) return;
                    setState((){
                      _heightBar=(size as Size).height;
                    });

                  },
                ),
              ),
            ],
          )


        ],
      ),
    );
  }
}
