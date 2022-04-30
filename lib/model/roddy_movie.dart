import 'package:cloud_firestore/cloud_firestore.dart';
// firebase auth
// firestore data base to store :

/// Film description
/// FIlm title Film
/// '''' year
/// '''' category/genre
/// film director.
/// video quality, age rating, time rating
///  cast, genres, this movie is: opinion.
/// fire store storage category:
/// film url

// Gunning for revenge, outlaw Nat love saddles up with his gang to to take down enemy Rufus buck, a ruthless crime boss who just go sprung from prison
// crime movie, westerns, action and adventure, Dramas
// director; jeymes Samuel
// cast : Johnathan Majors, Idris Elba, Regina King, Zazie Beetz, Delroy Lindo, LaKeith Stanfield, Danielle Deadwyler, Edi Gathegi, Deon cole, Rj cyler, Damon wayans jr, juilio cesar cedillo, woody McClain
// writer: Boaz Yakin, jeymes Samuel
// restriction : this movie is: Provocative, Witty
//movieRating: 16+, violence, language,   Recommended for 16 and up

class RoddyMovies {
  final String? title;
  final String? description;
  final String? videoQuality;
  final String? url;
  final List<String>? director;
  final List<String>? writer;
  final List<String>? genres;
  final List<String>? cast;
  final List<String>? movieRating;
  final List<String>? restriction;
  final DateTime? timeStamp;

  RoddyMovies({
    this.title,
    this.description,
    this.videoQuality,
    this.url,
    this.director,
    this.writer,
    this.genres,
    this.cast,
    this.movieRating,
    this.restriction,
    this.timeStamp,
  });

  static RoddyMovies fromJson(Map<String, dynamic> json) {
    return RoddyMovies(
      title: json['title'],
      description: json['description'],
      videoQuality: json['videoQuality'],
      url: json['url'],
      director: json['director'],
      writer: json['writer'],
      genres: json[' genres'],
      cast: json['cast'],
      movieRating: json['movieRating'],
      restriction: json['restriction'],
      timeStamp: (json['timeStamp'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'videoQuality': videoQuality,
      'url': url,
      'director': director,
      'writer': writer,
      ' genres': genres,
      'cast': cast,
      'movieRating': movieRating,
      'restriction': restriction,
      'timeStamp': timeStamp,
    };
  }
}
