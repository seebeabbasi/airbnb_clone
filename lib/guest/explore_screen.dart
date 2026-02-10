import 'package:flutter/material.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}
class _ExploreScreenState extends State<ExploreScreen> {

  void openFilters() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {

        bool petsAllowed = false;
        int adults = 1;
        int children = 0;
        int infants = 0;
        DateTime? checkIn;
        DateTime? checkOut;
        RangeValues priceRange = const RangeValues(1000, 50000);

        Set<String> propertyTypes = {};
        Set<String> amenities = {};

        return StatefulBuilder(
          builder: (context, setSheetState) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.9,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.close),
                        ),
                        const Expanded(
                          child: Text(
                            "Filters",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                        ),
                        const SizedBox(width: 40),
                      ],
                    ),
                  ),
                  const Divider(height: 1),

                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Pets Allowed",
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                const SizedBox(height: 4),
                                Text("Bringing a service animal?",
                                    style: TextStyle(fontSize: 14, color: Colors.grey[600])),
                              ],
                            ),
                            Switch(
                              value: petsAllowed,
                              onChanged: (v) {
                                setSheetState(() => petsAllowed = v);
                              },
                            ),
                          ],
                        ),

                        const SizedBox(height: 32),

                        const Text("Guests",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 16),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Adults"),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    if (adults > 1) {
                                      setSheetState(() => adults--);
                                    }
                                  },
                                  icon: const Icon(Icons.remove_circle_outline, size: 32),
                                ),
                                Text(adults.toString()),
                                IconButton(
                                  onPressed: () {
                                    setSheetState(() => adults++);
                                  },
                                  icon: const Icon(Icons.add_circle_outline, size: 32),
                                ),
                              ],
                            ),
                          ],
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Children"),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    if (children > 0) {
                                      setSheetState(() => children--);
                                    }
                                  },
                                  icon: const Icon(Icons.remove_circle_outline, size: 32),
                                ),
                                Text(children.toString()),
                                IconButton(
                                  onPressed: () {
                                    setSheetState(() => children++);
                                  },
                                  icon: const Icon(Icons.add_circle_outline, size: 32),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Infants"),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    if (infants > 0) {
                                      setSheetState(() => infants--);
                                    }
                                  },
                                  icon: const Icon(Icons.remove_circle_outline, size: 32),
                                ),
                                Text(infants.toString()),
                                IconButton(
                                  onPressed: () {
                                    setSheetState(() => infants++);
                                  },
                                  icon: const Icon(Icons.add_circle_outline, size: 32),
                                ),
                              ],
                            ),
                          ],
                        ),

                        const SizedBox(height: 32),

                        const Text("Property type",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),

                        CheckboxListTile(
                          title: const Text("Apartment"),
                          value: propertyTypes.contains("Apartment"),
                          onChanged: (v) {
                            setSheetState(() {
                              v! ? propertyTypes.add("Apartment") : propertyTypes.remove("Apartment");
                            });
                          },
                        ),

                        CheckboxListTile(
                          title: const Text("House"),
                          value: propertyTypes.contains("House"),
                          onChanged: (v) {
                            setSheetState(() {
                              v! ? propertyTypes.add("House") : propertyTypes.remove("House");
                            });
                          },
                        ),

                        CheckboxListTile(
                          title: const Text("Villa"),
                          value: propertyTypes.contains("Villa"),
                          onChanged: (v) {
                            setSheetState(() {
                              v! ? propertyTypes.add("Villa") : propertyTypes.remove("Villa");
                            });
                          },
                        ),

                        const SizedBox(height: 32),
                        const Text("Amenities",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),

                        CheckboxListTile(
                          title: const Text("Wi-Fi"),
                          value: amenities.contains("Wi-Fi"),
                          onChanged: (v) {
                            setSheetState(() {
                              v! ? amenities.add("Wi-Fi") : amenities.remove("Wi-Fi");
                            });
                          },
                        ),

                        CheckboxListTile(
                          title: const Text("Kitchen"),
                          value: amenities.contains("Kitchen"),
                          onChanged: (v) {
                            setSheetState(() {
                              v! ? amenities.add("Kitchen") : amenities.remove("Kitchen");
                            });
                          },
                        ),

                        const SizedBox(height: 32),


                        const Text("Dates",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 12),

                        Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () async {
                                  DateTime? picked = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime(2030),
                                  );
                                  if (picked != null) {
                                    setSheetState(() => checkIn = picked);
                                  }
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    checkIn == null
                                        ? "Check-in"
                                        : "${checkIn!.day}/${checkIn!.month}/${checkIn!.year}",
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: InkWell(
                                onTap: () async {
                                  DateTime? picked = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime(2030),
                                  );
                                  if (picked != null) {
                                    setSheetState(() => checkOut = picked);
                                  }
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    checkOut == null
                                        ? "Check-out"
                                        : "${checkOut!.day}/${checkOut!.month}/${checkOut!.year}",
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 32),
                        const Text("Price range",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),

                        RangeSlider(
                          min: 1000,
                          max: 50000,
                          values: priceRange,
                          onChanged: (values) {
                            setSheetState(() => priceRange = values);
                          },
                        ),

                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            setSheetState(() {
                              petsAllowed = false;
                              adults = 1;
                              children = 0;
                              infants = 0;
                              propertyTypes.clear();
                              amenities.clear();
                              checkIn = null;
                              checkOut = null;
                              priceRange = const RangeValues(1000, 50000);
                            });
                          },
                          child: const Text("Clear all"),
                        ),
                        const Spacer(),
                        ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("Show homes"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Explore"),
        actions: [
          IconButton(
            onPressed: openFilters,
            icon: const Icon(Icons.tune),
          )
        ],
      ),
      body: const Center(
        child: Text("Properties list here"),
      ),
    );
  }
}
