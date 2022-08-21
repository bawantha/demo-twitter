import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glints_twiter_firebase/glints_twiter_firebase.dart';
import 'package:glints_twitter/tweet/cubit/tweet_cubit.dart';
import 'package:glints_twitter/utills/glints_twitter_theme.dart';
import 'package:glints_twitter/widgets/glints_twitter_button.dart';

class SelectedTweetActionWidget extends StatefulWidget {
  const SelectedTweetActionWidget({
    super.key,
    this.tweet,
  });

  final TweetsRecord? tweet;

  @override
  _SelectedTweetActionWidgetState createState() =>
      _SelectedTweetActionWidgetState();
}

class _SelectedTweetActionWidgetState extends State<SelectedTweetActionWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 270,
      decoration: BoxDecoration(
        color: GlintsTwitterTheme.of(context).secondaryBackground,
        boxShadow: const [
          BoxShadow(
            blurRadius: 5,
            color: Color(0x3B1D2429),
            offset: Offset(0, -3),
          )
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
        child: Column(
          children: [
            GTButtonWidget(
              onPressed: () async {
                await context
                    .read<TweetCubit>()
                    .enableTweetEditMode(widget.tweet!)
                    .then((value) => Navigator.pop(context));
              },
              text: 'Edit Tweet',
              options: GTButtonOptions(
                width: double.infinity,
                height: 60,
                color: GlintsTwitterTheme.of(context).primaryColor,
                textStyle: GlintsTwitterTheme.of(context).subtitle2.override(
                      fontFamily:
                          GlintsTwitterTheme.of(context).subtitle2Family,
                      color: GlintsTwitterTheme.of(context).primaryBtnText,
                    ),
                borderSide: const BorderSide(
                  color: Colors.transparent,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
              child: GTButtonWidget(
                onPressed: () async {
                  Navigator.pop(context);
                  final confirmDialogResponse = await showDialog<bool>(
                        context: context,
                        builder: (alertDialogContext) {
                          return AlertDialog(
                            title: const Text('Are you sure'),
                            content:
                                const Text('You can not see this tweet again '),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext, false),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext, true),
                                child: const Text('Confirm'),
                              ),
                            ],
                          );
                        },
                      ) ??
                      false;
                  if (confirmDialogResponse) {
                    await widget.tweet!.reference.delete();
                    return;
                  } else {
                    Navigator.pop(context);
                    return;
                  }
                },
                text: 'Delete Tweet',
                options: GTButtonOptions(
                  width: double.infinity,
                  height: 60,
                  color: GlintsTwitterTheme.of(context).alternate,
                  textStyle: GlintsTwitterTheme.of(context).subtitle2.override(
                        fontFamily:
                            GlintsTwitterTheme.of(context).subtitle2Family,
                        color: GlintsTwitterTheme.of(context).primaryBtnText,
                      ),
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
              child: GTButtonWidget(
                onPressed: () async {
                  Navigator.pop(context);
                },
                text: 'Cancel',
                options: GTButtonOptions(
                  width: double.infinity,
                  height: 60,
                  color: GlintsTwitterTheme.of(context).secondaryBackground,
                  textStyle: GlintsTwitterTheme.of(context).subtitle2.override(
                        fontFamily: 'Lexend Deca',
                        color: GlintsTwitterTheme.of(context).secondaryText,
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
