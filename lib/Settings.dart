import 'package:flutter/material.dart';
import 'package:test_99915215/Category/Category.dart';

void main() => runApp(const Settings());

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SettingsWidget(),
    );
  }
}

class SettingsWidget extends StatefulWidget {
  const SettingsWidget({super.key});

  @override
  State<SettingsWidget> createState() => SettingsState();
}

class SettingsState extends State<SettingsWidget>
    with TickerProviderStateMixin {
  late final TabController _tabController;
  int tabindex = 0;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {
        tabindex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        shadowColor: Color(0xffaba9a9),
        backgroundColor: const Color(0xff030303),
        automaticallyImplyLeading: false,
        iconTheme: const IconThemeData(color: Colors.white),
        toolbarHeight: MediaQuery.of(context).size.height / 5.5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
              bottom: new Radius.elliptical(
                  MediaQuery.of(context).size.width, 53.0)),
        ),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        centerTitle: true,
        title: const Text('Settings'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(
              24.0), // Adjust the preferred size as needed
          child: Padding(
            padding: const EdgeInsets.only(
                bottom: 8.0), // Adjust the bottom padding as needed
            child: TabBar(
              dividerColor: Colors.transparent,
              labelColor: Colors.white,
              controller: _tabController,
              indicatorColor: Colors.transparent,
              automaticIndicatorColorAdjustment: true,
              tabs: [
                Tab(
                  icon: Icon(Icons.category_sharp),
                  text: tabindex == 0 ? 'Category' : '',
                ),
                Tab(
                  icon: Icon(Icons.directions_transit),
                  text: tabindex == 1 ? 'Product' : '',
                ),
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const <Widget>[
          Category(),
          Center(
            child: Text("It's rainy here"),
          ),
        ],
      ),
    );
  }
}
