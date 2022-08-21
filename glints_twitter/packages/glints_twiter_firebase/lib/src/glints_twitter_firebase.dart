
import 'package:glints_twiter_firebase/src/models/models.dart';

class GlintsTwitterFirebase {
  /// Functions to query TweetsRecords (as a Stream and as a Future).
  Stream<List<TweetsRecord>> queryTweetsRecord({
    Query Function(Query)? queryBuilder,
    int limit = -1,
    bool singleRecord = false,
  }) =>
      _queryCollection(
        TweetsRecord.collection,
        TweetsRecord.serializer,
        queryBuilder: queryBuilder,
        limit: limit,
        singleRecord: singleRecord,
      );

  Stream<List<T>> _queryCollection<T>(
      Query collection, Serializer<T> serializer,
      {Query Function(Query)? queryBuilder,
      int limit = -1,
      bool singleRecord = false}) {
    final builder = queryBuilder ?? (q) => q;
    var query = builder(collection);
    if (limit > 0 || singleRecord) {
      query = query.limit(singleRecord ? 1 : limit);
    }
    return query.snapshots().handleError((err) {
      throw QueryErrorException('Error querying collection: $err');
    }).map(
      (s) => s.docs
          .map(
            (d) => safeGet(
              () => serializers.deserializeWith(serializer, serializedData(d)),
              (e) => throw DeserializationErrorException('Error serializing doc ${d.reference.path}:\n$e'),
            ),
          )
          .where((d) => d != null)
          .map((d) => d!)
          .toList(),
    );
  }





}





class QueryErrorException implements Exception {
  QueryErrorException(this.message);
  final String message;
}

class DeserializationErrorException implements Exception {
  DeserializationErrorException(this.message);
  final String message;
}