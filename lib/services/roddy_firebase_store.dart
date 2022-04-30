import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:roddy/model/roddy_movie.dart';
import 'package:roddy/model/roddy_user.dart';
import 'package:roddy/model/roddy_user_profiles.dart';

class RoddyDataBaseFunctions {
  static final FirebaseFirestore _firebaseFirestore =
      FirebaseFirestore.instance;

  Stream<List<RoddyUser>> getRoddyUsers() {
    return _firebaseFirestore.collection('').snapshots().map((snapshot) =>
        snapshot.docs.map((docs) => RoddyUser.fromJson(docs.data())).toList());
  }

  Stream<List<RoddyProfiles>> getRoddyUserProfiles() {
    return _firebaseFirestore.collection('').snapshots().map((snapshot) =>
        (snapshot)
            .docs
            .map((docs) => RoddyProfiles.fromJson(docs.data()))
            .toList());
  }

  Stream<List<RoddyMovies>> getListOfMovies() {
    return _firebaseFirestore.collection('').snapshots().map((snapshot) =>
        (snapshot)
            .docs
            .map((docs) => RoddyMovies.fromJson(docs.data()))
            .toList());
  }
}
