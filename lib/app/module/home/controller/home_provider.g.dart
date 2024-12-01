// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getListImagesHash() => r'97e472e69e5923987f51993f290225c7c1b059db';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$GetListImages
    extends BuildlessAutoDisposeAsyncNotifier<List<GetUnplashImageModel>> {
  late final int page;

  FutureOr<List<GetUnplashImageModel>> build({
    required int page,
  });
}

/// See also [GetListImages].
@ProviderFor(GetListImages)
const getListImagesProvider = GetListImagesFamily();

/// See also [GetListImages].
class GetListImagesFamily
    extends Family<AsyncValue<List<GetUnplashImageModel>>> {
  /// See also [GetListImages].
  const GetListImagesFamily();

  /// See also [GetListImages].
  GetListImagesProvider call({
    required int page,
  }) {
    return GetListImagesProvider(
      page: page,
    );
  }

  @override
  GetListImagesProvider getProviderOverride(
    covariant GetListImagesProvider provider,
  ) {
    return call(
      page: provider.page,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getListImagesProvider';
}

/// See also [GetListImages].
class GetListImagesProvider extends AutoDisposeAsyncNotifierProviderImpl<
    GetListImages, List<GetUnplashImageModel>> {
  /// See also [GetListImages].
  GetListImagesProvider({
    required int page,
  }) : this._internal(
          () => GetListImages()..page = page,
          from: getListImagesProvider,
          name: r'getListImagesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getListImagesHash,
          dependencies: GetListImagesFamily._dependencies,
          allTransitiveDependencies:
              GetListImagesFamily._allTransitiveDependencies,
          page: page,
        );

  GetListImagesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.page,
  }) : super.internal();

  final int page;

  @override
  FutureOr<List<GetUnplashImageModel>> runNotifierBuild(
    covariant GetListImages notifier,
  ) {
    return notifier.build(
      page: page,
    );
  }

  @override
  Override overrideWith(GetListImages Function() create) {
    return ProviderOverride(
      origin: this,
      override: GetListImagesProvider._internal(
        () => create()..page = page,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        page: page,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<GetListImages,
      List<GetUnplashImageModel>> createElement() {
    return _GetListImagesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetListImagesProvider && other.page == page;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetListImagesRef
    on AutoDisposeAsyncNotifierProviderRef<List<GetUnplashImageModel>> {
  /// The parameter `page` of this provider.
  int get page;
}

class _GetListImagesProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<GetListImages,
        List<GetUnplashImageModel>> with GetListImagesRef {
  _GetListImagesProviderElement(super.provider);

  @override
  int get page => (origin as GetListImagesProvider).page;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
