import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shimmer/shimmer.dart';
import '../src/app_export.dart';

class Utils {
  Utils._();

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

  //   method to get Images by specific size
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
}