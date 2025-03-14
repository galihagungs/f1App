import 'package:f1_app/bloc/standing/standing_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TeamStanding extends StatefulWidget {
  const TeamStanding({super.key});

  @override
  State<TeamStanding> createState() => _TeamStandingState();
}

class _TeamStandingState extends State<TeamStanding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<StandingBloc, StandingState>(
        builder: (context, state) {
          return Center(child: Text("Data Tidak ada"));
        },
      ),
    );
  }
}
