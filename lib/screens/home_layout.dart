import 'package:flutter/material.dart';
import 'package:fuelflow_app/screens/company_admin/dashboard_screen.dart';
import 'package:fuelflow_app/screens/company_admin/stations_screen.dart';

class CompanyAdminHome extends StatefulWidget {
  const CompanyAdminHome({super.key});

  @override
  State<CompanyAdminHome> createState() => _CompanyAdminHomeState();
}

class _CompanyAdminHomeState extends State<CompanyAdminHome> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const DashboardScreen(),
    const StationsScreen(),
    const ReportsScreen(),
    const AccountScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pamtech Fuel Admin"),
        backgroundColor: const Color(0xFF0080FF),
      ),
      drawer: AppDrawer(onSelectTab: _onItemTapped),
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: const Color(0xFF0080FF),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_gas_station),
            label: 'Stations',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Reports',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}

class AppDrawer extends StatelessWidget {
  final Function(int) onSelectTab;

  const AppDrawer({super.key, required this.onSelectTab});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color(0xFF0080FF),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                CircleAvatar(radius: 30, backgroundColor: Colors.white),
                SizedBox(height: 10),
                Text('Company Admin',
                    style: TextStyle(color: Colors.white, fontSize: 18)),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.dashboard),
            title: const Text('Dashboard'),
            onTap: () {
              Navigator.pop(context);
              onSelectTab(0);
            },
          ),
          ListTile(
            leading: const Icon(Icons.local_gas_station),
            title: const Text('Stations'),
            onTap: () {
              Navigator.pop(context);
              onSelectTab(1);
            },
          ),
          ListTile(
            leading: const Icon(Icons.receipt),
            title: const Text('Reports'),
            onTap: () {
              Navigator.pop(context);
              onSelectTab(2);
            },
          ),
          ListTile(
            leading: const Icon(Icons.account_circle),
            title: const Text('Account'),
            onTap: () {
              Navigator.pop(context);
              onSelectTab(3);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});
  @override
  Widget build(BuildContext context) => const Center(child: Text('Reports'));
}

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});
  @override
  Widget build(BuildContext context) => const Center(child: Text('Account'));
}
