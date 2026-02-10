import 'package:airbnb_clone/widgets/step_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Room {
  String bathroom;
  int queenBeds;
  int singleBeds;
  int doubleBeds;
  bool mattress;
  int mattressCount;
  bool hasPets;
  bool? hasLock;

  Room({
    this.bathroom = 'Attached',
    this.queenBeds = 0,
    this.singleBeds = 0,
    this.doubleBeds = 0,
    this.mattress = false,
    this.mattressCount = 0,
    this.hasPets = false,
    this.hasLock,
  });
}

class RoomHostingScreen extends StatefulWidget {
  const RoomHostingScreen({super.key});

  @override
  State<RoomHostingScreen> createState() => _RoomHostingScreenState();
}

class _RoomHostingScreenState extends State<RoomHostingScreen> {
  int roomCount = 1;
  List<Room> rooms = [Room()];

  void addRoom() {
    setState(() {
      roomCount++;
      rooms.add(Room());
    });
  }

  void removeRoom() {
    if (roomCount > 1) {
      setState(() {
        roomCount--;
        rooms.removeLast();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'How many rooms are you hosting?',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Total Rooms',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 25),
                Row(
                  children: [
                    IconButton(
                      onPressed: removeRoom,
                      icon: const Icon(Icons.remove, color: Colors.red),
                    ),
                    Text(
                      '$roomCount',
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: addRoom,
                      icon: const Icon(Icons.add, color: Colors.red),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: rooms.length,
                padding: const EdgeInsets.only(bottom: 10),
                itemBuilder: (context, index) {
                  final room = rooms[index];

                  return Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Room ${index + 1}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 15),

                        const Text(
                          'Bathroom type',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    room.bathroom = 'Attached';
                                  });
                                },
                                child: Container(
                                  height: 48,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: room.bathroom == 'Attached'
                                        ? Colors.blue[50]
                                        : Colors.grey[200],
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: room.bathroom == 'Attached'
                                          ? Colors.blue
                                          : Colors.transparent,
                                    ),
                                  ),
                                  child: const Text(
                                    'Attached Bathroom',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    room.bathroom = 'Shared';
                                  });
                                },
                                child: Container(
                                  height: 48,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: room.bathroom == 'Shared'
                                        ? Colors.blue[50]
                                        : Colors.grey[200],
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: room.bathroom == 'Shared'
                                          ? Colors.blue
                                          : Colors.transparent,
                                    ),
                                  ),
                                  child: const Text(
                                    'Shared Bathroom',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'BEDS',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Queen Bed'),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    if (room.queenBeds > 0) {
                                      setState(() {
                                        room.queenBeds--;
                                      });
                                    }
                                  },
                                  icon: const Icon(Icons.remove),
                                ),
                                Text('${room.queenBeds}'),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      room.queenBeds++;
                                    });
                                  },
                                  icon: const Icon(Icons.add),
                                ),
                              ],
                            ),
                          ],
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Single Bed'),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    if (room.singleBeds > 0) {
                                      setState(() {
                                        room.singleBeds--;
                                      });
                                    }
                                  },
                                  icon: const Icon(Icons.remove),
                                ),
                                Text('${room.singleBeds}'),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      room.singleBeds++;
                                    });
                                  },
                                  icon: const Icon(Icons.add),
                                ),
                              ],
                            ),
                          ],
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Double Bed'),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    if (room.doubleBeds > 0) {
                                      setState(() {
                                        room.doubleBeds--;
                                      });
                                    }
                                  },
                                  icon: const Icon(Icons.remove),
                                ),
                                Text('${room.doubleBeds}'),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      room.doubleBeds++;
                                    });
                                  },
                                  icon: const Icon(Icons.add),
                                ),
                              ],
                            ),
                          ],
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Mattress'),
                            Switch(
                              value: room.mattress,
                              onChanged: (val) {
                                setState(() {
                                  room.mattress = val;
                                  if (!val) room.mattressCount = 0;
                                });
                              },
                              activeThumbColor: Colors.blue,
                            ),
                          ],
                        ),

                        if (room.mattress)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Mattress'),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      if (room.mattressCount > 0) {
                                        setState(() {
                                          room.mattressCount--;
                                        });
                                      }
                                    },
                                    icon: const Icon(Icons.remove),
                                  ),
                                  Text('${room.mattressCount}'),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        room.mattressCount++;
                                      });
                                    },
                                    icon: const Icon(Icons.add),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Pets Allowed',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Switch(
                              value: room.hasPets,
                              onChanged: (val) {
                                setState(() {
                                  room.hasPets = val;
                                });
                              },
                              activeThumbColor: Colors.blue,
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Column(
                          children: [
                            Text(
                              'Does every bedroom have a lock',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            RadioListTile(
                              title: Text('Yes'),
                              value: true,
                              groupValue: room.hasLock,
                              onChanged: (value) {
                                setState(() {
                                  room.hasLock = value!;
                                });
                              },
                              activeColor: Colors.blue,
                            ),
                            SizedBox(width: 5),
                            RadioListTile(
                              title: Text('No'),
                              value: false,
                              groupValue: room.hasLock,
                              onChanged: (value) {
                                setState(() {
                                  room.hasLock = value!;
                                });
                              },
                              activeColor: Colors.blue,
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.grey[50],
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
                          Get.toNamed('/propertyAmenitiesScreen');
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
                  const SizedBox(height: 8),
                  const StepHeader(step: 4),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
