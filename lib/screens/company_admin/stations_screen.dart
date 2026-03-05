import 'package:flutter/material.dart';
import 'package:fuelflow_app/widgets/add_station_form.dart';

class StationsScreen extends StatelessWidget {
  const StationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFEFEF),
      appBar: AppBar(
        title: const Text("Stations"),
        backgroundColor: const Color(0xFF0080FF),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            builder: (context) => AddStationForm(
              onSubmit: (stationData) {
                // TODO: Replace with actual API call
                print("Station data: $stationData");
              },
            ),
          );
        },
        backgroundColor: const Color(0xFF0080FF),
        child: const Icon(Icons.add),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        itemCount: 5, // For now, mock list of 5 stations
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          return Card(
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              leading:
                  const Icon(Icons.local_gas_station, color: Color(0xFF0080FF)),
              title: Text("Station ${index + 1}"),
              subtitle: const Text("Region: Dar es Salaam\nManager: John Doe"),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                // TODO: View or edit station details
              },
            ),
          );
        },
      ),
    );
  }
}
