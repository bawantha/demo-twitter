import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:glints_twitter/app/app.dart';
import 'package:glints_twitter/tweet/cubit/tweet_cubit.dart';
import 'package:glints_twitter/utills/glints_twitter_theme.dart';
import 'package:glints_twitter/widgets/widgets.dart';

class TweetActionWidget extends StatefulWidget {
  const TweetActionWidget({super.key});

  @override
  _TweetActionWIdgetWidgetState createState() =>
      _TweetActionWIdgetWidgetState();
}

class _TweetActionWIdgetWidgetState extends State<TweetActionWidget> {
  TextEditingController? tweetSectionController;

  @override
  void initState() {
    super.initState();
    tweetSectionController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 5,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Container(
        width: double.infinity,
        height: 370,
        decoration: BoxDecoration(
          color: GlintsTwitterTheme.of(context).secondaryBackground,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                    child: Container(
                      width: 50,
                      height: 4,
                      decoration: BoxDecoration(
                        color: GlintsTwitterTheme.of(context).lineColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 0, 0),
                child: Text(
                  'Create  a Tweet',
                  style: GlintsTwitterTheme.of(context).title2,
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 10, 0, 0),
                child: BlocBuilder<TweetCubit, TweetState>(
                  builder: (context, state) {
                    // ignore: lines_longer_than_80_chars
                    return Text(
                      '${context.read<TweetCubit>().state.tweetCharacterCount} Words',
                      style: GlintsTwitterTheme.of(context).bodyText1.override(
                            fontFamily:
                                GlintsTwitterTheme.of(context).bodyText1Family,
                            fontWeight: FontWeight.w100,
                          ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                child: BlocBuilder<TweetCubit, TweetState>(
                  builder: (context, state) {
                    return TextFormField(
                      maxLength: 280,
                      onChanged: context.read<TweetCubit>().onTweeting,
                      decoration: InputDecoration(
                        hintText: 'Write some tweets.....',
                        hintStyle: GlintsTwitterTheme.of(context).bodyText2,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: GlintsTwitterTheme.of(context)
                                .primaryBackground,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: GlintsTwitterTheme.of(context)
                                .primaryBackground,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        contentPadding: const EdgeInsetsDirectional.fromSTEB(
                            20, 32, 20, 12),
                      ),
                      style: GlintsTwitterTheme.of(context).bodyText1,
                      textAlign: TextAlign.start,
                      maxLines: 6,
                      keyboardType: TextInputType.multiline,
                    );
                  },
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 24, 0, 44),
                    child: GTButtonWidget(
                      onPressed: () {
                        context.read<TweetCubit>().publishTweet(
                              context
                                  .read<AppBloc>()
                                  .state
                                  .currentUserReference!,
                              context.read<AppBloc>().state.currentUserEmail!,
                            );
                        Navigator.pop(context);
                      },
                      text: 'Publish Tweet',
                      icon: const FaIcon(
                        FontAwesomeIcons.solidPaperPlane,
                      ),
                      options: GTButtonOptions(
                        width: 270,
                        height: 50,
                        color: GlintsTwitterTheme.of(context).primaryColor,
                        textStyle:
                            GlintsTwitterTheme.of(context).subtitle1.override(
                                  fontFamily: GlintsTwitterTheme.of(context)
                                      .subtitle1Family,
                                  color: Colors.white,
                                ),
                        elevation: 3,
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
