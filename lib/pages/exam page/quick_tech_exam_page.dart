import 'package:professors_english_academy/consts/consts.dart';
import 'package:professors_english_academy/widgets/quick_tech_custom_button.dart';

import '../../controller/quick_tech_pdf_controller.dart';
import '../../controller/quick_tech_practice_controller.dart';
import '../../controller/quick_tech_qustion_controller.dart';

class QuickTechExamPage extends StatefulWidget {
  final String pdfs;

  const QuickTechExamPage({super.key, required this.pdfs});

  @override
  State<QuickTechExamPage> createState() => _QuickTechExamPageState();
}

class _QuickTechExamPageState extends State<QuickTechExamPage> {
  final PdfController pdfController = Get.put(PdfController());
  final PracticeController practiceController = Get.find();
  final ExamController examController = Get.put(ExamController());

  @override
  void initState() {
    // TODO: implement initState
    pdfController.loadPdf(widget.pdfs != ""
        ? Api.baseUrl + widget.pdfs
        : "https://icseindia.org/document/sample.pdf");

    examController.timeInSeconds.value=int.parse(practiceController.singleExam.value.timer.toString())*60;

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
            // Get.back(result: false);
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
              return examController.formattedTime.text.sm.semiBold.make();
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
                  return const Center(child: CircularProgressIndicator())
                      .h(context.screenHeight / 1.9);
                }
                if (pdfController.filePath.value.isEmpty) {
                  return const Center(child: Text('Failed to load PDF.'))
                      .h(context.screenHeight / 1.9);
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
                    itemCount:
                        practiceController.singleExam.value.questions?.length,
                    itemBuilder: (context, index) {
                      final question =
                          practiceController.singleExam.value.questions?[index];
                      final options = question?.options ?? [];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Display question number (e.g., Q1)
                            Text(
                              'Q${question?.id}',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Obx(
                                  () => GridView.count(
                                crossAxisCount: 2,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                childAspectRatio: 3.0,
                                mainAxisSpacing: 8.0,
                                crossAxisSpacing: 8.0,
                                children: List.generate(options.length, (optionIndex) {
                                  final option = options[optionIndex];
                                  final optionLabel = String.fromCharCode(65 + optionIndex);
                                  final selectedOption = practiceController.selectedAnswers[question?.id]?.value['option'] ?? '';

                                  return RadioListTile<String>(
                                    title: Text('$optionLabel. ${option.option ?? ''}'),
                                    value: option.option ?? '',
                                    groupValue: selectedOption,
                                    onChanged: (value) {
                                      if (value != null && option.id != null) {
                                        practiceController.updateAnswer(question!.id!, value, option.id!);
                                      }
                                    },
                                    contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  );
                                }),
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
                            practiceController.submitAnswers(practiceController.singleExam.value.id.toString());

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
