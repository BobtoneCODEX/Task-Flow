import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  // Sample task data
  List<Task> tasks = [
    Task(
      id: '1',
      title: 'Design Login Screen',
      priority: 'High',
      icon: Icons.design_services,
      isCompleted: false,
    ),
    Task(
      id: '2',
      title: 'Fix Authentication',
      priority: 'Medium',
      icon: Icons.security,
      isCompleted: false,
    ),
    Task(
      id: '3',
      title: 'Create Dashboard UI',
      priority: 'High',
      icon: Icons.dashboard,
      isCompleted: true,
    ),
    Task(
      id: '4',
      title: '',
      priority: 'Low',
      icon: Icons.code,
      isCompleted: false,
    ),
  ];

  List<Deadline> deadlines = [
    Deadline(
      title: 'Flutter Project',
      date: 'Tomorrow',
    ),
    Deadline(
      title: 'UI Design',
      date: 'Friday',
    ),
  ];

  // Add these for notification functionality
  int notificationCount = 3;
  int selectedIndex = 0;

  // Get statistics
  int get totalTasks => tasks.length;
  int get completedTasks => tasks.where((t) => t.isCompleted).length;
  int get pendingTasks => tasks.where((t) => !t.isCompleted).length;
  int get overdueTasks => 1; // Example static value

  double get progress => totalTasks > 0 ? completedTasks / totalTasks : 0;

  @override
  Widget build(BuildContext context) {
    const Color gold = Color(0xFFFFC107);

    return Scaffold(
      backgroundColor: Colors.black,

      // Drawer
      drawer: _buildDrawer(),

      // App Bar
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: gold),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        title: const Text(
          "Task Flow",
          style: TextStyle(
            color: gold,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications_none, color: gold),
                onPressed: () {
                  _showNotificationDialog(context);
                },
              ),
              if (notificationCount > 0)
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 16,
                      minHeight: 16,
                    ),
                    child: Text(
                      notificationCount.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: () {
              _showProfileDialog(context);
            },
            child: const CircleAvatar(
              backgroundColor: gold,
              child: Icon(Icons.person, color: Colors.black),
            ),
          ),
          const SizedBox(width: 15),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Greeting with dynamic time
            _buildGreeting(),
            const SizedBox(height: 5),
            Text(
              "Let's finish today's tasks.",
              style: TextStyle(
                color: Colors.grey.shade400,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 25),

            // Statistics
            _buildStatistics(gold),
            const SizedBox(height: 30),

            // Progress
            _buildProgress(gold),
            const SizedBox(height: 30),

            // Today's Tasks
            _buildTaskSection(gold),
            const SizedBox(height: 30),

            // Upcoming Deadlines
            _buildDeadlineSection(gold),
            const SizedBox(height: 100),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: gold,
        onPressed: () {
          _showAddTaskDialog(context);
        },
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: gold,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
          // Navigate to different sections
          switch (index) {
            case 0:
              // Home - already here
              break;
            case 1:
              _showAllTasks(context);
              break;
            case 2:
              _showCalendar(context);
              break;
            case 3:
              _showProfileDialog(context);
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.task),
            label: "Tasks",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: "Calendar",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }

  // Custom Drawer
  Widget _buildDrawer() {
    return Drawer(
      backgroundColor: Colors.grey.shade900,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color(0xFFFFC107),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Icon(
                  Icons.task_alt,
                  size: 40,
                  color: Colors.black,
                ),
                SizedBox(height: 8),
                Text(
                  'Task Flow',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Manage your tasks efficiently',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          _buildDrawerItem(Icons.home, 'Dashboard', () {
            Navigator.pop(context);
          }),
          _buildDrawerItem(Icons.task, 'All Tasks', () {
            Navigator.pop(context);
            _showAllTasks(context);
          }),
          _buildDrawerItem(Icons.calendar_today, 'Calendar', () {
            Navigator.pop(context);
            _showCalendar(context);
          }),
          _buildDrawerItem(Icons.person, 'Profile', () {
            Navigator.pop(context);
            _showProfileDialog(context);
          }),
          const Divider(color: Colors.grey),
          _buildDrawerItem(Icons.settings, 'Settings', () {
            Navigator.pop(context);
            _showSettingsDialog(context);
          }),
          _buildDrawerItem(Icons.logout, 'Logout', () {
            Navigator.pop(context);
            _showLogoutDialog(context);
          }),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
      onTap: onTap,
    );
  }

  // Greeting based on time
  Widget _buildGreeting() {
    final hour = DateTime.now().hour;
    String greeting;
    if (hour < 12) {
      greeting = 'Good Morning 🌅';
    } else if (hour < 17) {
      greeting = 'Good Afternoon ☀️';
    } else {
      greeting = 'Good Evening 🌆';
    }

    return Text(
      greeting,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  // Statistics Section
  Widget _buildStatistics(Color gold) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: statCard(
                totalTasks.toString(),
                "Tasks",
                Icons.task_alt,
                gold,
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: statCard(
                completedTasks.toString(),
                "Completed",
                Icons.check_circle,
                Colors.green,
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        Row(
          children: [
            Expanded(
              child: statCard(
                pendingTasks.toString(),
                "Pending",
                Icons.schedule,
                Colors.orange,
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: statCard(
                overdueTasks.toString(),
                "Overdue",
                Icons.warning,
                Colors.red,
              ),
            ),
          ],
        ),
      ],
    );
  }

  // Progress Section
  Widget _buildProgress(Color gold) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Today's Progress",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              Text(
                "${(progress * 100).round()}%",
                style: TextStyle(
                  color: gold,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 10,
              backgroundColor: Colors.black,
              valueColor: const AlwaysStoppedAnimation(Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  // Task Section with interactive tasks
  Widget _buildTaskSection(Color gold) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Today's Tasks",
              style: TextStyle(
               color: Color.fromARGB(255, 101, 88, 31),

                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
              onPressed: () {
                _showAllTasks(context);
              },
              child: const Text(
                'See All',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        ...tasks.map((task) => taskTile(
              task.title,
              task.priority,
              task.icon,
              task.isCompleted,
              gold,
              () {
                setState(() {
                  task.isCompleted = !task.isCompleted;
                });
              },
              () {
                _showTaskOptions(context, task);
              },
            )),
      ],
    );
  }

  // Deadlines Section
  Widget _buildDeadlineSection(Color gold) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Upcoming Deadlines",
          style: TextStyle(
            color: Color.fromARGB(255, 101, 88, 31),
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 15),
        ...deadlines.map((deadline) => deadlineCard(
              deadline.title,
              deadline.date,
              gold,
              () {
                _showDeadlineOptions(context, deadline);
              },
            )),
      ],
    );
  }

  // Interactive Stat Card
  Widget statCard(String number, String title, IconData icon, Color color) {
    return InkWell(
      onTap: () {
        // Show filter by category
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Showing $title'),
            backgroundColor: color,
          ),
        );
      },
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.grey.shade900,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 35),
            const SizedBox(height: 15),
            Text(
              number,
              style: TextStyle(
                color: color,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              title,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  // Interactive Task Tile
  Widget taskTile(
    String title,
    String priority,
    IconData icon,
    bool isCompleted,
    Color color,
    VoidCallback onToggle,
    VoidCallback onLongPress,
  ) {
    return Card(
      color: isCompleted ? Colors.grey.shade800 : Colors.grey.shade900,
      margin: const EdgeInsets.only(bottom: 15),
      child: ListTile(
        leading: Icon(
          isCompleted ? Icons.check_circle : icon,
          color: isCompleted ? Colors.green : color,
        ),
        title: Text(
          title,
          style: TextStyle(
            color: isCompleted ? Colors.grey : Colors.white,
            decoration: isCompleted ? TextDecoration.lineThrough : null,
          ),
        ),
        subtitle: Text(
          priority,
          style: TextStyle(
            color: isCompleted ? Colors.grey.shade600 : Colors.grey,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Checkbox(
              value: isCompleted,
              onChanged: (_) => onToggle(),
              activeColor: Colors.green,
            ),
            IconButton(
              icon: Icon(
                Icons.arrow_forward_ios,
                color: color,
                size: 18,
              ),
              onPressed: onLongPress,
            ),
          ],
        ),
        onTap: onToggle,
      ),
    );
  }

  // Interactive Deadline Card
  Widget deadlineCard(String title, String date, Color color, VoidCallback onTap) {
    return Card(
      color: Colors.grey.shade900,
      margin: const EdgeInsets.only(bottom: 15),
      child: ListTile(
        leading: const Icon(Icons.event, color: Colors.blue),
        title: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
        subtitle: Text(
          date,
          style: const TextStyle(color: Colors.grey),
        ),
        trailing: IconButton(
          icon: Icon(Icons.more_vert, color: color),
          onPressed: onTap,
        ),
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Deadline: $title - $date'),
              backgroundColor: Colors.blue,
            ),
          );
        },
      ),
    );
  }

  // Dialog Functions
  void _showAddTaskDialog(BuildContext context) {
    final titleController = TextEditingController();
    String selectedPriority = 'Medium';
    final formKey = GlobalKey<FormState>();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey.shade900,
        title: const Text(
          'Add New Task',
          style: TextStyle(color: Colors.white),
        ),
        content: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: titleController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  hintText: 'Enter task title',
                  hintStyle: TextStyle(color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber),
                  ),
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter a task title';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: selectedPriority,
                dropdownColor: Colors.grey.shade900,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber),
                  ),
                ),
                items: ['High', 'Medium', 'Low'].map((priority) {
                  return DropdownMenuItem(
                    value: priority,
                    child: Text(priority),
                  );
                }).toList(),
                onChanged: (value) {
                  selectedPriority = value!;
                },
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel', style: TextStyle(color: Colors.grey)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFFC107),
            ),
            onPressed: () {
              if (formKey.currentState?.validate() ?? false) {
                setState(() {
                  tasks.add(Task(
                    id: DateTime.now().toString(),
                    title: titleController.text,
                    priority: selectedPriority,
                    icon: Icons.task,
                    isCompleted: false,
                  ));
                });
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Task added successfully!'),
                    backgroundColor: Colors.green,
                  ),
                );
              }
            },
            child: const Text('Add Task', style: TextStyle(color: Colors.black)),
          ),
        ],
      ),
    );
  }

  void _showTaskOptions(BuildContext context, Task task) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.grey.shade900,
      builder: (context) => Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.edit, color: Colors.blue),
              title: const Text('Edit Task', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
                _editTask(context, task);
              },
            ),
            ListTile(
              leading: const Icon(Icons.delete, color: Colors.red),
              title: const Text('Delete Task', style: TextStyle(color: Colors.white)),
              onTap: () {
                setState(() {
                  tasks.remove(task);
                });
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Task deleted'),
                    backgroundColor: Colors.red,
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(
                task.isCompleted ? Icons.undo : Icons.check_circle,
                color: Colors.green,
              ),
              title: Text(
                task.isCompleted ? 'Mark as Incomplete' : 'Mark as Complete',
                style: const TextStyle(color: Colors.white),
              ),
              onTap: () {
                setState(() {
                  task.isCompleted = !task.isCompleted;
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _editTask(BuildContext context, Task task) {
    final titleController = TextEditingController(text: task.title);
    String selectedPriority = task.priority;
    final formKey = GlobalKey<FormState>();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey.shade900,
        title: const Text(
          'Edit Task',
          style: TextStyle(color: Colors.white),
        ),
        content: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: titleController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  hintText: 'Enter task title',
                  hintStyle: TextStyle(color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber),
                  ),
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter a task title';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: selectedPriority,
                dropdownColor: Colors.grey.shade900,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber),
                  ),
                ),
                items: ['High', 'Medium', 'Low'].map((priority) {
                  return DropdownMenuItem(
                    value: priority,
                    child: Text(priority),
                  );
                }).toList(),
                onChanged: (value) {
                  selectedPriority = value!;
                },
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel', style: TextStyle(color: Colors.grey)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFFC107),
            ),
            onPressed: () {
              if (formKey.currentState?.validate() ?? false) {
                setState(() {
                  task.title = titleController.text;
                  task.priority = selectedPriority;
                });
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Task updated successfully!'),
                    backgroundColor: Colors.blue,
                  ),
                );
              }
            },
            child: const Text('Update Task', style: TextStyle(color: Colors.black)),
          ),
        ],
      ),
    );
  }

  void _showDeadlineOptions(BuildContext context, Deadline deadline) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.grey.shade900,
      builder: (context) => Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.edit, color: Colors.blue),
              title: const Text('Edit Deadline', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
                _editDeadline(context, deadline);
              },
            ),
            ListTile(
              leading: const Icon(Icons.delete, color: Colors.red),
              title: const Text('Delete Deadline', style: TextStyle(color: Colors.white)),
              onTap: () {
                setState(() {
                  deadlines.remove(deadline);
                });
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Deadline deleted'),
                    backgroundColor: Colors.red,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _editDeadline(BuildContext context, Deadline deadline) {
    final titleController = TextEditingController(text: deadline.title);
    final dateController = TextEditingController(text: deadline.date);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey.shade900,
        title: const Text(
          'Edit Deadline',
          style: TextStyle(color: Colors.white),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: titleController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                hintText: 'Enter deadline title',
                hintStyle: TextStyle(color: Colors.grey),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.amber),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: dateController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                hintText: 'Enter date (e.g., Tomorrow)',
                hintStyle: TextStyle(color: Colors.grey),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.amber),
                ),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel', style: TextStyle(color: Colors.grey)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFFC107),
            ),
            onPressed: () {
              setState(() {
                deadline.title = titleController.text;
                deadline.date = dateController.text;
              });
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Deadline updated!'),
                  backgroundColor: Colors.blue,
                ),
              );
            },
            child: const Text('Update', style: TextStyle(color: Colors.black)),
          ),
        ],
      ),
    );
  }

  void _showNotificationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey.shade900,
        title: const Text(
          'Notifications',
          style: TextStyle(color: Colors.white),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _notificationItem('Task "Create Dashboard UI" completed'),
            _notificationItem('New task added: "Review Flutter Code"'),
            _notificationItem('Deadline approaching: Flutter Project'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                notificationCount = 0;
              });
              Navigator.pop(context);
            },
            child: const Text('Clear All', style: TextStyle(color: Colors.grey)),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close', style: TextStyle(color: Colors.amber)),
          ),
        ],
      ),
    );
  }

  Widget _notificationItem(String message) {
    return ListTile(
      leading: const Icon(Icons.notifications, color: Colors.amber),
      title: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  void _showAllTasks(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.grey.shade900,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.8,
        maxChildSize: 0.95,
        minChildSize: 0.5,
        builder: (context, scrollController) => Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'All Tasks',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    final task = tasks[index];
                    return taskTile(
                      task.title,
                      task.priority,
                      task.icon,
                      task.isCompleted,
                      const Color(0xFFFFC107),
                      () {
                        setState(() {
                          task.isCompleted = !task.isCompleted;
                        });
                      },
                      () {
                        Navigator.pop(context);
                        _showTaskOptions(context, task);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showCalendar(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey.shade900,
        title: const Text(
          'Calendar',
          style: TextStyle(color: Colors.white),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              '📅 Upcoming Events',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            const SizedBox(height: 16),
            ...deadlines.map((d) => ListTile(
                  leading: const Icon(Icons.event, color: Colors.amber),
                  title: Text(d.title, style: const TextStyle(color: Colors.white)),
                  subtitle: Text(d.date, style: const TextStyle(color: Colors.grey)),
                )),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close', style: TextStyle(color: Colors.amber)),
          ),
        ],
      ),
    );
  }

  void _showProfileDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey.shade900,
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.white),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundColor: Color(0xFFFFC107),
              child: Icon(
                Icons.person,
                size: 50,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'John Doe',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            const Text(
              'john.doe@example.com',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _profileStat('Tasks', totalTasks.toString()),
                _profileStat('Completed', completedTasks.toString()),
                _profileStat('Pending', pendingTasks.toString()),
              ],
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close', style: TextStyle(color: Colors.amber)),
          ),
        ],
      ),
    );
  }

  Widget _profileStat(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: const TextStyle(color: Colors.grey),
        ),
      ],
    );
  }

  void _showSettingsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey.shade900,
        title: const Text(
          'Settings',
          style: TextStyle(color: Colors.white),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.dark_mode, color: Colors.amber),
              title: const Text('Dark Mode', style: TextStyle(color: Colors.white)),
              trailing: Switch(
                value: true,
                onChanged: (_) {},
                activeColor: Colors.amber,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.notifications, color: Colors.amber),
              title: const Text('Notifications', style: TextStyle(color: Colors.white)),
              trailing: Switch(
                value: true,
                onChanged: (_) {},
                activeColor: Colors.amber,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close', style: TextStyle(color: Colors.amber)),
          ),
        ],
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey.shade900,
        title: const Text(
          'Logout',
          style: TextStyle(color: Colors.white),
        ),
        content: const Text(
          'Are you sure you want to logout?',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel', style: TextStyle(color: Colors.grey)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Logged out successfully'),
                  backgroundColor: Colors.green,
                ),
              );
            },
            child: const Text('Logout', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}

// Data Models
class Task {
  String id;
  String title;
  String priority;
  IconData icon;
  bool isCompleted;

  Task({
    required this.id,
    required this.title,
    required this.priority,
    required this.icon,
    this.isCompleted = false,
  });
}

class Deadline {
  String title;
  String date;

  Deadline({
    required this.title,
    required this.date,
  });
}