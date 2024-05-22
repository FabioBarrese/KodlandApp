import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 211, 253, 105),
      title: Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ), 
        child: Text(title,style: Theme.of(context).textTheme.headlineLarge),
      ),
      actions: [IconButton(onPressed: (){
        Navigator.pushNamed(context, '/wishlist');
      }, 
      icon: const Icon(Icons.favorite,color: Color.fromARGB(255, 0, 0, 0),)
      )
      ],
    );
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(50.0);
}
