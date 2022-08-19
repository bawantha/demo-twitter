import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'tweet_state.dart';

class TweetCubit extends Cubit<TweetState> {
  TweetCubit() : super(TweetInitial());
}
