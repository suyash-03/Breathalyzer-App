import 'package:breathalyzer_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DietScreen extends StatefulWidget {
  const DietScreen({Key? key}) : super(key: key);

  @override
  State<DietScreen> createState() => _DietScreenState();
}

class _DietScreenState extends State<DietScreen> {
  List<String> items = ['Vegan', 'Veg', 'Non-Veg'];
  String? selectedItem;
  String veganTxt = '';
  String vegTxt = '';
  String nonVegTxt = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BrandColor.drawerBackgroundColor,
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20,50,20,20),
              child: Center(
                child: Text("Choose the type of diet",
                    style: GoogleFonts.poppins(color: Colors.white,fontSize: 24)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(color: Colors.grey[300]),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: DropdownButton<String>(
                        value: selectedItem,
                        isExpanded: true,
                        items: items
                            .map((valueItem) => DropdownMenuItem(
                            value: valueItem,
                            child: Text(
                              valueItem,
                              style: GoogleFonts.poppins(fontSize: 24),
                            )))
                            .toList(),
                        onChanged: (newValue) {
                          setState(() {
                            selectedItem = newValue;
                          });
                        }),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Container(
                height: 600,
                decoration: BoxDecoration(
                    color: BrandColor.categoriesBtnTextcolor,
                    borderRadius: BorderRadius.circular(15)),
                child: Center(
                    child: Text(
                      selectedItem == 'Vegan'
                          ? "Breakfast :\nSoaked Almonds x5\nSoya Milk x 300mL\nSoaked moong x 80 gms\nPoha x 1/2 cup\n \nLunch:\nChapati x 2\nRice x 1 cup\nSoya chunks x 50 gms\nDal x 1 cup\nTomato salad x 1 cup\n\nDinner:\nSalad x 100gms\nChapati x 1\nDal x 1 cup\nGreen vegetable x 100 gms\nTofu - 50 gms"
                          : selectedItem == 'Veg'
                          ? "Breakfast:\nSoaked almonds x 5\nMilk x 300mL\nSoaked moong x 80 gms \nPoha x 1/2 cup\n\nLunch:\nChapati x 2\nRice x 1 cup\nPaneer x 50 gms \nDal x 1 cup\nCurd x 1 cup \n\nDinner:\nSalad x 100gms\nChapati x 1 \nDal x 1 cup\nGreen vegetable x 100 gms"
                          : selectedItem == 'Non-Veg'
                          ? "Breakfast:\nWhole eggs x 2\nEgg whites x 2\nMilk x 300 ml \nBread x 2 slices\n\nLunch:\nChicken breast x 100 gms \nBrown Rice x 1 cup\nDal x 1 cup \nCurd x 1 cup\n\nDinner:\nFish x 50 gms \nSalad x 100 gms \nGreen veggies x 100 gms \nChapati x 2"
                          : "Please select diet type from the drop down menu",
                      style:  GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600,color: Colors.white),
                    )),
              ),
            ),
            SizedBox(height: 50,),
          ],
        ));
  }
}