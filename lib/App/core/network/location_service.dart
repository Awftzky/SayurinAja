import 'package:geolocator/geolocator.dart';
import 'package:sayurinaja/App/core/storage/local_storage.dart';

class LocationService {
  final LocalStorage _localStorage = LocalStorage();

  Future<Position?> getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return null;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return null;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return null;
    }

    try {
      return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
    } catch (e) {
      return null;
    }
  }

  Future<void> saveCurrentLocation() async {
    final position = await getCurrentLocation();
    if (position != null) {
      await _localStorage.saveLastKnownLocation(
          position.latitude, position.longitude);
    }
  }
}
