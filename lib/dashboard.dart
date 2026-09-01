import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
 const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<bool> isSelected = [true, false, false, false];
  int selectedNavIndex = 0;

    @override
      Widget build(BuildContext context) {
      return Scaffold(
          backgroundColor: Colors.black,
          resizeToAvoidBottomInset: false,


          drawer: Drawer(
          backgroundColor: Colors.black,
          child: SafeArea(
          child: Column(
          children: [

        // ================= PROFILE HEADER =================
        Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 25),
          decoration: const BoxDecoration(
            color: Color(0xFF111111),
            border: Border(
            bottom: BorderSide(
            color: Color(0xFFB8860B),
            width: 0.5,
           ),
         ),
       ),


            child: Row(
               children: [
              // PROFILE IMAGE
               CircleAvatar(
                radius: 28,
                backgroundColor: Color(0xFFB8860B),
                child: Icon(
                  Icons.person,
                  color: Colors.black,
                  size: 30,
                ),
              ),

                SizedBox(width: 14),

              // NAME
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                     'Bobmanuel',
                      style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 4),

                   Text(
                     'TaskFlow Account',
                      style: TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                    ),
                  ),

                ],
              ),
            ],
          ),
        ),

        // ================= MENU =================
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 12),
            children: [

              // DASHBOARD
              ListTile(
                leading: const Icon(
                  Icons.dashboard_outlined,
                  color: Color(0xFFB8860B),
                ),
                title: const Text(
                  'Dashboard',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              // TRANSACTIONS
              ListTile(
                leading: const Icon(
                  Icons.swap_horiz,
                  color: Color(0xFFB8860B),
                ),
                title: const Text(
                  'Transactions',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              // BUDGETS
              ListTile(
                leading: const Icon(
                  Icons.account_balance_wallet_outlined,
                  color: Color(0xFFB8860B),
                ),
                title: const Text(
                  'Budgets',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              // ANALYTICS
              ListTile(
                leading: const Icon(
                  Icons.bar_chart_outlined,
                  color: Color(0xFFB8860B),
                ),
                title: const Text(
                  'Analytics',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              // CALENDAR
              ListTile(
                leading: const Icon(
                  Icons.calendar_month_outlined,
                  color: Color(0xFFB8860B),
                ),
                title: const Text(
                  'Calendar',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 8,
                ),
                child: Divider(
                  color: Colors.white12,
                ),
              ),

              // NOTIFICATIONS
              ListTile(
                leading: const Icon(
                  Icons.notifications_outlined,
                  color: Colors.white70,
                ),
                title: const Text(
                  'Notifications',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              // RECURRING
              ListTile(
                leading: const Icon(
                  Icons.autorenew,
                  color: Colors.white70,
                ),
                title: const Text(
                  'Recurring Transactions',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 8,
                ),
                child: Divider(
                  color: Colors.white12,
                ),
              ),

              // SETTINGS
              ListTile(
                leading: const Icon(
                  Icons.settings_outlined,
                  color: Colors.white70,
                ),
                title: const Text(
                  'Settings',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              // HELP
              ListTile(
                leading: const Icon(
                  Icons.help_outline,
                  color: Colors.white70,
                ),
                title: const Text(
                  'Help & Support',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),

        // ================= LOGOUT =================
        Padding(
          padding: const EdgeInsets.all(16),
          child: ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),

            tileColor: const Color(0xFF151515),
            leading: const Icon(
              Icons.logout,
              color: Colors.redAccent,
            ),

            title: const Text(
              'Logout',
              style: TextStyle(
                color: Colors.redAccent,
              ),
            ),
            
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
      ],
    ),
  ),
),
     


      // ================= BODY =================
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // ================= TOP ICONS =================
              Row(
                children: [
                  // MENU BUTTON
                  Builder(
                    builder: (context) {
                      return IconButton(
                        icon: const Icon(
                          Icons.menu,
                          color: Color(0xFFB8860B),
                        ),
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                      );
                    },
                  ),

                  const Spacer(),

                  const Icon(
                    Icons.notifications,
                    size: 28,
                    color: Colors.white,
                  ),

                  const SizedBox(width: 12),

                  const CircleAvatar(
                    radius: 17,
                    child: Icon(
                      Icons.person,
                      size: 20,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // ================= WELCOME =================
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: "Good Morning ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: "Bob 👋",
                      style: TextStyle(
                        color: Color(0xFFB8860B),
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 7),

              const Text(
                "Let's get your task done",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                ),
              ),

              const SizedBox(height: 20),

              // ================= SEARCH BAR =================
              TextField(
                style: const TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  hintText: "Search",
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                  ),
                  filled: true,
                  fillColor: Colors.grey[900],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // ================= START CARDS =================
              SizedBox(
                height: 130,
                child: Row(
                  children: [

                    // TASKS
                    Expanded(
                      child: Card(
                        color: Colors.grey[900],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.task_alt,
                              color: Color(0xFFB8860B),
                              size: 30,
                            ),

                            SizedBox(height: 10),

                            Text(
                              "20",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            SizedBox(height: 5),

                            Text(
                              "Tasks",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // COMPLETED
                    Expanded(
                      child: Card(
                        color: Colors.grey[900],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.check_circle,
                              color: Colors.green,
                              size: 30,
                            ),

                            SizedBox(height: 10),

                            Text(
                              "15",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            SizedBox(height: 5),

                            Text(
                              "Completed",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // IN PROGRESS
                    Expanded(
                      child: Card(
                        color: Colors.grey[900],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.autorenew,
                              color: Colors.orange,
                              size: 30,
                            ),

                            SizedBox(height: 10),

                            Text(
                              "5",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            SizedBox(height: 5),

                            Text(
                              "In Progress",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // OVERDUE
                    Expanded(
                      child: Card(
                        color: Colors.grey[900],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.warning_amber_rounded,
                              color: Colors.red,
                              size: 30,
                            ),

                            SizedBox(height: 10),

                            Text(
                              "2",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            SizedBox(height: 5),

                            Text(
                              "Overdue",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              // ================= MY TASK CARD =================
              Card(
                color: Colors.grey[900],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      // TOP ROW
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "My Task",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          Text(
                            "View All",
                            style: TextStyle(
                              color: Color(0xFFB8860B),
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      // ================= FILTER =================
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: List.generate(
                            4,
                            (index) {
                              final labels = [
                                "All",
                                "Active",
                                "Completed",
                                "Pending",
                              ];

                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    for (
                                      int i = 0;
                                      i < isSelected.length;
                                      i++
                                    ) {
                                      isSelected[i] = i == index;
                                    }
                                  });
                                },
                                child: Container(
                                  padding:
                                      const EdgeInsets.symmetric(
                                    horizontal: 17,
                                    vertical: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: isSelected[index]
                                        ? const Color(0xFFB8860B)
                                        : Colors.transparent,
                                    borderRadius:
                                        BorderRadius.circular(6),
                                  ),
                                  child: Text(
                                    labels[index],
                                    style: TextStyle(
                                      color: isSelected[index]
                                          ? Colors.white
                                          : Colors.white70,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // ================= TASK 1 =================
                      Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [

                            Container(
                              width: 4,
                              height: 40,
                              decoration: BoxDecoration(
                                color: const Color(0xFFB8860B),
                                borderRadius:
                                    BorderRadius.circular(4),
                              ),
                            ),

                            const SizedBox(width: 12),

                            const Expanded(
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Complete Flutter Dashboard",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  SizedBox(height: 5),

                                  Text(
                                    "Today • 4:00 PM",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            const Icon(
                              Icons.more_vert,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 12),

                      // ================= TASK 2 =================
                      Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [

                            Container(
                              width: 4,
                              height: 45,
                              decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius:
                                    BorderRadius.circular(4),
                              ),
                            ),

                            const SizedBox(width: 12),

                            const Expanded(
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Build Authentication Screen",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  SizedBox(height: 5),

                                  Text(
                                    "Tomorrow • 10:00 AM",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            const Icon(
                              Icons.more_vert,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 12),

                      // ================= TASK 3 =================
                      Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [

                            Container(
                              width: 4,
                              height: 45,
                              decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius:
                                    BorderRadius.circular(4),
                              ),
                            ),

                            const SizedBox(width: 12),

                            const Expanded(
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Build Authentication Screen",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  SizedBox(height: 5),

                                  Text(
                                    "Tomorrow • 10:00 AM",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            const Icon(
                              Icons.more_vert,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Extra bottom space so content doesn't sit directly
              // behind the bottom navigation.
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),

      // ================= FLOATING + BUTTON =================
      floatingActionButton: Transform.translate(
        offset: const Offset(0, 43),
        child: SizedBox(
          width: 50,
          height: 50,
          child: FloatingActionButton(
            onPressed: () {},

            elevation: 0,
            focusElevation: 0,
            hoverElevation: 0,
            highlightElevation: 0,

            backgroundColor: const Color(0xFFB8860B),

            child: const Icon(
              Icons.add,
              color: Colors.white,
              size: 25,
            ),
          ),
        ),
      ),

      // ================= + BUTTON LOCATION =================
      floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked,

      // ================= BOTTOM NAVIGATION =================
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.black,
          border: Border(
            top: BorderSide(
              color: Colors.transparent,
            ),
          ),
        ),
        child: BottomAppBar(
          color: Colors.black,
          elevation: 0,
          shape: const CircularNotchedRectangle(),
          notchMargin: 4,

          child: SizedBox(
            height: 60,
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceAround,
              children: [

                // ================= HOME =================
                IconButton(
                  onPressed: () {
                    setState(() {
                      selectedNavIndex = 0;
                    });
                  },
                  icon: Icon(
                    selectedNavIndex == 0
                        ? Icons.home
                        : Icons.home_outlined,
                    color: selectedNavIndex == 0
                        ? const Color(0xFFB8860B)
                        : Colors.grey,
                    size: 26,
                  ),
                ),

                // ================= TASKS =================
                IconButton(
                  onPressed: () {
                    setState(() {
                      selectedNavIndex = 1;
                    });
                  },
                  icon: Icon(
                    selectedNavIndex == 1
                        ? Icons.task
                        : Icons.task_outlined,
                    color: selectedNavIndex == 1
                        ? const Color(0xFFB8860B)
                        : Colors.grey,
                    size: 26,
                  ),
                ),

                // ================= SPACE FOR + =================
                const SizedBox(
                  width: 55,
                ),

                // ================= CALENDAR =================
                IconButton(
                  onPressed: () {
                    setState(() {
                      selectedNavIndex = 2;
                    });
                  },
                  icon: Icon(
                    selectedNavIndex == 2
                        ? Icons.calendar_month
                        : Icons.calendar_month_outlined,
                    color: selectedNavIndex == 2
                        ? const Color(0xFFB8860B)
                        : Colors.grey,
                    size: 26,
                  ),
                ),

                // ================= PROFILE =================
                IconButton(
                  onPressed: () {
                    setState(() {
                      selectedNavIndex = 3;
                    });
                  },
                  icon: Icon(
                    selectedNavIndex == 3
                        ? Icons.person
                        : Icons.person_outline,
                    color: selectedNavIndex == 3
                        ? const Color(0xFFB8860B)
                        : Colors.grey,
                    size: 26,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}