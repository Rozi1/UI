import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rozi_design/view/analysis.dart';
import 'package:rozi_design/view/detail_page.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  late PageController _pageController;
  int pageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  onPageChanged(int pageIndex) {
    setState(() {
      this.pageIndex = pageIndex;
    });
  }

  onTap(int pageIndex) {
    _pageController.animateToPage(pageIndex,
        duration: Duration(microseconds: 300), curve: Curves.bounceIn);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: PageView(
          controller: _pageController,
          onPageChanged: onPageChanged,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            AnalysisPage(),
            Center(
              child: Text(
                "Featured",
              ),
            ),
            Center(
              child: Text(
                "Europe",
              ),
            ),
          ],
        ),
        bottomNavigationBar: CupertinoTabBar(
          height: 80,
          // border: Border(top: BorderSide(color: Colors.white)),
          backgroundColor: Colors.blue[900],
          currentIndex: pageIndex,
          onTap: onTap,
          activeColor: Colors.orange,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined)),
            BottomNavigationBarItem(icon: Icon(Icons.calendar_month_outlined)),
            BottomNavigationBarItem(icon: Icon(Icons.person_outline))
          ],
        ),
      ),
    );
  }
}
