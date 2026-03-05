import 'package:flutter/material.dart';

class AddStationForm extends StatefulWidget {
  final Function(Map<String, dynamic>) onSubmit;
  const AddStationForm({super.key, required this.onSubmit});

  @override
  State<AddStationForm> createState() => _AddStationFormState();
}

class _AddStationFormState extends State<AddStationForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _managerIdController = TextEditingController();
  final TextEditingController _regionController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();
  final TextEditingController _latitudeController = TextEditingController();
  final TextEditingController _longitudeController = TextEditingController();
  String _stationType = 'retail';

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final payload = {
        "name": _nameController.text,
        "location": _locationController.text,
        "manager_id": int.tryParse(_managerIdController.text),
        "region": _regionController.text,
        "district": _districtController.text,
        "latitude": double.tryParse(_latitudeController.text),
        "longitude": double.tryParse(_longitudeController.text),
        "station_type": _stationType,
      };
      widget.onSubmit(payload);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
        left: 20,
        right: 20,
        top: 20,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Text("Add New Station", style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 16),
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Station Name'),
              validator: (val) => val!.isEmpty ? 'Required' : null,
            ),
            TextFormField(
              controller: _locationController,
              decoration: const InputDecoration(labelText: 'Location'),
              validator: (val) => val!.isEmpty ? 'Required' : null,
            ),
            TextFormField(
              controller: _managerIdController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Manager ID'),
              validator: (val) => val!.isEmpty ? 'Required' : null,
            ),
            TextFormField(
              controller: _regionController,
              decoration: const InputDecoration(labelText: 'Region'),
              validator: (val) => val!.isEmpty ? 'Required' : null,
            ),
            TextFormField(
              controller: _districtController,
              decoration: const InputDecoration(labelText: 'District'),
              validator: (val) => val!.isEmpty ? 'Required' : null,
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _latitudeController,
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    decoration: const InputDecoration(labelText: 'Latitude'),
                    validator: (val) => val!.isEmpty ? 'Required' : null,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextFormField(
                    controller: _longitudeController,
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    decoration: const InputDecoration(labelText: 'Longitude'),
                    validator: (val) => val!.isEmpty ? 'Required' : null,
                  ),
                ),
              ],
            ),
            DropdownButtonFormField<String>(
              value: _stationType,
              decoration: const InputDecoration(labelText: 'Station Type'),
              items: const [
                DropdownMenuItem(value: 'retail', child: Text('Retail')),
                DropdownMenuItem(value: 'wholesale', child: Text('Wholesale')),
              ],
              onChanged: (val) => setState(() => _stationType = val!),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: const Icon(Icons.save),
              label: const Text('Submit'),
              onPressed: _submitForm,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0080FF),
                minimumSize: const Size(double.infinity, 48),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
