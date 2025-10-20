import 'package:flutter/material.dart';
import 'package:plantapp/constans/constans.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  bool toggleIsFavorit(bool isFavorit) {
    return !isFavorit;
  }

  final List<String> _plantTypes = [
    '|پیشنهادی|',
    '|آپارتمانی|',
    '|محل کار|',
    '|گل باغچه ای|',
    '|گل سمی|',
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Center(
                child: Container(
                  // padding: const EdgeInsets.symmetric(),
                  width: size.width * 0.9,
                  decoration: BoxDecoration(
                    color: Constans.primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.mic,
                        color: Constans.primaryColor.withOpacity(0.6),
                      ),
                      const Expanded(
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: TextField(
                            textAlign: TextAlign.start,
                            showCursor: false,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(right: 5.0),
                              hintText: "جست‌جو...",
                              border: InputBorder.none,
                            ),
                            style: TextStyle(fontSize: 14.0),
                          ),
                        ),
                      ),
                      const Icon(Icons.search),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10.0),
              height: 70.0,
              width: size.width,
              child: ListView.builder(
                reverse: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Text(
                        _plantTypes[index],
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: selectedIndex == index
                                ? FontWeight.bold
                                : FontWeight.w300,
                            color: selectedIndex == index
                                ? Constans.primaryColor
                                : Constans.blackColor),
                      ),
                    ),
                  );
                },
                scrollDirection: Axis.horizontal,
                itemCount: _plantTypes.length,
              ),
            ),
            //products 1
            SizedBox(
              height: size.height * 0.3,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                reverse: true,
                // itemCount: _plantList.length,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 200.0,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 18.0,
                      ),
                      decoration: BoxDecoration(
                        color: Constans.primaryColor.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 10.0,
                            right: 20.0,
                            child: Container(
                              height: 40.0,
                              width: 40.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.favorite,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                          const Positioned(
                            left: 50.0,
                            right: 50.0,
                            top: 50.0,
                            bottom: 50.0,
                            child: Text("popo"),
                            //  Image.asset(_plantList[index].imageURL),
                          ),
                          Positioned(
                            bottom: 15.0,
                            left: 20.0,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10.0,
                                vertical: 2.0,
                              ),
                              child: Text(
                                // r'$' + _plantList[index].price.toString(),
                                '299',
                                style: TextStyle(
                                  color: Constans.primaryColor,
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                          ),
                          const Positioned(
                            bottom: 15.0,
                            right: 20.0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'شبکه',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  'نرم افزار',
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            //products 2
            Container(
              padding: const EdgeInsets.only(
                right: 18.0,
                bottom: 15.0,
                top: 20.0,
              ),
              alignment: Alignment.topRight,
              child: const Text(
                'گیاهان جدید',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 18.0,
              ),
              height: size.height * 0.3,
              child: ListView.builder(
                itemCount: 5,
                //  itemCount: _plantList.length,
                itemBuilder: (context, index) {
                  return const Text("pouya");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
