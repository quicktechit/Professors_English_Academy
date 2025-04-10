import  'package:http/http.dart' as http;
import 'dart:io';

import '../consts/consts.dart';
class PdfController extends GetxController{
  var isLoading = true.obs;
  var filePath = ''.obs;

  Future<void> loadPdf(String url) async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse(url));
      final dir = await getApplicationDocumentsDirectory();
      final file = File('${dir.path}/temp.pdf');
      await file.writeAsBytes(response.bodyBytes);
      filePath.value = file.path;
    } finally {
      isLoading(false);
    }
  }
}