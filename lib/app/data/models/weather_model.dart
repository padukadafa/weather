class Weather {
  double? latitude;
  double? longitude;
  double? generationtimeMs;
  int? utcOffsetSeconds;
  String? timezone;
  String? timezoneAbbreviation;
  double? elevation;
  HourlyUnits? hourlyUnits;
  Hourly? hourly;
  DailyUnits? dailyUnits;
  Daily? daily;

  Weather(
      {this.latitude,
      this.longitude,
      this.generationtimeMs,
      this.utcOffsetSeconds,
      this.timezone,
      this.timezoneAbbreviation,
      this.elevation,
      this.hourlyUnits,
      this.hourly,
      this.dailyUnits,
      this.daily});

  Weather.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
    generationtimeMs = json['generationtime_ms'];
    utcOffsetSeconds = json['utc_offset_seconds'];
    timezone = json['timezone'];
    timezoneAbbreviation = json['timezone_abbreviation'];
    elevation = json['elevation'];
    hourlyUnits = json['hourly_units'] != null
        ? HourlyUnits?.fromJson(json['hourly_units'])
        : null;
    hourly = json['hourly'] != null ? Hourly?.fromJson(json['hourly']) : null;
    dailyUnits = json['daily_units'] != null
        ? DailyUnits?.fromJson(json['daily_units'])
        : null;
    daily = json['daily'] != null ? Daily?.fromJson(json['daily']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['generationtime_ms'] = generationtimeMs;
    data['utc_offset_seconds'] = utcOffsetSeconds;
    data['timezone'] = timezone;
    data['timezone_abbreviation'] = timezoneAbbreviation;
    data['elevation'] = elevation;
    if (hourlyUnits != null) {
      data['hourly_units'] = hourlyUnits?.toJson();
    }
    if (hourly != null) {
      data['hourly'] = hourly?.toJson();
    }
    if (dailyUnits != null) {
      data['daily_units'] = dailyUnits?.toJson();
    }
    if (daily != null) {
      data['daily'] = daily?.toJson();
    }
    return data;
  }
}

class HourlyUnits {
  String? time;
  String? relativehumidity2m;
  String? apparentTemperature;
  String? weathercode;
  String? surfacePressure;

  HourlyUnits(
      {this.time,
      this.relativehumidity2m,
      this.apparentTemperature,
      this.weathercode,
      this.surfacePressure});

  HourlyUnits.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    relativehumidity2m = json['relativehumidity_2m'];
    apparentTemperature = json['apparent_temperature'];
    weathercode = json['weathercode'];
    surfacePressure = json['surface_pressure'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['time'] = time;
    data['relativehumidity_2m'] = relativehumidity2m;
    data['apparent_temperature'] = apparentTemperature;
    data['weathercode'] = weathercode;
    data['surface_pressure'] = surfacePressure;
    return data;
  }
}

class Hourly {
  List<String>? time;
  List<int>? relativehumidity2m;
  List<double>? apparentTemperature;
  List<int>? weathercode;
  List<double>? surfacePressure;

  Hourly(
      {this.time,
      this.relativehumidity2m,
      this.apparentTemperature,
      this.weathercode,
      this.surfacePressure});

  Hourly.fromJson(Map<String, dynamic> json) {
    time = json['time'].cast<String>();
    relativehumidity2m = json['relativehumidity_2m'].cast<int>();
    apparentTemperature = json['apparent_temperature'].cast<double>();
    weathercode = json['weathercode'].cast<int>();
    surfacePressure = json['surface_pressure'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['time'] = time;
    data['relativehumidity_2m'] = relativehumidity2m;
    data['apparent_temperature'] = apparentTemperature;
    data['weathercode'] = weathercode;
    data['surface_pressure'] = surfacePressure;
    return data;
  }
}

class DailyUnits {
  String? time;
  String? weathercode;
  String? apparentTemperatureMax;
  String? apparentTemperatureMin;
  String? sunrise;
  String? sunset;

  DailyUnits(
      {this.time,
      this.weathercode,
      this.apparentTemperatureMax,
      this.apparentTemperatureMin,
      this.sunrise,
      this.sunset});

  DailyUnits.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    weathercode = json['weathercode'];
    apparentTemperatureMax = json['apparent_temperature_max'];
    apparentTemperatureMin = json['apparent_temperature_min'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['time'] = time;
    data['weathercode'] = weathercode;
    data['apparent_temperature_max'] = apparentTemperatureMax;
    data['apparent_temperature_min'] = apparentTemperatureMin;
    data['sunrise'] = sunrise;
    data['sunset'] = sunset;
    return data;
  }
}

class Daily {
  List<String>? time;
  List<int>? weathercode;
  List<double>? apparentTemperatureMax;
  List<double>? apparentTemperatureMin;
  List<int>? sunrise;
  List<int>? sunset;

  Daily(
      {this.time,
      this.weathercode,
      this.apparentTemperatureMax,
      this.apparentTemperatureMin,
      this.sunrise,
      this.sunset});

  Daily.fromJson(Map<String, dynamic> json) {
    time = json['time']!.cast<String>();
    weathercode = json['weathercode'].cast<int>();
    apparentTemperatureMax = json['apparent_temperature_max'].cast<double>();
    apparentTemperatureMin = json['apparent_temperature_min'].cast<double>();
    sunrise = json['sunrise'].cast<int>();
    sunset = json['sunset'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['time'] = time;
    data['weathercode'] = weathercode;
    data['apparent_temperature_max'] = apparentTemperatureMax;
    data['apparent_temperature_min'] = apparentTemperatureMin;
    data['sunrise'] = sunrise;
    data['sunset'] = sunset;
    return data;
  }
}
