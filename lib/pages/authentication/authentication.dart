//*utils
import 'package:flutter_svg/svg.dart';

import '../../utils/utils.dart';

class AuthenticationPage extends StatefulWidget {
  // Authentication({Key key}) : super(key: key);

  @override
  _AuthenticationPageState createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  //*Controller
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //*container
      body: SafeArea(
        child: VxBox(
          //*column
          child: SingleChildScrollView(
            child: Container(
              child: VStack(
                [
                  
                  SvgPicture.asset(
                    'assets/images/bluedigitalwallet.svg',
                    alignment: Alignment.topCenter,
                    fit: BoxFit.cover,
                    width: context.percentWidth*100,
                    height: context.percentHeight * 25,
                  ).centered(),
                  25.heightBox,
                  VxBevel(
                    backgroundColor: MyTheme.darkBluishColor,
                    height: 75,
                    child: 'Blueart Crypto Wallet'
                        .text
                        .color(MyTheme.creamColor)
                        .xl2
                        .makeCentered(),
                  ).shadow5xl.pSymmetric(h: 16),

                  25.heightBox,
                  //*email textfield
                  VxBevel(
                    backgroundColor: MyTheme.darkBluishColor,
                    height: 75,
                    child: TextFormField(
                      style: TextStyle(color: MyTheme.creamColor),
                      controller: _emailController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 16),
                        border: InputBorder.none,
                        hintText: "something@email.com",
                        hintStyle: TextStyle(
                          color: MyTheme.creamColor,
                          fontSize: 18,
                        ),
                        labelText: "Email",
                        labelStyle: TextStyle(
                          color: MyTheme.creamColor,
                          fontSize: 18,
                        ),
                      ),
                    ).centered(),
                  ).shadow5xl.px16(),

                  25.heightBox,

                  //*pass textfield
                  VxBevel(
                    backgroundColor: MyTheme.darkBluishColor,
                    height: 75,
                    child: TextFormField(
                      style: TextStyle(color: MyTheme.creamColor),
                      controller: _passController,
                      obscureText: true,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 16),
                        border: InputBorder.none,
                        hintText: "pass > 6",
                        hintStyle: TextStyle(
                          color: MyTheme.creamColor,
                          fontSize: 18,
                        ),
                        labelText: "Password",
                        labelStyle: TextStyle(
                          color: MyTheme.creamColor,
                          fontSize: 18,
                        ),
                      ),
                    ).centered(),
                  ).shadow5xl.px16(),
                  50.heightBox,
                  //*register button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      //*register
                      Expanded(
                        child: MaterialButton(
                          splashColor: MyTheme.creamColor,
                          onPressed: () async {
                            bool shouldNavigate = await register(
                              context,
                              _emailController.text,
                              _passController.text,
                            );
                            if (shouldNavigate) {
                              Navigator.pushNamed(context, MyRoutes.homeRoute);
                            }

                            print('Fail');
                          },
                          child: VxBevel(
                            backgroundColor: MyTheme.darkBluishColor,
                            height: 50,
                            child: 'Register'
                                .text
                                .color(MyTheme.creamColor)
                                .xl2
                                .makeCentered(),
                          ).shadow5xl.pSymmetric(h: 8),
                        ),
                      ),
                      //*Login
                      Expanded(
                        child: MaterialButton(
                          splashColor: MyTheme.creamColor,
                          onPressed: () async {
                            bool shouldNavigate = await signIn(
                              context,
                              _emailController.text,
                              _passController.text,
                            );
                            if (shouldNavigate) {
                              Navigator.pushNamed(context, MyRoutes.homeRoute);
                            }

                            print('fail');
                          },
                          child: VxBevel(
                            backgroundColor: MyTheme.darkBluishColor,
                            height: 50,
                            child: 'Login'
                                .text
                                .color(MyTheme.creamColor)
                                .xl2
                                .makeCentered(),
                          ).shadow5xl.pSymmetric(h: 8),
                        ),
                      ),
                    ],
                  ),
                ],
                alignment: MainAxisAlignment.center,
              ),
            ),
          ),
        )
            .color(
              MyTheme.creamColor,
            )
            .make(),
      ),
    );
  }
}
