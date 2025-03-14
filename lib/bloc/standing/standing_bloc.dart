import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:f1_app/model/Standings.dart';
import 'package:f1_app/model/standingsteam.dart';
import 'package:f1_app/service/api/f1.dart';
import 'package:meta/meta.dart';

part 'standing_event.dart';
part 'standing_state.dart';

class StandingBloc extends Bloc<StandingEvent, StandingState> {
  StandingBloc() : super(StandingInitial()) {
    on<StandingEvent>((event, emit) async {
      if (event is LastYearChamp) {
        emit(StandingLoading());
        final data = await F1Api().getSeason();
        // print(data.championships?[1].year);
        final year = data.championships?[1].year;
        if (year != null) {
          final dataLast = await F1Api().getDriverStandingbySeason(year);

          emit(StandingSucces(dataLast));
        } else {
          emit(StandingFailed("Year is null"));
        }
      } else if (event is GetYearSeasonDriver) {
        emit(StandingLoading());
        final data = await F1Api().getDriverStandingbySeason(event.year);
        emit(StandingSucces(data));
      } else if (event is GetYearSeasonTeam) {
        emit(StandingLoading());
        final data = await F1Api().getTeamStandingbySeason(event.year);
        emit(StandingSuccesTeam(data));
      }
    });
  }
}
