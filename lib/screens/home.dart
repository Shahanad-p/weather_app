import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/services/location_provider.dart';
import 'package:weather_app/services/weather_service_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // Provider.of<LocationProvider>(context, listen: false).findThePosition();

    // Provider.of<WeatherServiceProvider>(context, listen: false)
    //     .fetchWeatherDataByCity('dubai');

    final findLocation = Provider.of<LocationProvider>(context, listen: false);

    findLocation.findThePosition().then((_) {
      if (findLocation.currentLocationName != null) {
        var city = findLocation.currentLocationName!.locality;
        if (city != null) {
          Provider.of<WeatherServiceProvider>(context, listen: false)
              .fetchWeatherDataByCity(city);
        }
      }
    });
    super.initState();
  }

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
          Consumer2<LocationProvider, WeatherServiceProvider>(
            builder: (context, location, weatherpro, child) => Container(
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
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_pin,
                                  color: Colors.red,
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      location.currentLocationName?.locality ??
                                          'unknown location',
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),  
                                    const Text(
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
                            ? SizedBox(
                                height: 50,
                                width: 350,
                                child: TextFormField(),
                              )
                            : const SizedBox.shrink()
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
                          Text(
                            weatherpro.weather!.main!.temp!.toString(),
                            style: const TextStyle(fontSize: 25),
                          ),
                          Text(
                            weatherpro.weather!.weather![0].main.toString(),
                            style: const TextStyle(fontSize: 25),
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
          ),
        ],
      ),
    );
  }
}
