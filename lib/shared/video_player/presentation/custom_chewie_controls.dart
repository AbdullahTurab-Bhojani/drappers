part of '../../../drappers.dart';

class CustomChewieControls extends ConsumerStatefulWidget {
  final String videoSource;
  const CustomChewieControls({
    this.showPlayButton = true,
    super.key,
    required this.videoSource,
  });

  final bool showPlayButton;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _CustomChewieControlsState();
  }
}

class _CustomChewieControlsState extends ConsumerState<CustomChewieControls>
    with SingleTickerProviderStateMixin {
  PlayerNotifier? notifier;
  VideoPlayerValue? _latestValue;
  double? _latestVolume;
  Timer? _hideTimer;
  Timer? _initTimer;
  late var _subtitlesPosition = Duration.zero;
  bool _subtitleOn = false;
  Timer? _showAfterExpandCollapseTimer;
  bool _dragging = false;
  bool _displayTapped = false;
  Timer? _bufferingDisplayTimer;
  bool _displayBufferingIndicator = false;

  final barHeight = 48.0;
  final marginSize = 5.0;

  late VideoPlayerController controller;
  late PlayerNotifier playerNotifier;
  @override
  void initState() {
    super.initState();

    onAssignValue();
    playerNotifier = PlayerNotifier.init();
  }

  @override
  Widget build(BuildContext context) {
    final videoPlayer = ref.watch(
      customVideoPlayerProvider(widget.videoSource),
    );
    final chewieController = videoPlayer.value;
    if (notifier == null || _latestValue == null || chewieController == null) {
      return SizedBox();
    }
    if (_latestValue?.hasError ?? false) {
      return chewieController.errorBuilder?.call(
            context,
            chewieController.videoPlayerController.value.errorDescription!,
          ) ??
          const Center(child: Icon(Icons.error, color: Colors.white, size: 42));
    }

    return MouseRegion(
      onHover: (_) {
        _cancelAndRestartTimer();
      },
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,

        onTap: () => _cancelAndRestartTimer(),
        child: AbsorbPointer(
          absorbing: notifier!.hideStuff,
          child: Stack(
            children: [
              if (_displayBufferingIndicator)
                chewieController.bufferingBuilder?.call(context) ??
                    LoadingWidget()
              else
                _buildHitArea(),
              _buildActionBar(),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  if (_subtitleOn)
                    Transform.translate(
                      offset: Offset(
                        0.0,
                        notifier!.hideStuff ? barHeight * 0.8 : 0.0,
                      ),
                      child: _buildSubtitles(
                        context,
                        chewieController.subtitle!,
                      ),
                    ),
                  _buildBottomBar(context),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _dispose();
    super.dispose();
  }

  void _dispose() {
    controller.removeListener(_updateState);
    _hideTimer?.cancel();
    _initTimer?.cancel();
    _showAfterExpandCollapseTimer?.cancel();
  }

  @override
  void didChangeDependencies() {
    onAssignValue();
    super.didChangeDependencies();
  }

  void onAssignValue() async {
    final videoPlayer = await ref.read(
      customVideoPlayerProvider(widget.videoSource).future,
    );

    controller = videoPlayer.videoPlayerController;
    setState(() {});
    _dispose();
    _initialize();
  }

  Widget _buildActionBar() {
    final videoPlayer = ref.watch(
      customVideoPlayerProvider(widget.videoSource),
    );
    final chewieController = videoPlayer.value;
    if (chewieController == null) return SizedBox();

    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return Positioned(
      top: 0,
      right: 0,
      child: AnimatedOpacity(
        opacity: notifier!.hideStuff ? 0.0 : 1.0,
        duration: const Duration(milliseconds: 250),
        child: SizedBox(
          height: 50,
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              SizedBox(
                width: chewieController.isFullScreen && !isPortrait ? 60 : 20,
              ),
              if (context.isMobile && chewieController.isFullScreen)
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Assets.icons.arrowLeft.image(
                    scale: 4,
                    color: Colors.white,
                  ),
                ),
              Spacer(),
              _buildSubtitleToggle(),
              if (chewieController.showOptions) _buildOptionsButton(),
            ],
          ),
        ),
      ),
    );
  }

  List<OptionItem> _buildOptions(BuildContext context) {
    final videoPlayer = ref.read(customVideoPlayerProvider(widget.videoSource));
    final chewieController = videoPlayer.value;
    if (chewieController == null) return [];

    final options = <OptionItem>[
      OptionItem(
        onTap: (context) async {
          Navigator.pop(context);
          _onSpeedButtonTap();
        },
        iconData: Icons.speed,
        title:
            chewieController.optionsTranslation?.playbackSpeedButtonText ??
            'Playback Speed',
      ),
    ];

    if (chewieController.additionalOptions != null &&
        chewieController.additionalOptions!(context).isNotEmpty) {
      options.addAll(chewieController.additionalOptions!(context));
    }
    return options;
  }

  Widget _buildOptionsButton() {
    final videoPlayer = ref.watch(
      customVideoPlayerProvider(widget.videoSource),
    );
    final chewieController = videoPlayer.value;
    if (chewieController == null) return SizedBox();

    if (kIsWeb || kIsWasm) {
      return const SizedBox();
    }
    return AnimatedOpacity(
      opacity: notifier!.hideStuff ? 0.0 : 1.0,
      duration: const Duration(milliseconds: 250),
      child: IconButton(
        onPressed: () async {
          _hideTimer?.cancel();

          if (chewieController.optionsBuilder != null) {
            await chewieController.optionsBuilder!(
              context,
              _buildOptions(context),
            );
          } else {
            await showModalBottomSheet<OptionItem>(
              context: context,
              isScrollControlled: true,
              useRootNavigator: chewieController.useRootNavigator,
              builder: (context) => OptionsDialog(
                options: _buildOptions(context),
                cancelButtonText: 'Cancel',
              ),
            );
          }

          if (_latestValue?.isPlaying ?? false) {
            _startHideTimer();
          }
        },
        icon: const Icon(Icons.more_vert, color: Colors.white),
      ),
    );
  }

  Widget _buildSubtitles(BuildContext context, Subtitles subtitles) {
    final videoPlayer = ref.watch(
      customVideoPlayerProvider(widget.videoSource),
    );
    final chewieController = videoPlayer.value;
    if (chewieController == null) return SizedBox();

    if (!_subtitleOn) {
      return const SizedBox();
    }
    final currentSubtitle = subtitles.getByPosition(_subtitlesPosition);
    if (currentSubtitle.isEmpty) {
      return const SizedBox();
    }

    if (chewieController.subtitleBuilder != null) {
      return chewieController.subtitleBuilder!(
        context,
        currentSubtitle.first!.text,
      );
    }

    return Padding(
      padding: EdgeInsets.all(marginSize),
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: const Color(0x96000000),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Text(
          currentSubtitle.first!.text.toString(),
          style: const TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  AnimatedOpacity _buildBottomBar(BuildContext context) {
    final videoPlayer = ref.watch(
      customVideoPlayerProvider(widget.videoSource),
    );
    final chewieController = videoPlayer.value;
    if (chewieController == null) {
      return AnimatedOpacity(
        opacity: 0.0,
        duration: Duration.zero,
        child: SizedBox(),
      );
    }
    final iconColor = Theme.of(context).textTheme.labelLarge!.color;

    return AnimatedOpacity(
      opacity: notifier!.hideStuff ? 0.0 : 1.0,
      duration: const Duration(milliseconds: 300),
      child: Container(
        height: barHeight + (chewieController.isFullScreen ? 30.0 : 0),
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: !chewieController.isFullScreen ? 10.0 : 20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (!chewieController.isLive)
              Expanded(child: Row(children: [_buildProgressBar()])),
            SizedBox(height: chewieController.isFullScreen ? 15.0 : 5),
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  if (chewieController.isLive)
                    const Expanded(child: Text('LIVE'))
                  else
                    _buildPosition(iconColor),
                  if (chewieController.allowMuting)
                    _buildMuteButton(controller),
                  const Spacer(),
                  if (chewieController.allowFullScreen) _buildExpandButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector _buildMuteButton(VideoPlayerController controller) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,

      onTap: () {
        _cancelAndRestartTimer();

        if (_latestValue!.volume == 0) {
          controller.setVolume(_latestVolume ?? 0.5);
        } else {
          _latestVolume = controller.value.volume;
          controller.setVolume(0.0);
        }
      },
      child: AnimatedOpacity(
        opacity: notifier!.hideStuff ? 0.0 : 1.0,
        duration: const Duration(milliseconds: 300),
        child: ClipRect(
          child: Container(
            height: barHeight,
            padding: const EdgeInsets.only(left: 6.0),
            child: Icon(
              _latestValue!.volume > 0 ? Icons.volume_up : Icons.volume_off,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildExpandButton() {
    final videoPlayer = ref.watch(
      customVideoPlayerProvider(widget.videoSource),
    );
    final chewieController = videoPlayer.value;
    if (chewieController == null) return Row(children: []);

    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    var isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Row(
      children: [
        if (!kIsWeb && !kIsWasm && !isLandscape)
          CustomIconBtn(
            onPressed: () async {
              if (context.isMobile) {
                SystemChrome.setPreferredOrientations([
                  DeviceOrientation.portraitUp,
                  DeviceOrientation.portraitDown,
                ]);
                chewieController.toggleFullScreen();
                await Future.delayed(Duration(milliseconds: 1000));
                // if (controller.value.isPlaying) {
                //   controller.pause();
                // } else {
                controller.play();
                // }
              } else {
                chewieController.toggleFullScreen();
              }
            },
            child: (chewieController.isFullScreen && isPortrait)
                ? Assets.icons.window.image(
                    scale: 4,
                    height: 18,
                    width: 18,
                    color: Colors.white,
                  )
                : Assets.icons.diagonal.image(
                    scale: 4,
                    height: 18,
                    width: 18,
                    color: Colors.white,
                  ),
          ),
        SizedBox(width: 8),
        CustomIconBtn(
          onPressed: () {
            _onExpandCollapse();
          },
          child: chewieController.isFullScreen && !isPortrait
              ? Assets.icons.expandOff.image(
                  height: 18,
                  width: 18,
                  fit: BoxFit.cover,
                  color: Colors.white,
                )
              : Assets.icons.expandCopy.image(
                  height: 18,
                  width: 18,
                  fit: BoxFit.cover,
                  color: Colors.white,
                ),
        ),
      ],
    );
  }

  Widget _buildHitArea() {
    final videoPlayer = ref.watch(
      customVideoPlayerProvider(widget.videoSource),
    );
    final chewieController = videoPlayer.value;
    if (chewieController == null) return SizedBox();

    final bool isFinished =
        (_latestValue!.position >= _latestValue!.duration) &&
        _latestValue!.duration.inSeconds > 0;
    final bool showPlayButton =
        widget.showPlayButton && !_dragging && !notifier!.hideStuff;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,

      onTap: () {
        if (_latestValue!.isPlaying) {
          if (chewieController.pauseOnBackgroundTap) {
            _playPause();
            _cancelAndRestartTimer();
          } else {
            if (_displayTapped) {
              setState(() {
                notifier!.hideStuff = true;
              });
            } else {
              _cancelAndRestartTimer();
            }
          }
        } else {
          _playPause();

          setState(() {
            notifier!.hideStuff = true;
          });
        }
      },
      child: Container(
        alignment: Alignment.center,
        color: Colors
            .transparent, // The Gesture Detector doesn't expand to the full size of the container without this; Not sure why!
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (!isFinished && !chewieController.isLive)
              CenterSeekButton(
                iconData: Icons.replay_10,
                backgroundColor: Colors.transparent,
                iconColor: Colors.white,
                show: showPlayButton,
                fadeDuration: chewieController.materialSeekButtonFadeDuration,
                iconSize: 20,
                onPressed: _seekBackward,
              ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: marginSize),
              child: ColoredBox(
                color: Colors.transparent,
                child: Center(
                  child: UnconstrainedBox(
                    child: AnimatedOpacity(
                      opacity: showPlayButton ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 300),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          iconSize: 40,
                          icon: isFinished
                              ? Icon(
                                  Icons.replay_circle_filled_outlined,
                                  color: Colors.white,
                                )
                              : Icon(
                                  controller.value.isPlaying
                                      ? Icons.pause_circle_filled
                                      : Icons.play_circle_fill,
                                  color: Colors.white,
                                ),
                          onPressed: _playPause,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            if (!isFinished && !chewieController.isLive)
              CenterSeekButton(
                iconData: Icons.forward_10,
                backgroundColor: Colors.transparent,
                iconColor: Colors.white,
                show: showPlayButton,
                fadeDuration: chewieController.materialSeekButtonFadeDuration,
                iconSize: 20,
                onPressed: _seekForward,
              ),
          ],
        ),
      ),
    );
  }

  Future<void> _onSpeedButtonTap() async {
    final videoPlayer = ref.read(customVideoPlayerProvider(widget.videoSource));
    final chewieController = videoPlayer.value;
    if (chewieController == null) return;

    _hideTimer?.cancel();

    final chosenSpeed = await showModalBottomSheet<double>(
      context: context,
      isScrollControlled: true,
      useRootNavigator: chewieController.useRootNavigator,
      builder: (context) => PlaybackSpeedDialog(
        speeds: chewieController.playbackSpeeds,
        selected: _latestValue!.playbackSpeed,
      ),
    );

    if (chosenSpeed != null) {
      controller.setPlaybackSpeed(chosenSpeed);
    }

    if (_latestValue!.isPlaying) {
      _startHideTimer();
    }
  }

  Widget _buildPosition(Color? iconColor) {
    final position = _latestValue!.position;
    final duration = _latestValue!.duration;
    return PlusJakartaText(
      '${formatDuration(position)} / ${formatDuration(duration)}',
      size: 12,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    );
  }

  Widget _buildSubtitleToggle() {
    final videoPlayer = ref.watch(
      customVideoPlayerProvider(widget.videoSource),
    );
    final chewieController = videoPlayer.value;
    if (chewieController == null) return SizedBox();

    //if don't have subtitle hiden button
    if (chewieController.subtitle?.isEmpty ?? true) {
      return const SizedBox();
    }
    return GestureDetector(
      behavior: HitTestBehavior.opaque,

      onTap: _onSubtitleTap,
      child: Container(
        height: barHeight,
        color: Colors.transparent,
        padding: const EdgeInsets.only(left: 12.0, right: 12.0),
        child: Icon(
          _subtitleOn
              ? Icons.closed_caption
              : Icons.closed_caption_off_outlined,
          color: _subtitleOn ? Colors.white : Colors.grey[700],
        ),
      ),
    );
  }

  void _onSubtitleTap() {
    setState(() {
      _subtitleOn = !_subtitleOn;
    });
  }

  void _cancelAndRestartTimer() {
    _hideTimer?.cancel();
    _startHideTimer();

    setState(() {
      notifier!.hideStuff = false;
      _displayTapped = true;
    });
  }

  Future<void> _initialize() async {
    final videoPlayer = ref.read(customVideoPlayerProvider(widget.videoSource));
    final chewieController = videoPlayer.value;
    if (chewieController == null) return;

    _subtitleOn =
        chewieController.showSubtitles &&
        (chewieController.subtitle?.isNotEmpty ?? false);
    controller.addListener(_updateState);

    _updateState();

    if (controller.value.isPlaying || chewieController.autoPlay) {
      _startHideTimer();
    }

    if (chewieController.showControlsOnInitialize) {
      _initTimer = Timer(const Duration(milliseconds: 200), () {
        setState(() {
          notifier!.hideStuff = false;
        });
      });
    }
  }

  Future<void> _onExpandCollapse() async {
    final videoPlayer = ref.read(customVideoPlayerProvider(widget.videoSource));
    final chewieController = videoPlayer.value;
    if (chewieController == null) return;

    setState(() {
      notifier!.hideStuff = true;
      if (!kIsWeb) {
        var isPortrait =
            MediaQuery.of(context).orientation == Orientation.portrait;
        if (chewieController.isFullScreen && isPortrait) {
          SystemChrome.setPreferredOrientations([
            DeviceOrientation.landscapeLeft,
            DeviceOrientation.landscapeRight,
          ]);
        } else if (chewieController.isFullScreen) {
          chewieController.exitFullScreen();
          Navigator.pop(context);
          SystemChrome.setPreferredOrientations([
            DeviceOrientation.portraitUp,
            DeviceOrientation.portraitDown,
          ]);
        } else {
          chewieController.enterFullScreen();
          SystemChrome.setPreferredOrientations([
            DeviceOrientation.landscapeLeft,
            DeviceOrientation.landscapeRight,
          ]);
        }
      } else {
        chewieController.toggleFullScreen();
      }
    });
  }

  void _playPause() {
    final bool isFinished =
        (_latestValue!.position >= _latestValue!.duration) &&
        _latestValue!.duration.inSeconds > 0;

    setState(() {
      if (controller.value.isPlaying) {
        notifier!.hideStuff = false;
        _hideTimer?.cancel();
        controller.pause();
      } else {
        _cancelAndRestartTimer();

        if (!controller.value.isInitialized) {
          controller.initialize().then((_) {
            controller.play();
          });
        } else {
          if (isFinished) {
            controller.seekTo(Duration.zero);
          }
          controller.play();
        }
      }
    });
  }

  void _seekRelative(Duration relativeSeek) {
    _cancelAndRestartTimer();
    final position = _latestValue!.position + relativeSeek;
    final duration = _latestValue!.duration;

    if (position < Duration.zero) {
      controller.seekTo(Duration.zero);
    } else if (position > duration) {
      controller.seekTo(duration);
    } else {
      controller.seekTo(position);
    }
  }

  void _seekBackward() {
    _seekRelative(const Duration(seconds: -10));
  }

  void _seekForward() {
    _seekRelative(const Duration(seconds: 10));
  }

  void _startHideTimer() {
    final videoPlayer = ref.read(customVideoPlayerProvider(widget.videoSource));
    final chewieController = videoPlayer.value;
    if (chewieController == null) return;

    final hideControlsTimer = chewieController.hideControlsTimer.isNegative
        ? ChewieController.defaultHideControlsTimer
        : chewieController.hideControlsTimer;
    _hideTimer = Timer(hideControlsTimer, () {
      setState(() {
        notifier!.hideStuff = true;
      });
    });
  }

  void _bufferingTimerTimeout() {
    _displayBufferingIndicator = true;
    if (mounted) {
      setState(() {});
    }
  }

  void _updateState() {
    if (!mounted) return;

    final videoPlayer = ref.read(customVideoPlayerProvider(widget.videoSource));
    final chewieController = videoPlayer.value;
    if (chewieController == null) return;

    final bool buffering = getIsBuffering(controller);

    // display the progress bar indicator only after the buffering delay if it has been set
    if (chewieController.progressIndicatorDelay != null) {
      if (buffering) {
        _bufferingDisplayTimer ??= Timer(
          chewieController.progressIndicatorDelay!,
          _bufferingTimerTimeout,
        );
      } else {
        _bufferingDisplayTimer?.cancel();
        _bufferingDisplayTimer = null;
        _displayBufferingIndicator = false;
      }
    } else {
      _displayBufferingIndicator = buffering;
    }

    setState(() {
      _latestValue = controller.value;
      _subtitlesPosition = controller.value.position;
    });
    // if (chewieController.isFullScreen) {
    //   // when entering fullscreen → play video
    //   if (!chewieController.isPlaying) {
    //     chewieController.play();
    //   }
    // }
  }

  Widget _buildProgressBar() {
    final videoPlayer = ref.watch(
      customVideoPlayerProvider(widget.videoSource),
    );
    final chewieController = videoPlayer.value;
    if (chewieController == null) return Expanded(child: SizedBox());

    return Expanded(
      child: RotatedBox(
        quarterTurns: 0,
        child: MaterialVideoProgressBar(
          controller,
          height: 8,
          barHeight: 8,
          handleHeight: 4,
          onDragStart: () {
            setState(() {
              _dragging = true;
            });

            _hideTimer?.cancel();
          },
          onDragUpdate: () {
            _hideTimer?.cancel();
          },
          onDragEnd: () {
            setState(() {
              _dragging = false;
            });

            _startHideTimer();
          },
          colors:
              chewieController.materialProgressColors ??
              ChewieProgressColors(
                playedColor: Theme.of(context).colorScheme.secondary,
                handleColor: Theme.of(context).colorScheme.secondary,
                bufferedColor: Theme.of(
                  context,
                ).colorScheme.surface.withAlpha(128),
                backgroundColor: Theme.of(context).disabledColor.withAlpha(128),
              ),
          draggableProgressBar: chewieController.draggableProgressBar,
        ),
      ),
    );
  }
}
