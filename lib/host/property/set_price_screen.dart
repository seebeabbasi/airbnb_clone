import 'package:airbnb_clone/widgets/step_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PriceYourPlaceScreen extends StatefulWidget {
  const PriceYourPlaceScreen({super.key});

  @override
  State<PriceYourPlaceScreen> createState() => _PriceYourPlaceScreenState();
}

class _PriceYourPlaceScreenState extends State<PriceYourPlaceScreen> {
  int price = 300;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Price your place',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              const SizedBox(height: 5),
              const Text(
                "Set a competitive price to attract more guests.",
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 20),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Rs"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () {
                            if (price > 0) {
                              setState(() {
                                price--;
                              });
                            }
                          },
                        ),
                        Text(
                          "$price",
                          style: const TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () {
                            setState(() {
                              price++;
                            });
                          },
                        ),
                      ],
                    ),
                    const Text(
                      "BASE PRICE PER NIGHT",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Earnings Breakdown",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Base price",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          "Rs $price",
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Cleaning fee",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text("+ Rs 0", style: TextStyle(color: Colors.white)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Host service fee (3%)",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text("- Rs 0", style: TextStyle(color: Colors.white)),
                      ],
                    ),
                    const Divider(color: Colors.grey),
                    const Text(
                      "YOU'LL EARN (PER NIGHT)",
                      style: TextStyle(color: Colors.redAccent, fontSize: 12),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      "Rs $price",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
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
                          child: const Text(
                            'Back',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
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
                          onPressed: () {
                            Get.toNamed('/pricingStrategyScreen');
                          },
                          child: const Text(
                            "Next",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const StepHeader(step: 11),
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
