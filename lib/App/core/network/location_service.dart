import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
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
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
        ),
      );
    } catch (e) {
      return null;
    }
  }

  Future<String> getAddressFromCoordinates(Position position) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        final Placemark place = placemarks.first;

        String city = place.locality ?? place.subAdministrativeArea ?? "";
        String province = place.administrativeArea ?? "";

        if (city.isNotEmpty && province.isNotEmpty) {
          return "$city, $province";
        } else if (city.isNotEmpty) {
          return city;
        } else if (province.isNotEmpty) {
          return province;
        } else {
          return place.country ?? "Lokasi tidak diketahui";
        }
      } else {
        return "Alamat tidak ditemukan";
      }
    } catch (e) {
      return "Gagal mendapatkan alamat";
    }
  }

  Future<void> saveCurrentLocation() async {
    try {
      final position = await getCurrentLocation();
      if (position != null) {
        await _localStorage.saveLastKnownLocation(
            position.latitude, position.longitude);
      }
    // ignore: empty_catches
    } catch (e) {
      
    }
  }
}
