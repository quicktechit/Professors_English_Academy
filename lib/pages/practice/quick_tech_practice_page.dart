import 'package:professors_english_academy/consts/consts.dart';
import 'package:professors_english_academy/pages/Practice/quick_tech_practice_qustion_list_page.dart';
import '../../widgets/custom_category_card_design.dart';
import '../../widgets/quick_tech_custom_row_design.dart';

class QuickTechPracticePage extends StatefulWidget {
  const QuickTechPracticePage({super.key});

  @override
  State<QuickTechPracticePage> createState() => _QuickTechPracticePageState();
}

class _QuickTechPracticePageState extends State<QuickTechPracticePage> {
  final List<String> title = [
    "Bangla",
    "English",
    "Math",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: "Practice".text.semiBold.make(),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: dynamicSize),
        children: [
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  10.heightBox,
                  customRow(context, title[index], "", () {}).p8(),
                  15.heightBox,
                  // GridView inside Column
                  GridView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    physics: NeverScrollableScrollPhysics(),
                    // Disable GridView scrolling
                    shrinkWrap: true,
                    // Fit content
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // 2 columns
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                      childAspectRatio: 1.0, // Square items
                    ),
                    itemCount: 4,
                    // 4 items per grid
                    itemBuilder: (context, gridIndex) {
                      return customCard(context,"https://images.pexels.com/photos/206359/pexels-photo-206359.jpeg","20").onTap(() {
                        Get.to(() => QuickTechPracticeQuestionListPage());
                      }).animate().fadeIn(delay: (gridIndex*150).ms);
                    },
                  ),
                  10.heightBox,
                ],
              )
                  .box
                  .padding(EdgeInsets.symmetric(horizontal: 5))
                  .color(
                      Colors.primaries[index*2 % Colors.primaries.length].shade100)
                  .margin(EdgeInsets.symmetric(vertical: 10))
                  .rounded
                  .make().animate().fadeIn().move(
                  begin: const Offset(0, 200),
                  end: const Offset(0, 0),
                  delay: 100.ms,
                  duration: 380.ms);
            },
          ),
        ],
      ),
    );
  }
}
