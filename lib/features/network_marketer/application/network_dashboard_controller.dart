import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core_api/data/network/model_parsers.dart';
import '../../core_api/domain/models/domain_models.dart';
import '../../core_api/domain/repositories/repositories.dart';
import '../../core_api/domain/repositories/repository_providers.dart';

class NetworkDashboardState {
  const NetworkDashboardState({
    this.loading = false,
    this.dashboard,
    this.shareToken,
    this.error,
  });

  final bool loading;
  final NetworkMarketerDashboard? dashboard;
  final String? shareToken;
  final String? error;

  NetworkDashboardState copyWith({
    bool? loading,
    NetworkMarketerDashboard? dashboard,
    String? shareToken,
    String? error,
    bool clearError = false,
  }) {
    return NetworkDashboardState(
      loading: loading ?? this.loading,
      dashboard: dashboard ?? this.dashboard,
      shareToken: shareToken ?? this.shareToken,
      error: clearError ? null : (error ?? this.error),
    );
  }
}

final networkDashboardControllerProvider =
    StateNotifierProvider<NetworkDashboardController, NetworkDashboardState>(
        (ref) {
  return NetworkDashboardController(
      ref.watch(networkMarketerRepositoryProvider));
});

class NetworkDashboardController extends StateNotifier<NetworkDashboardState> {
  NetworkDashboardController(this._repository)
      : super(const NetworkDashboardState()) {
    load();
  }

  final NetworkMarketerRepository _repository;

  Future<void> load({bool forceRefresh = false}) async {
    state = state.copyWith(loading: true, clearError: true);
    try {
      final dashboardJson = await _repository.getDashboard(
          forceRefresh: forceRefresh) as Map<String, dynamic>;
      final shareJson =
          await _repository.getShareToken() as Map<String, dynamic>;
      state = state.copyWith(
        loading: false,
        dashboard: parseNetworkDashboard(dashboardJson),
        shareToken: shareJson['token']?.toString() ??
            shareJson['referral_token']?.toString(),
      );
    } catch (e) {
      state = state.copyWith(loading: false, error: e.toString());
    }
  }

  Future<void> invalidateCache() async {
    await _repository.invalidateDashboardCache();
    await load(forceRefresh: true);
  }
}
