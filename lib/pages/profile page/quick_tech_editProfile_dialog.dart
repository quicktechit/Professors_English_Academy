import 'package:professors_english_academy/widgets/quick_tech_custom_button.dart';
import 'package:professors_english_academy/widgets/quicktech_custom_text_field.dart';

import '../../consts/consts.dart';

Widget editDialog(
    {name,
    emil,
    phone,
    uni,
    gy,
    tx,
    required BuildContext context,
    controller}) {
  var selectedItem = 'Option 1'.obs;
  final List<String> dropdownItems = [
    'Option 1',
    'Option 2',
    'Option 3',
    'Option 4',
  ].obs;
  return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 5,
      child: SizedBox(
        width: context.screenWidth,
        height: context.screenHeight / 1.4,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  "Profile Update".text.semiBold.size(15).make(),
                  const Icon(
                    Icons.cancel_outlined,
                    size: 28,
                    color: Colors.red,
                  ).onTap(() {
                    Get.back();
                  })
                ],
              ).animate().fadeIn(delay: 120.ms),
              20.heightBox,
              'Your Name'
                  .text
                  .color(gry)
                  .size(14)
                  .fontWeight(FontWeight.w500)
                  .make().animate().fadeIn().move(
                  begin: const Offset(0, 150),
                  end: const Offset(0, 0),
                  delay: 100.ms,
                  duration: 380.ms),
              5.heightBox,
              customTextField(
                controller: controller,
                isSuffix: false,
                icon: Icons.person_outline_rounded,
                hint: 'Name',
                isVisible: true,
              ).animate().fadeIn().move(
                  begin: const Offset(0, 150),
                  end: const Offset(0, 0),
                  delay: 100.ms,
                  duration: 380.ms),
              10.heightBox,
              'Your Phone Number'
                  .text
                  .color(gry)
                  .size(14)
                  .fontWeight(FontWeight.w500)
                  .make().animate().fadeIn().move(
                  begin: const Offset(0, 130),
                  end: const Offset(0, 0),
                  delay: 120.ms,
                  duration: 380.ms),
              5.heightBox,
              customTextField(
                controller: controller,
                isSuffix: false,
                icon: Icons.phone_outlined,
                hint: 'Number',
                isVisible: true,
              ).animate().fadeIn().move(
                  begin: const Offset(0, 130),
                  end: const Offset(0, 0),
                  delay: 120.ms,
                  duration: 380.ms),
              10.heightBox,
              'School/College/University'
                  .text
                  .color(gry)
                  .size(14)
                  .fontWeight(FontWeight.w500)
                  .make().animate().fadeIn().move(
                  begin: const Offset(0, 90),
                  end: const Offset(0, 0),
                  delay: 140.ms,
                  duration: 380.ms),
              customTextField(
                controller: controller,
                isSuffix: true,
                icon: Icons.school_outlined,
                hint: 'School/College/University',
                isVisible: true,
              ).animate().fadeIn().move(
                  begin: const Offset(0, 90),
                  end: const Offset(0, 0),
                  delay: 140.ms,
                  duration: 380.ms),
              10.heightBox,
              "Select Your Course".text.semiBold.make().animate().fadeIn().move(
                  begin: const Offset(0, 60),
                  end: const Offset(0, 0),
                  delay: 160.ms,
                  duration: 380.ms),
              5.heightBox,
              Obx(
                ()=> DropdownButton<String>(
                  value: selectedItem.value,
                  hint: const Text('Select an option'),
                  // Shown when no value is selected
                  icon: const Icon(Icons.arrow_drop_down),
                  // Dropdown arrow icon
                  elevation: 16,
                  // Shadow elevation
                  isExpanded: true,
                  style: const TextStyle(
                    color: mainColor,
                    fontSize: 16,
                  ),
                  underline: SizedBox.shrink(),
                  onChanged: (String? newValue) {

                      selectedItem.value = newValue.toString();

                  },
                  items: dropdownItems
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                )
                    .box
                    .rounded
                    .border(color: Colors.black)
                    .padding(EdgeInsets.symmetric(horizontal: 10))
                    .make()
                    .animate()
                    .fadeIn()
                    .move(
                        begin: const Offset(0, 60),
                        end: const Offset(0, 0),
                        delay: 160.ms,
                        duration: 380.ms),
              ),
              15.heightBox,
              "Batch".text.semiBold.make().animate().fadeIn().move(
                  begin: const Offset(0, 50),
                  end: const Offset(0, 0),
                  delay: 180.ms,
                  duration: 380.ms),
              5.heightBox,
              Obx(
                ()=> DropdownButton<String>(
                  value: selectedItem.value,
                  hint: const Text('Select an option'),
                  // Shown when no value is selected
                  icon: const Icon(Icons.arrow_drop_down),
                  // Dropdown arrow icon
                  elevation: 16,
                  // Shadow elevation
                  isExpanded: true,
                  style: const TextStyle(
                    color: mainColor,
                    fontSize: 16,
                  ),
                  underline: SizedBox.shrink(),
                  onChanged: (String? newValue) {

                      selectedItem.value = newValue.toString();

                  },
                  items: dropdownItems
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                )
                    .box
                    .rounded
                    .border(color: Colors.black)
                    .padding(EdgeInsets.symmetric(horizontal: 10))
                    .make()
                    .animate()
                    .fadeIn()
                    .move(
                        begin: const Offset(0, 50),
                        end: const Offset(0, 0),
                        delay: 180.ms,
                        duration: 380.ms),
              ),
              15.heightBox,
              customButton(
                      title: "Update",
                      onPressed: () {},
                      color: mainColor,
                      txtColor: white)
                  .w(context.screenWidth).animate()
                  .fadeIn()
                  .move(
                  begin: const Offset(0, 50),
                  end: const Offset(0, 0),
                  delay: 190.ms,
                  duration: 380.ms),
            ],
          ),
        ),
      ));
}
