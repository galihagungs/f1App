import 'package:f1_app/bloc/standing/standing_bloc.dart';
import 'package:f1_app/style/styling.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RaceResult extends StatefulWidget {
  const RaceResult({super.key});

  @override
  State<RaceResult> createState() => _RaceResultState();
}

class _RaceResultState extends State<RaceResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<StandingBloc, StandingState>(
        builder: (context, state) {
          if (state is StandingLoading) {
            return Center(
              child: CircularProgressIndicator(color: Colors.black),
            );
          } else if (state is StandingSuccesRace) {
            print(state.race.total);
            return ListView.builder(
              itemCount: state.race.total,
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              state.race.races![index].circuit!.circuitName
                                  .toString(),
                              style: normalTextBold,
                            ),
                            Text(
                              state.race.races![index].fastLap!.fastLap
                                  .toString(),
                            ),
                            Text(
                              state.race.races?[index].winner?.shortName
                                      .toString() ??
                                  "Event Not Start Yet",
                              style: normalText,
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
