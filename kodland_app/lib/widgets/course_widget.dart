import 'package:kodland_app/my_objects/my_objects.dart';
import 'package:kodland_app/screens/screens.dart';
import 'package:flutter/material.dart';

class CourseWidget extends StatefulWidget implements PreferredSizeWidget {
  
  final Course course;
  final pageController;
  final updateState;

  const CourseWidget({
    super.key,
    required this.course,
    required this.pageController,
    required this.updateState
  });
  
  @override
  Size get preferredSize => const Size.fromHeight(50.0);
  
  @override
  State<StatefulWidget> createState() {
    return _CourseWidgetState();
  }
}

class _CourseWidgetState extends State<CourseWidget>{
  bool isSelected = false;
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() {
        HomeScreen.tapedCourseId = widget.course.id - 1;
        widget.updateState();
        //Navigator.pushNamed(context, '/product');
      }),
      onTapUp: (_) => setState(() {
        isSelected = !isSelected;
      }),
      child: Container(
        //height: MediaQuery.of(context).size.height/2,
        decoration: BoxDecoration(
          //border: Border.all(color: const Color.fromARGB(255, 92, 139, 252)),
          color: const Color.fromARGB(255, 240, 243, 255),
          borderRadius: BorderRadius.circular(20),
        ),
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ), 
          child: Column(
            children: [
              _header(),
              const SizedBox(height: 50,),
              _description(context),
              const SizedBox(height: 50,),
              _skills()
            ],
          ),
      ),
    );
  }

  Text _description(BuildContext context) => Text(widget.course.description,style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.normal));

  Row _header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('ETA\' ${widget.course.minAge}-${widget.course.maxAge}'),
                      const SizedBox(height: 10,),
                      Text(widget.course.name,style: Theme.of(context).textTheme.headlineMedium,),
                    ],
                  ),
                ),
                SizedBox(
                  width: 100,
                  height: 100,
                  child: Image.asset(widget.course.imagePath)),
              ],
            );
  }

  GridView _skills() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 8,mainAxisSpacing: 8,mainAxisExtent: 50 ), 
            itemBuilder: (context,index) {
              return _customContainer(index, context);
            },
            itemCount: widget.course.skills.length,
            );
  }

  Container _customContainer(int index, BuildContext context) {
    return Container(
    decoration: BoxDecoration(
      //border: Border.all(color: const Color.fromARGB(255, 92, 139, 252)),
      color:const Color.fromARGB(255, 255, 255, 255),
      borderRadius: BorderRadius.circular(20),
    ),
      //padding: const EdgeInsets.all(40),
      child: Center(child: Text(widget.course.skills[index],style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.black,fontWeight: FontWeight.normal))),
            );
  }
}
