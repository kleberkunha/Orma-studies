import 'package:weather_api_flutter/services/DataConverter.dart';

class ApiAnswer {
  String cod;
  int message;
  int cnt;
  List<Forecast> list;

  ApiAnswer(this.cod, this.message, this.cnt, this.list);

  ApiAnswer.fromJson(Map<String, dynamic> map)
      : cod = map["cod"],
        message = map["message"],
        cnt = map["cnt"],
        list = DataConverter()
            .listMappable(map["list"])
            .map((e) => Forecast.fromJson(e))
            .toList();
}

class Forecast {
  int dt;
  Main main;
  List<Weather> weather;
  Wind wind;
  Clouds clouds;
  int visibility;
  String dt_txt;

  Forecast(
    this.dt,
    this.main,
    this.weather,
    this.wind,
    this.clouds,
    this.visibility,
    this.dt_txt,
  );

  Forecast.fromJson(Map<String, dynamic> map)
      : dt = map["dt"],
        main = Main.fromJson(map["main"]),
        weather = DataConverter()
            .listMappable(map["weather"])
            .map((e) => Weather.fromJson(e))
            .toList(),
        wind = Wind.fromJson(map["wind"]),
        clouds = Clouds.fromJson(map["clouds"]),
        visibility = map["visibility"],
        dt_txt = map["dt_txt"];
}

class Main {
  double temp;
  double feels_like;
  double temp_min;
  double temp_max;
  int pressure;
  int grnd_level;
  int humidity;
  double temp_kf;

  Main(
    this.temp,
    this.feels_like,
    this.temp_min,
    this.temp_max,
    this.pressure,
    this.grnd_level,
    this.humidity,
    this.temp_kf,
  );

  Main.fromJson(Map<String, dynamic> map)
      : temp = map["temp"],
        feels_like = map["feels_like"],
        temp_min = map["temp_min"],
        temp_max = map["temp_max"],
        pressure = map["pressure"],
        grnd_level = map["grnd_level"],
        humidity = map["humidity"],
        temp_kf = map["temp_kf"];
}

class Weather {
  int id;
  String main;
  String description;
  String icon;

  Weather(
    this.id,
    this.main,
    this.description,
    this.icon,
  );

  Weather.fromJson(Map<String, dynamic> map)
      : id = map["id"],
        main = map["main"],
        description = map["description"],
        icon = map["icon"];
}

class Clouds {
  int all;

  Clouds(this.all);

  Clouds.fromJson(Map<String, dynamic> map) : all = map["all"];
}

class Wind {
  double speed;
  int deg;
  double gust;

  Wind(
    this.speed,
    this.deg,
    this.gust,
  );

  Wind.fromJson(Map<String, dynamic> map)
      : speed = map["speed"].toDouble(),
        deg = map["deg"],
        gust = map["gust"].toDouble();
}
