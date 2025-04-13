
import '../../consts/consts.dart';

class QuickTechTermsPage extends StatefulWidget {
  const QuickTechTermsPage({super.key});

  @override
  State<QuickTechTermsPage> createState() =>
      _QuickTechTermsPage();
}

class _QuickTechTermsPage
    extends State<QuickTechTermsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
          "Terms and Conditions".text.semiBold.make(),

      ),
      body: SingleChildScrollView(padding: EdgeInsets.symmetric(horizontal: 15),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Terms and Conditions",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                "Effective Date: March 22, 2025\n\n"
                "Welcome to our application. By accessing and using our app, you agree to comply with and be bound by these Terms and Conditions. Please read them carefully.\n\n"
                "1. Acceptance of Terms\n\n"
                "By using our services, you agree to abide by these terms and conditions, as well as any additional guidelines or rules that may apply.\n\n"
                "2. User Responsibilities\n\n"
                "You are responsible for ensuring that your use of the app complies with all local laws and regulations. You may not use the app for any unlawful or prohibited purpose.\n\n"
                "3. Account Security\n\n"
                "You agree to keep your account information secure and are responsible for all activities under your account.\n\n"
                "4. Restrictions on Use\n\n"
                "You may not copy, modify, distribute, or otherwise use the content of the app without explicit permission.\n\n"
                "5. Termination\n\n"
                "We reserve the right to suspend or terminate your access to the app if you violate these Terms and Conditions.\n\n"
                "6. Limitation of Liability\n\n"
                "We are not liable for any direct, indirect, incidental, or consequential damages resulting from your use of the app.\n\n"
                "7. Changes to Terms\n\n"
                "We may update these Terms and Conditions from time to time. Any changes will be posted on this page with an updated effective date.\n\n"
                "8. Contact Us\n\n"
                "If you have any questions regarding these Terms and Conditions, please contact us at support@ourapp.com.\n\n"
                "By continuing to use our services, you acknowledge that you have read, understood, and agree to these Terms and Conditions.",
                style: TextStyle(fontSize: 16, height: 1.6),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
