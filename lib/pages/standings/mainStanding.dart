import 'package:f1_app/bloc/standing/standing_bloc.dart';
import 'package:f1_app/pages/standings/driverStanding.dart';
import 'package:f1_app/pages/standings/raceresult.dart';
import 'package:f1_app/pages/standings/teamStanding.dart';
import 'package:f1_app/style/styling.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final yearsad = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffee0000),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
              context.read<StandingBloc>().add(LastYearChamp());
            },
            icon: Icon(Icons.output, color: Colors.white),
          ),
        ],
        title: Text("STANDINGS", style: titleStyleText),
        bottom: TabBar(
          onTap: (value) {
            if (value == 0) {
              context.read<StandingBloc>().add(
                GetYearSeasonDriver(year: yearsad),
              );
            } else if (value == 1) {
              context.read<StandingBloc>().add(
                GetYearSeasonTeam(year: yearsad),
              );
            }
            // else if (value == 2) {
            //   context.read<StandingBloc>().add(
            //     GetYearSeasonRace(year: yearsad),
            //   );
            // }
          },
          controller: _tabController,
          labelColor: Colors.white,
          indicatorColor: Colors.white,
          unselectedLabelColor: Colors.white,
          tabs: const <Widget>[
            Tab(child: Text("Driver")),
            Tab(child: Text("Teams")),
            // Tab(child: Text("Race Result")),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const <Widget>[
          Driverstanding(),
          // Homepage(),
          TeamStanding(),
          // RaceResult(),
        ],
      ),
    );
  }
}
