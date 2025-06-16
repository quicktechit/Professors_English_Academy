import 'dart:developer';

import 'package:professors_english_academy/controller/quick_tech_leader_board_controller.dart';

import '../../consts/consts.dart';

class QuickTechLeaderBoard extends StatefulWidget {
  const QuickTechLeaderBoard({super.key});

  @override
  State<QuickTechLeaderBoard> createState() => _QuickTechLeaderBoardState();
}

class _QuickTechLeaderBoardState extends State<QuickTechLeaderBoard> {
  LeaderBoardController leaderBoardController =
      Get.put(LeaderBoardController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      leaderBoardController.fetchData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: "LeaderBoard".text.semiBold.make(),
      ),
      body: Column(
        children: [
          Obx(
          ()=> ClipPath(
              clipper: TriangleClipper(),
              child: Container(
                color: mainColor,
                height: 300,
                width: Get.width,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    // Check if the leaderboard data has at least 3 students
                    if (leaderBoardController
                        .leaderBoardData.value.isNotEmpty) ...[
                      // Leaderboard for Top 3
                      Positioned(
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/images/crown.png",
                              height: 30,
                            ),
                            SizedBox(
                              width: 110,
                              height: 125,
                              child: Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  Positioned(
                                    bottom: 15,
                                    child: CircleAvatar(
                                      radius: 50,
                                      backgroundColor: Colors.white,
                                      child: leaderBoardController.leaderBoardData
                                                  .value[0].student?.image ==
                                              "null"
                                          ? Image.asset("assets/images/Final-01.png")
                                          : Image.network(
                                              Api.imageUrl +
                                                  (leaderBoardController
                                                          .leaderBoardData
                                                          .value[0]
                                                          .student
                                                          ?.image ??
                                                      ''),
                                            ),
                                    )
                                        .clipOval()
                                        .box
                                        .roundedFull
                                        .padding(const EdgeInsets.all(5))
                                        .color(Colors.yellow)
                                        .make(),
                                  ),
                                  Positioned(
                                      child: "1"
                                          .text
                                          .black
                                          .semiBold
                                          .size(16)
                                          .make()
                                          .box
                                          .roundedFull
                                          .padding(const EdgeInsets.all(5))
                                          .color(Colors.yellow)
                                          .make())
                                ],
                              ),
                            ),
                            leaderBoardController
                                        .leaderBoardData.value[0].student?.name !=
                                    null
                                ? "${leaderBoardController.leaderBoardData.value[0].student?.name}"
                                    .text
                                    .semiBold
                                    .textStyle(GoogleFonts.kufam())
                                    .semiBold
                                    .white.maxLines(1)
                                    .make().w(context.screenWidth/2)
                                : "UserName"
                                    .text
                                    .semiBold
                                    .textStyle(GoogleFonts.kufam())
                                    .semiBold
                                    .white
                                    .make(),
                            leaderBoardController.leaderBoardData.value[0]
                                        .totalRightAnswers !=
                                    null
                                ? "${leaderBoardController.leaderBoardData.value[0].totalRightAnswers} / ${leaderBoardController.leaderBoardData.value[0].totalQuestions}"
                                    .text
                                    .semiBold
                                    .textStyle(GoogleFonts.kufam())
                                    .white
                                    .semiBold
                                    .make()
                                : "Score"
                                    .text
                                    .semiBold
                                    .textStyle(GoogleFonts.kufam())
                                    .white
                                    .semiBold
                                    .make(),
                          ],
                        ).w(context.screenWidth/3),
                      ),
                      Positioned(
                        right: 5,
                        bottom: 70,
                        child: Column(
                          children: [
                            SizedBox(
                              width: 110,
                              height: 125,
                              child: Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  Positioned(
                                    bottom: 15,
                                    child: CircleAvatar(
                                      radius: 40,
                                      backgroundColor: Colors.white,
                                      child: leaderBoardController.leaderBoardData
                                                  .value[1].student?.image ==
                                              "null"
                                          ? Image.asset("assets/images/Final-01.png")
                                          : Image.network(
                                              Api.imageUrl +
                                                    (  leaderBoardController
                                                          .leaderBoardData
                                                          .value[1]
                                                          .student
                                                          ?.image ??
                                                  ''),
                                            ),
                                    )
                                        .clipOval()
                                        .box
                                        .roundedFull
                                        .padding(const EdgeInsets.all(5))
                                        .color(deepGreen)
                                        .make(),
                                  ),
                                  Positioned(
                                      child: "2"
                                          .text
                                          .white
                                          .semiBold
                                          .size(16)
                                          .make()
                                          .box
                                          .roundedFull
                                          .padding(const EdgeInsets.all(5))
                                          .color(deepGreen)
                                          .make())
                                ],
                              ),
                            ),
                            leaderBoardController
                                        .leaderBoardData.value[1].student?.name !=
                                    null
                                ? "${leaderBoardController.leaderBoardData.value[1].student?.name}"
                                    .text
                                    .semiBold
                                    .textStyle(GoogleFonts.kufam())
                                    .semiBold
                                    .white.maxLines(1)
                                    .makeCentered()
                                : "UserName"
                                    .text
                                    .semiBold
                                    .textStyle(GoogleFonts.kufam())
                                    .semiBold
                                    .white
                                    .make(),
                            leaderBoardController.leaderBoardData.value[1]
                                        .totalRightAnswers !=
                                    null
                                ? "${leaderBoardController.leaderBoardData.value[1].totalRightAnswers} / ${leaderBoardController.leaderBoardData.value[1].totalQuestions}"
                                    .text
                                    .semiBold
                                    .textStyle(GoogleFonts.kufam())
                                    .white
                                    .semiBold
                                    .makeCentered()
                                : "Score"
                                    .text
                                    .semiBold
                                    .textStyle(GoogleFonts.kufam())
                                    .white
                                    .semiBold
                                    .make(),
                          ],
                        ).w(context.screenWidth/3),
                      ),
                      Positioned(
                        left: 5,
                        bottom: 70,
                        child: Column(
                          children: [
                            SizedBox(
                              width: 110,
                              height: 125,
                              child: Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  Positioned(
                                    bottom: 15,
                                    child: CircleAvatar(
                                      radius: 40,
                                      backgroundColor: Colors.white,
                                      child: leaderBoardController.leaderBoardData
                                                  .value[2].student?.image ==
                                              "null"
                                          ? Image.asset("assets/images/Final-01.png")
                                          : Image.network(
                                              Api.imageUrl +
                                                   (   leaderBoardController
                                                          .leaderBoardData
                                                          .value[2]
                                                          .student
                                                          ?.image ??
                                                  ''),
                                            ),
                                    )
                                        .clipOval()
                                        .box
                                        .roundedFull
                                        .padding(const EdgeInsets.all(5))
                                        .color(deepGreen)
                                        .make(),
                                  ),
                                  Positioned(
                                      child: "3"
                                          .text
                                          .white
                                          .semiBold
                                          .size(16)
                                          .make()
                                          .box
                                          .roundedFull
                                          .padding(const EdgeInsets.all(5))
                                          .color(deepGreen)
                                          .make())
                                ],
                              ),
                            ),
                            leaderBoardController
                                        .leaderBoardData.value[2].student?.name !=
                                    null
                                ? "${leaderBoardController.leaderBoardData.value[2].student?.name}"
                                    .text
                                    .semiBold
                                    .textStyle(GoogleFonts.kufam())
                                    .semiBold
                                    .white.maxLines(1)
                                    .makeCentered()
                                : "UserName"
                                    .text
                                    .semiBold
                                    .textStyle(GoogleFonts.kufam())
                                    .semiBold
                                    .white
                                    .make(),
                            leaderBoardController.leaderBoardData.value[2]
                                        .totalRightAnswers !=
                                    null
                                ? "${leaderBoardController.leaderBoardData.value[2].totalRightAnswers} / ${leaderBoardController.leaderBoardData.value[2].totalQuestions}"
                                    .text
                                    .semiBold
                                    .textStyle(GoogleFonts.kufam())
                                    .white
                                    .semiBold
                                    .makeCentered()
                                : "Score"
                                    .text
                                    .semiBold
                                    .textStyle(GoogleFonts.kufam())
                                    .white
                                    .semiBold
                                    .make(),
                          ],
                        ).w(context.screenWidth/3),
                      ),
                    ] else
                      // Display a loading indicator if the list is empty
                      Center(
                        child: CircularProgressIndicator(),
                      ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Obx(
              () {
                if (leaderBoardController.leaderBoardData.value.isEmpty) {
                  return Lottie.asset("assets/icons/empty.json").centered();
                } else {
                  var leaderboardData =
                      leaderBoardController.leaderBoardData.value;

                  // Skip the first 3 ranks
                  var studentsFromRank4 = leaderboardData.skip(3).toList();

                  return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: studentsFromRank4.length>=47?47:studentsFromRank4.length,
                    itemBuilder: (context, index) {
                      var student = studentsFromRank4[index];
                      return Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          '${index + 4}'
                              .text
                              .black
                              .textStyle(GoogleFonts.kufam())
                              .size(20)
                              .make(),
                          10.widthBox,
                          CircleAvatar(
                            radius: 23,
                            child: student.student?.image != "null"
                                ? Image.network(
                                    Api.imageUrl + student.student?.image,
                                    fit: BoxFit.cover,
                                  )
                                : Image.asset('assets/images/Final-01.png', fit: BoxFit.cover),
                          ).clipOval(),
                          5.widthBox,
                          "${student.student?.name}"
                              .text
                              .black
                              .textStyle(GoogleFonts.kufam())
                              .size(17)
                              .make()
                              .w(context.screenWidth * 0.4),
                          const Spacer(),
                          "${student.totalRightAnswers ?? 0}/${student.totalQuestions ?? 0}"
                              .text
                              .black
                              .textStyle(GoogleFonts.kufam())
                              .size(16)
                              .make(),
                        ],
                      )
                          .box
                          .rounded
                          .white
                          .margin(const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10))
                          .padding(const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10))
                          .make()
                          .animate()
                          .fadeIn(duration: 300.ms)
                          .move(
                              begin: const Offset(0, 130),
                              end: const Offset(0, 0),
                              delay: (80 * index).ms,
                              duration: 400.ms);
                    },
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
