import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Sample user data
  final Map<String, dynamic> userData = {
    'name': 'Minhaj Raza',
    'email': 'minhajraza@gmail.com',
    'joinDate': 'March 15, 2025',
    'profileImage': 'assets/images/profile.jpg',
    'totalDays': 42,
    'totalHabits': 4,
    'longestStreak': 12,
    'achievements': [
      {
        'title': 'Early Bird',
        'description': 'Complete "No phone first hour" 7 days in a row',
        'icon': Icons.wb_sunny_outlined,
        'color': Colors.amber,
        'achieved': true,
        'progress': 1.0,
      },
      {
        'title': 'Focus Master',
        'description': 'Use notification pause for 14 days',
        'icon': Icons.center_focus_strong_outlined,
        'color': Colors.blue,
        'achieved': false,
        'progress': 0.7,
      },
      {
        'title': 'Digital Minimalist',
        'description': 'Complete all habits for a full week',
        'icon': Icons.smartphone_outlined,
        'color': Colors.teal,
        'achieved': false,
        'progress': 0.4,
      },
    ],
    'settings': [
      {
        'title': 'Notifications',
        'icon': Icons.notifications_outlined,
        'enabled': true,
      },
      {'title': 'Dark Mode', 'icon': Icons.nightlight_round, 'enabled': false},
      {
        'title': 'Daily Reminders',
        'icon': Icons.alarm_outlined,
        'enabled': true,
      },
      {
        'title': 'Weekly Reports',
        'icon': Icons.bar_chart_outlined,
        'enabled': true,
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F9FC),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          "Profile",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF2E7D32),
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Color(0xFF2E7D32)),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined, color: Color(0xFF2E7D32)),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile header
              _buildProfileHeader(),

              const SizedBox(height: 24),

              // Stats section
              _buildStatsSection(),

              const SizedBox(height: 24),

              // Achievements section
              const Text(
                "Achievements",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2E7D32),
                ),
              ),
              const SizedBox(height: 16),

              ...userData['achievements']
                  .map<Widget>(
                    (achievement) => _buildAchievementCard(achievement),
                  )
                  .toList(),

              const SizedBox(height: 24),

              // Settings section
              const Text(
                "Settings",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2E7D32),
                ),
              ),
              const SizedBox(height: 16),

              _buildSettingsCard(),

              const SizedBox(height: 24),

              // Account options
              _buildAccountOptions(),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF2E7D32), Color(0xFF66BB6A)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.green.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              // Profile image
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.white,
                child: ClipOval(
                  child: Icon(
                    Icons.person,
                    size: 50,
                    color: Colors.green.shade200,
                  ),
                ),
              ),
              const SizedBox(width: 20),
              // User info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userData['name'],
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      userData['email'],
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white.withOpacity(0.8),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Member since: ${userData['joinDate']}",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: Colors.white.withOpacity(0.5)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              "Edit Profile",
              style: TextStyle(
                color: Colors.white.withOpacity(0.9),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStatItem(
            Icons.calendar_today_outlined,
            "${userData['totalDays']}",
            "Days",
            Colors.blue,
          ),
          _buildVerticalDivider(),
          _buildStatItem(
            Icons.psychology_outlined,
            "${userData['totalHabits']}",
            "Habits",
            Colors.green,
          ),
          _buildVerticalDivider(),
          _buildStatItem(
            Icons.local_fire_department_outlined,
            "${userData['longestStreak']}",
            "Streak",
            Colors.orange,
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(
    IconData icon,
    String value,
    String label,
    Color color,
  ) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: color, size: 22),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF333333),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
        ),
      ],
    );
  }

  Widget _buildVerticalDivider() {
    return Container(height: 50, width: 1, color: Colors.grey.withOpacity(0.2));
  }

  Widget _buildAchievementCard(Map<String, dynamic> achievement) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: achievement['color'].withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                achievement['icon'],
                color: achievement['color'],
                size: 22,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        achievement['title'],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF333333),
                        ),
                      ),
                      const SizedBox(width: 8),
                      if (achievement['achieved'])
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFF2E7D32).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Text(
                            "Unlocked",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF2E7D32),
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    achievement['description'],
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                  ),
                  const SizedBox(height: 8),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: LinearProgressIndicator(
                      value: achievement['progress'],
                      backgroundColor: Colors.grey.shade200,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        achievement['color'],
                      ),
                      minHeight: 6,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "${(achievement['progress'] * 100).toInt()}%",
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children:
            userData['settings'].map<Widget>((setting) {
              return Column(
                children: [
                  ListTile(
                    leading: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color(0xFF2E7D32).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        setting['icon'],
                        color: const Color(0xFF2E7D32),
                        size: 20,
                      ),
                    ),
                    title: Text(
                      setting['title'],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF333333),
                      ),
                    ),
                    trailing: Switch(
                      value: setting['enabled'],
                      onChanged: (value) {
                        setState(() {
                          setting['enabled'] = value;
                        });
                      },
                      activeColor: const Color(0xFF2E7D32),
                    ),
                  ),
                  if (setting != userData['settings'].last)
                    Divider(
                      height: 1,
                      color: Colors.grey.withOpacity(0.2),
                      indent: 16,
                      endIndent: 16,
                    ),
                ],
              );
            }).toList(),
      ),
    );
  }

  Widget _buildAccountOptions() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text(
              "Account",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade800,
              ),
            ),
          ),
          _buildAccountOption(
            Icons.help_outline,
            "Help & Support",
            Colors.blue,
          ),
          _buildAccountOption(
            Icons.privacy_tip_outlined,
            "Privacy Policy",
            Colors.purple,
          ),
          _buildAccountOption(
            Icons.description_outlined,
            "Terms of Service",
            Colors.amber,
          ),
          _buildAccountOption(
            Icons.logout,
            "Log Out",
            Colors.red,
            isLast: true,
          ),
        ],
      ),
    );
  }

  Widget _buildAccountOption(
    IconData icon,
    String title,
    Color color, {
    bool isLast = false,
  }) {
    return Column(
      children: [
        ListTile(
          leading: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          title: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: title == "Log Out" ? Colors.red : const Color(0xFF333333),
            ),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: Colors.grey,
          ),
          onTap: () {},
        ),
        if (!isLast)
          Divider(
            height: 1,
            color: Colors.grey.withOpacity(0.2),
            indent: 16,
            endIndent: 16,
          ),
      ],
    );
  }
}
