import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:sayurinaja/App/core/network/location_service.dart';

class LocationController extends GetxController {
  final Rx<Position?> location = Rx<Position?>(null);
  final RxString locationName = "Mencari lokasi...".obs; // State baru
  final RxBool isLoading = true.obs;

  final LocationService _locationService = LocationService();

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> fetchLocation() async {
    isLoading.value = true;

    final fetchedPosition = await _locationService.getCurrentLocation();

    if (fetchedPosition != null) {
      locationName.value =
          await _locationService.getAddressFromCoordinates(fetchedPosition);
    } else {
      locationName.value = "Lokasi Tidak di Izinkan";
    }

    isLoading.value = false;
  }
}
