import 'package:airbnb_clone/widgets/step_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  GoogleMapController? mapController;

  LatLng selectedLocation = const LatLng(24.8607, 67.0011);
  final TextEditingController fullAddressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController provinceController = TextEditingController();
  final TextEditingController postalCodeController = TextEditingController();

  Future<void> useCurrentLocation() async {
    await Geolocator.requestPermission();

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    selectedLocation = LatLng(position.latitude, position.longitude);

    mapController?.animateCamera(CameraUpdate.newLatLng(selectedLocation));

    await fillAddressFromLatLng();
    setState(() {});
  }

  Future<void> onMapTap(LatLng latLng) async {
    selectedLocation = latLng;
    await fillAddressFromLatLng();
    setState(() {});
  }

  Future<void> fillAddressFromLatLng() async {
    List<Placemark> placemarks = await placemarkFromCoordinates(
      selectedLocation.latitude,
      selectedLocation.longitude,
    );

    final place = placemarks.first;

    fullAddressController.text = "${place.street}, ${place.subLocality}";
    cityController.text = place.locality ?? "";
    countryController.text = place.country ?? "";
    provinceController.text = place.administrativeArea ?? "";
    postalCodeController.text = place.postalCode ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const Text(
                "Enter your address",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 6),
              const Text(
                "Your address is only shared with guests after they've booked.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 22),

              InkWell(
                onTap: useCurrentLocation,
                child: Container(
                  height: 58,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.black),
                  ),
                  child: Row(
                    children: const [
                      SizedBox(width: 18),
                      Icon(Icons.location_pin, color: Colors.red),
                      SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          "Use my current location",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios, size: 16),
                      SizedBox(width: 18),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              TextField(
                controller: fullAddressController,
                decoration: InputDecoration(
                  hintText: "Full Address / Street",
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 14),

              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: cityController,
                      decoration: InputDecoration(
                        hintText: "City",
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextField(
                      controller: countryController,
                      decoration: InputDecoration(
                        hintText: "Country",
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: provinceController,
                      decoration: InputDecoration(
                        hintText: "Province",
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextField(
                      controller: postalCodeController,
                      decoration: InputDecoration(
                        hintText: "PostCode",
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 22),

              Container(
                height: 210,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(22),
                  child: GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: selectedLocation,
                      zoom: 14,
                    ),
                    onMapCreated: (controller) {
                      mapController = controller;
                    },
                    markers: {
                      Marker(
                        markerId: const MarkerId("m1"),
                        position: selectedLocation,
                      ),
                    },
                    onTap: onMapTap,
                  ),
                ),
              ),

              const SizedBox(height: 35),
              Row(
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
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      Get.toNamed('/propertyPhotosScreen');
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
                    child: const Text(
                      "Next",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              StepHeader(step: 6),
            ],
          ),
        ),
      ),
    );
  }
}
