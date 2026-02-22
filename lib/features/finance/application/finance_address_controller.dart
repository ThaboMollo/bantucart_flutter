import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core_api/data/network/model_parsers.dart';
import '../../core_api/domain/models/domain_models.dart';
import '../../core_api/domain/repositories/repositories.dart';
import '../../core_api/domain/repositories/repository_providers.dart';

class FinanceAddressState {
  const FinanceAddressState({
    this.loading = false,
    this.address,
    this.accounts = const <BankAccount>[],
    this.error,
  });

  final bool loading;
  final Address? address;
  final List<BankAccount> accounts;
  final String? error;

  FinanceAddressState copyWith({
    bool? loading,
    Address? address,
    List<BankAccount>? accounts,
    String? error,
    bool clearError = false,
  }) {
    return FinanceAddressState(
      loading: loading ?? this.loading,
      address: address ?? this.address,
      accounts: accounts ?? this.accounts,
      error: clearError ? null : (error ?? this.error),
    );
  }
}

final financeAddressControllerProvider =
    StateNotifierProvider<FinanceAddressController, FinanceAddressState>((ref) {
  return FinanceAddressController(
    financeRepository: ref.watch(financeRepositoryProvider),
    addressRepository: ref.watch(addressRepositoryProvider),
  );
});

class FinanceAddressController extends StateNotifier<FinanceAddressState> {
  FinanceAddressController({
    required FinanceRepository financeRepository,
    required AddressRepository addressRepository,
  })  : _financeRepository = financeRepository,
        _addressRepository = addressRepository,
        super(const FinanceAddressState()) {
    loadAll();
  }

  final FinanceRepository _financeRepository;
  final AddressRepository _addressRepository;

  Future<void> loadAll() async {
    state = state.copyWith(loading: true, clearError: true);
    try {
      final accountResponse =
          await _financeRepository.getMyAccount() as Map<String, dynamic>;
      final accountsJson =
          (accountResponse['accounts'] as List<dynamic>? ?? <dynamic>[])
              .cast<Map<String, dynamic>>();
      final accounts = accountsJson.map(parseBankAccount).toList();

      Address? address;
      try {
        final addressResponse = await _addressRepository.getAddress();
        if (addressResponse is Map<String, dynamic>) {
          address = parseAddress(addressResponse);
        }
      } catch (_) {
        address = null;
      }

      state =
          state.copyWith(loading: false, accounts: accounts, address: address);
    } catch (e) {
      state = state.copyWith(loading: false, error: e.toString());
    }
  }

  Future<void> upsertAddress(Map<String, dynamic> payload,
      {required bool hasExisting}) async {
    if (hasExisting) {
      await _addressRepository.updateAddress(payload);
    } else {
      await _addressRepository.createAddress(payload);
    }
    await loadAll();
  }

  Future<void> createBankAccount(Map<String, dynamic> payload) async {
    await _financeRepository.createBankAccount(payload);
    await loadAll();
  }

  Future<void> setPrimary(String accountId) async {
    await _financeRepository.setPrimaryBankAccount(accountId);
    await loadAll();
  }

  Future<void> deleteAccount(String accountId) async {
    await _financeRepository.deleteBankAccount(accountId);
    await loadAll();
  }
}
