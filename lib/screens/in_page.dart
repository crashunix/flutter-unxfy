import 'package:flutter/material.dart';
import 'package:unxfy/layouts/homepage_layout.dart';
import 'package:unxfy/styles/app_styles.dart';

class InPage extends StatefulWidget {
  const InPage({Key? key}) : super(key: key);

  @override
  State<InPage> createState() => _InPageState();
}

class _InPageState extends State<InPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final _tabs = [
    Tab(text: 'Entradas'),
    Tab(text: 'Impostos'),
  ];

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return HomePageLayout(
      header_title: 'Home',
      header_label: 'Entradas - impostos',
      header_value: 2045.45,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text('In'),
        TabBar(
          controller: _tabController,
          tabs: _tabs,
          labelColor: kDarkGrey,
          indicatorColor: kDarkGrey,
          unselectedLabelColor: kGrey,
          indicatorSize: TabBarIndicatorSize.label,
          padding: EdgeInsets.zero,
          isScrollable: false,
        ),
      ]),
    );
  }
}
