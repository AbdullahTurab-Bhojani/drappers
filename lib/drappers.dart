// Main library file for Everbloom app
// All imports are consolidated here, and all other files use `part of` pattern

// ignore_for_file: unnecessary_import, implementation_imports

import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

// Third-party packages
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:firebase_auth/firebase_auth.dart'
//     show
//         AppleAuthProvider,
//         AuthCredential,
//         FirebaseAuth,
//         User,
//         FirebaseAuthException,
//         GoogleAuthProvider,
//         OAuthProvider,
//         UserInfo;
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_timezone/flutter_timezone.dart';
// import 'package:google_sign_in/google_sign_in.dart';
import 'package:image/image.dart' as img;
import 'package:chewie/chewie.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:share_plus/share_plus.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'core/extensions/theme_extension.dart';
import 'core/local/providers/shared_pref.dart';
import 'core/theme/app_theme.dart';
import 'features/Setting&preferences/presentation/setting_preferences.dart';
import 'features/applypitch/presentation/apply_pitch_screen.dart';
import 'features/dashboard/presentation/nav_bar.dart';
import 'features/deleteAccount/presentation/delete_account.dart';
import 'features/deactivateAccount/deactivateAccount.dart';
import 'features/delete_detail/presentation/deleteDetail.dart';
import 'features/discover/presentation/discover_screen.dart';
import 'features/documentriescard/presentation/documentriescard.dart';
import 'features/editprofile/presentation/editprofile_screen.dart';
import 'features/faqs/privacypolicy/presentation/views/faqs.dart';
import 'features/help&support/presentation/helpsupport.dart';
import 'features/home/presentation/views/home.dart';
import 'features/login/presentation/forgetpassword_screen.dart';
import 'features/login/presentation/login_screen.dart';
import 'features/login/presentation/updatepassword_screen.dart';
import 'features/login/presentation/verfiicationcode_screen.dart';
import 'features/onboarding/presentation/onboarding_screen.dart';
import 'features/privacypolicy/presentation/views/privacypolicy.dart';
import 'features/profile/presentation/profile_screen.dart';
import 'features/report_content/presentation/report_content.dart';
import 'features/savereel/presentation/savedreel.dart';
import 'features/signup/presentation/views/signup.dart';
import 'features/something_Else/presentation/reportContent_SomethingElse.dart';
import 'features/splash/presentation/views/splash.dart';
import 'features/terms&condition/presentation/termscondition.dart';
import 'features/voteforstartup/presentation/vote_for_startup_screen.dart';
import 'features/watchlist/presentation/watchlist_screen.dart';
import 'gen/assets.gen.dart';
import 'package:chewie/src/center_seek_button.dart';
import 'package:chewie/src/chewie_player.dart';
import 'package:chewie/src/chewie_progress_colors.dart';
import 'package:chewie/src/helpers/utils.dart';
import 'package:chewie/src/material/material_progress_bar.dart';
import 'package:chewie/src/material/widgets/options_dialog.dart';
import 'package:chewie/src/material/widgets/playback_speed_dialog.dart';
import 'package:chewie/src/models/option_item.dart';
import 'package:chewie/src/models/subtitle_model.dart';
import 'package:chewie/src/notifiers/index.dart';
import 'shared/custom_app_start/providers/app_start.dart';
import 'shared/video_player/providers/video_player_provider.dart';
import 'shared/widgets/podcast/podcast_widget.dart';
import 'shared/widgets/reelwidget/reel_widget.dart';
import 'shared/widgets/trendingshow/trendingshow_widget.dart';
part 'drappers.freezed.dart';
part 'app.dart';
part 'core/routes/router.dart';
part 'core/routes/routes.dart';
part 'core/theme/colors.dart';
part 'core/states/app_loading_state.dart';
part 'core/mixin/form_state_mixin.dart';
part 'core/extensions/custom_extensions.dart';
part 'core/services/fcm_service.dart';

part 'core/services/image_picker_handler.dart';
part 'core/services/fixed_grid_heigh_delegates.dart';
part 'core/services/files_picker_service.dart';
part 'core/services/check_internet.dart';
part 'shared/custom_app_start/presentation/my_app_start.dart';
part 'shared/disposable_providers/disposable_providers.dart';
part 'shared/modals/confirmation_modal.dart';
part 'shared/utils/custom_date_picker.dart';
part 'shared/utils/custom_scroll_behaviour.dart';
part 'shared/utils/ui_breaks_points.dart';
part 'shared/video_player/presentation/custom_chewie_controls.dart';
part 'shared/video_player/presentation/short_view_player.dart';
part 'shared/video_player/presentation/thumbnail_video_preview.dart';
part 'shared/video_player/presentation/video_player_state_builder.dart';
part 'shared/widgets/app_buttons/custom_icon_btn.dart';
part 'shared/widgets/app_buttons/primary_button.dart';
part 'shared/widgets/images/app_image.dart';
part 'shared/widgets/images/cached_image.dart';
part 'shared/widgets/images/circle_image.dart';
part 'shared/widgets/images/edit_profile_widget.dart';
part 'shared/widgets/images/svg_images.dart';
part 'shared/widgets/text_widget/plus_jakarta.dart';
part 'shared/widgets/text_widget/readmore_text.dart';
part 'shared/widgets/text_widget/poppins.dart';
part 'shared/widgets/coming_soon.dart';
part 'shared/widgets/custom_drop_down.dart';
part 'shared/widgets/custom_form_validator.dart';
part 'shared/widgets/custom_message.dart';
part 'shared/widgets/decorated_icon.dart';
part 'shared/widgets/error_widget.dart';
part 'shared/widgets/loading_widget.dart';
part 'shared/widgets/searchable_custom_dropdown.dart';
part 'shared/widgets/text_field_label.dart';
part 'core/local/domain/repositories/shared_preference_repository.dart';
part 'core/local/domain/repositories/local_storage_repository.dart';
