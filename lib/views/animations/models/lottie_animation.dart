import 'package:shop_app_riverpod/app/resources/assets_manager.dart';

enum LottieAnimation {
  loading(name: JsonAssets.loadingSpinner),
  error(name: JsonAssets.error),
  noData(name: JsonAssets.empty),
  ;

  final String name;
  const LottieAnimation({
    required this.name,
  });
}
