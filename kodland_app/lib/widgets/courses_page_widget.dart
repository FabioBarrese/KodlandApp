import 'package:kodland_app/my_objects/my_objects.dart';
import 'package:kodland_app/widgets/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CoursesPageWidget extends StatelessWidget {

  final PageController pageController;
  final updateState;

  const CoursesPageWidget({
    super.key,
    required this.numOfFilters,
    required this.filtersLabels,
    required this.filteredCourses,
    required this.tapedcustomFilterId,
    required this.pageController,
    required this.updateState,
  });

  final int numOfFilters;
  final List<String> filtersLabels;
  final Map<int, List<Course>> filteredCourses;
  final ValueNotifier<int> tapedcustomFilterId;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      builder: (BuildContext context, int value, Widget? child) {
        if (kDebugMode){
          debugPrint('numero filtro premuto: $value');}
        return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('ETA\'',style: Theme.of(context).textTheme.headlineMedium),
              ),
              SingleChildScrollView(
                key: const PageStorageKey<String>("list1Page1"),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(numOfFilters, (index) => 
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomFilter(title: filtersLabels[index],customFilterId: index,),
                  )
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  key: const PageStorageKey<String>("list2Page1"),
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: List.generate(filteredCourses[value]!.length, (index) => 
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CourseWidget(course: filteredCourses[value]![index],pageController: pageController,updateState: updateState,),
                        )
                        ),
                  ),
                ),
              ),
            ],
          );
      },
      valueListenable: tapedcustomFilterId,
    );
  }
}