import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../view_model/home_view_model.dart';
import '../../constants/color_constants.dart';
import '../../constants/text_styles.dart';
import '../../constants/enums.dart';
import '../Base/base_view.dart';

class HomeView extends StatefulWidget {

    static Widget create() {
    return ChangeNotifierProvider(
      create: (_) => HomeViewModel(),
      child: const HomeView(),
    );
    }
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final scrollController = ScrollController();

  final TextEditingController _textController = TextEditingController();
  int pageNo = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = MediaQuery.of(context).size.height;
        return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: backgroundColor,
          title: const Text(
            'TASKS',
            style: appBarTextStyle,
          ),
        ),
        body: BaseView<HomeViewModel>(
      builder: (context, model, child) { 
       final _homeViewModel = Provider.of<HomeViewModel>(context);

        switch (_homeViewModel.state) {
            case ViewState.initial:
                 
            case ViewState.loading:
              // return const Center(
              //   child: CircularProgressIndicator(),
              // );
         case ViewState.loaded:
          return  Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
           SizedBox(height: size.height * 0.02),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: const Text(
                "Customer Details ",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2661FA),
                    fontSize: 20),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: size.height * 0.03),
            SizedBox(height: size.height * 0.03),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: RawMaterialButton(
                fillColor: Colors.green,
                splashColor: Colors.greenAccent,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const <Widget>[
                      Text(
                        'Get Customer',
                        maxLines: 1,
                        style: TextStyle(color: Colors.white),
                      ),
                      Icon(
                        Icons.arrow_right_alt,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
                onPressed: () {
                  _homeViewModel.getCusomer('7012969837');

                },
                shape: const StadiumBorder(),
              ),
              
            ),

            if (_homeViewModel.isLoaded) 
            Text(_homeViewModel.customerer!.firstName! + _homeViewModel.customerer!.lastName!,
                        maxLines: 1,
                        style: const TextStyle(color: Colors.black))

          ],
        );
          case ViewState.error:
            break;
        }
                  return const Center(
            child: null,
          );
      },
     )
     );
  }
}