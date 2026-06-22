// Mobile/desktop implementation using the normal image_picker package.
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';

Future<Uint8List?> pickImageBytes() async {
  final picker = ImagePicker();
  final XFile? picked = await picker.pickImage(
    source: ImageSource.gallery,
    maxWidth: 600,
    maxHeight: 600,
    imageQuality: 70,
  );

  if (picked == null) return null;
  return await picked.readAsBytes();
}
