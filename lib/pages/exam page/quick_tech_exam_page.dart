import 'package:professors_english_academy/consts/consts.dart';
import 'package:professors_english_academy/pages/reasult%20page/quick_tech_result_screen.dart';
import 'package:professors_english_academy/widgets/quick_tech_custom_button.dart';

import '../../controller/quick_tech_pdf_controller.dart';
import '../../controller/quick_tech_qustion_controller.dart';

class QuickTechExamPage extends StatefulWidget {
  const QuickTechExamPage({super.key});

  @override
  State<QuickTechExamPage> createState() => _QuickTechExamPageState();
}

class _QuickTechExamPageState extends State<QuickTechExamPage> {
  final PdfController pdfController = Get.put(PdfController());
  final QuestionController questionController = Get.put(QuestionController());

  @override
  void initState() {
    // TODO: implement initState
    pdfController.loadPdf("https://icseindia.org/document/sample.pdf");
    super.initState();
  }
  Future<bool> showExitConfirmationDialog() async {
    return await Get.defaultDialog<bool>(
      title: 'Confirm Exit',
      titleStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
      middleText: 'Are you sure you want to leave this screen?',
      textCancel: 'No',
      cancelTextColor: Colors.grey,
      textConfirm: 'Yes',
      confirmTextColor: Colors.white,
      buttonColor: Colors.blue,
      barrierDismissible: false,
      onCancel: () {

        Get.back(result: false);
      },
      onConfirm: () {

        Get.back(result: true);
      },
    ) ?? false;
  }
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (didPop) return;
        bool shouldPop = await showExitConfirmationDialog();
        if (shouldPop) {
          Get.back();
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: "Exam Paper".text.make(),
          actions: [
            "Remain Time: ".text.sm.make(),
            Obx(() {
              return questionController.formattedTime.text.sm.semiBold.make();
            }),
            5.widthBox
          ],
        ),
        body: SafeArea(
          child: Column(
            children: [
              5.heightBox,
              Obx(() {
                if (pdfController.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (pdfController.filePath.value.isEmpty) {
                  return const Center(child: Text('Failed to load PDF.'));
                }
                return PDFView(
                  filePath: pdfController.filePath.value,
                  enableSwipe: true,
                  swipeHorizontal: false,
                  autoSpacing: true,
                  pageFling: true,
                  onError: (error) => print(error.toString()),
                  onPageChanged: (page, total) =>
                      print('Page changed: $page/$total'),
                ).h(context.screenHeight / 1.9);
              }),
              Flexible(
                child: Obx(() {
                  return ListView.builder(
                    padding: const EdgeInsets.all(8.0),
                    itemCount: questionController.questions.length,
                    itemBuilder: (context, index) {
                      final question = questionController.questions[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Display question number (e.g., Q1)
                            Text(
                              'Q${question.id}',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            // Options organized in two rows: [A, B] and [C, D]
                            Obx(
                              ()=> Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  RadioListTile<String>(
                                    title: Text('A'),
                                    value: 'A',
                                    groupValue: question.selectedOption.value,
                                    onChanged: (value) {
                                      questionController.setSelectedOption(question.id, value!);
                                    },
                                  ).w(100),
                                  RadioListTile<String>(
                                    title: Text('B'),
                                    value: 'B',
                                    groupValue: question.selectedOption.value,
                                    onChanged: (value) {
                                      questionController.setSelectedOption(question.id, value!);
                                    },
                                  ).w(100),
                                ],
                              ),
                            ),
                            Obx(
                              ()=> Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  RadioListTile<String>(
                                    title: Text('C'),
                                    value: 'C',
                                    groupValue: question.selectedOption.value,
                                    onChanged: (value) {
                                      questionController.setSelectedOption(question.id, value!);
                                    },
                                  ).w(100),
                                  RadioListTile<String>(
                                    title: Text('D'),
                                    value: 'D',
                                    groupValue: question.selectedOption.value,
                                    onChanged: (value) {
                                      questionController.setSelectedOption(question.id, value!);
                                    },
                                  ).w(100),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                })
                    .box
                    .color(gry.withOpacity(0.3))
                    .rounded
                    .clip(Clip.antiAlias)
                    .padding(EdgeInsets.symmetric(horizontal: 3,vertical: 5))
                    .make(),
              ),
              15.heightBox,
              customButton(
                      title: "Submit",
                      onPressed: () {
                        Get.defaultDialog(
                          title: 'Quick Alert',
                          middleText: 'Are you sure you want to Submit?',
                          textCancel: 'Cancel',
                          textConfirm: 'OK',
                          onCancel: () {
                            Get.back();
                          },
                          onConfirm: () {
                            Get.back();
                            Get.to(()=>QuickTechResultScreen());
                          },
                        );

                      },
                      color: mainColor,
                      txtColor: white)
                  .w(context.screenWidth)
            ],
          ).pSymmetric(h: dynamicSize),
        ),
      ),
    );
  }
}
