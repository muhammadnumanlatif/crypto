//*utils
import '../../utils/utils.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.authRoute,
      routes: {
        MyRoutes.authRoute: (context) => AuthenticationPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
      },
    );
  }
}
