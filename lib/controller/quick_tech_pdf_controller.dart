import 'dart:developer';

import 'package:device_info_plus/device_info_plus.dart';
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



  Future<void> downloadToDownloadsFolder(BuildContext context, String url) async {
    try {
      bool hasPermission = await _requestStoragePermission();
      if (!hasPermission && Platform.isAndroid) {
        Get.snackbar('Error', 'Storage permission denied');
        return;
      }

      Directory? downloadsDir;

      if (Platform.isAndroid) {
        downloadsDir = await getDownloadsDirectory();
        downloadsDir ??= Directory('/storage/emulated/0/Download/English');
      } else if (Platform.isIOS) {
        downloadsDir = await getDownloadsDirectory();
      }

      if (downloadsDir == null || !await downloadsDir.exists()) {
        Get.snackbar('Error', 'Downloads folder not found');
        return;
      }

      final response = await http.get(Uri.parse(Api.imageUrl+url));

      if (response.statusCode == 200) {
        final file = File('${downloadsDir.path}/routine_${DateTime.now().millisecondsSinceEpoch}.pdf');
        await file.writeAsBytes(response.bodyBytes);
        Get.snackbar('Success', 'PDF downloaded to: ${file.path}');
        log(file.path);
      } else {
        Get.snackbar('Error', 'Failed to download file: ${response.statusCode}');
      }
    } catch (e) {
      Get.snackbar('Error', 'Error during download: $e');
      log(e.toString());
    }
  }

  Future<bool> _requestStoragePermission() async {
    if (Platform.isIOS) {
      return true;
    }

    final deviceInfo = DeviceInfoPlugin();
    final androidInfo = await deviceInfo.androidInfo;
    final sdkInt = androidInfo.version.sdkInt;

    if (sdkInt >= 33) {
      return true;
    } else if (sdkInt >= 30) {
      var status = await Permission.storage.status;
      if (status.isGranted) {
        return true;
      }

      status = await Permission.storage.request();
      if (status.isGranted) {
        return true;
      } else if (status.isPermanentlyDenied) {
        await openAppSettings();
        return false;
      }
      return false;
    } else {
      // Android 10 and below: Use storage permission
      var status = await Permission.storage.status;
      if (status.isGranted) {
        return true;
      }

      status = await Permission.storage.request();
      if (status.isGranted) {
        return true;
      } else if (status.isPermanentlyDenied) {
        await openAppSettings();
        return false;
      }
      return false;
    }
  }
}