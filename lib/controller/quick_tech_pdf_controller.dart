import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import  'package:http/http.dart' as http;

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
        // Explicitly set the public Downloads directory
        downloadsDir = Directory('/storage/emulated/0/Download');
        if (!await downloadsDir.exists()) {
          // Fallback to getDownloadsDirectory if the public folder doesn't exist
          downloadsDir = await getDownloadsDirectory();
          if (downloadsDir == null) {
            Get.snackbar('Error', 'Downloads folder not found');
            return;
          }
        }
      } else if (Platform.isIOS) {
        downloadsDir = await getDownloadsDirectory();
        if (downloadsDir == null || !await downloadsDir.exists()) {
          Get.snackbar('Error', 'Downloads folder not found');
          return;
        }
      }

      final response = await http.get(Uri.parse(Api.imageUrl+url));

      if (response.statusCode == 200) {
        final fileName = 'routine_${DateTime.now().millisecondsSinceEpoch}.pdf';
        final file = File('${downloadsDir?.path}/$fileName');
        await file.writeAsBytes(response.bodyBytes);
        Get.snackbar('Success', 'PDF downloaded to: ${file.path}');
      } else {
        Get.snackbar('Error', 'Failed to download file: ${response.statusCode}');
      }
    } catch (e) {
      Get.snackbar('Error', 'Error during download: $e');
      debugPrint('Download error: $e');
    }
  }

  Future<bool> _requestStoragePermission() async {
    if (Platform.isIOS) {
      return true; // iOS doesn't require explicit storage permission for downloads
    }

    try {
      final deviceInfo = DeviceInfoPlugin();
      final androidInfo = await deviceInfo.androidInfo;
      final sdkInt = androidInfo.version.sdkInt;

      if (sdkInt >= 33) {
        // Android 13+ (API 33): No storage permission needed for public Downloads
        return true;
      } else if (sdkInt >= 30) {
        // Android 11-12 (API 30-32): Request MANAGE_EXTERNAL_STORAGE for public directories
        var status = await Permission.manageExternalStorage.status;
        if (status.isGranted) {
          return true;
        }

        status = await Permission.manageExternalStorage.request();
        if (status.isGranted) {
          return true;
        } else if (status.isPermanentlyDenied) {
          await openAppSettings();
          return false;
        }
        return false;
      } else {
        // Android 10 and below: Request storage permission
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
    } catch (e) {
      Get.snackbar('Error', 'Failed to get device info: $e');
      debugPrint('DeviceInfoPlugin error: $e');
      return false;
    }
  }
}