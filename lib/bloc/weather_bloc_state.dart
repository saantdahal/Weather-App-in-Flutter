part of 'weather_bloc_bloc.dart';

@immutable
sealed class WeatherBlocState {}

final class WeatherBlocInitial extends WeatherBlocState {}

class WeatherBlocLoading extends WeatherBlocState {}

class WeatherBlocFailure extends WeatherBlocState {}

class WeatherBlocSucess extends WeatherBlocState {
  final Weather weather;
  WeatherBlocSucess(this.weather);


  List<Object> get props =>[weather];
  }

