import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:insurance_boost/src/features/core/models/package.dart';

class PackageApi {
  final CollectionReference mypackages =
      FirebaseFirestore.instance.collection('my_package');

  // when users modify their info again

  static Future<Package> getDetailByID(String pid) async {
    String id;
    String detail;
    double price;
    String category;
    int point;
    String code;

    try {
      DocumentSnapshot doc =
          await FirebaseFirestore.instance.collection('package').doc(pid).get();
      id = pid;
      detail = doc.get('detail');
      price = doc.get('price');
      category = doc.get('category');
      point = doc.get('point');
      code = doc.get('code');
      return Package(id, detail, price, category, point, code);
    } catch (e) {
      // Handle any potential errors here, e.g., print an error message
      print('Error fetching package details: $e');
      return Package('', '', 0, '', 0, '');
    }
  }

  Future buyPackage(DateTime date, String id, String code, int point,
      String detail, String category, int price) {
    return mypackages.add({
      'id': id,
      'code': code,
      'point': point,
      'detail': detail,
      'category': category,
      'price': price,
      'date': date,
    });
  }
}
