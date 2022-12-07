import 'package:aksacademy/presentation/component/common/warning_widget.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class TicketPage extends StatefulWidget {

  const TicketPage({Key? key}) : super(key: key);

  @override
  _TicketPageState createState() =>
      _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {

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
    return Scaffold(

      body: SmartRefresher(
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: const CustomScrollView(
          slivers: [
            SliverFillRemaining(
              child: Center(
                  child: WarningWidget(
                    asset: 'assets/icons/ic_not_found.png',
                    title: 'Fitur Tidak Ada',
                    subTitle: 'Fitur akan tersedia secepatnya',
                  )),
            )
          ],
        ),
      ),
    );
  }

}
