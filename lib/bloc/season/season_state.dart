part of 'season_bloc.dart';

@immutable
sealed class SeasonState {}

final class SeasonInitial extends SeasonState {}

final class SeasonLoading extends SeasonState {}

final class SeasonFailed extends SeasonState {
  final String e;
  SeasonFailed(this.e);
  List<Object> get props => [e];
}

final class SeasonSucces extends SeasonState {
  final SeasonModel season;

  SeasonSucces(this.season);

  List<Object> get data => [season];
}
