import 'package:flutter/material.dart';
import 'package:noteso_app/misc/colors.dart';
import 'package:noteso_app/widgets/app_large_text.dart';
import 'package:noteso_app/widgets/app_text.dart';
import 'package:noteso_app/widgets/responsive_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = ["welcome-one.png", "welcome-two.png", "welcome-three.png"];
  List text = [
    "Trips",
    "Mountain",
    "Adrenalin",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: ((_, index) {
            return Container(
              width: double.maxFinite, // ekranın tümünü kaplaması için
              height: double.maxFinite, // ekranın tümünü kaplaması için
              decoration: BoxDecoration(
                // görsel geleceği için
                image: DecorationImage(
                  image: AssetImage("img/" +
                          images[
                              index] // imajları liste olarak tanımladık ve sonra assete gösterdik.
                      ),
                  fit: BoxFit
                      .cover, // görselin sağından ve solundan fit olması için.
                ),
              ),
              child: Container(
                margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start, // metinleri sola hizalar
                      children: [
                        AppLargeText(
                            text: text[
                                index]), // app_large_text.dart classından geliyor
                        const AppText(text: "Mountain", size: 30),
                        const SizedBox(
                          height: 20,
                        ), // app_text.dart classından geliyor
                        SizedBox(
                          width: 250,
                          child: AppText(
                            text:
                                "Mountain hikes give you an incredible sense of freedom along with endurance test",
                            color: AppColors.textColor2,
                            size: 14,
                          ),
                        ),
                        const SizedBox(height: 40),
                        ResponsiveButton(width: 120) //responsive_button.dart
                      ],
                    ),
                    Column(
                      //Slider dots
                      children: List.generate(3, (indexDots) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 2),
                          width: 8,
                          height: index == indexDots
                              ? 25
                              : 8, //image index sayısı list index sayısına eşit ise
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: index == indexDots
                                  ? AppColors.mainColor
                                  : AppColors.mainColor.withOpacity(0.3)),
                        );
                      }),
                    )
                  ],
                ),
              ),
            );
          })),
    );
  }
}
