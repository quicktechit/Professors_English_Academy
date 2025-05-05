
import 'package:flutter_html/flutter_html.dart';

import '../../consts/consts.dart';
import '../../model/privicyterms_model.dart';

class QuickTechTermsPage extends StatefulWidget {
  final Datas data;
  const QuickTechTermsPage({super.key, required this.data});

  @override
  State<QuickTechTermsPage> createState() =>
      _QuickTechTermsPage();
}

class _QuickTechTermsPage
    extends State<QuickTechTermsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
          "Terms and Conditions".text.semiBold.make(),

      ),
      body: SingleChildScrollView(padding: EdgeInsets.symmetric(horizontal: 15),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${widget.data.name}",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              15.heightBox,
              Html(data: widget.data.details)
            ],
          ),
        ),
      ),
    );
  }
}
