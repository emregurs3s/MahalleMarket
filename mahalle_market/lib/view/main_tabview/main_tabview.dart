import 'package:flutter/material.dart';
import 'package:mahalle_market/common/color_extensions.dart';
import 'package:mahalle_market/view/home/home_view.dart';

class MainTabview extends StatefulWidget {
  const MainTabview({super.key});

  @override
  State<MainTabview> createState() => _MainTabviewState();
}

class _MainTabviewState extends State<MainTabview> {
  int selctTab = 2;
  PageStorageBucket storageBucket = PageStorageBucket();
  Widget selectPageView = const HomeView();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(bucket: storageBucket, child: selectPageView),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (selctTab != 2) {
            selctTab = 2;
            selectPageView = HomeView();
          } else {}
          if (mounted) {
            setState(() {});
          }
        },
        backgroundColor: selctTab == 2 ? TColor.primary : TColor.placeholder,
        child: Container(
          width: 60,
          height: 60,
          alignment: Alignment.center,
          child: Image.asset(
            "assets/img/home.png",
            width: 50,
            height: 50,
          ),
        ),
      ),
    );
  }
}
