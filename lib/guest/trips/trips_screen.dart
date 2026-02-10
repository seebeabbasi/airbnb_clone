import 'package:flutter/material.dart';
import 'past_screen.dart';
import 'pending_screen.dart';
import 'upcoming_screen.dart';

class TripsScreen extends StatefulWidget {
  const TripsScreen({super.key});

  @override
  State<TripsScreen> createState() => _TripsScreenState();
}

class _TripsScreenState extends State<TripsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'Upcoming adventures',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          bottom: const TabBar(
            indicatorColor: Colors.black,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: 'Upcoming'),
              Tab(text: 'Pending Request'),
              Tab(text: 'Past Trips'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [UpcomingScreen(), PendingScreen(), PastScreen()],
        ),
      ),
    );
  }
}
