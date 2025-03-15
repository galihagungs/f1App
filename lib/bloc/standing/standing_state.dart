part of 'standing_bloc.dart';

@immutable
sealed class StandingState {}

final class StandingInitial extends StandingState {}

final class StandingLoading extends StandingState {}

final class StandingFailed extends StandingState {
  final String e;
  StandingFailed(this.e);
  List<Object> get props => [e];
}

final class StandingSucces extends StandingState {
  final StandingsModel standings;

  StandingSucces(this.standings);

  List<Object> get data => [standings];
}

final class StandingSuccesTeam extends StandingState {
  final StandingsTeams team;

  StandingSuccesTeam(this.team);

  List<Object> get data => [team];
}

final class StandingSuccesRace extends StandingState {
  final ResultRace race;

  StandingSuccesRace(this.race);

  List<Object> get data => [race];
}
