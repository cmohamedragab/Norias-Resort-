
import 'package:flutter/material.dart';

void main() {
  runApp(const NoriasApp());
}

class NoriasApp extends StatelessWidget {
  const NoriasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Norias Resort PMS',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF087E9B),
        ),
        fontFamily: 'Arial',
      ),
      home: const Directionality(
        textDirection: TextDirection.rtl,
        child: DashboardScreen(),
      ),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  final List<Map<String, dynamic>> modules = const [
    {'name': 'الحجوزات والإقامة', 'icon': Icons.book_online},
    {'name': 'الغرف وحالتها', 'icon': Icons.hotel},
    {'name': 'الخزينة والحسابات', 'icon': Icons.account_balance_wallet},
    {'name': 'حمام السباحة والرحلات', 'icon': Icons.pool},
    {'name': 'الفوتوسيشن', 'icon': Icons.camera_alt},
    {'name': 'المطعم والمطبخ', 'icon': Icons.restaurant},
    {'name': 'المخازن والمشتريات', 'icon': Icons.inventory},
    {'name': 'الموظفين والحضور', 'icon': Icons.people},
    {'name': 'الصيانة', 'icon': Icons.build},
    {'name': 'الشكاوى والمقترحات', 'icon': Icons.feedback},
    {'name': 'التقارير والإحصائيات', 'icon': Icons.bar_chart},
    {'name': 'الإعدادات والصلاحيات', 'icon': Icons.settings},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F6F8),
      appBar: AppBar(
        backgroundColor: const Color(0xFF075B73),
        foregroundColor: Colors.white,
        title: const Text(
          'Norias Resort',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'لوحة تحكم الإدارة',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'مرحباً بك في نظام إدارة منتجع نورياس',
              style: TextStyle(color: Colors.black54),
            ),
            const SizedBox(height: 20),

            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.5,
              children: [
                _statCard('إجمالي الغرف', '34', Icons.hotel),
                _statCard('الغرف المشغولة', '0', Icons.meeting_room),
                _statCard('حجوزات اليوم', '0', Icons.calendar_month),
                _statCard('إيرادات اليوم', '0 ج.م', Icons.payments),
              ],
            ),

            const SizedBox(height: 25),
            const Text(
              'الأقسام الرئيسية',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),

            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: modules.length,
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.25,
              ),
              itemBuilder: (context, index) {
                final module = modules[index];

                return Card(
                  elevation: 1,
                  color: Colors.white,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'قسم ${module['name']} سيتم تجهيزه',
                          ),
                        ),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          module['icon'] as IconData,
                          size: 35,
                          color: const Color(0xFF087E9B),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          module['name'] as String,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _statCard(String title, String value, IconData icon) {
    return Card(
      color: Colors.white,
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: const Color(0xFF087E9B), size: 27),
            const SizedBox(height: 7),
            Text(
              value,
              style: const TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
