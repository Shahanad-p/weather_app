import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool onclick = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            height: size.height,
            width: size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/9027259.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: kToolbarHeight),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Row(
                            children: [
                              Icon(
                                Icons.location_pin,
                                color: Colors.red,
                              ),
                              SizedBox(width: 10),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Kannur',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Good Morning',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                onclick = !onclick;
                              });
                            },
                            icon: const Icon(Icons.search),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      onclick == true
                          ? Container(
                              height: 50,
                              width: 350,
                              child: TextFormField(),
                            )
                          : SizedBox.shrink()
                    ],
                  ),
                  const SizedBox(height: 80),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Image(
                          height: 150,
                          width: 150,
                          image: AssetImage(
                              'assets/—Pngtree—creative cartoon burger vector material_3177179.png'),
                        ),
                        const Text(
                          '25 C',
                          style: TextStyle(fontSize: 25),
                        ),
                        const Text(
                          'Sunny',
                          style: TextStyle(fontSize: 25),
                        ),
                        const Text('12:30 PM'),
                        const SizedBox(height: 100),
                        Container(
                          height: 180,
                          width: 270,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.3),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(25)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset(
                                      'assets/—Pngtree—creative cartoon burger vector material_3177179.png',
                                      height: 40,
                                      width: 40),
                                  const Column(
                                    children: [
                                      Text('Min Temp'),
                                      Text('20 C'),
                                    ],
                                  ),
                                  Image.asset(
                                      'assets/—Pngtree—creative cartoon burger vector material_3177179.png',
                                      height: 40,
                                      width: 40),
                                  const Column(
                                    children: [
                                      Text('Max Temp'),
                                      Text('20 C'),
                                    ],
                                  ),
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 15, right: 15),
                                child: Divider(
                                  thickness: 3,
                                  color: Colors.white,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset(
                                      'assets/—Pngtree—creative cartoon burger vector material_3177179.png',
                                      height: 40,
                                      width: 40),
                                  const Column(
                                    children: [
                                      Text('Sunrise'),
                                      Text('06:00'),
                                    ],
                                  ),
                                  Image.asset(
                                      'assets/—Pngtree—creative cartoon burger vector material_3177179.png',
                                      height: 40,
                                      width: 40),
                                  const Column(
                                    children: [
                                      Text('Sunset'),
                                      Text('06:40'),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
