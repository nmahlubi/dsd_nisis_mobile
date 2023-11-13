import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../house_hold/house_hold_profile.dart';

// import 'dashboard_page.dart';
class WorkListPage extends StatefulWidget {
  const WorkListPage({Key? key}) : super(key: key);

  @override
  State<WorkListPage> createState() => _WorkListPageState();
}

class _WorkListPageState extends State<WorkListPage> {
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
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFE3C263),
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
          padding: const EdgeInsets.all(5),
          child: Form(
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              //    Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => DashboardPage()),
                              // );
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color(0xFFE3C263)),
                            ),
                            child: Text('Back',
                                style: TextStyle(color: Colors.black)),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 100.0),
                                child: Text(
                                  'Logged in as: ${preferences?.getString('firstname')}',
                                  style: TextStyle(fontSize: 7.0),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 100.0),
                                child: Text(
                                  'Role: CDP',
                                  style: TextStyle(fontSize: 7.0),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 100.0),
                                child: Text(
                                  'Date:08/08/2023 11:43AM',
                                  style: TextStyle(fontSize: 7.0),
                                ),
                              ),
                            ],
                          ),
                          CircleAvatar(
                            radius: 15.0, // Reduced from the default 20.0
                            backgroundColor: Colors.purple,
                            child: Text(
                              'PM',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    12.0, // Optional: You might want to reduce the font size as well
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 50),
                      Center(
                        child: Text(
                          'WorkList',
                          style: TextStyle(
                            fontSize: 32,
                            color: Color(0xFFE3C263),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 50),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Color(0xFF036FE3)),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                          ),
                          minimumSize: MaterialStateProperty.all(
                              Size(double.infinity, 60)), // Set the height here
                        ),
                        onPressed: () {
                          // TODO: Add your onPressed logic here
                          // _showSearchSitePopup(context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Search WorkList Site',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                                width:
                                    5), // Some space between the text and the icon
                            Icon(Icons.search, color: Colors.white),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                ),
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Work list Sites",
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Divider(thickness: 2.0),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Site Name"),
                          Text("TestSideToday"),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Alternative Name"),
                          Text("TestSideToday"),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Site status"),
                          Chip(
                            label: Text("Capturing"),
                            backgroundColor: Color.fromRGBO(57, 61, 66, 0.7),
                            labelStyle: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(height: 40),
                      LayoutBuilder(
                        builder: (context, constraints) {
                          double width = constraints.maxWidth;

                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: width * 0.10, // 10% of available width
                                height: 34.0,
                                child: ElevatedButton(
                                  onPressed: () {
                                    _showSuccessDialog(context);
                                  },
                                  child: Icon(Icons.delete,
                                      size: 14.0, color: Colors.white),
                                  style: ElevatedButton.styleFrom(
                                    primary: Color(0xFF036FE3),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10), // Spacing between buttons
                              Container(
                                width: width * 0.37, // 40% of available width
                                height: 34.0,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "View More",
                                        style: TextStyle(fontSize: 11.0),
                                      ),
                                      SizedBox(width: 8),
                                      Icon(Icons.arrow_upward,
                                          size: 14.0, color: Colors.white),
                                    ],
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    primary: Color(0xFF036FE3),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10), // Spacing between buttons
                              Container(
                                width: width * 0.47, // 50% of available width
                                height: 34.0,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              House_ProfilePage()),
                                    );
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .center, // This centers the children vertically
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment
                                            .center, // This centers the Text widgets vertically inside the Column
                                        children: [
                                          Text(
                                            "Household",
                                            style: TextStyle(fontSize: 11.0),
                                          ),
                                          Text(
                                            "Profiling",
                                            style: TextStyle(fontSize: 11.0),
                                          ),
                                        ],
                                      ),
                                      SizedBox(width: 8),
                                      Icon(Icons.arrow_forward,
                                          size: 14.0, color: Colors.white),
                                    ],
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    primary: Color(0xFF036FE3),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
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
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const <Widget>[
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
                              )),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
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
      ),
    );
  }

  void _showSearchSitePopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Search Site',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue)),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('Display user records only',
                        style: TextStyle(fontSize: 16)),
                    Spacer(),
                    Checkbox(
                      value: true,
                      onChanged: (value) {
                        // Update the state of the checkbox here, if required
                      },
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Text('Municipality', style: TextStyle(fontSize: 16)),
                DropdownButton<String>(
                  hint: Text('Please select'),
                  items: [], // Add your items here
                  onChanged: (value) {},
                  isExpanded: true,
                ),
                SizedBox(height: 15),
                Text('Local Municipality', style: TextStyle(fontSize: 16)),
                DropdownButton<String>(
                  hint: Text('Please select'),
                  items: [], // Add your items here
                  onChanged: (value) {},
                  isExpanded: true,
                ),
                SizedBox(height: 15),
                Text('Ward', style: TextStyle(fontSize: 16)),
                DropdownButton<String>(
                  hint: Text('Please select'),
                  items: [], // Add your items here
                  onChanged: (value) {},
                  isExpanded: true,
                ),
                SizedBox(height: 15),
                Text('Site Name', style: TextStyle(fontSize: 16)),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Example',
                  ),
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Start', style: TextStyle(fontSize: 16)),
                          TextField(
                            decoration: InputDecoration(
                              hintText: '06/01/2023',
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
                    child: Text('Search Site', style: TextStyle(fontSize: 16)),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Container(
          padding: EdgeInsets.all(1.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.check, color: Colors.green),
                      SizedBox(width: 10),
                      Text(
                        'Site removed from your Worklist',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text('successfully'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTile(Widget child, {Function()? onTap}) {
    return Material(
      elevation: 14.0,
      borderRadius: BorderRadius.circular(12.0),
      shadowColor: const Color(0x802196F3),
      child: InkWell(
        onTap: onTap != null ? () => onTap() : () {},
        child: child,
      ),
    );
  }
}
