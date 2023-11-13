
import '../../../model/household/add_household_model.dart';
import '../../db_model_hive/household/add_house_model.dart';

class AddHouseholdRepository {
  AddHouseholdRepository._constructor();
  static final AddHouseholdRepository _instance = AddHouseholdRepository._constructor();

  factory AddHouseholdRepository() => _instance;

  //late Box<PersonModel> _personsBox;

  Future<void> initialize() async {
    // await Hive.initFlutter();
    // Hive.registerAdapter<PersonModel>(PersonModelAdapter());
    // _personsBox = await Hive.openBox<PersonModel>(personBox);
  }


  AddHouseModel householdToDb(AddHousehold? addHousehold) => AddHouseModel(
    description: addHousehold!.description.toString(),

  );


}