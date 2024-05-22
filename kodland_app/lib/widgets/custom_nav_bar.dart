import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: const Color.fromARGB(255, 211, 253, 105),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
      
          IconButton(
            icon: const Icon(Icons.home,color: Colors.black,),
            tooltip: 'Go to home page',
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
          ),
      
          IconButton(
            icon: const Icon(Icons.shopping_cart,color: Colors.black,),
            tooltip: 'Go to cart page',
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
          ),
      
          IconButton(
            icon: const Icon(Icons.person,color: Colors.black,),
            tooltip: 'Go to user page',
            onPressed: () {
              Navigator.pushNamed(context, '/user');
            },
          ),
        
        ],
              ),
        );
  }
}