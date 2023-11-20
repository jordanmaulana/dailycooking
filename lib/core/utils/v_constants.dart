class VConst {
  VConst._();

  static final animationAsset = AnimationAsset();
}

class AnimationAsset {
  static const String _emptyCart = 'assets/animations/empty_cart.json';

  String get emptyCart => _emptyCart;
}
