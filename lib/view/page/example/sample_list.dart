import 'package:flutter/material.dart';
import 'package:jd_mall_flutter/view/page/example/snow_man.dart';
import 'package:jd_mall_flutter/view/page/example/widget/list_item.dart';
import 'package:jd_mall_flutter/view/page/example/Interlaced_animation.dart';
import 'package:jd_mall_flutter/view/page/example/breathing_method.dart';
import 'package:jd_mall_flutter/component/common_header.dart';

class SampleList extends StatefulWidget {
  const SampleList({Key? key}) : super(key: key);
  static const String name = "/sampleList";

  @override
  State<SampleList> createState() => _SampleListState();
}

class _SampleListState extends State<SampleList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          commonHeader(context, title: "案例"),
          Expanded(
            flex: 1,
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                ListItem(
                  title: '【动画】之交错动画',
                  subtitle: '【动画】之交错动画',
                  icon: Icons.person,
                  onTap: () => Navigator.of(context).pushNamed(InterlacedAnimationDemo.name),
                ),
                ListItem(
                  title: '【动画】之CustomPointer',
                  subtitle: '【动画】之CustomPointer',
                  icon: Icons.line_style,
                  onTap: () => Navigator.of(context).pushNamed(SnowManDemo.name),
                ),
                ListItem(
                  title: '【动画】之478呼吸法',
                  subtitle: '【动画】之478呼吸法',
                  icon: Icons.tab_rounded,
                  onTap: () => Navigator.of(context).pushNamed(BreathingMethod.name),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
