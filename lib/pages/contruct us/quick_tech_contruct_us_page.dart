import '../../consts/consts.dart';
import '../../widgets/quick_tech_custom_button.dart';
import '../../widgets/quicktech_custom_text_field.dart';

class QuickTechContactUsPage extends StatelessWidget {
  const QuickTechContactUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Controllers for form fields
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController messageController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: 'Contact Us'.text.semiBold.make(),),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            20.heightBox,
            "Get in Touch"
                .text
                .xl3
                .bold
                .color(Colors.blueGrey)
                .make()
                .centered()
                .pSymmetric(h: 20),
            10.heightBox,
            "We'd love to hear from you! Reach out with any questions or feedback."
                .text
                .gray500
                .center
                .make()
                .pSymmetric(h: 20),

            // Contact Info Section
            30.heightBox,
            "Contact Information"
                .text
                .xl2
                .semiBold
                .color(Colors.blueGrey)
                .make()
                .pOnly(left: 20),
            10.heightBox,
            Row(
              children: [
                Icon(Icons.email, color: Vx.blue500).pOnly(right: 10),
                "Email: support@tourapp.com".text.lg.gray700.make(),
              ],
            ).pOnly(left: 20),
            10.heightBox,
            Row(
              children: [
                Icon(Icons.phone, color: Vx.green500).pOnly(right: 10),
                "Phone: +1 234 567 8901".text.lg.gray700.make(),
              ],
            ).pOnly(left: 20),
            10.heightBox,
            Row(
              children: [
                Icon(Icons.location_on, color: Vx.red500).pOnly(right: 10),
                "Address: 123 Travel St, Tour City, TC 45678"
                    .text
                    .lg
                    .gray700
                    .make(),
              ],
            ).pOnly(left: 20),

            // Contact Form Section
            30.heightBox,
            "Send Us a Message"
                .text
                .xl2
                .semiBold
                .color(Colors.blueGrey)
                .make()
                .pOnly(left: 20),
            20.heightBox,
            customTextField(
                    hint: "Your Name",
                    isSuffix: false,
                    isVisible: true,
                    controller: nameController)
                .pSymmetric(h: 20),
            15.heightBox,
            customTextField(
                    hint: "Your Email",
                    isSuffix: false,
                    isVisible: true,
                    controller: emailController)
                .pSymmetric(h: 20),
            15.heightBox,
            customTextField(
                    hint: "Your Message",
                    isSuffix: false,
                    isVisible: true,
                    controller: messageController)
                .pSymmetric(h: 20),
            20.heightBox,
            customButton(
                    title: "Send Message",
                    onPressed: () {
                      // Handle form submission (e.g., send to API)
                      String name = nameController.text;
                      String email = emailController.text;
                      String message = messageController.text;
                      if (name.isNotEmpty &&
                          email.isNotEmpty &&
                          message.isNotEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: "Message sent!".text.make()),
                        );
                        nameController.clear();
                        emailController.clear();
                        messageController.clear();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: "Please fill all fields".text.make()),
                        );
                      }
                    },
                    color: mainColor,
                    txtColor: white)
                .w(context.screenWidth)
                .pSymmetric(h: 20),

            30.heightBox, // Extra padding at bottom
          ],
        ),
      ),
    );
  }
}
