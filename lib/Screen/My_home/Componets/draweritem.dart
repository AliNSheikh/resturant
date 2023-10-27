import 'package:flutter/material.dart';
class DrawerItem extends StatelessWidget {
  const DrawerItem({Key? key,
    required this.name,
    required this.icon,
    required this.onPressed});
  final String name;
  final IconData icon;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
     child: SizedBox(
       height: 50,
       child: Row(
         children: [
           Icon(icon,size:25,color:Colors.orange),
           SizedBox(width:30,),
           Text(name,style: TextStyle(
             fontSize: 25,
             color: Colors.white
           ),)
         ],
       ),
     ),
    );
  }
}
