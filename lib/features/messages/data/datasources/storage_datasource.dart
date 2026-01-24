import 'package:firebase_storage/firebase_storage.dart';

class StorageDatasource {
  final FirebaseStorage _storage;

  const StorageDatasource(this._storage);

  Future<String> getDownloadUrl(String storagePath) {
    return _storage.ref(storagePath).getDownloadURL();
  }
}
