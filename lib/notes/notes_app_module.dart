import 'package:clean_core/clean_core.dart';
import 'package:flutter/material.dart';

import 'notes_exporter.dart';

class NoteAppModule {
  static final AppModule NOTES_MODULE = AppModule(
    mainModules: [
      AppMainModule(
        moduleName: "Notas",
        moduleIcon: Icons.note_rounded,
        moduleHomePageRouteName: NotesHomepage.ROUTE_NAME,
      ),
    ],
    initScreen: [
      AppModuleInitScreen(
        initName: "Notas",
        initImage: "image src",
        initDescription: "App de notas",
      )
    ],
    utils: [
      AppUtilModule(
        utilName: "Notas Add",
        utilIcon: Icons.note_add_outlined,
        utilPageRouteName: NotesHomepage.ROUTE_NAME,
      )
    ],
  );
}
