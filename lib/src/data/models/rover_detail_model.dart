import './rover_manifest_model.dart';

class RoverDetail {
  final RoverManifest _roverManifest;
  final Map<String, String> _solDates;
  RoverDetail(
    this._roverManifest,
    this._solDates,
  );
  RoverManifest get manifest => _roverManifest;
  Map<String, String> get sols => _solDates;
}

Map<String, RoverDetail> roverDetailMap = {};
