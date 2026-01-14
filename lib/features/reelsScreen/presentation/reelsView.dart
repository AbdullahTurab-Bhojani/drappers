// ignore_for_file: file_names, unused_field, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../../../shared/widgets/guestloginwidget.dart';
import '../../../shared/widgets/reel_action_bar.dart';

class ReelsviewScreen extends StatefulWidget {
  const ReelsviewScreen({super.key});

  @override
  State<ReelsviewScreen> createState() => _ReelsviewScreenState();
}

class _ReelsviewScreenState extends State<ReelsviewScreen> {
  final List<String> _videoPaths = [
    'assets/images/video8.mp4',
    'assets/images/video8.mp4',
    'assets/images/video8.mp4',
    'assets/images/video8.mp4',
    'assets/images/video8.mp4',
  ];

  late final PageController _pageController;
  late final List<VideoPlayerController> _videoControllers;

  late final List<bool> _isLiked;
  late final List<int> _likeCounts;
  late final List<bool> _isSaved;
  late final List<bool> _expanded;

  final List<String> _titles = [
    'Rio de Janeiro – Meet the Drapers Season 6 (2023)',
    'Startup Spotlight — Episode 2',
    'Behind the Scenes — Drapers Live',
    'Behind the Scenes — Drapers Live',
    'Behind the Scenes — Drapers Live',
  ];

  final List<String> _descriptions = [
    'Welcome to ‘Meet the Drapers’ at Websummit Rio de Janeiro! Tim Draper, with judges Luis Justo and Cris Arcangeli, assess startups Renova, Voxcell Bio, Instor Robotics, and Aprix. Which Rio startup advances to the semi-finals?',
    'Quick highlight of our latest startup pitch — watch till the end!',
    'Short Behind-the-Scenes from our last founder meetup — raw and real.',
    'Welcome to ‘Meet the Drapers’ at Websummit Rio de Janeiro! Tim Draper, with judges Luis Justo and Cris Arcangeli, assess startups Renova, Voxcell Bio, Instor Robotics, and Aprix. Which Rio startup advances to the semi-finals?',
    'Short Behind-the-Scenes from our last founder meetup — raw and real.',
  ];

  final List<String> _dates = [
    '12 July 2025',
    '10 July 2025',
    '08 July 2025',
    '08 July 2025',
    '08 July 2025',
  ];

  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();

    _isLiked = List.generate(_videoPaths.length, (_) => false);
    _likeCounts = List.generate(_videoPaths.length, (_) => 0);
    _isSaved = List.generate(_videoPaths.length, (_) => false);
    _expanded = List.generate(_videoPaths.length, (_) => false);

    _videoControllers = _videoPaths
        .map((path) => VideoPlayerController.asset(path))
        .toList();

    for (int i = 0; i < _videoControllers.length; i++) {
      final c = _videoControllers[i];
      c.setLooping(true);
      c.initialize().then((_) {
        if (i == 0) c.play();
        if (mounted) setState(() {});
      });
    }
  }

  @override
  void dispose() {
    for (var c in _videoControllers) c.dispose();
    _pageController.dispose();
    super.dispose();
  }

  void _playOnlyAt(int index) {
    for (int i = 0; i < _videoControllers.length; i++) {
      if (_videoControllers[i].value.isInitialized) {
        i == index ? _videoControllers[i].play() : _videoControllers[i].pause();
      }
    }
    setState(() => _currentPage = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        top: false,
        child: PageView.builder(
          controller: _pageController,
          scrollDirection: Axis.vertical,
          itemCount: _videoControllers.length,
          onPageChanged: _playOnlyAt,
          itemBuilder: (context, index) {
            final controller = _videoControllers[index];

            return ReelActionBar(
              controller: controller,
              title: _titles[index],
              description: _descriptions[index],
              date: _dates[index],
              isLiked: _isLiked[index],
              likeCount: _likeCounts[index],
              isSaved: _isSaved[index],
              isExpanded: _expanded[index],

              onLike: () {
                if (GuestHelper.isGuest) {
                  GuestHelper.checkGuest(context);
                  return;
                }
                setState(() {
                  _isLiked[index] = !_isLiked[index];
                  _likeCounts[index] += _isLiked[index] ? 1 : -1;
                });
              },
              onShare: () {
                if (GuestHelper.isGuest) {
                  GuestHelper.checkGuest(context);
                  return;
                }
              },
              onSave: () {
                if (GuestHelper.isGuest) {
                  GuestHelper.checkGuest(context);
                  return;
                }
                setState(() {
                  _isSaved[index] = !_isSaved[index];
                });
              },
              onToggleExpand: () {
                setState(() {
                  _expanded[index] = !_expanded[index];
                });
              },
              onBack: () {
                _videoControllers[index].pause();
                Navigator.pop(context);
              },
            );
          },
        ),
      ),
    );
  }
}
