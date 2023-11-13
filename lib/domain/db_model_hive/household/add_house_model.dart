
import 'package:hive/hive.dart';

@HiveType(typeId: 22)
class AddHouseModel {
  @HiveField(5)
  late final int? data;
  @HiveField(3)
  late final String? description;

  AddHouseModel({this.data, this.description});
}
