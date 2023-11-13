class AddHousehold {
  Description description;
  Map<String, Datum> data;

  AddHousehold({
    required this.description,
    required this.data,
  });



}

class Datum {
  String value;
  String anomaly;

  Datum({
    required this.value,
    required this.anomaly,
  });

}

class Description {
  String title;
  String units;
  String basePeriod;

  Description({
    required this.title,
    required this.units,
    required this.basePeriod,
  });

}