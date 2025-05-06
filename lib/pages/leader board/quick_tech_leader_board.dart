import '../../consts/consts.dart';

class QuickTechLeaderBoard extends StatefulWidget {
  const QuickTechLeaderBoard({super.key});

  @override
  State<QuickTechLeaderBoard> createState() => _QuickTechLeaderBoardState();
}

class _QuickTechLeaderBoardState extends State<QuickTechLeaderBoard> {
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
          ClipPath(
            clipper: TriangleClipper(),
            child: Container(
              color: mainColor,
              height: 300,
              width: Get.width,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
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
                                child: Image.asset(
                                  "assets/images/man.png",
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
                                child: "3"
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
                      "UserName"
                          .text
                          .semiBold
                          .textStyle(GoogleFonts.kufam())
                          .semiBold
                          .white
                          .make(),
                      "90"
                          .text
                          .semiBold
                          .textStyle(GoogleFonts.kufam())
                          .white
                          .semiBold
                          .make(),
                    ],
                  )).animate().fade(duration: 800.ms),
                  Positioned(
                      right: 20,
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
                                    child: Image.asset(
                                      "assets/images/man.png",
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
                          "UserName"
                              .text
                              .semiBold
                              .textStyle(GoogleFonts.kufam())
                              .semiBold
                              .white
                              .make(),
                          "7/10"
                              .text
                              .semiBold
                              .textStyle(GoogleFonts.kufam())
                              .white
                              .semiBold
                              .make(),
                        ],
                      )).animate().fade(duration: 1100.ms),
                  Positioned(
                      left: 20,
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
                                    child: Image.asset(
                                      "assets/images/man.png",
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
                          "UserName"
                              .text
                              .semiBold
                              .textStyle(GoogleFonts.kufam())
                              .semiBold
                              .white
                              .make(),
                          "7/10"
                              .text
                              .semiBold
                              .textStyle(GoogleFonts.kufam())
                              .white
                              .semiBold
                              .make(),
                        ],
                      )).animate().fade(duration: 1400.ms),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: 6,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      '${index + 4}'
                          .text
                          .textStyle(GoogleFonts.kufam())
                          .size(20)
                          .make(),
                      10.widthBox,
                      CircleAvatar(
                        radius: 23,
                        child: Image.asset("assets/images/man.png"),
                      ).clipOval(),
                      const Spacer(),
                      "50"
                          .text
                          .textStyle(GoogleFonts.kufam())
                          .size(16)
                          .make(),
                    ],
                  )
                      .box
                      .rounded
                      .white
                      .margin(const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10))
                      .padding(const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10))
                      .make()
                      .animate()
                      .fadeIn(duration: 300.ms)
                      .move(
                          begin: const Offset(0, 300),
                          end: const Offset(0, 0),
                          delay: (150 * index).ms,
                          duration: 500.ms);
                }),
          )
        ],
      ),
    );
  }
}
