import 'dart:convert';

import 'package:professors_english_academy/consts/consts.dart';
import 'package:professors_english_academy/model/leader_board_model.dart';
import 'package:http/http.dart' as http;

class LeaderBoardController extends GetxController {
  // Correcting this line to be a list of LeaderBoardModel
  var leaderBoardData = <LeaderBoardModel>[].obs;  // RxList<LeaderBoardModel>

  Future<void> fetchData() async {
    try {
      LoaderService.to.showLoader();
      final response = await http.get(Uri.parse(Api.leaderBoard));

      if (response.statusCode == 200) {
        LoaderService.to.hideLoader();
        var data = json.decode(response.body) as List;  // Decode as a list of objects
        // Now map each element to LeaderBoardModel
        leaderBoardData.value = data.map((json) => LeaderBoardModel.fromJson(json)).toList();
      } else {
        LoaderService.to.hideLoader();
        throw Exception('Failed to load data');
      }
    } catch (e) {
      LoaderService.to.hideLoader();
      throw Exception('Error: $e');
    }
  }
}

