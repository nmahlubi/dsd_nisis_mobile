import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'worklist_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  SharedPreferences? preferences;

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
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment
                            .end, // Aligns items to the end of the row
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 100.0),
                                child: Text(
                                  'Logged in as: ${preferences?.getString('firstname')}',
                                  style: const TextStyle(fontSize: 7.0),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 100.0),
                                child: const Text(
                                  'Role: CDP',
                                  style: TextStyle(fontSize: 7.0),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 100.0),
                                child: const Text(
                                  'Date:08/08/2023 11:43AM',
                                  style: TextStyle(fontSize: 7.0),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                              width:
                                  10.0), // This will provide some space between the texts and the avatar
                          const CircleAvatar(
                            radius: 15.0, // Reduced from the default 20.0
                            backgroundColor: Colors.purple,
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
                    ),
                    const SizedBox(height: 40),
                    const Center(
                      child: Text(
                        "Site Listing",
                        style: TextStyle(
                          fontSize: 30,
                          color: Color(0xFFE3C263),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 60),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xFF036FE3),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25, vertical: 15),
                          ),
                          onPressed: () {
                            // Handle search site button press
                            //_showSearchSitePopup(context);
                          },
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("Search Site"),
                              SizedBox(width: 7),
                              Icon(Icons.search),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xFF036FE3),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25, vertical: 15),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const WorkListPage()),
                            );
                          },
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("WorkList"),
                              SizedBox(width: 7),
                              Icon(Icons.arrow_forward),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Created Sites",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Divider(thickness: 2),
                    const SizedBox(height: 20),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Site Name"),
                        Text("TestSideToday"),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Alternative Name"),
                        Text("TestSideToday"),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Site status"),
                        Chip(
                          label: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 0.0,
                                vertical: 0.2), // Adjust padding as required
                            child: Text("Capturing"),
                          ),
                          backgroundColor: Color.fromRGBO(57, 61, 66, 0.7),
                          labelStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 10.0, // Adjust fontSize as required
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Handle view more button press
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("View More"),
                              SizedBox(width: 8),
                              Icon(Icons.arrow_forward, color: Colors.white),
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF036FE3),
                          ),
                        ),
                        SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () {
                            // Handle add to worklist button press
                            _showPopup(context);
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("Add to Worklist"),
                              SizedBox(width: 8),
                              Icon(Icons.add, color: Colors.white),
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF036FE3),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
              ),
              if (preferences?.getBool('supervisor') == false)
                _buildTile(
                  onTap: () => Navigator.pushReplacementNamed(
                      context, '/sync-manual-offline'),
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Sync(Offline)',
                                style: TextStyle(color: Colors.red)),
                          ],
                        ),
                        Material(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(24.0),
                          child: const Center(
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Icon(Icons.sync,
                                  color: Colors.white, size: 30.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _showPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          content: Container(
            width: double.maxFinite,
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(Icons.check_circle, color: Colors.green, size: 60),
                SizedBox(height: 10),
                Text(
                  'Site added to your Worklist successfully',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Close', style: TextStyle(color: Colors.blue)),
              onPressed: () {
                Navigator.of(context).pop(); // Close the popup
              },
            ),
          ],
        );
      },
    );
  }

  void _showSearchSitePopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          titlePadding: EdgeInsets.all(0),
          title: Container(
            color: Colors.blue,
            padding: const EdgeInsets.all(15),
            child: const Text('Search Site',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text('Display user records only',
                        style: TextStyle(fontSize: 16)),
                    const Spacer(),
                    Checkbox(
                      value: true,
                      onChanged: (value) {
                        // Update the state of the checkbox here, if required
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                const Text('Municipality', style: TextStyle(fontSize: 16)),
                Container(
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.grey)),
                  child: DropdownButton<String>(
                    hint: const Text('Please select'),
                    items: [], // Add your items here
                    onChanged: (value) {},
                    isExpanded: true,
                    underline: const SizedBox.shrink(),
                  ),
                ),
                const SizedBox(height: 15),
                const Text('Local Municipality',
                    style: TextStyle(fontSize: 16)),
                Container(
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.grey)),
                  child: DropdownButton<String>(
                    hint: const Text('Please select'),
                    items: [], // Add your items here
                    onChanged: (value) {},
                    isExpanded: true,
                    underline: const SizedBox.shrink(),
                  ),
                ),
                const SizedBox(height: 15),
                const Text('Ward', style: TextStyle(fontSize: 16)),
                Container(
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.grey)),
                  child: DropdownButton<String>(
                    hint: const Text('Please select'),
                    items: [], // Add your items here
                    onChanged: (value) {},
                    isExpanded: true,
                    underline: const SizedBox.shrink(),
                  ),
                ),
                const SizedBox(height: 15),
                const Text('Site Name', style: TextStyle(fontSize: 16)),
                const TextField(
                  decoration: InputDecoration(
                    hintText: 'Example',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 15),
                const Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Start', style: TextStyle(fontSize: 16)),
                          TextField(
                            decoration: InputDecoration(
                              hintText: '06/01/2023',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('End', style: TextStyle(fontSize: 16)),
                          TextField(
                            decoration: InputDecoration(
                              hintText: '27/01/2023',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 25),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the popup
                      // Execute your search logic here, if required
                    },
                    child: const Text('Search Site',
                        style: TextStyle(fontSize: 16)),
                  ),
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
