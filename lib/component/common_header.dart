// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:jd_mall_flutter/common/style/common_style.dart';
import 'package:jd_mall_flutter/common/util/screen_util.dart';
import 'package:jd_mall_flutter/component/image/asset_image.dart';
import 'package:jd_mall_flutter/generated/assets.dart';

Widget commonHeader(BuildContext context, {required String title}) {
  double statusHeight = getStatusHeight();

  return Container(
    height: 42 + statusHeight,
    color: Colors.white,
    width: getScreenWidth(),
    padding: EdgeInsets.only(top: statusHeight),
    child: Row(
      children: [
        GestureDetector(
          onTap: () => Get.back(),
          child: Container(
            height: 42,
            width: 60,
            alignment: Alignment.center,
            child: assetFillImage(Assets.imagesIcBackBlack, 24, 30),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            alignment: Alignment.center,
            child: Text(
              title,
              style: TextStyle(color: CommonStyle.color2A2A2A, fontWeight: FontWeight.w500, fontSize: 20, decoration: TextDecoration.none),
            ),
          ),
        ),
        const SizedBox(height: 42, width: 60)
      ],
    ),
  );
}
