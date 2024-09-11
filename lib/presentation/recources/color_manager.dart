import 'dart:ui';

// Centeralized Class for managing Colors

class ColorManager{
  // static Color primary = const Color(0xffED9728);
  // static Color darkGrey = const Color(0xff525252);
  // static Color grey = const Color(0xff737470);
  // static Color lightGrey = const Color(0xff9E9E9E);

   static Color primary = HexColor.fromHex("#ED9728");
   static Color darkGrey = HexColor.fromHex("#525252");
   static Color grey = HexColor.fromHex("#737470");
   static Color lightGrey = HexColor.fromHex("#9E9E9E");
   static Color primaryOpecity70 = HexColor.fromHex("#B3ED9728");


   // new colors

   static Color darkPrimary = HexColor.fromHex("#d17d11");
   static Color grey1 = HexColor.fromHex("#707070");
   static Color grey2 = HexColor.fromHex("#797979");
   static Color white = HexColor.fromHex("#FFFFFF");
   static Color error = HexColor.fromHex("#e61f34");


}

extension HexColor on Color{
  static Color fromHex(String hexColorString){
    hexColorString = hexColorString.replaceAll("#", "");
    if(hexColorString.length == 6){
      hexColorString = "FF"+hexColorString; // 8 char without Opecity

    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}