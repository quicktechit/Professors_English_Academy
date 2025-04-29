import 'package:professors_english_academy/consts/consts.dart';
import 'package:professors_english_academy/controller/quick_tech_otp_controller.dart';
import 'package:professors_english_academy/controller/quick_tech_register_controller.dart';
import 'package:professors_english_academy/widgets/quick_tech_custom_button.dart';
import 'package:professors_english_academy/widgets/quicktech_custom_text_field.dart';

class QuickTechCompleteRegister extends StatefulWidget {
  final String phone;
  const QuickTechCompleteRegister({super.key, required this.phone});

  @override
  State<QuickTechCompleteRegister> createState() =>
      _QuickTechCompleteRegisterState();
}

class _QuickTechCompleteRegisterState extends State<QuickTechCompleteRegister> {
  String? _selectedItem = 'Option 1';
  final List<String> _dropdownItems = [
    'Option 1',
    'Option 2',
    'Option 3',
    'Option 4',
  ];
@override
  void initState() {
    // TODO: implement initState
    super.initState();
   registerController.phone.text=widget.phone;
  }

  final RegisterController registerController=Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            "Complete Register".text.semiBold.xl2.make().animate().fadeIn().move(
            begin: const Offset(0, 300),
            end: const Offset(0, 0),
            delay: 80.ms,
            duration: 380.ms),
            20.heightBox,
            "Name".text.semiBold.make().animate().fadeIn().move(
                begin: const Offset(0, 300),
                end: const Offset(0, 0),
                delay: 100.ms,
                duration: 380.ms),
            5.heightBox,
            customTextField(controller: registerController.name,
                hint: "Name",
                isSuffix: false,
                isVisible: true,
                icon: Icons.person_outline).animate().fadeIn().move(
                begin: const Offset(0, 300),
                end: const Offset(0, 0),
                delay: 100.ms,
                duration: 380.ms),
            15.heightBox,
            "Phone Number".text.semiBold.make().animate().fadeIn().move(
                begin: const Offset(0, 300),
                end: const Offset(0, 0),
                delay: 120.ms,
                duration: 380.ms),
            5.heightBox,
            customTextField(
                hint: "Number",controller: registerController.phone,
                isSuffix: false,
                isVisible: true,
                icon: Icons.phone).animate().fadeIn().move(
                begin: const Offset(0, 300),
                end: const Offset(0, 0),
                delay: 120.ms,
                duration: 380.ms),
            15.heightBox,
            "Email".text.semiBold.make().animate().fadeIn().move(
                begin: const Offset(0, 300),
                end: const Offset(0, 0),
                delay: 140.ms,
                duration: 380.ms),
            5.heightBox,
            customTextField(
                hint: "Email",controller: registerController.email,
                isSuffix: false,
                isVisible: true,
                icon: Icons.phone).animate().fadeIn().move(
                begin: const Offset(0, 300),
                end: const Offset(0, 0),
                delay: 140.ms,
                duration: 380.ms),
            15.heightBox,
            "School/College/University".text.semiBold.make().animate().fadeIn().move(
                begin: const Offset(0, 300),
                end: const Offset(0, 0),
                delay: 160.ms,
                duration: 380.ms),
            5.heightBox,
            customTextField(controller: registerController.college,
                hint: "School/College/University",
                isSuffix: false,
                isVisible: true,
                icon: Icons.location_city).animate().fadeIn().move(
                begin: const Offset(0, 300),
                end: const Offset(0, 0),
                delay: 160.ms,
                duration: 380.ms),
            // 15.heightBox,
            // "Select Your Course".text.semiBold.make().animate().fadeIn().move(
            //     begin: const Offset(0, 300),
            //     end: const Offset(0, 0),
            //     delay: 160.ms,
            //     duration: 380.ms),
            // 5.heightBox,
            // DropdownButton<String>(
            //   value: _selectedItem,
            //   hint: const Text('Select an option'), // Shown when no value is selected
            //   icon: const Icon(Icons.arrow_drop_down), // Dropdown arrow icon
            //   elevation: 16, // Shadow elevation
            //   isExpanded: true,
            //   style: const TextStyle(
            //     color: mainColor,
            //     fontSize: 16,
            //   ),
            //   underline: SizedBox.shrink(),
            //   onChanged: (String? newValue) {
            //     setState(() {
            //       _selectedItem = newValue;
            //     });
            //   },
            //   items: _dropdownItems.map<DropdownMenuItem<String>>((String value) {
            //     return DropdownMenuItem<String>(
            //       value: value,
            //       child: Text(value),
            //     );
            //   }).toList(),
            // )
            //     .box
            //     .rounded
            //     .border(color: Colors.black)
            //     .padding(EdgeInsets.symmetric(horizontal: 10))
            //     .make().animate().fadeIn().move(
            //     begin: const Offset(0, 300),
            //     end: const Offset(0, 0),
            //     delay: 160.ms,
            //     duration: 380.ms),
            // 15.heightBox,
            // "Batch".text.semiBold.make().animate().fadeIn().move(
            //     begin: const Offset(0, 300),
            //     end: const Offset(0, 0),
            //     delay: 180.ms,
            //     duration: 380.ms),
            // 5.heightBox,
            // DropdownButton<String>(
            //   value: _selectedItem,
            //   hint: const Text('Select an option'),
            //   // Shown when no value is selected
            //   icon: const Icon(Icons.arrow_drop_down),
            //   // Dropdown arrow icon
            //   elevation: 16,
            //   // Shadow elevation
            //   isExpanded: true,
            //   style: const TextStyle(
            //     color: mainColor,
            //     fontSize: 16,
            //   ),
            //   underline: SizedBox.shrink(),
            //   onChanged: (String? newValue) {
            //     setState(() {
            //       _selectedItem = newValue;
            //     });
            //   },
            //   items: _dropdownItems.map<DropdownMenuItem<String>>((String value) {
            //     return DropdownMenuItem<String>(
            //       value: value,
            //       child: Text(value),
            //     );
            //   }).toList(),
            // )
            //     .box
            //     .rounded
            //     .border(color: Colors.black)
            //     .padding(EdgeInsets.symmetric(horizontal: 10))
            //     .make().animate().fadeIn().move(
            //     begin: const Offset(0, 300),
            //     end: const Offset(0, 0),
            //     delay: 180.ms,
            //     duration: 380.ms),
            15.heightBox,
            "Password".text.semiBold.make().animate().fadeIn().move(
                begin: const Offset(0, 300),
                end: const Offset(0, 0),
                delay: 200.ms,
                duration: 380.ms),
            5.heightBox,
            customTextField(controller: registerController.password,
                hint: "Password",
                isSuffix: false,
                isVisible: false,
                icon: Icons.key).animate().fadeIn().move(
                begin: const Offset(0, 300),
                end: const Offset(0, 0),
                delay: 200.ms,
                duration: 380.ms),
            15.heightBox,
            "Confirm Password".text.semiBold.make().animate().fadeIn().move(
                begin: const Offset(0, 300),
                end: const Offset(0, 0),
                delay: 220.ms,
                duration: 380.ms),
            5.heightBox,
            customTextField(controller:registerController.confirmPassword,
                hint: "Confirm Password",
                isSuffix: false,
                isVisible: false,
                icon: Icons.key).animate().fadeIn().move(
                begin: const Offset(0, 300),
                end: const Offset(0, 0),
                delay: 220.ms,
                duration: 380.ms),
            30.heightBox,
            customButton(
                    title: "Create Account",
                    onPressed: () {
                     registerController.createUser();
                    },
                    color: mainColor,
                    txtColor: white)
                .w(context.screenWidth).animate().fadeIn().move(
                begin: const Offset(0, 300),
                end: const Offset(0, 0),
                delay: 240.ms,
                duration: 380.ms),
            20.heightBox,
          ],
        ).pSymmetric(h: dynamicSize),
      ),
    );
  }
}
