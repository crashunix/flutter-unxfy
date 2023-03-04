import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:unxfy/screens/dashboard_page.dart';
import 'package:unxfy/screens/in_page.dart';
import 'package:unxfy/screens/out_page.dart';
import 'package:unxfy/screens/savings_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;
  late PageController pc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pc = PageController(initialPage: currentPage);
  }

  setCurrentPage(index) {
    setState(() {
      currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        onPageChanged: setCurrentPage,
        controller: pc,
        children: [
          DashboardPage(),
          InPage(),
          OutPage(),
          SavingsPage(),
        ],
      ),
      bottomNavigationBar: GNav(
          selectedIndex: currentPage,
          gap: 8,
          onTabChange: (index) {
            pc.animateToPage(index,
                duration: Duration(milliseconds: 400), curve: Curves.ease);
          },
          tabs: const [
            GButton(
              icon: Icons.home_outlined,
              text: 'Home',
            ),
            GButton(icon: Icons.attach_money, text: 'In'),
            GButton(
              icon: Icons.money_off,
              text: 'Out',
            ),
            GButton(
              icon: Icons.savings_outlined,
              text: 'Savings',
            )
          ]),
    );
  }
}
