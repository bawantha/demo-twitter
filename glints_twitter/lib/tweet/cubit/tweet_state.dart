part of 'tweet_cubit.dart';

enum TweetAddModal {
  open,
  close,
}

enum TweetPublishStatus {
  initial,
  publishing,
  published,
  publishError,
}

class TweetState extends Equatable {
  const TweetState({
    this.tweetAddModal = TweetAddModal.close,
    this.newTweet = '',
    this.tweetCharacterCount = 280,
    this.tweetPublishStatus = TweetPublishStatus.initial,
    this.editingTweet = '',
  });

  final TweetAddModal tweetAddModal;
  final String newTweet;
  final String editingTweet;
  final int tweetCharacterCount;
  final TweetPublishStatus tweetPublishStatus;

  @override
  List<Object?> get props =>
      [tweetAddModal, newTweet, tweetCharacterCount, editingTweet];

  TweetState copyWith({
    TweetAddModal? tweetAddModal,
    String? newTweet,
    int? tweetCharacterCount,
    TweetPublishStatus? tweetPublishStatus,
    String? editingTweet,
  }) {
    return TweetState(
      tweetAddModal: tweetAddModal ?? this.tweetAddModal,
      newTweet: newTweet ?? this.newTweet,
      tweetCharacterCount: tweetCharacterCount ?? this.tweetCharacterCount,
      tweetPublishStatus: tweetPublishStatus ?? this.tweetPublishStatus,
      editingTweet: editingTweet ?? this.editingTweet,
    );
  }
}
