import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:airbnb_clone/widgets/step_header.dart';

class PropertyPhotosScreen extends StatefulWidget {
  const PropertyPhotosScreen({super.key});

  @override
  State<PropertyPhotosScreen> createState() => _PropertyPhotosScreenState();
}

class _PropertyPhotosScreenState extends State<PropertyPhotosScreen> {
  final List<File> photos = [];
  final ImagePicker picker = ImagePicker();

  Future pickImage(int index) async {
    ImageSource? src = await Get.dialog<ImageSource>(
      AlertDialog(
        title: const Text("Choose Image Source"),
        actions: [
          TextButton(
            onPressed: () {
              Get.back(result: ImageSource.camera);
              },
            child: const Text("Camera"),
          ),
          TextButton(
            onPressed: () {
              Get.back(result: ImageSource.gallery);
            },
            child: const Text("Gallery"),
          ),
        ],
      ),
    );

    if (src != null) {
      final XFile? img = await picker.pickImage(source: src);
      if (img != null) {
        setState(() {
          if (index < photos.length) {
            photos[index] = File(img.path);
          } else if (photos.length < 5) {
            photos.add(File(img.path));
          }
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Next, add some photos of your house",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                "Choose up to 5 pictures... We'll use the first one as your cover.",
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
              const SizedBox(height: 30),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: GestureDetector(
                      onTap: () => pickImage(0),
                      child: Container(
                        height: 220,
                        decoration: BoxDecoration(
                          color: Colors.grey[50],
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: photos.isNotEmpty
                                ? Colors.redAccent
                                : Colors.grey,
                          ),
                          image: photos.isNotEmpty
                              ? DecorationImage(
                            image: FileImage(photos[0]),
                            fit: BoxFit.cover,
                          )
                              : null,
                        ),
                        child: photos.isEmpty
                            ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.camera_alt_outlined,
                                color: Colors.grey, size: 40),
                            Text(
                              "PHOTO 1",
                              style: TextStyle(
                                  fontSize: 10, color: Colors.grey),
                            ),
                          ],
                        )
                            : null,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: List.generate(2, (i) {
                        int index = i + 1;
                        bool hasPhoto = index < photos.length;
                        return Padding(
                          padding: EdgeInsets.only(bottom: i == 0 ? 12 : 0),
                          child: GestureDetector(
                            onTap: () {
                              pickImage(index);
                            },
                            child: Container(
                              height: 104,
                              decoration: BoxDecoration(
                                color: Colors.grey[50],
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                  color: hasPhoto
                                      ? Colors.redAccent
                                      : Colors.grey,
                                ),
                                image: hasPhoto
                                    ? DecorationImage(
                                  image: FileImage(photos[index]),
                                  fit: BoxFit.cover,
                                )
                                    : null,
                              ),
                              child: !hasPhoto
                                  ? Column(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.camera_alt_outlined,
                                      color: Colors.grey, size: 24),
                                  Text(
                                    "PHOTO ${index + 1}",
                                    style: const TextStyle(
                                        fontSize: 10,
                                        color: Colors.grey),
                                  ),
                                ],
                              )
                                  : null,
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),
              Row(
                children: List.generate(2, (i) {
                  int index = i + 3;
                  bool hasPhoto = index < photos.length;
                  return Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: i == 1 ? 12 : 0,
                        right: i == 0 ? 12 : 0,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          pickImage(index);
                        },
                        child: Container(
                          height: 104,
                          decoration: BoxDecoration(
                            color: Colors.grey[50],
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: hasPhoto
                                  ? Colors.redAccent
                                  : Colors.grey[300]!,
                            ),
                            image: hasPhoto
                                ? DecorationImage(
                              image: FileImage(photos[index]),
                              fit: BoxFit.cover,
                            )
                                : null,
                          ),
                          child: !hasPhoto
                              ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.camera_alt_outlined,
                                  color: Colors.grey, size: 24),
                              Text(
                                "PHOTO ${index + 1}",
                                style: const TextStyle(
                                    fontSize: 10, color: Colors.grey),
                              ),
                            ],
                          )
                              : null,
                        ),
                      ),
                    ),
                  );
                }),
              ),

              const Spacer(),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: (){
                        Get.back();
                     },
                    child: const Text(
                      "Back",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.toNamed("/describeHouseScreen");
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

              const SizedBox(height: 15),
              const StepHeader(step: 7),
            ],
          ),
        ),
      ),
    );
  }
}
