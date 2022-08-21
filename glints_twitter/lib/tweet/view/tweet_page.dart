import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:glints_twiter_firebase/glints_twiter_firebase.dart';
import 'package:glints_twitter/app/app.dart';
import 'package:glints_twitter/login/cubit/login_cubit.dart';
import 'package:glints_twitter/tweet/cubit/tweet_cubit.dart';
import 'package:glints_twitter/tweet/widgets/tweet_action_widget.dart';
import 'package:glints_twitter/utills/glints_twitter_theme.dart';
import 'package:intl/intl.dart';

import '../widgets/selected_tweet_action_widget.dart';

class TweetPage extends StatelessWidget {
  const TweetPage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: TweetPage());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TweetCubit(
        GlintsTwitterFirebase(),
      ),
      child: const TweetView(),
    );
  }
}

class TweetView extends StatelessWidget {
  const TweetView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: GlintsTwitterTheme.of(context).primaryBackground,
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              context: context,
              builder: (_) {
                return Padding(
                  padding: MediaQuery.of(context).viewInsets,
                  child: BlocProvider.value(
                    value: BlocProvider.of<TweetCubit>(context),
                    child: const TweetActionWidget(),
                  ),
                );
              },
            );
          },
          backgroundColor: GlintsTwitterTheme.of(context).primaryColor,
          elevation: 8,
          child: FaIcon(
            FontAwesomeIcons.featherAlt,
            color: GlintsTwitterTheme.of(context).primaryBtnText,
            size: 24,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      /// Sign out
                      onTap: context.read<GlintsTwitterAuth>().signOut,
                      child: const Icon(
                        Icons.exit_to_app_sharp,
                        color: Colors.black,
                        size: 24,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.9,
                decoration: const BoxDecoration(),
                child: StreamBuilder<List<TweetsRecord>>(
                  stream: context.read<TweetCubit>().tweets,
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: SpinKitCircle(
                            color: GlintsTwitterTheme.of(context).primaryColor,
                          ),
                        ),
                      );
                    }
                    final listViewTweetsRecordList = snapshot.data!;
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: listViewTweetsRecordList.length,
                      itemBuilder: (context, listViewIndex) {
                        final listViewTweetsRecord =
                            listViewTweetsRecordList[listViewIndex];
                        return TweetCard(
                          tweetsRecord: listViewTweetsRecord,
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TweetCard extends StatefulWidget {
  const TweetCard({Key? key, required this.tweetsRecord}) : super(key: key);

  final TweetsRecord tweetsRecord;

  @override
  State<TweetCard> createState() => _TweetCardState();
}

class _TweetCardState extends State<TweetCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
      child: Container(
        width: 100,
        height: 220,
        decoration: BoxDecoration(),
        child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          color: Color(0xFFF5F5F5),
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: BlocBuilder<TweetCubit, TweetState>(
            builder: (context, state) {
              return Stack(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                        child: TextFormField(
                          key: ValueKey(widget.tweetsRecord),
                          initialValue: widget.tweetsRecord.content,
                          onChanged:
                              context.read<TweetCubit>().onTweetingChanged,
                          readOnly: widget.tweetsRecord.isEditing == false,
                          decoration: InputDecoration(
                            hintStyle: GlintsTwitterTheme.of(context).bodyText2,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                          style:
                              GlintsTwitterTheme.of(context).bodyText1.override(
                                    fontFamily: GlintsTwitterTheme.of(context)
                                        .bodyText1Family,
                                    fontSize: 20,
                                  ),
                          maxLines: 6,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              dateTimeFormat('M/d h:mm a',
                                  widget.tweetsRecord.createdDate!),
                              style: GlintsTwitterTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: GlintsTwitterTheme.of(context)
                                        .bodyText1Family,
                                    fontWeight: FontWeight.w200,
                                  ),
                            ),
                            Text(
                              widget.tweetsRecord.ownerEmail!,
                              style: GlintsTwitterTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: GlintsTwitterTheme.of(context)
                                        .bodyText1Family,
                                    fontWeight: FontWeight.w300,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  if (widget.tweetsRecord.isEditing == true)
                    Align(
                      alignment: AlignmentDirectional(0.74, -0.91),
                      child: InkWell(
                        onTap: () => context
                            .read<TweetCubit>()
                            .updateTweet(widget.tweetsRecord),
                        child: const Icon(
                          Icons.done,
                          color: Color(0xFF006D77),
                          size: 24,
                        ),
                      ),
                    ),
                  if (widget.tweetsRecord.owner ==
                      context.read<AppBloc>().state.currentUserReference)
                    Align(
                      alignment: const AlignmentDirectional(0.93, -0.91),
                      child: InkWell(
                        onTap: () async {
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (_) {
                              return Padding(
                                padding: MediaQuery.of(context).viewInsets,
                                child: BlocProvider.value(
                                  value:  BlocProvider.of<TweetCubit>(context),
                                  child: SelectedTweetActionWidget(
                                    tweet: widget.tweetsRecord,
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Icon(
                          Icons.settings_outlined,
                          color: GlintsTwitterTheme.of(context).primaryColor,
                          size: 24,
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  String dateTimeFormat(String format, DateTime? dateTime) {
    if (dateTime == null) {
      return '';
    }
    return DateFormat(format).format(dateTime);
  }
}
