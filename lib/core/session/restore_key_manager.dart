class RestoreKeyManager {
  String? _restorKey;

  //? save restore key
  void saveRestoreKey(String restoreKey) => _restorKey = restoreKey;

  String? get restoreKey => _restorKey;
}
