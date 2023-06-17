import 'package:jd_mall_flutter/common/http/http.dart';
import 'package:jd_mall_flutter/models/goods_page_info.dart';
import 'package:jd_mall_flutter/common/config/config.dart';

class CommonServiceApi {
  static Future queryGoodsListByPage(String code, int currentPage, int pageSize) async {
    var res = await httpManager.post(
        '${config.host}/common/queryGoodsListByPage', {"code": code, "currentPage": currentPage, "pageSize": pageSize}, null, null);
    if (res?.code != '0') {
      return null;
    }
    return GoodsPageInfo.fromJson(res?.data ?? {});
  }
}