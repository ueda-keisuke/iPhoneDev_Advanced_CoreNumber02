iPhoneDev_Advanced_CoreNumber02
===============================
##Core Assignment #2

Write an iPhone/iPad application that allows the user to keep a simple set of notes.

See iOS Notes applications for a more complex version of this application

* In the main-view-controller:
  * Display a list/table of all saved notes – by title (see below)
    * if no saved notes exist yet, the table is empty
      * Add buttons:
        * Create Note
          When selected; bring up another view with a simple multi-line view-controller, NoteViewController, that supports text entry. See below
      * Delete Note
        Delete a note (see below).
  * Support viewing a note via a touch-up-inside event/action. Viewing a note is a read-only operation.

* Within NoteViewController support adding a new note.
This view controller is displayed when the “Create Note” button is selected in the main-view-controller. 
  * Provide a way for the user to enter a simple multi-line note.
  * Provide a way for the user to enter a title for the new note – the user must enter a title for the note before saving the note.
  * Have a Save button. save the note in a file in your application's document folder in a sub-folder called “MyNotes” and return to the main- view controller. This new note should now be listed in the main-view- controller by title.
  * Have a Cancel Button. Immediately return to the main-view-controller without saving the note.
* As specified above – you need to save each note in a file in your app’s documents directory in sub-folder “MyNotes”.
NOTE: you need to figure out how to come up with unique file names for each file that you save a note in. Notes with the same title are allowed.
* When the application starts you need to find any saved notes and display the title of each saved note in the main-view controller.
* When a note is deleted the underlying file needs to be deleted and the note’s title should not longer appear in the main-view- controller.
