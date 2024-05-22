import 'package:kodland_app/my_objects/my_objects.dart';
import 'package:kodland_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/';
  static ValueNotifier<int> tapedcustomFilterId = ValueNotifier<int>(0);
  static int tapedCourseId = 0;
  static const int numOfFilters = 7;
  static const List<String> filtersLabels = [
    'Tutti',
    '5-7',
    '8-10',
    '8-12',
    '10-12',
    '10+',
    '13+',
  ];
  
  static List<Course> courses = [
    Course(id: 1, minAge: 5, maxAge: 7, name: 'FunTech', imagePath: 'lib/images/funtech.png', description: "Attività divertenti per insegnare ai bambini l'ABC del computer, il coding e la creatività digitale, sviluppando le loro capacità logiche e di pensiero critico!", skills: ["Abilità nell'usare il computer",'Programmazione','Matematica','Creazione'],
    level: Level("Principiante"),prerequisites: "Utente PC",duration: PositiveInteger(32)),
    Course(id: 2, minAge: 8, maxAge: 10, name: 'Programmazione visiva su Scratch', imagePath: 'lib/images/scratch.png', description: 'La programmazione visiva in Scratch e gli algoritmi di base per creare giochi e cartoni animati', skills: ['Scratch','Creatività','Sviluppo di giochi','Animazione'],
    level: Level("Principiante"),prerequisites: "Utente PC",duration: PositiveInteger(32)),
    Course(id: 3, minAge: 8, maxAge: 12, name: 'Sviluppo giochi Roblox', imagePath: 'lib/images/roblox.png', description: 'Un motore per giochi potente per le tue idee!', skills: ['Roblox','LUA','Programmazione','Game design'],
    level: Level("Principiante"),prerequisites: "Utente PC",duration: PositiveInteger(32)),
    Course(id: 4, minAge: 10, maxAge: 12, name: 'Design di Mondi Fantastici', imagePath: 'lib/images/designmf.png', description: 'Diventa creativo: crea il tuo fantastico mondo immaginario!', skills: ['Illustrazione','Design','Animazione','3D'],
    level: Level("Principiante"),prerequisites: "Utente PC",duration: PositiveInteger(32)),
    Course(id: 5, minAge: 10, maxAge: 17, name: 'Programmazione su Python', imagePath: 'lib/images/python.png', description: 'Corso di base su python che mira a insegnare le principali abilità di programmazione', skills: ['Programmazione','Python','Pygame','Sviluppo di giochi'],
    level: Level("Principiante"),prerequisites: "Utente PC",duration: PositiveInteger(32)),
    Course(id: 6, minAge: 13, maxAge: 17, name: 'Unity', imagePath: 'lib/images/unity.png', description: 'Questo corso copre le competenze necessarie, utilizzando Unity 3D, la piattaforma standard del settore che consente ai creatori di dare vita alle loro visioni', skills: ['Programmazione','3D','C#','Game Engines','Sviluppo di giochi'],
    level: Level("Principiante"),prerequisites: "Utente PC",duration: PositiveInteger(32)),
    Course(id: 7, minAge: 13, maxAge: 17, name: 'Python PRO', imagePath: 'lib/images/python_pro.png', description: "Impara Python creando bot Discord, siti web, e utilizzando l'intelligenza artificiale. Al termine, crea progetti open-source e partecipa a un hackathon sul riscaldamento globale", skills: ['API', 'HTML', 'Estrazione dei dati', 'Intelligenza artificiale'],
    level: Level("Principiante"),prerequisites: "Utente PC",duration: PositiveInteger(32)),
  ];

  static var filteredCourses = {
    0: courses, 
    1: [courses[0]], 
    2: [courses[1]],
    3: [courses[1],courses[2],courses[3]],
    4: [courses[3]],
    5: [courses[3],courses[4],courses[5],courses[6]],
    6: [courses[5],courses[6]]
  };

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const HomeScreen());
  }
}

class _HomeScreenState extends State<HomeScreen> {
  final _pageController = PageController();
  bool isScrollable = false;

  updateState() {
    setState(() {
      isScrollable = true;
      _pageController.animateToPage(2, duration: const Duration(milliseconds: 200), curve: Curves.linear);

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'kodland',),
      body: PageView(
        onPageChanged: (value) => setState(() {
          value == 0 ? isScrollable = false : isScrollable = true;
        }),
        controller: _pageController,
        physics: isScrollable ? const AlwaysScrollableScrollPhysics() : const NeverScrollableScrollPhysics(),
        children: [
          //page 1
          CoursesPageWidget(numOfFilters: HomeScreen.numOfFilters, filtersLabels: HomeScreen.filtersLabels, filteredCourses: HomeScreen.filteredCourses, tapedcustomFilterId: HomeScreen.tapedcustomFilterId,pageController: _pageController,updateState: updateState,),
          //page 2
          CoursePageWidget(course: HomeScreen.courses[HomeScreen.tapedCourseId])
          
        ]
        ),
      bottomNavigationBar: const CustomNavBar(),
    );
  }
}