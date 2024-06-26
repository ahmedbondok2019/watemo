import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shimmer/shimmer.dart';
import '../../features/home/data/models/hajj_model.dart';
import '../../features/services/data/models/services/services_model.dart';
import '../src/app_export.dart';

class Utils {
  Utils._();

  /// get Image
  static Future<XFile?> getImage(bool isCamera) async {
    final ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(
        source: isCamera ? ImageSource.camera : ImageSource.gallery);
    if (image != null) {
      File imageFile = File(image.path);
      return await compressAndGetFile(imageFile);
    }
    return null;
  }

  /// get video
  static Future<File?> getVideo() async {
    final ImagePicker picker = ImagePicker();
    XFile? video = await picker.pickVideo(
        source: ImageSource.camera);
    if (video != null) {
      File videoFile = File(video.path);
      return videoFile;
    }
    return null;
  }

  /// compress And Get File
  static Future<XFile?> compressAndGetFile(File file) async {
    String dir = (await getApplicationDocumentsDirectory()).path;
    num size = file.lengthSync() / 2048;
    print("===============================> size ${file.lengthSync()} $size");
    var result = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      "$dir/${file.path.split("/").last}",
      quality: 60,
      rotate: 360,
    );
    return result;
  }

  /// put Shimmer
  static Shimmer putShimmer({double? width, double? height}) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.white,
      child: Container(
        width: width,
        height: height,
        color: Colors.grey.shade300,
      ),
    );
  }

  /// method to get Images by specific size
  static Future<Uint8List> getBytesFromAsset(String path,
      {required int width, required int height}) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width, targetHeight: height);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  static String calculateAddService(List<ServicesModel> selectServicesList){
    double total = 0.0;
    for (var element in selectServicesList) {
      total += double.parse(element.price.toString()) * element.counter;
    }
    return total.toString();
  }
  static String calculateTotalService(HajjModel? hajj,ServicesModel? services){
    double total = 0.0;
    if(hajj != null){
      total += double.parse(hajj.price.toString()) * 1;
    }
    else{
      total += double.parse(services!.price.toString()) * services.counter;
    }
    return total.toString();
  }
  static String calculateTotal({required List<ServicesModel> selectServices,
      ServicesModel? service, HajjModel? hajj}){
    double total = 0.0;
    if(hajj != null){
      total += double.parse(hajj.price.toString());
    }
    if(service != null){
      total += double.parse(service.price.toString()) * service.counter;
    }

    for (var element in selectServices) {
      total += double.parse(element.price.toString()) * element.counter;
    }
    return total.toString();
  }

  /// <<< check Location Enabled --->>>
  static Future<bool> checkLocationEnabled() async {
    bool serviceEnabled;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (serviceEnabled) {
      return true;
    }
    return false;
  }

  /// <<< check Location Permission --->>>
  static Future<bool> checkLocationPermission() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return false;
    }
    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse ||
        permission == LocationPermission.unableToDetermine) {
      return true;
    }
    return false;
  }
}