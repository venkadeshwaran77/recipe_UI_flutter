// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:recipe_ui/categories.dart';
import 'package:recipe_ui/colors.dart';
import 'package:recipe_ui/recipe_model.dart';

class HomeScreenRecipe extends StatefulWidget {
  const HomeScreenRecipe({super.key});

  @override
  State<HomeScreenRecipe> createState() => _HomeScreenRecipeState();
}

class _HomeScreenRecipeState extends State<HomeScreenRecipe> {
int selectedIndex =0;
int selectedPage = 0;
  List<IconData> icons = [
    Iconsax.home1,
    Icons.bar_chart_rounded,
    Iconsax.heart,
    Icons.person_outline_rounded,
  ];
  @override
  Widget build(BuildContext context) {
 return Scaffold(
backgroundColor:recipeAppBackground,
body:SingleChildScrollView(
child: SafeArea(
child:Column(
children: [
headerParts(),
SizedBox(height:30),
mySearchField(),
SizedBox(height:40),
Padding(
padding:EdgeInsets.symmetric(horizontal:20),
child:Row(
mainAxisAlignment:MainAxisAlignment.spaceBetween,
children: [
Text(
"Popular menus",
style:TextStyle(
fontSize:20,
fontWeight:FontWeight.w600,
),
),
Text(
"See all",
style:TextStyle(
fontSize:14,
color:Colors.green,
fontWeight:FontWeight.w500,
),
),
],
), 
),
SizedBox(height:20),
popularMenuItems(),
SizedBox(height:20),
SingleChildScrollView(
scrollDirection:Axis.horizontal,
child:Row(
children:List.generate(recipeItems.length,(index){
final recipe = recipeItems[index];
return Padding(
padding:index ==0
? EdgeInsets.only(left:20,right:10)
: EdgeInsets.only(right:10),
child:GestureDetector(
onTap:(){},
child:Container(
height:260,
width:MediaQuery.of(context).size.width /2.45,
decoration:BoxDecoration(
borderRadius:BorderRadius.circular(8),
image:DecorationImage(
image:AssetImage(
recipe.image,
),
fit:BoxFit.cover,
),
),
child:Column(
mainAxisAlignment:MainAxisAlignment.spaceBetween,
crossAxisAlignment:CrossAxisAlignment.end,
children: [
Container(
padding:EdgeInsets.all(5),
margin:EdgeInsets.all(5),
decoration:BoxDecoration(
shape:BoxShape.circle,
color:recipe.fav
? Colors.red
:Colors.black45,
),
child:Icon(
Iconsax.heart,
color:Colors.white,
size:18,
),
),
Container(
padding:EdgeInsets.all(10),
decoration:BoxDecoration(
borderRadius:BorderRadius.circular(10),
color:Colors.black45,
),
child:Column(
crossAxisAlignment:CrossAxisAlignment.start,
children: [
Row(
children: [
Expanded(
child:Text(
recipe.name,
maxLines:1,
style:TextStyle(
fontSize:16,
height:0,
color:Colors.white,
fontWeight:FontWeight.w500,
),
),
),
Row(
children: [
Icon(
Icons.star,
color:Colors.amberAccent,
size:18,
),
Text(
"${recipe.rate}",
style:TextStyle(
height:0,
color:Colors.white,
),
),
],
),
],
),
SizedBox(height:3),
Text(
"1 Bowl (${recipe.weight}g)",
style:TextStyle(
color:Colors.white70,
fontSize:12,
height:0,
),
),
SizedBox(height:3),
Text(
"${recipe.calorie} Kkal | 25% AKG",
style:TextStyle(
color:Colors.white70,
),
),
],
),
),
],
),
),
),
);
}
),
),
),
SizedBox(height:40),
Padding(
padding:EdgeInsets.symmetric(horizontal:20),
child:Row(
mainAxisAlignment:MainAxisAlignment.spaceBetween,
children: [
Text(
"Categories",
style:TextStyle(
fontSize:20,
fontWeight:FontWeight.w600,
),
),
Text(
"See all",
style:TextStyle(
fontSize:14,
color:Colors.green,
fontWeight:FontWeight.w500,
),
),
],
), 
),
SizedBox(height:10),
categoryItems(),
Padding(
padding: const EdgeInsets.all(40),
child: Row(
children: [
Container(
height: 40,
width: 40,
decoration:BoxDecoration(
shape: BoxShape.circle,
image: DecorationImage(
image: NetworkImage(
"https://kgo.googleusercontent.com/profile_vrt_raw_bytes_1587515369_10614.jpg",
),
fit: BoxFit.cover,
),
),
),
SizedBox(width: 20),
Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(
"Sanjeev Kapoor",
style: TextStyle(
fontWeight: FontWeight.bold,
color: Colors.black,
fontSize: 14,
),
),
Text(
"Expert Chef",
style: TextStyle(
color: Colors.black.withOpacity(0.5),
fontSize: 12,
),
),
],
),
],
)
),
],
),
),
),
bottomSheet:Container(
height:80,
decoration:BoxDecoration(
color:Colors.white,
boxShadow:[
BoxShadow(
color:Colors.black12,
spreadRadius:1,  
)
]
),
child:Row(
mainAxisAlignment:MainAxisAlignment.spaceEvenly,
children:List.generate(
icons.length,
(index) => GestureDetector(
onTap:(){
setState(() {

});
selectedPage = index;
},
child:SizedBox(
height:40,
width:40,
child:Column(
crossAxisAlignment:CrossAxisAlignment.center,
mainAxisAlignment:MainAxisAlignment.spaceBetween,
children: [
Icon(
icons[index],
color:index == selectedPage
? Colors.green
: Colors.grey,
size:28,
),
index == selectedPage
? Container(
height:3,
width:30,
decoration:BoxDecoration(
borderRadius:BorderRadius.circular(10),
color:Colors.green,
),
)
: SizedBox(),
],
),
),
),
),
),
),
);
}
SingleChildScrollView categoryItems() {
return SingleChildScrollView(
scrollDirection:Axis.horizontal,
child:Row(
children:List.generate(
recipeCategory.length,
(index) => Padding(
padding:index ==0
? EdgeInsets.only(left:20,right:20)
: EdgeInsets.only(right:20),
child:Column(
children: [
CircleAvatar(
radius:33,
backgroundColor:recipeCategory[index].color,
child:Image.asset(
recipeCategory[index].image,
height:40,
width:40,
),
),
SizedBox(height:5),
Text(
recipeCategory[index].name,
style:TextStyle(
fontSize:12,
fontWeight:FontWeight.bold,
color:Colors.black,
),
),
],
),
),
),
),
);
}
SingleChildScrollView popularMenuItems() {
return SingleChildScrollView(
scrollDirection:Axis.horizontal,
child:Row(
children: List.generate(
menuItems.length,
(index)=> Padding(
padding:EdgeInsets.only(left:20),
child:GestureDetector(
onTap:(){
setState(() {

});
selectedIndex = index;
},
child:Container(
padding:EdgeInsets.symmetric(
horizontal:15,
vertical:7,
),
decoration:BoxDecoration(
borderRadius:BorderRadius.circular(20),
gradient:LinearGradient(
colors:[
selectedIndex == index 
? Colors.green
: Colors.white,
selectedIndex == index
? Colors.greenAccent
: Colors.white,
], 
)
),
child:Text(
menuItems [index],
style:TextStyle(
fontSize:15,
fontWeight:selectedIndex == index
? FontWeight.bold
: FontWeight.w500
),
),
),
), 
),
),
),
);
}
Padding mySearchField() {
return Padding(
padding:EdgeInsets.symmetric(horizontal:20),
child:Container(
decoration:BoxDecoration(
borderRadius:BorderRadius.circular(35),
color:searchBarColor,
),
child:TextField(
decoration:InputDecoration(
border:InputBorder.none,
prefixIcon:Icon(
Iconsax.search_normal,
),
hintText:"Search",
hintStyle:TextStyle(
color:Colors.black26,
),
contentPadding:EdgeInsets.symmetric(vertical:15),
),
),
),
);
}
Padding headerParts() {
return Padding(
padding: const EdgeInsets.symmetric(horizontal:20),
child: Row(
children: [
Text.rich(
TextSpan(
children:[
TextSpan(
text:"Hello Venkey,\n",
style:TextStyle(fontSize:16),
),
TextSpan(
text:"What do you want to eat today?",
style:TextStyle(
fontSize:13,
color:Colors.black45,
),
),
],
),
),
Spacer(),
Stack(
children: [
CircleAvatar(
radius:20,
backgroundColor:Colors.white,
backgroundImage:NetworkImage(
"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKnc5WzhI2eJPpbZEPp-3mcfpdlt_BM3eLJw&s",
),
),
Positioned(
right:1,
top:1,
child:Container(
height:9,width:9,
decoration:BoxDecoration(
shape:BoxShape.circle,
border:Border.all(color:Colors.white),
color:Colors.green,
),
), 
),
],
),
],
),
);
}
}
