import 'package:test_relise_app/models/bundles.dart';

class BundlesState {}

class BundlesInitial extends BundlesState {}

class BundlesLoadingState extends BundlesState {
 
}

class BundlesLoadedState extends BundlesState {
   final List<Bundles> bundles;
  BundlesLoadedState(this.bundles);
}

class BundlesErrorState extends BundlesState {
  final String error;
  BundlesErrorState(this.error);
}
