import 'package:flutter/widgets.dart';
import 'package:updown_app/app/controllers/controller.dart';
import 'package:updown_app/config/storage_keys.dart';
import 'package:nylo_framework/nylo_framework.dart';

class LocalStorageExampleController<T> extends Controller {
  construct(BuildContext context) {
    super.construct(context);
  }

  // 1 - Reading a collection
  Future<List<T>> readCollection() async {
    return await NyStorage.readCollection(StorageKey.collectionKeyExample);
  }

  // 2 - Adding an item to a collection
  Future<void> addCollectionItem(int productId) async {
    await NyStorage.addToCollection(
      StorageKey.collectionKeyExample,
      item: productId,
    ); // adds productId to the collection
  }

  // 3 - Saving/Updating collection data
  Future<void> saveCollectionData(List<int> itemsList) async {
    await NyStorage.saveCollection(
      StorageKey.collectionKeyExample,
      itemsList,
    ); // adds productId to the collection
  }

  // 4 - Deleting an item from the collection
  Future<void> deleteCollectionItem(int index) async {
    await NyStorage.deleteFromCollection(
      key: StorageKey.collectionKeyExample,
      index,
    );
  }
}
