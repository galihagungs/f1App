import 'package:f1_app/pages/homepage.dart';
import 'package:f1_app/pages/standings/driverStanding.dart';
import 'package:f1_app/style/styling.dart';
import 'package:flutter/material.dart';

class StadingsDriverYearMain extends StatefulWidget {
  const StadingsDriverYearMain({super.key});

  @override
  State<StadingsDriverYearMain> createState() => _StadingsDriverYearMainState();
}

class _StadingsDriverYearMainState extends State<StadingsDriverYearMain>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffee0000),
        title: Text("STANDINGS", style: titleStyleText),

        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.white,
          indicatorColor: Colors.white,
          unselectedLabelColor: Colors.white,
          tabs: const <Widget>[
            Tab(child: Text("Driver")),
            Tab(child: Text("Teams")),
            Tab(child: Text("Race Result")),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const <Widget>[
          Driverstanding(),
          // Homepage(),
          Center(child: Text("It's rainy here")),
          Center(child: Text("It's sunny here")),
        ],
      ),
    );
  }
}
