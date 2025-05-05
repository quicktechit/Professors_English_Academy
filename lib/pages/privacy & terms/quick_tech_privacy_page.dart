import 'package:flutter_html/flutter_html.dart';
import 'package:professors_english_academy/consts/consts.dart';
import 'package:professors_english_academy/model/privicyterms_model.dart';

class QuickTechPrivacyPage extends StatefulWidget {
  final  Datas data;
  const QuickTechPrivacyPage({super.key, required this.data});

  @override
  State<QuickTechPrivacyPage> createState() => _QuickTechPrivacyPage();
}

class _QuickTechPrivacyPage extends State<QuickTechPrivacyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Privacy Policy".text.semiBold.make(),

      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${widget.data.name}",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Html(data: widget.data.details)
            ],
          ),
        ),
      ),
    );
  }
}
