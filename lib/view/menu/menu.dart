import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:testnet/providers/user.dart';
import 'package:testnet/theme/colors.dart';
import 'package:testnet/view/menu/applicants.dart';
import 'package:testnet/view/edit_job.dart';
import 'package:testnet/view/menu/home.dart';

class MenuScreen extends StatefulWidget {
  static const route = '/menu';
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final controller = PageController(initialPage: 0);

  var currentPage = 0;

  _updateNavBar() {
    if (controller.page!.round() != currentPage) {
      setState(() => currentPage = controller.page!.round());
    }
  }

  @override
  void initState() {
    controller.addListener(_updateNavBar);
    super.initState();
  }

  @override
  void dispose() {
    controller.removeListener(_updateNavBar);
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: controller,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            HomePage(controller: controller),
            ApplicantsPage(controller: controller),
            const Scaffold(body: Center(child: Text('Under construction'))),
            const Scaffold(body: Center(child: Text('Under construction'))),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                blurRadius: 20, offset: Offset(0, -8), color: Color(0x18000000))
          ],
        ),
        child: GNav(
          gap: 8,
          tabBorderRadius: 24,
          selectedIndex: currentPage,
          color: const Color.fromARGB(255, 75, 75, 75),
          activeColor: ColorPalette.primary,
          tabBackgroundColor: const Color(0xffE3DAF2),
          padding: const EdgeInsets.all(18),
          tabMargin: const EdgeInsets.symmetric(vertical: 25),
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          tabs: const [
            GButton(text: 'Home', icon: Icons.home),
            GButton(text: 'Applicants', icon: Icons.list),
            GButton(text: 'Messages', icon: Icons.message_outlined),
            GButton(text: 'Profile', icon: Icons.person_outline)
          ],
          onTabChange: (val) {
            controller.animateToPage(
              val,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn,
            );
          },
        ),
      ),
    );
  }
}
