import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app_riverpod/app/typedefs/typedefs.dart';
import 'package:shop_app_riverpod/states/auth/is_guest_notifier.dart';

final isGuestProvider = StateNotifierProvider<IsGuestNotifier, IsGuest>(
    (ref) => IsGuestNotifier(ref));
