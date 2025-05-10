import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thrive_client/features/game/domain/entities/choice_entity.dart';
import 'package:thrive_client/features/game/domain/entities/game_entity.dart';
import 'package:thrive_client/features/game/presentation/bloc/game_cubit.dart';
import 'package:thrive_client/features/game/presentation/bloc/game_state.dart';
import 'package:thrive_client/features/game/presentation/widgets/skeletons/game_skeleton.dart';
import 'package:typewritertext/typewritertext.dart';

class GameView extends StatefulWidget {
  const GameView({super.key, required this.game});

  final GameEntity game;

  @override
  State<GameView> createState() => _GameViewState();
}

class _GameViewState extends State<GameView> {
  bool _isMuted = false;

  // @override
  // void initState() {
  //   super.initState();
  //   _initAudio();
  // }

  // Future<void> _initAudio() async {
  //   _audioPlayer = AudioPlayer();
  //   try {
  //     await _audioPlayer.play(AssetSource('audio/background_music.mp3'));
  //     await _audioPlayer.setReleaseMode(ReleaseMode.loop);
  //     await _audioPlayer.setVolume(0.5);
  //   } catch (e) {
  //     debugPrint('Error loading audio: $e');
  //   }
  // }

  void toggleMute() {
    setState(() {
      _isMuted = !_isMuted;
    });
  }

  void onTapDecision(ChoiceEntity decision) {
    context.read<GameCubit>().makeDecision(decision);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: BlocBuilder(
          bloc: context.read<GameCubit>(),
          builder: (BuildContext context, GameState state) {
            if (state is GameLoading) {
              return const GameSkeleton();
            } else if (state is GameError) {
              return Center(
                child: Text(
                  (state).message,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              );
            } else if (state is GameLoaded || state is GameInitial) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: TypeWriter.text(
                          key: ValueKey(state.game!.currentPlot.title),
                          state.game!.currentPlot.title,
                          style: Theme.of(context).textTheme.titleSmall,
                          textAlign: TextAlign.left,
                          duration: const Duration(milliseconds: 100),
                        ),
                      ),
                      IconButton(
                        icon: Icon(_isMuted ? Icons.volume_off : Icons.volume_up),
                        onPressed: toggleMute,
                        tooltip: _isMuted ? 'Unmute' : 'Mute',
                      ),
                      IconButton(
                        icon: const Icon(Icons.turn_left),
                        onPressed: () {
                          context.read<GameCubit>().goBack();
                        },
                        tooltip: 'Go back',
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: Stack(
                      children: [
                        Image.asset(
                          "assets/images/starry_night.jpg",
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.fromLTRB(8, 48, 8, 8),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                stops: const [0.6, 1],
                                colors: [
                                  Theme.of(context).colorScheme.surface.withOpacity(0.8),
                                  Theme.of(context).colorScheme.surface.withOpacity(0),
                                ],
                              ),
                            ),
                            child: SizedBox(
                              height: 150,
                              child: SingleChildScrollView(
                                physics: const BouncingScrollPhysics(),
                                child: TypeWriter.text(
                                  key: ValueKey(state.game!.currentPlot.description),
                                  state.game!.currentPlot.description,
                                  style: Theme.of(context).textTheme.bodyLarge,
                                  softWrap: true,
                                  maxLines: null,
                                  duration: const Duration(milliseconds: 50),
                                  onFinished: (value) {
                                    context.read<GameCubit>().setTextFinished();
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  if (state.isTextFinished)
                    Expanded(
                      child: state.game!.currentPlot.choices != null && state.game!.currentPlot.choices!.isNotEmpty
                          ? ListView.separated(
                              separatorBuilder: (context, index) => const SizedBox(height: 8),
                              itemCount: state.game!.currentPlot.choices!.length,
                              itemBuilder: (context, index) {
                                final choice = state.game!.currentPlot.choices![index];
                                return ListTile(
                                  tileColor: Theme.of(context).colorScheme.primaryContainer,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  title: Text(
                                    choice.name,
                                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                          color: Theme.of(context).colorScheme.onPrimaryContainer,
                                        ),
                                  ),
                                  onTap: () => onTapDecision(choice),
                                );
                              },
                            )
                          : const Center(
                              child: Text("You have reached the end of the story."),
                            ),
                    ),
                ],
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
