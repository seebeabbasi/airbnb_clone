import 'package:airbnb_clone/widgets/step_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PropertyAmenitiesScreen extends StatefulWidget {
  const PropertyAmenitiesScreen({super.key});

  @override
  State<PropertyAmenitiesScreen> createState() =>
      _PropertyAmenitiesScreenState();
}

class _PropertyAmenitiesScreenState extends State<PropertyAmenitiesScreen> {
  Set<String> selected = {};
  final List<Map<String, dynamic>> amenities = [
    {'name': 'WI-FI', 'icon': Icons.wifi_rounded},
    {'name': 'AIR CONDITIONING', 'icon': Icons.ac_unit_rounded},
    {'name': 'HEATING', 'icon': Icons.fireplace_rounded},
    {'name': 'KITCHEN', 'icon': Icons.soup_kitchen_rounded},
    {'name': 'WASHING MACHINE', 'icon': Icons.local_laundry_service_rounded},
    {'name': 'PARKING', 'icon': Icons.directions_car_rounded},
  ];

  void toggle(String name) {
    setState(() {
      if (selected.contains(name)) {
        selected.remove(name);
      } else {
        selected.add(name);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const Text(
                'Tell guests what your place has to offer',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'You can add more amenities after you publish your listing.',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 15),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 13,
                    mainAxisSpacing: 13,
                    childAspectRatio: 1.1,
                  ),
                  itemCount: amenities.length,
                  itemBuilder: (context, index) {
                    final item = amenities[index];
                    final isSelected = selected.contains(item['name']);

                    return GestureDetector(
                      onTap: () {
                        toggle(item['name']);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.white : Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: isSelected ? Colors.blue : Colors.grey,
                            width: isSelected ? 2 : 1,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              item['icon'],
                              size: 40,
                              color: isSelected ? Colors.blue : Colors.grey,
                            ),
                            const SizedBox(height: 12),
                            Text(
                              item['name'],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: isSelected ? Colors.blue : Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const Divider(height: 1),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                color: Colors.white,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: const Text(
                            "Back",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Get.toNamed('/propertyAddressScreen');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 40,
                              vertical: 15,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            "Next",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const StepHeader(step: 5),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
