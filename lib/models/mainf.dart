class Main {
  Main({
    this.temp,
    this.pressure,
    this.humidity,
    this.tempMin,
    this.tempMax,
  });

  double? temp;
  int? pressure;
  int? humidity;
  double? tempMin;
  double? tempMax;

  factory Main.fromJson(Map<String, dynamic> json) => Main(
    temp: json["temp"].toDouble(),
    pressure: json["pressure"],
    humidity: json["humidity"],
    tempMin: json["temp_min"].toDouble(),
    tempMax: json["temp_max"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "temp": temp,
    "pressure": pressure,
    "humidity": humidity,
    "temp_min": tempMin,
    "temp_max": tempMax,
  };
}