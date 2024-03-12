// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_redux/flutter_redux.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

// Project imports:
import 'package:jd_mall_flutter/component/page_menu.dart';
import 'package:jd_mall_flutter/models/mine_menu_tab_info.dart';
import 'package:jd_mall_flutter/store/app_state.dart';
import 'package:jd_mall_flutter/view/page/mine/mine_controller.dart';

Widget singleLineMenu(BuildContext context, MineController controller) {
  return Obx(
    () {
      List<FunctionInfo> menuData = controller.menuTabInfo.value.functionList ?? [];

      return SliverToBoxAdapter(
        child: PageMenu(menuDataList: menuData),
      );
    },
  );
}
