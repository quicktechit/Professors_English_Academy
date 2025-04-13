import 'package:professors_english_academy/consts/consts.dart';

class QuickTechNotificationPage extends StatefulWidget {
  const QuickTechNotificationPage({super.key});

  @override
  State<QuickTechNotificationPage> createState() =>
      _QuickTechNotificationPageState();
}

class _QuickTechNotificationPageState extends State<QuickTechNotificationPage> {
  final List<Map<String, String>> notifications = List.generate(
    10, // Dynamic item count
        (index) => {
      'title': 'Notification ${index + 1}',
      'message': 'This is a sample notification message for item ${index + 1}.',
      'timestamp': '2025-04-12 ${10 + index}:00',
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'Notifications'.text.xl2.bold.make(),
      ),
      body: ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: notifications.length, // Dynamic item count
        itemBuilder: (context, index) {
          return Card(
            elevation: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Notification title
                notifications[index]['title']!.text.lg.bold.black.make(),
                8.heightBox,
                // Notification message
                notifications[index]['message']!.text.sm.black.make(),
                8.heightBox,
                // Timestamp
                notifications[index]['timestamp']!.text.xs.black.make(),
                // Optional GridView (comment out if not needed)
              ],
            )
                .p(16)
                .box
                .color(Colors.primaries[index % Colors.primaries.length].shade100)
                .margin(const EdgeInsets.symmetric(horizontal: 5, vertical: 3))
                .rounded
                .make(),
          ).animate().fadeIn(delay: (index*100).ms);
        },
      ).p(8),
    );
  }
}
