import 'package:professors_english_academy/consts/consts.dart';
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          "Complete Register".text.semiBold.xl2.make(),
          15.heightBox,
          "Name".text.semiBold.make(),
          5.heightBox,
          customTextField(
              hint: "name",
              isSuffix: false,
              isVisible: true,
              icon: Icons.person_outline),
          15.heightBox,
          "Phone Number".text.semiBold.make(),
          5.heightBox,
          customTextField(
              hint: "number",
              isSuffix: false,
              isVisible: true,
              icon: Icons.phone),
          15.heightBox,
          "School/College/University".text.semiBold.make(),
          5.heightBox,
          customTextField(
              hint: "School/College/University",
              isSuffix: false,
              isVisible: true,
              icon: Icons.location_city),
          15.heightBox,
          "Select Your Exam".text.semiBold.make(),
          5.heightBox,
          DropdownButton<String>(
            value: _selectedItem,
            hint: const Text('Select an option'), // Shown when no value is selected
            icon: const Icon(Icons.arrow_drop_down), // Dropdown arrow icon
            elevation: 16, // Shadow elevation
            style: const TextStyle(
              color: Colors.blue,
              fontSize: 16,
            ),
            underline: SizedBox.shrink(), 
            onChanged: (String? newValue) {
              setState(() {
                _selectedItem = newValue; // Update the selected value
              });
            },
            items: _dropdownItems.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          "Batch".text.semiBold.make(),
        ],
      ).pSymmetric(h: dynamicSize),
    );
  }
}
