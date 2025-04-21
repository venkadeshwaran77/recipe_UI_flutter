// ignore_for_file: unused_local_variable, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:recipe_ui/recipe_model.dart';

class ItemsDetailsScreen extends StatefulWidget {
  final RecipeItems recipeItems;
  const ItemsDetailsScreen({super.key, required this.recipeItems});

  @override
  State<ItemsDetailsScreen> createState() => _ItemsDetailsScreenState();
}

class _ItemsDetailsScreenState extends State<ItemsDetailsScreen> {
  @override
  Widget build(BuildContext context) {
Size size = MediaQuery.of(context).size;
return Scaffold(
body:SizedBox(
height:size.height,
child:Stack(
children: [
Container(
height:size.height*0.55,
decoration:BoxDecoration(
image:DecorationImage(
image:AssetImage(
widget.recipeItems.image,
),
fit:BoxFit.cover
),
),
),
Positioned(
top:50,
left:20,
child:CircleAvatar(
backgroundColor:Colors.black38,
child:InkWell(
onTap:() =>Navigator.pop(context),
child:Icon(
Icons.arrow_back_rounded,
color:Colors.white,
),
),
), 
),
Positioned(
bottom:0,
child:Container(
height:size.height*0.5,
width:size.width,
decoration:BoxDecoration(
borderRadius:BorderRadius.only(
topRight:Radius.circular(60),
),
color:Colors.white
),
child:Padding(
padding:EdgeInsets.symmetric(horizontal:20),
child:Column(
children: [
SizedBox(height:50),
Row(
children: [
CircleAvatar(
radius:22,
backgroundImage:NetworkImage(
widget.recipeItems.woner,
),
),
SizedBox(width:10),
Expanded(
child:Column(
crossAxisAlignment:CrossAxisAlignment.start,
children: [
Text(
widget.recipeItems.wonerName,
maxLines:1,
style:TextStyle(
height:0,
fontSize:16,
color:Colors.black,
),
),
SizedBox(height:5),
Text(
"12 Recipes Shared",
style:TextStyle(
height:0,
fontSize:12,
color:Colors.black.withOpacity(0.6),
),
),
],
),
),
Column(
crossAxisAlignment:CrossAxisAlignment.end,
children: [
Row(
children: [
Text("${widget.recipeItems.rate}",
style: TextStyle(
fontSize:12,
fontWeight:FontWeight.w500,
),
),
SizedBox(width:5),
RatingBar.builder(
itemSize:15,
initialRating:widget.recipeItems.rate,
unratedColor:Colors.grey.shade400,
itemBuilder:(context,index){
return Icon(
Icons.star,
color:Colors.amberAccent,
);
},
onRatingUpdate:(value) {},
),
],
),
SizedBox(height:5),
Text(
"[${widget.recipeItems.reviews} Reviews]",
style:TextStyle(
fontSize:12,
color:Colors.black.withOpacity(0.6),
),
),
],
),
],
),
SizedBox(height:30),
Row(
children: [
Column(
children: [
Text(
widget.recipeItems.name,
style:TextStyle(
fontSize:17,
fontWeight:FontWeight.w600,
color:Colors.black,
),
),
SizedBox(height:2),
Text(
"1 Bowl (${widget.recipeItems.weight}g)",
style:TextStyle(
fontSize:13,
color:Colors.black45,
),
),
],
),
Spacer(),
Text(
"See details",
style:TextStyle(
color:Colors.green,
fontWeight:FontWeight.bold,
),
),
],
),
SizedBox(height:30),
Row(
mainAxisAlignment:MainAxisAlignment.spaceBetween,
children: [
MyProgressIndicatorValue(
name:"Carbs" , 
amount:"${widget.recipeItems.carb} g", 
percentage:"(56%)",
color:Colors.green, 
data:0.4, 
),
],
),
],
),
),
),
),
Positioned(
bottom:size.height*0.5,
child:ClipPath(
clipper:MyClipper(),
child:Container(
height:70,
width:70,
decoration:BoxDecoration(
color:Colors.white,
),
),
), 
),
Positioned(
bottom: size.height * 0.48,
right:30,
child:Container(
padding:EdgeInsets.all(7),
decoration:BoxDecoration(
shape: BoxShape.circle,
boxShadow:[
BoxShadow(
color:Colors.grey.shade200,
spreadRadius: 5,
),
],
color:widget.recipeItems.fav
? Colors.red
: Colors.black45,
),
child:Icon(
Iconsax.heart,
color:Colors.white,
),
), 
),
],
),
),
);
}
}
class MyProgressIndicatorValue extends StatelessWidget {
final String? name,amount;
final String percentage;
final Color color;
final double data;
const MyProgressIndicatorValue ({
super.key,
required this.name,
required this.amount,
required this.percentage,
required this.color,
required this.data,
});
@override
Widget build(BuildContext context) {
return CircularPercentIndicator(
radius: 20,
circularStrokeCap: CircularStrokeCap.round,
percent: data,
lineWidth: 7,
reverse: true,
backgroundColor: color.withOpacity(0.2),
animation: true,
animationDuration: 500,
restartAnimation: true,
progressColor: color,
header: Padding(
padding: const EdgeInsets.only(bottom: 5),
child: Text(
name!,
style: TextStyle(
color: Colors.black.withOpacity(0.6),
fontSize: 12,
),
),
),
footer: Padding(
padding: const EdgeInsets.only(top: 5),
child: RichText(
text: TextSpan(
children: [
TextSpan(
text: '$amount ',
style: const TextStyle(
color: Colors.black,
fontSize: 12,
),
),
TextSpan(
text: percentage,
style: TextStyle(
color: color,
fontWeight: FontWeight.bold,
fontSize: 12,
),
),
],
),
),
),
);
}
}

class MyClipper extends CustomClipper<Path>{
@override
Path getClip(Size size) {
var path = Path();
path.lineTo(0, size.height);
path.lineTo(size.width,size.height);
path.quadraticBezierTo(0,size.height, 0, 0);
path.close();
return path;
}
@override
bool shouldReclip(CustomClipper<Path>oldClipper) =>false;
}