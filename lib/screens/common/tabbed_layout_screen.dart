import 'package:flutter/material.dart';
import 'package:ge_task/constants/theme_constants.dart';
import 'package:ge_task/screens/features/items_list_screen.dart';
import 'package:ge_task/screens/features/refund_screen.dart';
import 'package:ge_task/screens/features/settings_screen.dart';
import 'package:ge_task/screens/features/wallet_screen.dart';
import 'package:ge_task/widgets/wallet/add_feature_sheet.dart';

class TabbedLayoutScreen extends StatefulWidget {
  const TabbedLayoutScreen({Key? key}) : super(key: key);

  @override
  State<TabbedLayoutScreen> createState() => _TabbedLayoutScreenState();
}

class _TabbedLayoutScreenState extends State<TabbedLayoutScreen> {
  final List<Map> tabbedScreensData = [
    {
      'screen': const WalletScreen(),
      'label': "Wallet",
      'icon': const Icon(Icons.account_balance_wallet_outlined)
    },
    {
      'screen': const RefundScreen(),
      'label': "Refund",
      'icon': const Icon(Icons.screen_rotation_alt_rounded)
    },
    {
      'screen': const RefundScreen(),
      'label': "Add",
      'icon': Container(
          color: Colors.blue.shade50,
          child: Icon(
            Icons.add,
            color: Colors.blue.shade800,
          ))
    },
    {
      'screen': const ItemsListScreen(),
      'label': "List",
      'icon': const Icon(Icons.list_outlined)
    },
    {
      'screen': const SettingsScreen(),
      'label': "Settings",
      'icon': const Icon(Icons.settings)
    },
  ];

  int selectedScreenIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.notifications_none),
        actions: [
          GestureDetector(
            onTapDown: (TapDownDetails details) =>
                _showPopupMenu(details.globalPosition),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: ThemeConstants.scaffoldHorizontalPadding),
              child: CircleAvatar(
                  radius: 8,
                  child: Image.asset(
                    "assets/images/pokemon.png",
                    fit: BoxFit.cover,
                  )),
            ),
          )
        ],
      ),
      body: IndexedStack(
        index: selectedScreenIndex,
        children: tabbedScreensData.map((e) => e['screen'] as Widget).toList(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedScreenIndex,
        onTap: (index) => changeBottomBarItemHandler(index),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: _generateNavigationItems(tabbedScreensData),
      ),
    );
  }

  List<BottomNavigationBarItem> _generateNavigationItems(
      List<Map> tabbedScreensData) {
    return tabbedScreensData.map((screenData) {
      return BottomNavigationBarItem(
        icon: screenData['icon'],
        label: screenData['label'],
      );
    }).toList();
  }

  changeBottomBarItemHandler(int index) {
    if (index == 2) {
      showAddBottomSheetHandler();
      return;
    }
    setState(() {
      selectedScreenIndex = index;
    });
  }

  showAddBottomSheetHandler() {
    showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return AddFeatureSheet();
        });
  }

  void _showPopupMenu(Offset offset) async {
    double left = offset.dx;
    double top = offset.dy;
    await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(left, top, left + 1, top + 1),
      items: [
        PopupMenuItem<String>(
          value: 'account_settings',
          onTap: () {},
          child: const Text("Account Settings"),
        ),
        PopupMenuItem<String>(
            value: 'logout',
            onTap: () {
              Future.delayed(const Duration(seconds: 0), () {
                logoutHandler();
              });
            },
            child: const Text("Logout")),
      ],
      elevation: 8.0,
    );
  }

  void logoutHandler() {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              actionsPadding: const EdgeInsets.only(right: 10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              title: const Text("Logout"),
              content: const Text("Are you sure want to logout?"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Cancel"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Logout"),
                ),
              ],
            ));
  }
}
