import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sayurinaja/App/core/network/location_service.dart';
import 'package:sayurinaja/App/core/storage/local_storage.dart';
import 'package:sayurinaja/App/routes/app_pages.dart';
import 'package:sayurinaja/App/shared/animation/tutorial/tutorial_service.dart';
import 'package:sayurinaja/App/shared/models/caterogy/offer_caterogy_model.dart';
import 'package:geolocator/geolocator.dart';

class HomeController extends GetxController {
  // Dependency
  final LocationService _locationService = LocationService();
  final LocalStorage _localStorage = LocalStorage();
  late final TutorialService tutorialService;

  // Header State
  final username = "".obs;
  final Rx<Position?> location = Rx<Position?>(null);
  final locationName = "Mencari lokasi...".obs;

  // Offer State
  final offerCategories = <OfferCategoryModel>[].obs;
  final offerCurrentPage = 0.obs;
  late final PageController offerPageController;

  // Shop State
  final shops = <String>["Toko A", "Toko B", "Toko C"].obs;

  // ========== TUTORIAL KEYS ==========
  // ✅ FIXED: Add all necessary keys
  final GlobalKey usernameKey = GlobalKey();
  final GlobalKey locationKey = GlobalKey();
  final GlobalKey profilePhotoKey = GlobalKey();
  final GlobalKey searchBarKey = GlobalKey();
  final GlobalKey offerKey = GlobalKey();
  final GlobalKey tokoPetaniKey = GlobalKey();
  final GlobalKey categoryKey = GlobalKey();
  final GlobalKey navBarKey = GlobalKey();

  // ========== OTHER CONTROLLERS ==========
  late final TextEditingController searchController;

  // ========== LOADING STATE ==========
  final isLoadingLocation = true.obs;
  final isLoadingUsername = true.obs;
  final isTutorialShown = false.obs;
  final isTutorialCompleted = false.obs; // ✅ Track completion

  @override
  void onInit() {
    super.onInit();
    _initializeControllers();
    _loadInitialData();
    _checkTutorialStatus(); // ✅ Check if tutorial already shown
  }

  @override
  void onClose() {
    _disposeControllers();
    super.onClose();
  }

  // ========== INITIALIZATION ==========
  void _initializeControllers() {
    searchController = TextEditingController();
    offerPageController = PageController();
    tutorialService = TutorialService();
    _loadOfferCategories();
  }

  void _disposeControllers() {
    searchController.dispose();
    offerPageController.dispose();
  }

  // ========== DATA LOADING ==========
  Future<void> _loadInitialData() async {
    await Future.wait([
      _loadUsername(),
      _loadLocation(),
    ]);
  }

  Future<void> _loadUsername() async {
    try {
      isLoadingUsername.value = true;
      final storedUsername = await _localStorage.getUsername();
      username.value = storedUsername ?? "Pengguna";
    } catch (e) {
      debugPrint('Error loading username: $e');
      username.value = "Pengguna";
    } finally {
      isLoadingUsername.value = false;
    }
  }

  Future<void> _loadLocation() async {
    try {
      isLoadingLocation.value = true;
      final position = await _locationService.getCurrentLocation();

      if (position != null) {
        location.value = position;
        final address =
            await _locationService.getAddressFromCoordinates(position);
        locationName.value = address;
      } else {
        locationName.value = "Lokasi tidak ditemukan";
      }
    } catch (e) {
      debugPrint('Error loading location: $e');
      locationName.value = "Gagal mengambil lokasi";
    } finally {
      isLoadingLocation.value = false;
    }
  }

  void _loadOfferCategories() {
    offerCategories.value = [
      OfferCategoryModel(
        discountText: "Diskon 5%",
        categoryText: "Daging di semua toko lagi ada Diskon nih",
        descriptionText:
            "Buruan di ambil guys sebelum waktunya habis ya, WAJIB!!",
        imagePath: "assets/images/discountmeat.png",
      ),
      OfferCategoryModel(
        discountText: "Diskon 3%",
        categoryText: "Buah di semua toko lagi ada Diskon nih",
        descriptionText:
            "Buruan di ambil guys sebelum waktunya habis ya, WAJIB!!",
        imagePath: "assets/images/discountfruit.png",
      ),
      OfferCategoryModel(
        discountText: "Diskon 2.5%",
        categoryText: "Sayuran di semua toko lagi ada Diskon nih",
        descriptionText:
            "Buruan di ambil guys sebelum waktunya habis ya, WAJIB!!",
        imagePath: "assets/images/discountvegetable.png",
      ),
    ];
  }

  // ========== TUTORIAL FEATURE ==========

  /// ✅ Check if tutorial already shown
  Future<void> _checkTutorialStatus() async {
    try {
      final isCompleted = await _localStorage.getTutorialCompleted();
      isTutorialCompleted.value = isCompleted ?? false;
      debugPrint('📚 Tutorial completed status: $isTutorialCompleted');
    } catch (e) {
      debugPrint('Error checking tutorial status: $e');
      isTutorialCompleted.value = false;
    }
  }

  /// ✅ Start tutorial with proper checks
  void startTutorial(BuildContext context) {
    // Skip if already shown in this session
    if (isTutorialShown.value) {
      debugPrint('📚 Tutorial already shown in this session');
      return;
    }

    // Skip if completed before
    if (isTutorialCompleted.value) {
      debugPrint('📚 Tutorial already completed');
      return;
    }

    // Wait for keys to be ready
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Add delay to ensure all widgets are built
      Future.delayed(const Duration(milliseconds: 500), () {
        if (_areKeysValid()) {
          _setupTutorialTargets();
          tutorialService.showIntro(
            context,
            onStart: () {
              isTutorialShown.value = true;
            },
            onSkip: () {}, // SKIP
          );
        } else {
          debugPrint('⚠️ Tutorial keys not ready yet');
          _logKeyStatus();
        }
      });
    });
  }

  /// ✅ Validate all keys are attached
  bool _areKeysValid() {
    return usernameKey.currentContext != null &&
        locationKey.currentContext != null &&
        profilePhotoKey.currentContext != null &&
        searchBarKey.currentContext != null &&
        tokoPetaniKey.currentContext != null &&
        categoryKey.currentContext != null;
  }

  /// ✅ Log key status for debugging
  void _logKeyStatus() {
    debugPrint('🔑 Key Status:');
    debugPrint('  - usernameKey: ${usernameKey.currentContext != null}');
    debugPrint('  - locationKey: ${locationKey.currentContext != null}');
    debugPrint(
        '  - profilePhotoKey: ${profilePhotoKey.currentContext != null}');
    debugPrint('  - searchBarKey: ${searchBarKey.currentContext != null}');
    debugPrint('  - tokoPetaniKey: ${tokoPetaniKey.currentContext != null}');
    debugPrint('  - categoryKey: ${categoryKey.currentContext != null}');
  }

  /// ✅ Setup tutorial targets with correct keys
  void _setupTutorialTargets() {
    tutorialService.clearTargets();

    // 1. Username
    tutorialService.addTarget(
      key: usernameKey,
      description:
          "Ini adalah nama kamu di halaman utama dan bisa kamu ubah melalui pengaturan",
      align: ContentAlign.bottom,
    );

    // 2. Location
    tutorialService.addTarget(
      key: locationKey,
      description:
          "Ini lokasi kamu berada saat ini, kalau mau diubah bisa kok lewat pengaturan tapi saat ini masih dalam tahap pengembangan",
      align: ContentAlign.bottom,
    );

    // 3. Profile Photo
    tutorialService.addTarget(
      key: profilePhotoKey,
      description:
          "Ini foto profil kamu, bisa diubah kok lewat pengaturan dan bisa di klik gambarnya biar langsung ke pengaturan",
      align: ContentAlign.bottom,
    );

    // 4. Search Bar
    tutorialService.addTarget(
      key: searchBarKey,
      description:
          "Ini adalah kolom pencarian dimana kamu bisa mencari apapun yang kamu butuhkan di sayurinaja!",
      align: ContentAlign.bottom,
    );

    // 5. Toko Petani
    tutorialService.addTarget(
      key: tokoPetaniKey,
      description:
          "Ini adalah kolom toko petani, dimana kamu bisa melihat dan mencari toko yang terbaik menurutmu",
      align: ContentAlign.top,
    );

    // 6. Category
    tutorialService.addTarget(
      key: categoryKey,
      description:
          "Kolom ini terdapat 3 kategori bahan makanan, kamu bisa memilih yang kamu inginkan dengan mengkliknya saja",
      align: ContentAlign.top,
    );
  }

  /// ✅ Called when tutorial completes
  Future<void> onTutorialComplete() async {
    try {
      await _localStorage.setTutorialCompleted(true);
      isTutorialCompleted.value = true;
      debugPrint('✅ Tutorial marked as completed');
    } catch (e) {
      debugPrint('❌ Error saving tutorial completion: $e');
    }
  }

  /// ✅ Reset tutorial (for testing)
  Future<void> resetTutorial() async {
    try {
      await _localStorage.setTutorialCompleted(false);
      isTutorialCompleted.value = false;
      isTutorialShown.value = false;
      debugPrint('🔄 Tutorial reset');
    } catch (e) {
      debugPrint('❌ Error resetting tutorial: $e');
    }
  }

  // ========== OTHER ACTIONS ==========
  void updateOfferPage(int index) {
    offerCurrentPage.value = index;
  }

  void onOfferTap(int index) {
    debugPrint('Offer tapped: $index');
  }

  void onSearchChanged(String query) {
    debugPrint('Search query: $query');
  }

  void onSearchSubmitted(String query) {
    debugPrint('Search submitted: $query');
  }

  void onCategoryTap() {
    Get.toNamed(Routes.COMINGSOON);
  }

  Future<void> refreshData() async {
    await Future.wait([
      _loadUsername(),
      _loadLocation(),
    ]);
  }
}
