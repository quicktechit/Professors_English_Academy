import 'package:professors_english_academy/consts/consts.dart';

class QuickTechPrivacyPage extends StatefulWidget {
  const QuickTechPrivacyPage({super.key});

  @override
  State<QuickTechPrivacyPage> createState() => _QuickTechPrivacyPage();
}

class _QuickTechPrivacyPage extends State<QuickTechPrivacyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Privacy Policy".text.semiBold.make(),

      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Privacy Policy",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                "Effective Date: March 22, 2025\n\n"
                    "This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you visit our app. Please read this policy carefully. By using our app, you agree to the collection and use of information in accordance with this policy.\n\n"
                    "1. Information We Collect\n\n"
                    "We collect personal information that you provide when you use our services, such as your name, email address, and other details you choose to share.\n\n"
                    "2. How We Use Your Information\n\n"
                    "We may use the information we collect to provide and improve our services, respond to your inquiries, send promotional material, or for other legitimate purposes as outlined.\n\n"
                    "3. Data Security\n\n"
                    "We take reasonable precautions to protect your information. However, no method of transmission over the internet is 100% secure, and we cannot guarantee absolute security.\n\n"
                    "4. Sharing of Information\n\n"
                    "We may share your information with third parties if required by law or to fulfill the services you have requested.\n\n"
                    "5. Changes to This Privacy Policy\n\n"
                    "We may update our Privacy Policy from time to time. Any changes will be posted on this page with an updated effective date.\n\n"
                    "6. Contact Us\n\n"
                    "If you have any questions about this Privacy Policy, please contact us at support@ourapp.com.\n\n"
                    "By using our services, you agree to the terms outlined in this Privacy Policy.",
                style: TextStyle(fontSize: 16, height: 1.6),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
