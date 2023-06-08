import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:jd_mall_flutter/common/widget/image/asset_image.dart';
import 'package:jd_mall_flutter/redux/app_state.dart';
import 'package:jd_mall_flutter/page/welcome/util.dart';
import '../../../common/localization/default_localizations.dart';
import '../../../common/style/common_style.dart';
import '../../../common/widget/persistentHeader/sliver_header_builder.dart';
import '../redux/mine_page_state.dart';

Widget infoHeader(BuildContext context) {
  return StoreConnector<AppState, MinePageState>(converter: (store) {
    return store.state.minePageState;
  }, builder: (context, state) {
    HeaderSize headerSize = calcSize(state.pageScrollY);

    Widget title = Positioned(
      top: 0,
      left: (MediaQuery.of(context).size.width - 100) / 2,
      child: Container(
        width: 100,
        height: 36,
        alignment: Alignment.center,
        child: Opacity(
          opacity: headerSize.opacity,
          child: Text(
            MallLocalizations.i18n(context).tab_main_mine,
            style: const TextStyle(color: Colors.black, fontSize: 22),
          ),
        ),
      ),
    );

    Widget header = Positioned(
        top: headerSize.top,
        left: 0,
        child: Container(
            width: headerSize.size,
            height: headerSize.size,
            margin: const EdgeInsets.only(left: 16),
            decoration: const ShapeDecoration(
                shape: CircleBorder(), image: DecorationImage(fit: BoxFit.contain, image: AssetImage("images/header.png")))));

    Widget userInfo = Positioned(
      top: headerSize.name2Top,
      left: 100,
      child: SizedBox(
          width: MediaQuery.of(context).size.width - 100,
          height: 60,
          child: Opacity(
            opacity: 1 - headerSize.opacity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  MallLocalizations.i18n(context).author,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    const Text("积分: 200", style: TextStyle(fontSize: 16)),
                    Container(margin: const EdgeInsets.only(left: 20), child: const Text("信用值: 1200", style: TextStyle(fontSize: 16)))
                  ],
                )
              ],
            ),
          )),
    );

    return SliverPersistentHeader(
      pinned: true,
      delegate: SliverHeaderDelegate(
        //有最大和最小高度
        maxHeight: 130 + MediaQueryData.fromView(View.of(context)).padding.top,
        minHeight: 48 + MediaQueryData.fromView(View.of(context)).padding.top,
        child: Container(
            padding: EdgeInsets.fromLTRB(0, MediaQueryData.fromView(View.of(context)).padding.top, 0, 0),
            decoration: const BoxDecoration(
                image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("images/mine_top_bg.png"),
            )),
            child: Stack(
              alignment: Alignment.center,
              fit: StackFit.expand,
              children: <Widget>[
                Positioned(
                  top: 4,
                  right: 116,
                  child: assetImage('images/ic_friend.png', 26, 26),
                ),
                Positioned(
                  top: 4,
                  right: 66,
                  child: assetImage('images/ic_setting.png', 28, 28),
                ),
                Positioned(
                  top: 4,
                  right: 18,
                  child: assetImage('images/ic_message.png', 28, 28),
                ),
                title,
                header,
                userInfo
              ],
            )),
      ),
    );
  });
}

double maxTop = 40;
double minTop = 4;
double nameMaxTop = 48;
double maxSize = 70;
double minSize = 30;
double maxOpacity = 1;
double minOpacity = 0;

HeaderSize calcSize(double y) {
  double toTop = maxTop - y * 0.8;
  double name2Top = nameMaxTop - y * 0.8;
  double realSize = maxSize - y * 0.8;
  double opacity = minOpacity + y * 0.01;
  if (toTop < minTop) toTop = minTop;
  if (toTop > maxTop) toTop = maxTop;
  if (name2Top < minTop) name2Top = minTop;
  if (name2Top > nameMaxTop) name2Top = nameMaxTop;
  if (realSize > maxSize) realSize = maxSize;
  if (realSize < minSize) realSize = minSize;

  if (opacity > maxOpacity) opacity = maxOpacity;
  if (opacity < minOpacity) opacity = minOpacity;

  return HeaderSize(toTop, name2Top, realSize, opacity);
}

class HeaderSize {
  double top;
  double name2Top;
  double size;
  double opacity;

  HeaderSize(this.top, this.name2Top, this.size, this.opacity);
}
