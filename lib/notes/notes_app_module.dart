import 'package:clean_core/clean_core.dart';
import 'package:flutter/material.dart';

import 'notes_exporter.dart';

class NoteAppModule {
  static void init() {
    AppModuleRegister.register(
      NOTES_MODULE,
    );
  }

  static final AppModule NOTES_MODULE = AppModule(
    mainModules: [
      AppMainModule(
        moduleName: "Notas",
        moduleIcon: Icons.note_rounded,
        moduleHomePage: NotesHomepage(
          title: "nota 1",
        ),
      ),
      AppMainModule(
        moduleName: "Notas 2",
        moduleIcon: Icons.note_rounded,
        moduleHomePage: NotesHomepage(
          title: "nota 2",
        ),
      ),
    ],
    initScreen: [
      AppModuleInitScreen(
        initName: "Notas",
        initImage: "image src",
        initDescription: "App de notas",
      ),
      AppModuleInitScreen(
        initName: "Notas 2",
        initImage: "image src",
        initDescription: "App de notas 2",
      )
    ],
    utils: [
      AppUtilModule(
        utilName: "Notas Add",
        utilIcon: Icons.note_add_outlined,
        utilPage: NotesHomepage(
          key: ValueKey(3),
          title: "nota 3",
        ),
      ),
      AppUtilModule(
        utilName: "Notas Add 2",
        utilIcon: Icons.note_add_outlined,
        utilPage: NotesHomepage(
          key: ValueKey(4),
          title: "nota 4",
        ),
      )
    ],
  );
}
