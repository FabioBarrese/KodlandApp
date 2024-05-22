import 'package:kodland_app/screens/screens.dart';
import 'package:flutter/material.dart';

class CustomFilter extends StatefulWidget implements PreferredSizeWidget {
  
  final String title;
  final int customFilterId;

  const CustomFilter({
    super.key,
    required this.title,
    required this.customFilterId
  });
  
  @override
  Size get preferredSize => const Size.fromHeight(50.0);
  
  @override
  State<StatefulWidget> createState() {
    return _CustomFilterState();
  }
}

class _CustomFilterState extends State<CustomFilter>{

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() {
        HomeScreen.tapedcustomFilterId.value = widget.customFilterId;
      }),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: const Color.fromARGB(255, 92, 139, 252)),
          color: HomeScreen.tapedcustomFilterId.value != widget.customFilterId ?  const Color.fromARGB(255, 255, 255, 255) : const Color.fromARGB(255, 92, 139, 252),
          borderRadius: BorderRadius.circular(20),
        ),
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ), 
          child: HomeScreen.tapedcustomFilterId.value != widget.customFilterId ? Text(widget.title,style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.black)) : Text(widget.title,style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.white)),
      ),
    );
  }
}
