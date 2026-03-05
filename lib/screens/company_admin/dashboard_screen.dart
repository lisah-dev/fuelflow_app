import 'package:flutter/material.dart';
import 'package:fuelflow_app/widgets/add_station_form.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFEFEF),
      floatingActionButton: _buildFAB(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              const Text(
                "Welcome, Yohana!",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(
                "${DateTime.now().toLocal().toString().split(' ')[0]}",
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const Divider(thickness: 0.4),
              const SizedBox(height: 16),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  _buildKpiCard("Stations", "5", Icons.local_gas_station),
                  _buildKpiCard("Managers", "8", Icons.group),
                  _buildKpiCard("Fuel Tanks", "15", Icons.storage),
                  _buildKpiCard("Daily Sales", "TZS 2.5M", Icons.attach_money),
                  _buildKpiCard("Deliveries", "2 pending", Icons.fire_truck),
                  _buildKpiCard("Expenses", "TZS 750K", Icons.receipt_long),
                ],
              ),
              const SizedBox(height: 32),
              const Text(
                "Recent Activities",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              ...List.generate(3, (index) => _buildActivityItem(index)),
              const SizedBox(height: 32),
              const Text(
                "Station Performance",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              ...List.generate(3, (index) => _buildStationCard(index)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildKpiCard(String label, String value, IconData icon) {
    return SizedBox(
      width: 105,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 22, color: const Color(0xFF0080FF)),
            const SizedBox(height: 6),
            Text(value,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            const SizedBox(height: 2),
            Text(label,
                style: const TextStyle(fontSize: 11, color: Colors.grey)),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(String title, IconData icon) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(icon, size: 20),
      label: Text(title),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF0080FF),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  Widget _buildActivityItem(int index) {
    return ListTile(
      leading: const Icon(Icons.notifications, color: Colors.grey),
      title: Text("Activity ${index + 1}: Fuel delivery recorded"),
      subtitle: const Text("Today at 10:45 AM"),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
    );
  }

  Widget _buildStationCard(int index) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.ev_station, color: Color(0xFF0080FF)),
        title: Text("Station ${index + 1}"),
        subtitle: const Text("Sales: TZS 800K | Tank Level: 63%"),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }

  Widget _buildFAB(BuildContext context) {
    return FloatingActionButton(
      heroTag: 'dashboard_fab',
      onPressed: () {
        showModalBottomSheet(
          context: context,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          builder: (context) => Padding(
            padding: const EdgeInsets.all(20.0),
            child: Wrap(
              runSpacing: 12,
              children: [
                ListTile(
                  leading: const Icon(Icons.add_business),
                  title: const Text("Add Station"),
                  onTap: () {
                    Navigator.pop(context); // Close the sheet
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(16)),
                      ),
                      builder: (context) => AddStationForm(
                        onSubmit: (stationData) {
                          // TODO: Replace with actual API call
                          print("Station data: $stationData");
                        },
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.person_add_alt),
                  title: const Text("Add Manager"),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.add_box),
                  title: const Text("Add Tank"),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.delivery_dining),
                  title: const Text("Add Delivery"),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.add_chart),
                  title: const Text("Add Expense"),
                  onTap: () {},
                ),
              ],
            ),
          ),
        );
      },
      backgroundColor: const Color(0xFF0080FF),
      child: const Icon(Icons.add),
    );
  }
}
