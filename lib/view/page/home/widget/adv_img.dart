// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';

// Project imports:
import 'package:jd_mall_flutter/common/util/screen_util.dart';
import 'package:jd_mall_flutter/component/image/asset_image.dart';
import 'package:jd_mall_flutter/generated/assets.dart';
import 'package:jd_mall_flutter/routes.dart';
import 'package:jd_mall_flutter/view/page/home/home_controller.dart';

Widget advBanner() {
  return SliverToBoxAdapter(
    child: GestureDetector(
      onTap: () => Get.toNamed(
        RoutesEnum.webViewPage.path,
        arguments: {"url": "https://pro.m.jd.com/mall/active/2WrXYwmYpiy7EpWjDETSVyhXfLCb/index.html"},
      ),
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(0),
        child: Obx(
          () => CachedNetworkImage(
            height: 90,
            imageUrl: HomeController.to.homePageInfo.value.adUrl ?? "",
            placeholder: (context, url) => assetImage(Assets.imagesDefault, getScreenWidth() - 24, 90),
            errorWidget: (context, url, error) => assetImage(Assets.imagesDefault, getScreenWidth() - 24, 90),
            fit: BoxFit.fill,
          ),
        ),
      ),
    ),
  );
}
