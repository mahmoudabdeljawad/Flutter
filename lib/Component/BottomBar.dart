import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';
import 'package:test_99915215/Settings.dart';
import 'package:test_99915215/Dashboard.dart';
import 'package:test_99915215/Functions/CheckAuth.dart';
import 'package:test_99915215/Functions/logout.dart';

void main() => runApp(const BottomBar_());

class BottomBar_ extends StatefulWidget {
  const BottomBar_({super.key});

  @override
  State<BottomBar_> createState() => BottomBar_States();
}

class BottomBar_States extends State<BottomBar_> {
  dynamic selected;
  var heart = false;
  PageController controller = PageController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, //to make floating action button notch Transparent
      bottomNavigationBar: StylishBottomBar(
        option: AnimatedBarOptions(
          barAnimation: BarAnimation.fade,
          iconStyle: IconStyle.animated,
        ),
        items: [
          BottomBarItem(
            icon: const Icon(
              Icons.house_outlined,
            ),
            selectedIcon: const Icon(Icons.house_rounded),
            backgroundColor: Color(0xff352c07),
            selectedColor: Colors.red,
            title: const Text('Home'),
            // badge: const Text('9+'),
            // showBadge: true,
            // badgeColor: Colors.red,
          ),
          BottomBarItem(
            icon: const Icon(Icons.inventory),
            selectedIcon: const Icon(Icons.inventory),
            selectedColor: Colors.red,
            // unSelectedColor: Colors.purple,
            backgroundColor: Color(0xff352c07),
            title: const Text('Setting'),
          ),
          BottomBarItem(
              icon: const Icon(
                Icons.style_outlined,
              ),
              selectedIcon: const Icon(
                Icons.style,
              ),
              backgroundColor: Color(0xff352c07),
              selectedColor: Colors.deepOrangeAccent,
              title: const Text('Style')),
          BottomBarItem(
              icon: const Icon(
                Icons.person_outline,
              ),
              selectedIcon: const Icon(
                Icons.person,
              ),
              backgroundColor: Color(0xff352c07),
              selectedColor: Colors.deepPurple,
              title: const Text('Profile')),
        ],
        hasNotch: true,
        currentIndex: selected ?? 0,
        notchStyle: NotchStyle.circle,
        onTap: (i) {
          controller.jumpToPage(i);
          setState(() {
            selected = i;
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.jumpToPage(5);
          setState(() {
            selected = 0;
          });
          // setState(() {
          //   heart = !heart;
          // });
        },
        backgroundColor: Colors.white,
        child: Icon(
          heart ? CupertinoIcons.heart_circle : CupertinoIcons.heart,
          color: Color(0xff352c07),
        ),
      ),
      body: SafeArea(
        child: PageView(
          controller: controller,
          children: [
            const DashBoard(),
            const Settings(),
            const Center(child: Text('Shake')),
            Container(
                child: Center(
              child: ElevatedButton(
                  onPressed: () => {
                        performlogout(),
                        Navigator.pushNamed(context, '/'),
                      },
                  child: Text('Logout')),
            )),
          ],
        ),
      ),
    );
  }
}
