import 'package:f1_app/bloc/standing/standing_bloc.dart';
import 'package:f1_app/style/styling.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Driverstanding extends StatefulWidget {
  const Driverstanding({super.key});

  @override
  State<Driverstanding> createState() => _DriverstandingState();
}

class _DriverstandingState extends State<Driverstanding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: BlocBuilder<StandingBloc, StandingState>(
          builder: (context, state) {
            if (state is StandingLoading) {
              return Center(
                child: CircularProgressIndicator(color: Colors.white),
              );
            } else if (state is StandingSucces) {
              return ListView.builder(
                itemCount: state.standings.total,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 80,
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Center(
                                child: Text(
                                  state
                                      .standings
                                      .driversChampionship![index]
                                      .driver!
                                      .number
                                      .toString(),
                                  style: header2TextBlack,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "${state.standings.driversChampionship![index].driver!.name.toString()} ",
                                        style: normalText16,
                                      ),
                                      Text(
                                        state
                                            .standings
                                            .driversChampionship![index]
                                            .driver!
                                            .surname
                                            .toString(),
                                        style: normalTextBold16,
                                      ),
                                    ],
                                  ),
                                  Text(
                                    state
                                        .standings
                                        .driversChampionship![index]
                                        .team!
                                        .teamName
                                        .toString(),
                                    style: normalTextBold16,
                                  ),
                                ],
                              ),
                            ),

                            Text(
                              state.standings.driversChampionship![index].points
                                  .toString(),
                              style: normalTextBold16,
                            ),
                          ],
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
      ),
    );
  }
}
