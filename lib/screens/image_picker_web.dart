// Web-only implementation. Bypasses image_picker_for_web's internal
// blob-URL resizing, which is the source of the
// "Could not load Blob from its URL. Has it been revoked?" error.
import 'dart:async';
import 'dart:html' as html;
import 'dart:typed_data';

Future<Uint8List?> pickImageBytes() async {
  final completer = Completer<Uint8List?>();

  final input = html.FileUploadInputElement();
  input.accept = 'image/*';
  input.click();

  input.onChange.listen((event) {
    final files = input.files;
    if (files == null || files.isEmpty) {
      completer.complete(null);
      return;
    }

    final file = files[0];
    final reader = html.FileReader();

    reader.onLoadEnd.listen((event) {
      final result = reader.result;
      if (result is Uint8List) {
        completer.complete(result);
      } else if (result is ByteBuffer) {
        completer.complete(result.asUint8List());
      } else {
        completer.complete(null);
      }
    });

    reader.onError.listen((event) {
      completer.complete(null);
    });

    reader.readAsArrayBuffer(file);
  });

  return completer.future;
}
