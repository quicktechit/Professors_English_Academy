import 'package:professors_english_academy/consts/consts.dart';
import 'package:professors_english_academy/widgets/quick_tech_custom_contract_us.dart';

class QuickTechHelpAndSupportPage extends StatelessWidget {
  const QuickTechHelpAndSupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'Help & Support'.text.semiBold.make(),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            20.heightBox,
            "Help & Support"
                .text
                .xl3
                .bold
                .color(Colors.blueGrey)
                .make()
                .centered()
                .pSymmetric(h: 20),
            10.heightBox,
            "Find answers to common questions or get in touch with our team."
                .text
                .gray500
                .center
                .make()
                .pSymmetric(h: 20),

            // FAQ Section
            30.heightBox,
            "Frequently Asked Questions"
                .text
                .xl2
                .semiBold
                .color(Colors.blueGrey)
                .make()
                .pOnly(left: 20),
            20.heightBox,
            ExpansionTile(
              iconColor: Colors.black,
              title: "How do I book a tour?".text.lg.semiBold.black.make(),
              tilePadding: EdgeInsets.symmetric(horizontal: 20),
              collapsedBackgroundColor: Vx.gray100,
              backgroundColor: Vx.gray200,
              children: [
                "You can book a tour by selecting a category from the home page, choosing your desired tour, and following the booking steps."
                    .text
                    .gray700
                    .make()
                    .p(16),
              ],
            ).pSymmetric(h: 20),
            ExpansionTile(
              iconColor: Colors.black,
              title: "What is the cancellation policy?"
                  .text
                  .lg
                  .semiBold
                  .black
                  .make(),
              children: [
                "Cancellations can be made up to 48 hours before the tour starts for a full refund. Please check tour details for specific policies."
                    .text
                    .gray700
                    .make()
                    .p(16),
              ],
              tilePadding: EdgeInsets.symmetric(horizontal: 20),
              collapsedBackgroundColor: Vx.gray100,
              backgroundColor: Vx.gray200,
            ).pSymmetric(h: 20),
            ExpansionTile(
              iconColor: Colors.black,
              title: "How do I contact the tour guide?"
                  .text
                  .lg
                  .semiBold
                  .black
                  .make(),
              children: [
                "Once your booking is confirmed, you'll receive the guide's contact details via email or in the app."
                    .text
                    .gray700
                    .make()
                    .p(16),
              ],
              tilePadding: EdgeInsets.symmetric(horizontal: 20),
              collapsedBackgroundColor: Vx.gray100,
              backgroundColor: Vx.gray200,
            ).pSymmetric(h: 20),
            ExpansionTile(
              iconColor: Colors.black,
              title: "What if I have a technical issue?"
                  .text
                  .lg
                  .semiBold
                  .black
                  .make(),
              children: [
                "Please reach out to our support team below, and we'll assist you promptly."
                    .text
                    .gray700
                    .make()
                    .p(16),
              ],
              tilePadding: EdgeInsets.symmetric(horizontal: 20),
              collapsedBackgroundColor: Vx.gray100,
              backgroundColor: Vx.gray200,
            ).pSymmetric(h: 20),

            // Support Contact Section
            20.heightBox,
            "Need More Help?"
                .text
                .xl2
                .semiBold
                .color(Colors.blueGrey)
                .make()
                .pOnly(left: 20),
            10.heightBox,
            customContractUS(context),

            30.heightBox, // Bottom padding
          ],
        ),
      ),
    );
  }
}
