//*utils
import '../../utils/utils.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: VxBox(
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(
                FirebaseAuth.instance.currentUser!.uid,
              )
              .collection('coins')
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return //name
                  CircularProgressIndicator().centered();
            }
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                var doc = snapshot.data?.docs[index];
                return VxBox(
                  child: HStack(
                    [
                      //name
                      'CoinName: ${doc?.id}'.text.make(),
                      //amount
                      'CoinAmount: ${doc?.data() ?? ["amount"]}'.text.make(),
                    ],
                    alignment: MainAxisAlignment.spaceEvenly,
                  ),
                ).make();
              },
            );
          },
        ),
      ).make(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          VxBottomSheet.bottomSheetView(
            context,
            roundedFromTop: true,
            isDismissible: false,
            enableDrag: true,
            isSafeAreaFromBottom: true,
            backgroundColor: Colors.white,
            minHeight: context.safePercentHeight*0.1,
            maxHeight: context.safePercentHeight*0.8,
            child: AuthenticationPage(),
          );
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
