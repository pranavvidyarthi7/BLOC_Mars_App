import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mars_rover_app/src/data/models/rover_detail_model.dart';

import '../data_providers/rover_data_provider.dart';
import '../models/rover_manifest_model.dart';

class RoverDataRepository {
  final RoverDataProvider _roverDataProvider;
  RoverDataRepository(this._roverDataProvider);
  Future<RoverDetail> getRoverManifest({required String roverName}) async {
    try {
      final http.Response response =
          await _roverDataProvider.getRoverManifest(roverName);
      final data = jsonDecode(response.body)['photo_manifest'];
      print('DATA $data');
      Map<String, String> solDates = {};
      for (Map<String, dynamic> sol in data['photos']) {
        solDates[sol['sol'].toString()] = sol['earth_date'].toString();
      }
      final manifest = RoverManifest(
          roverName: data['name'],
          maxSol: data['max_sol'].toString(),
          maxDate: data['max_date'].toString(),
          totalPics: data['total_photos'].toString());
      final roverDetail = RoverDetail(manifest, solDates);
      return roverDetail;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<String>> getRoverPicUrls(
      {required String roverName,
      required String sol,
      required String camera}) async {
    try {
      final http.Response response = await _roverDataProvider.getRoverPics(
          camera: camera, sol: sol, rover: roverName);
      final List<dynamic> data = jsonDecode(response.body)['photos'];
      print('DATA ${data.length}');
      List<String> imageUrls = [];
      for (Map<String, dynamic> pic in data) {
        imageUrls.add(pic['img_src']);
      }
      return imageUrls;
    } catch (e) {
      rethrow;
    }
  }
}
