import 'package:bloc/bloc.dart';
import 'package:f1_app/model/season.dart';
import 'package:f1_app/service/api/f1.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

part 'season_event.dart';
part 'season_state.dart';

class SeasonBloc extends Bloc<SeasonEvent, SeasonState> {
  SeasonBloc() : super(SeasonInitial()) {
    on<SeasonEvent>((event, emit) async {
      if (event is SeasonGet) {
        emit(SeasonLoading());
        final data = await F1Api().getSeason();
        emit(SeasonSucces(data));
      }
    });
  }
}
