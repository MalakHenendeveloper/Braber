import 'package:braber/data/model/Booking.dart';
import 'package:braber/data/model/User.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireStore {
  //User
  static CollectionReference<UserModel> createCollection() {
    return FirebaseFirestore.instance
        .collection('My User')
        .withConverter<UserModel>(
            fromFirestore: (snapshot, _) =>
                UserModel.fromjson(snapshot.data()!),
            toFirestore: (model, _) => model.tojson());
  }

  static Future<void> saveuser(UserModel user) async {
    return await createCollection().doc(user.id).set(user);
  }

  static Future<UserModel?> getuser(String userid) async {
    var document = await createCollection().doc(userid).get();
    return document.data();
  }

  //Booking
  static CollectionReference<Booking> createBooking() {
    return FirebaseFirestore.instance
        .collection('Booking')
        .withConverter<Booking>(
            fromFirestore: (snapshot, _) => Booking.fromjson(snapshot.data()!),
            toFirestore: (book, _) => book.tojson());
  }

  static Future<Booking> Bookbraber(Booking book) async {
    var docs = await createBooking().doc();
    book.id = docs.id;
    await docs.set(book);
    return book;
  }




  static Stream<QuerySnapshot<Booking>> getbooking() {
    return createBooking().snapshots();
  }
}
