part of 'standing_bloc.dart';

@immutable
sealed class StandingEvent {}

class LastYearChamp extends StandingEvent {}

class GetYearSeasonDriver extends StandingEvent {
  final int year;

  GetYearSeasonDriver({required this.year});
}

class GetYearSeasonTeam extends StandingEvent {
  final int year;
  GetYearSeasonTeam({required this.year});
}

class GetYearSeasonRace extends StandingEvent {
  final int year;
  GetYearSeasonRace({required this.year});
}
