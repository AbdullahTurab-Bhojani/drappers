// ignore_for_file: deprecated_member_use, use_build_context_synchronously

import 'package:better_player_plus/better_player_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';
import '../../../core/theme/app_scalar.dart';
import '../../../drappers.dart';
import '../../../gen/assets.gen.dart';
import '../../../shared/widgets/app_bar/main_app_bar.dart';
import '../../../shared/widgets/featured_episode_card.dart';
import '../../voteforstartup/provider/startup_vote_provider.dart';
import '../provider/startup_detail_provider.dart';

class Startupdetails extends ConsumerStatefulWidget {
  const Startupdetails({super.key, required this.startupId});
  final int startupId;

  @override
  ConsumerState<Startupdetails> createState() => _StartupdetailsState();
}

class _StartupdetailsState extends ConsumerState<Startupdetails> {
  late BetterPlayerController _playerController;
  bool _isPlayerInitialized = false;
  bool _isMuted = true;
  bool _showPlayIcon = true;
  String?
  _initializedUrl; // ✅ track karne ke liye kaunsa URL already initialized hai

  @override
  void initState() {
    super.initState();

    // ✅ Provider listener: data aate hi player init karenge sirf ek dafa
    ref.listenManual(getStartupDetailProvider(widget.startupId), (
      previous,
      next,
    ) {
      next.whenData((startup) {
        if (startup != null &&
            startup.videoLink.isNotEmpty &&
            _initializedUrl != startup.videoLink) {
          _initializedUrl = startup.videoLink;
          _initPlayer(startup.videoLink);
        }
      });
    });
  }

  void _initPlayer(String url) {
    _playerController = BetterPlayerController(
      BetterPlayerConfiguration(
        allowedScreenSleep: false,
        handleLifecycle: true,
        autoPlay: true,
        looping: true,
        fit: BoxFit.cover,
        controlsConfiguration: const BetterPlayerControlsConfiguration(
          showControls: false,
        ),
      ),
      betterPlayerDataSource: BetterPlayerDataSource(
        BetterPlayerDataSourceType.network,
        url,
      ),
    );

    _playerController.setVolume(0);
    _isPlayerInitialized = true;

    Future.delayed(const Duration(seconds: 20), () {
      if (!mounted || !_isPlayerInitialized) return;

      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted && _isPlayerInitialized) {
          _playerController.pause();
          setState(() => _showPlayIcon = true);
        }
      });
    });
    _playerController.addEventsListener((event) {
      if (event.betterPlayerEventType == BetterPlayerEventType.exception) {
        if (!mounted || !_isPlayerInitialized) return;
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) setState(() => _isPlayerInitialized = false);
        });
      }
    });
  }

  @override
  void dispose() {
    if (_isPlayerInitialized) {
      _playerController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final asyncStartup = ref.watch(getStartupDetailProvider(widget.startupId));

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.images.screensbg.path),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppMainBar(
          leading: GestureDetector(
            onTap: () => context.pop(),
            child: Image.asset(
              "assets/images/backicon.png",
              width: AppScaler.scaleSize(context, 20),
              height: AppScaler.scaleHeight(context, 20),
            ),
          ),
          title: "Startup Details",
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            GestureDetector(
              onTap: () {
                Share.share('Check out this startup!');
              },
              child: Image.asset(
                Assets.images.shareicon.path,
                height: AppScaler.scaleHeight(context, 18),
              ),
            ),
            SizedBox(width: AppScaler.scaleSize(context, 15)),
          ],
        ),
        body: asyncStartup.when(
          loading: () =>
              Center(child: LoadingWidget(color: AppColors.buttoncolor.first)),
          error: (e, _) => Center(
            child: Text(
              e.toString(),
              style: const TextStyle(color: Colors.red),
            ),
          ),
          data: (startup) {
            if (startup == null) {
              return const Center(child: Text("Startup not found"));
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    if (startup.videoLink.isNotEmpty) {
                      context.pushNamed(
                        AppRoutes.videoScreen.name,
                        extra: startup.videoLink,
                      );
                    }
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Stack(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: AppScaler.scaleHeight(context, 215),
                          child:
                              startup.videoLink.isNotEmpty &&
                                  _isPlayerInitialized
                              ? BetterPlayer(controller: _playerController)
                              : Image.network(
                                  startup.thumbnailUrl ?? '',
                                  fit: BoxFit.cover,
                                  errorBuilder: (_, _, _) => Container(
                                    color: Colors.grey,
                                    child: const Center(
                                      child: Icon(Icons.broken_image, size: 50),
                                    ),
                                  ),
                                ),
                        ),
                        if (startup.videoLink.isNotEmpty)
                          Container(
                            width: double.infinity,
                            height: AppScaler.scaleHeight(context, 215),
                            color: Colors.black.withOpacity(0.35),
                          ),
                        if (_showPlayIcon && startup.videoLink.isNotEmpty)
                          Positioned(
                            top: 0,
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: GestureDetector(
                              onTap: () {
                                _playerController.play();
                                setState(() => _showPlayIcon = false);
                              },
                              child: Icon(
                                Icons.play_circle_fill,
                                size: 60,
                                color: Colors.white.withOpacity(0.85),
                              ),
                            ),
                          ),
                        if (startup.videoLink.isNotEmpty)
                          Positioned(
                            bottom: AppScaler.scaleHeight(context, 10),
                            right: AppScaler.scaleSize(context, 10),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _isMuted = !_isMuted;
                                  _playerController.setVolume(_isMuted ? 0 : 1);
                                });
                              },
                              child: Icon(
                                _isMuted ? Icons.volume_off : Icons.volume_up,
                                color: Colors.white,
                                size: 22,
                              ),
                            ),
                          ),
                        Positioned(
                          top: AppScaler.scaleHeight(context, 10),
                          right: AppScaler.scaleSize(context, 10),
                          child: GestureDetector(
                            onTap: () => context.pop(),
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: const BoxDecoration(
                                color: AppColors.color000011,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.close,
                                color: AppColors.white,
                                size: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        FeaturedEpisodeCard(
                          startupModel: startup,
                          onVotePressed: () async {
                            try {
                              await ref.read(startupVoteProvider(startup.id))();
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Vote failed: ${e.toString()}'),
                                ),
                              );
                            }
                          },
                        ),
                        SizedBox(height: AppScaler.scaleHeight(context, 20)),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
