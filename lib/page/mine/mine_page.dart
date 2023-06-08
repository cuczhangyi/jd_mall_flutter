import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:jd_mall_flutter/common/style/common_style.dart';
import 'package:jd_mall_flutter/page/mine/widget/info_header.dart';
import 'package:jd_mall_flutter/page/mine/widget/order-card.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../common/util/refresh_util.dart';
import '../../common/widget/back_to_top.dart';
import '../../redux/app_state.dart';
import '../mine/redux/mine_page_action.dart';

class MinePage extends StatefulWidget {
  const MinePage({super.key});

  static const String name = "/mine";

  @override
  State<MinePage> createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  final ScrollController _scrollController = ScrollController();
  final RefreshController _refreshController = RefreshController();

  @override
  Widget build(BuildContext context) {
    return StoreBuilder<AppState>(onInit: (store) {
      // store.dispatch(InitDataAction());
    }, builder: (context, store) {
      return NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification notification) {
            if (notification.depth == 0) {
              double distance = notification.metrics.pixels;
              store.dispatch(ChangePageScrollYAction(distance));
            }
            return false;
          },
          child: Container(
              color: CommonStyle.colorF5F5F5,
              child: Scaffold(
                body: SmartRefresher(
                  controller: _refreshController,
                  enablePullUp: true,
                  onRefresh: () async {
                    refreshSuccess(_refreshController);
                  },
                  onLoading: () async {
                    loadMoreSuccess(_refreshController);
                  },
                  child: CustomScrollView(
                    controller: _scrollController,
                    slivers: [infoHeader(context), orderCard(context)],
                  ),
                ),
                floatingActionButton: BackToTop(_scrollController),
              )));
    });
  }
}
