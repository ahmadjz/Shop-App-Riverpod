import 'lottie_animation_view.dart';
import 'models/lottie_animation.dart';

class NoDataAnimationView extends LottieAnimationView {
  const NoDataAnimationView({super.key})
      : super(
          animation: LottieAnimation.noData,
        );
}
