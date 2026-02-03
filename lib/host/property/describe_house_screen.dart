import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:airbnb_clone/widgets/step_header.dart';

class DescribeHouseScreen extends StatefulWidget {
  const DescribeHouseScreen({super.key});

  @override
  State<DescribeHouseScreen> createState() => _DescribeHouseScreenState();
}

class _DescribeHouseScreenState extends State<DescribeHouseScreen> {
  final List<Map<String, dynamic>> highlights = [
    {'icon': Icons.clear_rounded, 'label': 'Peaceful'},
    {'icon': Icons.auto_awesome, 'label': 'Unique'},
    {'icon': Icons.family_restroom, 'label': 'Family-friendly'},
    {'icon': Icons.diamond_outlined, 'label': 'Stylish'},
    {'icon': Icons.location_on, 'label': 'Central'},
    {'icon': Icons.account_balance, 'label': 'Spacious'},
  ];

  final List<int> selected = [];

  void toggleSelection(int index) {
    setState(() {
      if (selected.contains(index)) {
        selected.remove(index);
      } else {
        selected.add(index);
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Next, let's describe your house",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 10),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Choose up to 2 highlights.",
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            ),

            const SizedBox(height: 25),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GridView.builder(
                  itemCount: highlights.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 14,
                  ),
                  itemBuilder: (context, index) {
                    final bool isSelected = selected.contains(index);

                    return GestureDetector(
                      onTap: () {
                        toggleSelection(index);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: isSelected ? Colors.blue : Colors.black26,
                            width: 2,
                          ),
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              highlights[index]['icon'],
                              size: 30,
                              color: isSelected ? Colors.blue : Colors.black,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              highlights[index]['label'],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: isSelected ? Colors.blue : Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: const BoxDecoration(
                border: Border(top: BorderSide(color: Colors.black12)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: Get.back,
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
                          Get.toNamed('/propertyDescriptionScreen');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 15),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        child: const Text(
                          "Next",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const StepHeader(step: 8),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
