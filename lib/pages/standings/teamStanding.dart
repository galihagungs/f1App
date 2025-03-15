import 'package:f1_app/bloc/standing/standing_bloc.dart';
import 'package:f1_app/style/styling.dart';
import 'package:f1_app/widget/flagNation.dart';
import 'package:f1_app/widget/teamLogos.dart';
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
          if (state is StandingLoading) {
            return Center(
              child: CircularProgressIndicator(color: Colors.black),
            );
          } else if (state is StandingSuccesTeam) {
            return ListView.builder(
              itemCount: state.team.total,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 110,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 16,
                        bottom: 16,
                        right: 16,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      teamLogos(
                                        state
                                                .team
                                                .constructorsChampionship?[index]
                                                .team
                                                ?.teamName
                                                ?.toString() ??
                                            'Unknown',
                                        35,
                                      ),
                                      SizedBox(width: 10),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${state.team.constructorsChampionship?[index].team?.teamName} ",
                                            style: normalTextBold16,
                                          ),
                                          Row(
                                            children: [
                                              flagNation(
                                                state
                                                    .team
                                                    .constructorsChampionship![index]
                                                    .team!
                                                    .country
                                                    .toString(),
                                                15,
                                              ),
                                              SizedBox(width: 10),
                                              Text(
                                                state
                                                            .team
                                                            .constructorsChampionship?[index]
                                                            .team
                                                            ?.country
                                                            .toString() ==
                                                        "null"
                                                    ? "0"
                                                    : state
                                                        .team
                                                        .constructorsChampionship![index]
                                                        .team!
                                                        .country
                                                        .toString(),
                                                style: normalTextBold,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            Text(
                              state.team.constructorsChampionship![index].points
                                  .toString(),
                              style: normalTextBold16,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return Center(child: Text("Data Tidak ada"));
        },
      ),
    );
  }
}
