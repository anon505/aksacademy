import 'package:aksacademy/common/colors.dart';
import 'package:aksacademy/presentation/component/common/input.dart';
import 'package:aksacademy/presentation/component/main/home/category.dart';
import 'package:aksacademy/presentation/component/main/home/event_item.dart';
import 'package:aksacademy/presentation/page/detail/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomePage extends StatefulWidget {
  double heightBar;
  HomePage({Key? key,required this.heightBar}) : super(key: key);

  @override
  _HomePageState createState() =>
      _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final RefreshController _refreshController = RefreshController(initialRefresh: false);

  void _onRefresh() async {
  }

  void _onLoading() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    // items.add((items.length + 1).toString());
    if (mounted) setState(() {});
    _refreshController.loadComplete();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: BaseColors.white,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 10,right: 10,bottom: 14),
            child: Input(
              listener: (keyword,isValidate){},
              height: 40,
              hint: 'Cari event...',
              borderRadius: 20,
              alwayShowIcon: true,
              enableValidation: false,
              rightIcon: const Icon(
                Iconsax.search_normal,
                size: 20,
              ),
            ),
          ),

          Expanded(child: SmartRefresher(
            controller: _refreshController,
            onRefresh: _onRefresh,
            onLoading: _onLoading,
            child: CustomScrollView(
              slivers: [
                categoryUI(),
                listItemUI()
              ],
            ),
          ),),
        ],
      ),
    );
  }
  final List<String> _categories=['Semua','Creator','Crypto','Dev'];
  final List<String> _items=['item1','item2','item3','item4'];
  int _selectedCategoryIndex=0;
  SliverList categoryUI() {
    return SliverList(
        delegate: SliverChildListDelegate([
          Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _categories.asMap().entries.map((e) {
                    return Category(
                      index: e.key,
                      caption: e.value,
                      icon: e.key>0 ? Icon(Iconsax.play,size: 14,
                        color: _selectedCategoryIndex==e.key ? BaseColors.white:BaseColors.neutral500,):null,
                      isSelected: _selectedCategoryIndex==e.key,
                      onTap: (key){
                        setState((){
                          _selectedCategoryIndex=key;
                        });
                      },);
                  }).toList(),
                ),
              ),
            ],
          )
        ]),
    );
  }
  SliverList listItemUI() {
    return SliverList(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.only(bottom: index==_items.length-1
                ? widget.heightBar:18,left: 18,right: 14,top:index==0? 14:0),
            child: EventItem(index: index, onTap: (){
              Navigator.pushNamed(context, DetailPage.routeName);
            }),
          );
        },
        childCount: _items.length,
      ),
    );
  }
}
