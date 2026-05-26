import 'package:flutter/material.dart';
import 'services/network_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Day 41 HTTP Task',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TaskScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Day 41: Networking with HTTP'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            print('Fetching tasks...');
            // Instantiate the NetworkService and call the method
            final networkService = NetworkService();
            await networkService.fetchTasks();
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
          child: const Text(
            'Fetch Tasks (Check Console)',
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}