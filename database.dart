import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseServices {
  static CollectionReference productCollection =
      Firestore.instance.collection('produk');

  static Future<void> createOrUppdateProduk(String id,
      {String name, int price}) async {
    await productCollection.document(id).setData({
      'nama' : name,
      'harga': price
    });
  }

  static Future<DocumentSnapshot> getProduk(String id) async{
    return await productCollection.document(id).get();
  }

  static Future<void> delateProduk(String id) async{
    await productCollection.document(id).delete();
  }
}
