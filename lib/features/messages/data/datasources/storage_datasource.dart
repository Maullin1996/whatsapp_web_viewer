import 'package:firebase_storage/firebase_storage.dart';

class StorageDatasource {
  final FirebaseStorage _storage;

  const StorageDatasource(this._storage);

  String getDownloadUrl(String storagePath) {
    final bucket = _storage.bucket;
    final encodedPath = Uri.encodeComponent(storagePath);

    return 'https://firebasestorage.googleapis.com/v0/b/$bucket/o/$encodedPath?alt=media';
  }
}
