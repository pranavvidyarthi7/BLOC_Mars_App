import 'package:http/http.dart' as http;

import '../../core/secrets.dart';

class RoverDataProvider {
  RoverDataProvider();
  String baseUrl = "https://api.nasa.gov/mars-photos/api/v1/";
  Future<http.Response> getRoverManifest(String rover) => http.get(
        Uri.parse('$baseUrl/manifests/$rover?api_key=$apiKey'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
  Future<http.Response> getRoverPics(
          {required String rover,
          required String sol,
          required String camera}) =>
      http.get(
        Uri.parse(
            '$baseUrl/rovers/$rover/photos?sol=$sol&camera=$camera&api_key=$apiKey'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
}
