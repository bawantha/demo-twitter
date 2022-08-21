import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:glints_twiter_firebase/glints_twiter_firebase.dart';
import 'package:glints_twitter/app/app.dart';
import 'package:meta/meta.dart';

part 'tweet_state.dart';

class TweetCubit extends Cubit<TweetState> {
  TweetCubit(
    this._glintsFirebase,
  ) : super(const TweetState());
  final GlintsTwitterFirebase _glintsFirebase;

  /// create reference of AppBloc

  void onTweeting(String text) {
    emit(
      state.copyWith(
        newTweet: text,
        tweetCharacterCount: 280 - text.length,
      ),
    );
  }

  void onTweetingChanged(String text) {
    emit(
      state.copyWith(
        editingTweet: text,
      ),
    );
  }

  /// Stream List of Tweets
  Stream<List<TweetsRecord>> get tweets => _glintsFirebase.queryTweetsRecord(
        queryBuilder: (tweetsRecord) =>
            tweetsRecord.orderBy('created_date', descending: true),
      );

  Future<void> publishTweet(
    DocumentReference user,
    String email,
  ) async {
    emit(
      state.copyWith(
        tweetPublishStatus: TweetPublishStatus.publishing,
      ),
    );
    try {
      final tweetsCreateData = createTweetsRecordData(
        content: state.newTweet,
        createdDate: DateTime.now(),
        owner: user,
        ownerEmail: email,
      );
      await TweetsRecord.collection.doc().set(tweetsCreateData);
      emit(
        state.copyWith(
          tweetPublishStatus: TweetPublishStatus.published,
          newTweet: ""
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          tweetPublishStatus: TweetPublishStatus.publishError,
        ),
      );
    }
  }

  Future<void> updateTweet(TweetsRecord tweetsRecord) async {
    emit(
      state.copyWith(
        tweetPublishStatus: TweetPublishStatus.publishing,
      ),
    );
    try {
      final tweetsUpdateData = createTweetsRecordData(
          content: state.editingTweet,
          createdDate: DateTime.now(),
          isEditing: false);
      await tweetsRecord.reference.update(tweetsUpdateData);
      emit(
        state.copyWith(
          tweetPublishStatus: TweetPublishStatus.published,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          tweetPublishStatus: TweetPublishStatus.publishError,
        ),
      );
    }
  }

  Future<void> enableTweetEditMode(TweetsRecord tweetsRecord) async {
    emit(state.copyWith(editingTweet: tweetsRecord.content),);
    final tweetsUpdateData = createTweetsRecordData(
      isEditing: true,

    );
    await tweetsRecord.reference.update(tweetsUpdateData);
  }

  Future<void> disableTweetEditMode(TweetsRecord tweetsRecord) async {
    final tweetsUpdateData = createTweetsRecordData(
      isEditing: false,
    );
    await tweetsRecord.reference.update(tweetsUpdateData);
  }

  Future<void> deleteTweet(TweetsRecord tweetsRecord) async {
    await tweetsRecord.reference.delete();
  }
}
