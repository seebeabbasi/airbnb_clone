import 'package:airbnb_clone/widgets/step_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PricingStrategiesScreen extends StatefulWidget {
  const PricingStrategiesScreen({super.key});

  @override
  State<PricingStrategiesScreen> createState() => _PricingStrategiesScreenState();
}

class _PricingStrategiesScreenState extends State<PricingStrategiesScreen> {
  int weekly = 2;
  int monthly = 3;
  int earlyBird = 6;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              SizedBox(height: 10,),
              Text('Pricing Strategies',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
              SizedBox(height: 10,),
              Container(
                padding: const EdgeInsets.all(14),
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: Colors.grey),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Weekly Discount",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("7 nights or more",
                            style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () {
                            if (weekly > 0) {
                              setState(() {
                                weekly--;
                              });
                            }
                          },
                        ),
                        Text("$weekly%"),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () {
                            setState(() {
                              weekly++;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(14),
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: Colors.grey),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Monthly Discount",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("28 nights or more",
                            style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () {
                            if (monthly > 0) {
                              setState(() {
                                monthly--;
                              });
                            }
                          },
                        ),
                        Text("$monthly%"),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () {
                            setState(() {
                              monthly++;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: Colors.grey),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Early Bird Discount",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("Booked 2+ months early",
                            style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () {
                            if (earlyBird > 0) {
                              setState(() {
                                earlyBird--;
                              });
                            }
                          },
                        ),
                        Text("$earlyBird%"),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () {
                            setState(() {
                              earlyBird++;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 65),
              const Divider(),
              Container(
                padding: const EdgeInsets.all(16),
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
                          child: const Text('Back', style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,)),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 15),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          onPressed: () {
                          },
                          child: const Text(
                            "Next",
                            style: TextStyle(color: Colors.white, fontSize: 16,),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const StepHeader(step: 12),
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
