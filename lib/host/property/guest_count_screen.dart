import 'package:airbnb_clone/widgets/step_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GuestCountScreen extends StatefulWidget {
  const GuestCountScreen({super.key});

  @override
  State<GuestCountScreen> createState() => _GuestCountScreenState();
}

class _GuestCountScreenState extends State<GuestCountScreen> {
  int adults = 2;
  int children = 1;
  int infants = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50),
                  const Text(
                    "Share some basics about your place",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "You'll add more details later, like Guest types.",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(height: 24),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Adults", style: TextStyle(fontSize: 18)),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              if(adults > 0){
                                setState(() {
                                  adults--;
                                });
                              }
                            },
                            child: Container(
                              width: 36,
                              height: 36,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.grey),
                              ),
                              child: const Icon(Icons.remove, color: Colors.grey),
                            ),
                          ),
                          SizedBox(
                            width: 40,
                            child: Center(child: Text(adults.toString(), style: const TextStyle(fontSize: 16))),
                          ),
                          GestureDetector(
                            onTap: () {
                             setState(() {
                               adults++;
                             });
                            },
                            child: Container(
                              width: 36,
                              height: 36,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.grey),
                              ),
                              child: const Icon(Icons.add, color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Divider(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Children", style: TextStyle(fontSize: 18)),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              if(children> 0){
                                setState(() {
                                  children--;
                                });
                              }
                            },
                            child: Container(
                              width: 36,
                              height: 36,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.grey),
                              ),
                              child: const Icon(Icons.remove, color: Colors.grey),
                            ),
                          ),
                          SizedBox(
                            width: 40,
                            child: Center(child: Text(children.toString(), style: const TextStyle(fontSize: 16))),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                children++;
                              });
                            },
                            child: Container(
                              width: 36,
                              height: 36,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.grey),
                              ),
                              child: const Icon(Icons.add, color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Divider(height: 32),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Infants", style: TextStyle(fontSize: 18)),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              if(infants> 0){
                                setState(() {
                                  infants--;
                                });
                              }
                            },
                            child: Container(
                              width: 36,
                              height: 36,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.grey),
                              ),
                              child: const Icon(Icons.remove, color: Colors.grey),
                            ),
                          ),
                          SizedBox(
                            width: 40,
                            child: Center(child: Text(infants.toString(), style: const TextStyle(fontSize: 16))),
                          ),
                          GestureDetector(
                            onTap: () {
                             setState(() {
                               infants++;
                             });
                            },
                            child: Container(
                              width: 36,
                              height: 36,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.grey),
                              ),
                              child: const Icon(Icons.add, color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 30,),
                ],
              ),
            ),
          ),

          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.all(20),
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
                        Get.toNamed('/roomHostingScreen', arguments: {
                          "adults": adults,
                          "children": children,
                          "infants": infants,
                        });
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
                const SizedBox(height: 15,),
                const StepHeader(step: 3),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
