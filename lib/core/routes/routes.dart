part of '../../drappers.dart';

enum AppRoutes {
  signInOptions('sign-in', '/sign-in'),
  guestPage('guest-page', '/guest-page'),
  completeProfileUser("complete-user-profile", '/complete-user-profile'),
  suggestedLesson('suggested-lesson', '/suggested-lesson'),
  signInOnBoard('sign-in-onboard', '/sign-in-onboard'),
  getStartedPage('get-started', '/get-started'),
  createAccountPage('create-account', '/create-account'),
  signUp('sign-up', '/sign-up'),
  questionBuilder('question-builder', '/question-builder'),
  questionBuilderSignIn('question-buildersignin', '/question-buildersignin'),
  questionBuilderSettings(
    'question-builder-settings',
    '/question-builder-settings',
  ),
  learningsPage('learnings-page', '/learnings-page'),
  learnersProfilePage('learners-profile-page', '/learners-profile-page'),
  // homeProfile('home-profile', '/home-profile'),
  home('home', '/home'),
  // profile('profile', '/profile'),
  ourPolicyMobile('our-policy-mobile', '/our-policy-mobile'),
  faqsPageMobile('faqs-mobile', '/faqs-mobile'),
  notificationSettings('notification-settings', '/notification-settings'),
  preferenceSettings('preference-settings', '/preference-settings'),

  courseCompletePage('course-complete', '/course-complete'),
  coursesByCategory('courses-by-category', '/courses-by-category'),

  ///JUST FOR PUBIC ROUTE CHECK
  courseDetailHome('home/course', '/home/course'),
  // courseDetailLearning('course-myLearning', '/course-myLearning'),
  // courseDetailProfile('course-myProfile', '/course-myProfile'),
  courseCompletePageLearner(
    'learner-course-complete',
    '/learner-course-complete',
  ),
  courseCompleteLearnerPage(
    'course-complete-learner',
    '/course-complete-learner',
  ),
  lessonCompletePage('lesson-complete', '/lesson-complete'),
  learnerlessonCompletePage(
    'learner-lesson-complete',
    '/learner-lesson-complete',
  ),

  courseLevels('course-levels', '/course-levels'),
  learnText('learn-text', '/learn-text'),
  speakSentence('speak-sentence', '/speak-sentence'),
  listenAndChoose('listen-&-choose', '/listen-&-choose'),
  readAndRespond('read-&-respond', '/read-&-respond'),
  videoChapter('video-chapter', '/video-chapter'),
  textBase('text-base', '/text-base'),
  booleanBase('boolean-base', '/boolean-base'),
  choiceBase('choice-base', '/choice-base'),
  userSettingPage('user-setting-page', '/user-setting-page'),

  completeSentence('complete_sentence', '/complete_sentence'),
  storyTellingQuizBuilder(
    'story_telling_quiz_page',
    '/story_telling_quiz_page',
  ),
  // dialoguePage('dialogue-page', '/dialogue-page'),

  // courseTakeQuestionPage('course-take-page', '/course-take-page'),
  questionsTakingHandler('question-take-page', '/question-take-page'),
  questionsTakingHandlerLearner(
    'learner-question-take-page',
    '/learner-question-take-page',
  ),
  courseTakeQuestionPageLearner(
    'course-take-page-learner',
    '/course-take-page-learner',
  ),
  streakCalendar('streak-calendar', '/streak-calendar'),
  streakCommit('streak-commit', '/streak-commit'),
  streakCalendarLearning(
    'streak-calendar-learning',
    '/streak-calendar-learning',
  ),
  streakCommitLeaning('streak-commit-learning', '/streak-commit-learning'),
  completedCourses('completed-courses', 'completed-courses'),

  dragDrop('drag_drop', '/drag_drop');

  final String name;
  final String path;

  const AppRoutes(this.name, this.path);

  static String get initialLocation => AppRoutes.home.path;

  static List<AppRoutes> bottomNavPages = [
    AppRoutes.home,
    AppRoutes.learningsPage,
    // AppRoutes.home,
    // AppRoutes.learnersProfilePage,
    AppRoutes.learnersProfilePage,
  ];

  static List<AppRoutes> get publicRoutes => [
    AppRoutes.getStartedPage,
    AppRoutes.signInOptions,
    AppRoutes.completeProfileUser,
    AppRoutes.createAccountPage,
    AppRoutes.signInOnBoard,
    // AppRoutes.profile,
    AppRoutes.suggestedLesson,
    AppRoutes.guestPage,
    AppRoutes.courseDetailHome,
    // AppRoutes.courseDetailLearning,
    // AppRoutes.courseDetailProfile,
  ];

  static bool isPublicRoute(GoRouterState state) {
    final fullPath = state.fullPath;

    return fullPath != null &&
        publicRoutes.any((p) {
          return fullPath.startsWith(p.path);
        });
  }
}
