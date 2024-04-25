import '../../src/app_export.dart';

class NoRouteScreen extends StatelessWidget {
  const NoRouteScreen({
    Key? key,
    required this.routeName,
  }) : super(key: key);

  final String routeName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('No route defined for {$routeName}'),
      ),
    );
  }
}
