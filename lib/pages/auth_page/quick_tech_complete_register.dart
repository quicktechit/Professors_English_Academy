import 'package:professors_english_academy/consts/consts.dart';
import 'package:professors_english_academy/widgets/quick_tech_custom_button.dart';
import 'package:professors_english_academy/widgets/quicktech_custom_text_field.dart';

class QuickTechCompleteRegister extends StatefulWidget {
  const QuickTechCompleteRegister({super.key});

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
            15.heightBox,
            "Name".text.semiBold.make().animate().fadeIn().move(
                begin: const Offset(0, 300),
                end: const Offset(0, 0),
                delay: 100.ms,
                duration: 380.ms),
            5.heightBox,
            customTextField(
                hint: "name",
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
                hint: "number",
                isSuffix: false,
                isVisible: true,
                icon: Icons.phone).animate().fadeIn().move(
                begin: const Offset(0, 300),
                end: const Offset(0, 0),
                delay: 120.ms,
                duration: 380.ms),
            15.heightBox,
            "School/College/University".text.semiBold.make().animate().fadeIn().move(
                begin: const Offset(0, 300),
                end: const Offset(0, 0),
                delay: 140.ms,
                duration: 380.ms),
            5.heightBox,
            customTextField(
                hint: "School/College/University",
                isSuffix: false,
                isVisible: true,
                icon: Icons.location_city).animate().fadeIn().move(
                begin: const Offset(0, 300),
                end: const Offset(0, 0),
                delay: 140.ms,
                duration: 380.ms),
            15.heightBox,
            "Select Your Course".text.semiBold.make().animate().fadeIn().move(
                begin: const Offset(0, 300),
                end: const Offset(0, 0),
                delay: 160.ms,
                duration: 380.ms),
            5.heightBox,
            DropdownButton<String>(
              value: _selectedItem,
              hint: const Text('Select an option'), // Shown when no value is selected
              icon: const Icon(Icons.arrow_drop_down), // Dropdown arrow icon
              elevation: 16, // Shadow elevation
              isExpanded: true,
              style: const TextStyle(
                color: mainColor,
                fontSize: 16,
              ),
              underline: SizedBox.shrink(), 
              onChanged: (String? newValue) {
                setState(() {
                  _selectedItem = newValue;
                });
              },
              items: _dropdownItems.map<DropdownMenuItem<String>>((String value) {
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
                .make().animate().fadeIn().move(
                begin: const Offset(0, 300),
                end: const Offset(0, 0),
                delay: 160.ms,
                duration: 380.ms),
            15.heightBox,
            "Batch".text.semiBold.make().animate().fadeIn().move(
                begin: const Offset(0, 300),
                end: const Offset(0, 0),
                delay: 180.ms,
                duration: 380.ms),
            5.heightBox,
            DropdownButton<String>(
              value: _selectedItem,
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
                setState(() {
                  _selectedItem = newValue;
                });
              },
              items: _dropdownItems.map<DropdownMenuItem<String>>((String value) {
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
                .make().animate().fadeIn().move(
                begin: const Offset(0, 300),
                end: const Offset(0, 0),
                delay: 180.ms,
                duration: 380.ms),
            15.heightBox,
            "Password".text.semiBold.make().animate().fadeIn().move(
                begin: const Offset(0, 300),
                end: const Offset(0, 0),
                delay: 200.ms,
                duration: 380.ms),
            5.heightBox,
            customTextField(
                hint: "Password",
                isSuffix: false,
                isVisible: false,
                icon: Icons.key).animate().fadeIn().move(
                begin: const Offset(0, 300),
                end: const Offset(0, 0),
                delay: 200.ms,
                duration: 380.ms),
            30.heightBox,
            customButton(
                    title: "Create Account",
                    onPressed: () {},
                    color: mainColor,
                    txtColor: white)
                .w(context.screenWidth).animate().fadeIn().move(
                begin: const Offset(0, 300),
                end: const Offset(0, 0),
                delay: 220.ms,
                duration: 380.ms)
          ],
        ).pSymmetric(h: dynamicSize),
      ),
    );
  }
}
