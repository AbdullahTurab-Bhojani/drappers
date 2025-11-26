import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/extensions/theme_extension.dart';
import '../../../drappers.dart';
import '../../../gen/assets.gen.dart';

class ReelsviewScreen extends StatefulWidget {
  const ReelsviewScreen({super.key});

  @override
  State<ReelsviewScreen> createState() => _ReelsviewScreenState();
}

class _ReelsviewScreenState extends State<ReelsviewScreen> {
  final String _reelTitle = 'Rio de Janeiro – Meet the Drapers Season 6 (2023)';
  final String _reelDescription =
      'Welcome to ‘Meet the Drapers’ at Websummit Rio de Janeiro! Tim Draper, with judges Luis Justo and Cris Arcangeli, assess startups Renova, Voxcell Bio, Instor Robotics, and Aprix. Which Rio startup advances to the semi-finals? find out in this exciting episode!';
  final String _viewsCount = '2.2k views';
  final String _date = '12 July 2025';

  bool _isPlaying = true;

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    String count = '',
  }) {
    final bool isLikeButton = label.isEmpty && count.isNotEmpty;

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.white, size: 24),
                if (isLikeButton) ...[
                  SizedBox(width: 6),
                  PoppinsText(
                    count,
                    fontSize: PoppinsFontSizeVariant.size16,
                    fontWeight: PoppinsFontWeightVariant.medium,
                    color: Colors.white,
                  ),
                ],
              ],
            ),
            if (!isLikeButton && label.isNotEmpty) ...[
              const SizedBox(height: 4),
              PoppinsText(
                label,
                fontSize: PoppinsFontSizeVariant.size14,
                fontWeight: PoppinsFontWeightVariant.regular,
                color: Colors.white,
              ),
            ],
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _isPlaying = !_isPlaying;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  image: DecorationImage(
                    image: AssetImage(Assets.images.reelimage2.path),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  // AnimatedOpacity(
                  //   opacity: _isPlaying ? 0.0 : 1.0,
                  //   duration: const Duration(milliseconds: 300),
                  //   child: const Icon(
                  //     Icons.play_arrow,
                  //     color: Colors.white,
                  //     size: 80,
                  //   ),
                  // ),
                ),
              ),
            ),
          ),

          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 300,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.transparent, Colors.black87, Colors.black],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.0, 0.7, 1.0],
                  ),
                ),
              ),
            ),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  PoppinsText(
                    _reelTitle,
                    fontSize: PoppinsFontSizeVariant.size18,
                    fontWeight: PoppinsFontWeightVariant.medium,
                    color: customColors.textColor,
                  ),
                  PoppinsText(
                    '$_date • $_viewsCount',
                    fontSize: PoppinsFontSizeVariant.size14,
                    fontWeight: PoppinsFontWeightVariant.regular,
                    color: customColors.labelColor,
                  ),
                  const SizedBox(height: 8),
                  PoppinsText(
                    _reelDescription,
                    fontSize: PoppinsFontSizeVariant.size14,
                    fontWeight: PoppinsFontWeightVariant.regular,
                    color: customColors.textColor,
                    maxLines: 4,
                    textOverflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Like Button
                      _buildActionButton(
                        icon: Icons.thumb_up_alt_outlined,
                        label: '',
                        count: '12',
                        onTap: () {
                          // Handle Like/Unlike
                        },
                      ),

                      // Share Button
                      _buildActionButton(
                        icon: Icons.send_outlined,
                        label: 'Share',
                        onTap: () {
                          // Handle Share
                        },
                        count: '',
                      ),

                      // Save Button
                      _buildActionButton(
                        icon: Icons.add,
                        label: 'Save',
                        onTap: () {
                          // Handle Save to Watchlist
                        },
                        count: '',
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),

          // 4. Top Controls (Back Button and Menu)
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 10.0,
                left: 10.0,
                right: 10.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Back Button
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: const CircleAvatar(
                      backgroundColor: Colors.black54,
                      radius: 20,
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                  // Menu Button
                  GestureDetector(
                    onTap: () {
                      // Handle Menu
                    },
                    child: const Icon(
                      Icons.more_vert,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
