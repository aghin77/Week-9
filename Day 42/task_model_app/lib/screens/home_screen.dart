import 'package:flutter/material.dart';
import '../models/task_model.dart';
import '../services/api_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<TaskModel>> tasks;

  @override
  void initState() {
    super.initState();
    tasks = ApiService.fetchTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Model Mapping'),
      ),
      body: FutureBuilder<List<TaskModel>>(
        future: tasks,
        builder: (context, snapshot) {
          if (snapshot.connectionState ==
              ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }

          final taskList = snapshot.data!;

          return ListView.builder(
            itemCount: taskList.length,
            itemBuilder: (context, index) {
              final task = taskList[index];

              return ListTile(
                leading: CircleAvatar(
                  child: Text(task.id.toString()),
                ),
                title: Text(task.title),
                trailing: Icon(
                  task.completed
                      ? Icons.check_circle
                      : Icons.cancel,
                  color: task.completed
                      ? Colors.green
                      : Colors.red,
                ),
              );
            },
          );
        },
      ),
    );
  }
}