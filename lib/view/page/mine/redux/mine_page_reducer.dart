import 'package:redux/redux.dart';
import 'package:jd_mall_flutter/view/page/mine/redux/mine_page_action.dart';
import 'package:jd_mall_flutter/view/page/mine/redux/mine_page_state.dart';

import 'package:jd_mall_flutter/models/goods_page_info.dart';

final minePageReducer = combineReducers<MinePageState>([
  TypedReducer<MinePageState, ChangeBackTopAction>((state, action) => state..showBackTop = action.value),
  //记录页面滚动距离
  TypedReducer<MinePageState, ChangePageScrollYAction>((state, action) => state..pageScrollY = action.value),
  //记录九宫格菜单滚动index
  TypedReducer<MinePageState, ChangeSliderIndexAction>((state, action) => state..menuIndex = action.menuIndex),
  //记录滚动tab index
  TypedReducer<MinePageState, SetCurrentTab>((state, action) => state..currentTab = action.value),
  //
  TypedReducer<MinePageState, InitMineMenuTabInfoAction>((state, action) => state..menuTabInfo = action.menuTabInfo),
]);
