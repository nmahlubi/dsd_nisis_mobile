import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../../../widget/camera_picker.dart';
import '../../../../widget/custom_button.dart';
import '../../../../widget/image_picker.dart';
import '../../../../widget/textfield_dropdown.dart';
import '../dashboard/worklist_page.dart';
import 'house_hold_details.dart';

class CreateHouseHoldProfile extends StatefulWidget {
  const CreateHouseHoldProfile({super.key});

  @override
  State<CreateHouseHoldProfile> createState() => _CreateHouseHoldProfileState();
}

class _CreateHouseHoldProfileState extends State<CreateHouseHoldProfile> {
  FocusNode _focus = FocusNode();
  bool _isValidate = true;
  SharedPreferences? preferences;
  final TextEditingController _Textcontroller = TextEditingController();
  TextEditingController _dateController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
    );

    if (picked != null && picked != DateTime.now()) {
      setState(() {
        _dateController.text = picked.toString();
      });
    }
  }

  Future<void> initializePreference() async {
    preferences = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      initializePreference().whenComplete(() {
        setState(() {});
      });
    });
  }

  showDialogMessage(String? message) {
    final messageDialog = ScaffoldMessenger.of(context);
    messageDialog.showSnackBar(
      SnackBar(content: Text(message!), backgroundColor: Colors.red),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xFFE3C263),
            elevation: 0,
            title: const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 10),
                Text(
                  'Module > Nisis',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(
                  'https://cdn.contactcenterworld.com/images/company/department-of-social-development-1200px-logo.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(10),
            child: Form(
                child: ListView(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => WorkListPage()),
                              );
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  const Color(
                                      0xFFE3C263) // Adjusted to provided blue color
                                  ),
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.black // Adjusted text color to white
                                  ),
                            ),
                            child: const Text('Back'),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 100.0),
                                child: Text(
                                  'Logged in as: ${preferences?.getString('firstname')}',
                                  style: const TextStyle(
                                      fontSize: 7.0, color: Colors.black87),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 100.0),
                                child: const Text(
                                  'Role: CDP',
                                  style: TextStyle(
                                      fontSize: 7.0, color: Colors.black87),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 100.0),
                                child: const Text(
                                  'Date:08/08/2023 11:43AM',
                                  style: TextStyle(
                                      fontSize: 7.0, color: Colors.black87),
                                ),
                              ),
                            ],
                          ),
                          const CircleAvatar(
                            radius: 15.0,
                            backgroundColor: Color(
                                0xFF036FE3), // Adjusted to provided blue color
                            child: Text(
                              'PM',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 50.0),
                      const Column(
                        children: [
                          Center(
                            child: Text(
                              'Household',
                              style: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(
                                      0xFFE3C263) // Adjusted to provided color
                                  ),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Center(
                            child: Text(
                              'Profiling',
                              style: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(
                                      0xFFE3C263) // Adjusted to provided color
                                  ),
                            ),
                          ),
                          SizedBox(height: 50.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Create Household Information',
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color(
                                        0xff000000) // Adjusted to provided color
                                    ),
                              ),
                            ],
                          ),
                          Divider(
                            thickness: 2,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Create Household Information',
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color(
                                        0xFF808080) // Adjusted to provided color
                                    ),
                              ),
                            ],
                          ),
                          Divider(
                              thickness: 2, color: Colors.grey, endIndent: 10),
                          SizedBox(
                            width: 50,
                          )
                        ],
                      ),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.blue),
                                    minimumSize:
                                        MaterialStateProperty.all<Size>(
                                      const Size(200, 50),
                                    ), // Set button width and height
                                  ),
                                  onPressed: () {
                                    _showCustomDialog(context);
                                  },
                                  child: const Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      SizedBox(width: 8),
                                      Text('Add household image'),
                                      SizedBox(width: 4),
                                      Icon(Icons.add),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 300,
                              decoration: const BoxDecoration(
                                color: Colors.cyan,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/One.jpg'), // Path to your image asset
                                  fit: BoxFit
                                      .cover, // How the image should be inscribed into the box
                                ),
                              ),
                              child: const Center(
                                child: Text(
                                  'This is a full-screen container!',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 24),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.blue),
                                    minimumSize:
                                        MaterialStateProperty.all<Size>(
                                      const Size(100, 50),
                                    ), // Set button width and height
                                  ),
                                  onPressed: () {
                                    _displayDialog(context);
                                  },
                                  child: const Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      SizedBox(width: 8),
                                      Text('Full Image'),
                                      SizedBox(width: 4),
                                    ],
                                  ),
                                ),
                                ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.blue),
                                    minimumSize:
                                        MaterialStateProperty.all<Size>(
                                      const Size(200, 50),
                                    ), // Set button width and height
                                  ),
                                  onPressed: () {
                                    _showCustomDialog2(context);
                                  },
                                  child: const Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      SizedBox(width: 8),
                                      Text('Add Description'),
                                      SizedBox(width: 4),
                                      Icon(Icons.add),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.blue),
                                minimumSize: MaterialStateProperty.all<Size>(
                                  const Size(200, 50),
                                ), // Set button width and height
                              ),
                              onPressed: () {},
                              child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  SizedBox(width: 8),
                                  Text('Delete'),
                                  SizedBox(width: 4),
                                  Icon(Icons.delete),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            )
                          ]),
                      const SizedBox(height: 30.0),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          (_Textcontroller.value.text.isEmpty)
                              ? const Text("Date Profiled")
                              : Text(
                                  'Sent Message: ${_Textcontroller.value.text}'),
                          TextField(
                            controller: _dateController,
                            decoration: InputDecoration(
                              labelText: 'Select Date',
                              border:
                                  OutlineInputBorder(), // Add border to the TextField
                              suffixIcon: IconButton(
                                icon: Icon(Icons.calendar_today),
                                onPressed: () {
                                  _selectDate(
                                      context); // Show calendar when icon is tapped
                                },
                              ),
                            ),
                            readOnly: true, // Make the text field read-only
                          ),
                          const SizedBox(height: 10.0),
                          (_Textcontroller.value.text.isEmpty)
                              ? const Text("EA Number")
                              : Text(
                                  'Sent Message: ${_Textcontroller.value.text}'),
                          TextFormField(
                            controller: _Textcontroller,
                            minLines: 2,
                            maxLines: 3,
                            keyboardType: TextInputType.multiline,
                            decoration: const InputDecoration(
                                hintText: 'Enter A Message Here',
                                hintStyle: TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                )),
                          ),
                          (_Textcontroller.value.text.isEmpty)
                              ? const Text("Household Question ID")
                              : Text(
                                  'Sent Message: ${_Textcontroller.value.text}'),
                          TextFormField(
                            controller: _Textcontroller,
                            minLines: 2,
                            maxLines: 3,
                            keyboardType: TextInputType.multiline,
                            decoration: const InputDecoration(
                                hintText: 'Enter A Message Here',
                                hintStyle: TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                )),
                          ),
                          const SizedBox(height: 10.0),
                          (_Textcontroller.value.text.isEmpty)
                              ? const Text("Profiling Tool")
                              : Text(
                                  'Sent Message: ${_Textcontroller.value.text}'),
                          TextFormField(
                            controller: _Textcontroller,
                            minLines: 2,
                            maxLines: 5,
                            style: TextStyle(color: Colors.grey),
                            keyboardType: TextInputType.multiline,
                            decoration: const InputDecoration(
                                fillColor: Colors.deepPurpleAccent,
                                hintText: 'Enter A Message Here',
                                hintStyle: TextStyle(),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                )),
                          ),
                          const SizedBox(height: 10.0),
                          (_Textcontroller.value.text.isEmpty)
                              ? const Text("Structure Type")
                              : Text(
                                  'Sent Message: ${_Textcontroller.value.text}'),
                          TextFormField(
                            controller: _Textcontroller,
                            minLines: 2,
                            maxLines: 5,
                            keyboardType: TextInputType.multiline,
                            decoration: const InputDecoration(
                                hintText: 'Enter A Message Here',
                                hintStyle: TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                )),
                          ),
                          const SizedBox(height: 10.0),
                          (_Textcontroller.value.text.isEmpty)
                              ? const Text("Dwelling Unit Address")
                              : Text(
                                  'Sent Message: ${_Textcontroller.value.text}'),
                          DropDown(),
                          const SizedBox(height: 10.0),
                          (_Textcontroller.value.text.isEmpty)
                              ? const Text("Dwelling Unit Description ")
                              : Text(
                                  'Sent Message: ${_Textcontroller.value.text}'),
                          DropDown(),
                          const SizedBox(height: 10.0),
                          (_Textcontroller.value.text.isEmpty)
                              ? const Text("Dwelling Unit Number")
                              : Text(
                                  'Sent Message: ${_Textcontroller.value.text}'),
                          TextFormField(
                            controller: _Textcontroller,
                            minLines: 2,
                            maxLines: 5,
                            keyboardType: TextInputType.multiline,
                            decoration: const InputDecoration(
                                hintText: 'Enter A Message Here',
                                hintStyle: TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                )),
                          ),
                          const SizedBox(height: 10.0),
                          (_Textcontroller.value.text.isEmpty)
                              ? const Text("Household Number")
                              : Text(
                                  'Sent Message: ${_Textcontroller.value.text}'),
                          TextFormField(
                            controller: _Textcontroller,
                            minLines: 2,
                            maxLines: 5,
                            keyboardType: TextInputType.multiline,
                            decoration: const InputDecoration(
                                hintText: 'Enter A Message Here',
                                hintStyle: TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                )),
                          ),
                          const SizedBox(height: 10.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              (_Textcontroller.value.text.isEmpty)
                                  ? const Text(
                                      "Dwelling Co-ordinates",
                                      style: TextStyle(),
                                    )
                                  : Text(
                                      'Sent Message: ${_Textcontroller.value.text}'),
                              SizedBox(
                                width: 50.0,
                              ),
                              Icon(
                                Icons.quiz_sharp,
                                size: 15.0,
                                color: Colors.grey,
                              )
                            ],
                          ),
                          const SizedBox(height: 10.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(height: 10.0),
                              Expanded(
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.blue),
                                    minimumSize:
                                        MaterialStateProperty.all<Size>(
                                      const Size(350, 60),
                                    ), // Set button width and height
                                  ),
                                  onPressed: () {},
                                  child: const Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      SizedBox(width: 8),
                                      Text('Generate Co-Ordinates'),
                                      SizedBox(width: 4),
                                      Icon(Icons.downloading),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10.0),
                          (_Textcontroller.value.text.isEmpty)
                              ? const Text("Latitude")
                              : Text(
                                  'Sent Message: ${_Textcontroller.value.text}'),
                          TextFormField(
                            controller: _Textcontroller,
                            minLines: 2,
                            maxLines: 5,
                            style: TextStyle(color: Colors.grey),
                            keyboardType: TextInputType.multiline,
                            decoration: const InputDecoration(
                                fillColor: Colors.deepPurpleAccent,
                                hintText: 'Enter A Message Here',
                                hintStyle: TextStyle(),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                )),
                          ),
                          const SizedBox(height: 10.0),
                          (_Textcontroller.value.text.isEmpty)
                              ? const Text("Longitude")
                              : Text(
                                  'Sent Message: ${_Textcontroller.value.text}'),
                          TextFormField(
                            controller: _Textcontroller,
                            minLines: 2,
                            maxLines: 5,
                            keyboardType: TextInputType.multiline,
                            decoration: const InputDecoration(
                                hintText: 'Enter A Message Here',
                                hintStyle: TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                )),
                          ),
                          const SizedBox(height: 30.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.blue),
                                    minimumSize:
                                        MaterialStateProperty.all<Size>(
                                      const Size(200, 60),
                                    ), // Set button width and height
                                  ),
                                  onPressed: () {},
                                  child: const Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      SizedBox(width: 8),
                                      Text('Save'),
                                      SizedBox(width: 4),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10.0),
                              Expanded(
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.blue),
                                    minimumSize:
                                        MaterialStateProperty.all<Size>(
                                      const Size(200, 60),
                                    ), // Set button width and height
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              HouseholdDetails()),
                                    );
                                  },
                                  child: const Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      SizedBox(width: 8),
                                      Text('Submit'),
                                      SizedBox(width: 4),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.logout),
                label: 'Log Out',
              ),
            ],
          ),
        ));
  }

  _displayDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      transitionDuration: Duration(milliseconds: 2000),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            scale: animation,
            child: child,
          ),
        );
      },
      pageBuilder: (context, animation, secondaryAnimation) {
        return SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.all(20),
            color: Colors.white,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    'Hai This Is Full Screen Dialog',
                    style: TextStyle(color: Colors.red, fontSize: 20.0),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                      minimumSize: MaterialStateProperty.all<Size>(
                        const Size(100, 50),
                      ), // Set button width and height
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        SizedBox(width: 8),
                        Text('Dismiss'),
                        SizedBox(width: 4),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  _showCustomDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Center(
            child: Text(
              'House Image',
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFE3C263) // Adjusted to provided color
                  ),
            ),
          ),
          content: SizedBox(
            height: 180,
            width: 200,
            child: Column(
              children: <Widget>[
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                    minimumSize: MaterialStateProperty.all<Size>(
                      const Size(200, 50),
                    ), // Set button width and height
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CameraPicker()),
                    );
                  },
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(width: 8),
                      Text('Use Camera'),
                      SizedBox(width: 4),
                      Icon(Icons.camera),
                    ],
                  ),
                ),
                const Row(
                  children: <Widget>[
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                        height: 36,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'OR',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                        height: 36,
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                    minimumSize: MaterialStateProperty.all<Size>(
                      const Size(200, 50),
                    ), // Set button width and height
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ImageFromGalleryEx(AlertDialog)),
                    );
                  },
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(width: 8),
                      Text('Upload Image'),
                      SizedBox(width: 4),
                      Icon(Icons.upload),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  _showCustomDialog2(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Column(
            children: [
              Center(
                child: Text(
                  'Image Description',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFE3C263) // Adjusted to provided color
                      ),
                ),
              ),
              Divider(thickness: 2, color: Colors.grey, endIndent: 10),
            ],
          ),
          content: SizedBox(
            height: 180,
            width: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                (_Textcontroller.value.text.isEmpty)
                    ? const Text("Image description")
                    : Text('Sent Message: ${_Textcontroller.value.text}'),
                const SizedBox(height: 10.0),
                TextFormField(
                  controller: _Textcontroller,
                  minLines: 2,
                  maxLines: 5,
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(
                      hintText: 'Enter A Message Here',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      )),
                ),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.blue),
                        minimumSize: MaterialStateProperty.all<Size>(
                          const Size(100, 50),
                        ), // Set button width and height
                      ),
                      onPressed: () {
                        HouseholdDetails();
                      },
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          SizedBox(width: 8),
                          Text('Save'),
                          SizedBox(width: 4),
                          Icon(Icons.save),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTile(Widget child, {Function()? onTap}) {
    return Material(
        elevation: 14.0,
        borderRadius: BorderRadius.circular(12.0),
        shadowColor: const Color(0x802196F3),
        child: InkWell(
            // Do onTap() if it isn't null, otherwise do print()
            onTap: onTap != null
                ? () => onTap()
                : () {
                    //print('Not set yet');
                  },
            child: child));
  }
}
