import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import 'package:weather/weather.dart';
import 'package:weatherapp/data/my_data.dart';
part 'weather_bloc_event.dart';
part 'weather_bloc_state.dart';

class WeatherBlocBloc extends Bloc<WeatherBlocEvent, WeatherBlocState> {
  WeatherBlocBloc() : super(WeatherBlocInitial()) {
    on<FetchWeather>((event, emit) async {
      emit(WeatherBlocLoading());
      try {
        WeatherFactory wf =
            WeatherFactory(apiKey, language: Language.ENGLISH);
           Position position = await Geolocator.getCurrentPosition();
        Weather weather =
            await wf.currentWeatherByLocation(
            position.latitude, 
            position.longitude);
        emit(WeatherBlocSucess(weather));
      } catch (e) {
        emit(WeatherBlocFailure());
      }
    });
  }
}
