import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyContainer extends StatelessWidget {
  final String text;
  final String text2;
  final IconData icon;
  final VoidCallback onPressed;


  const MyContainer({Key? key, required this.text, required this.text2, required this.icon, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child:Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),

        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(

            height: 66,
            width: 150,

            child: Row(
              children: [
                IconButton(icon: Icon(icon), onPressed: onPressed, ),
                SizedBox(width: 16.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      text,
                      style: GoogleFonts.inter(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 4,),
                    Text(
                      text2,
                      style: GoogleFonts.inter(fontSize: 14.0,fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyContainer2 extends StatelessWidget {
  final String text;
  final String text2;
  final IconData icon;
  final VoidCallback onPressed;


  const MyContainer2({Key? key, required this.text, required this.text2, required this.icon, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child:Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),

        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: SizedBox(

            height: 100,
            width: 100,

            child: Column(
              children: [
                IconButton(icon: Icon(icon),color: Colors.blue, onPressed:onPressed,),
                SizedBox(width: 16.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      text,
                      style: GoogleFonts.inter(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text(
                      text2,
                      style: GoogleFonts.inter(fontSize: 14.0),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
