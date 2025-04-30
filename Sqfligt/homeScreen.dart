import 'package:flutter/material.dart';
import 'package:sqflightdemo3/dbHelper.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  // List to store notes
  List<Map<String, dynamic>> notes = [];

  // Database helper instance
  Dbhelper? dbHelper;

  @override
  void initState() {
    super.initState();
    dbHelper = Dbhelper.getinstance; // Initialize the database helper instance
    getNotes();
  }

  // Function to add a note
  void getNotes() async {
    notes = await dbHelper!.getAllNotes();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Notes")),
      body:
          notes.isNotEmpty
              ? ListView.builder(
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Card(
                      color: const Color.fromARGB(255, 128, 202, 130),
                      elevation: 10,
                      child: ListTile(
                        leading: Text("${index + 1}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)), 
                        title: Text(notes[index]["title"]),
                        subtitle: Text(notes[index]["description"]),
                        trailing: SizedBox(
                          width: 120,
                          child: Row(
                            children: [
                              // Edit
                              IconButton(
                                color: Colors.blue,
                                onPressed: () {
                                  titleController.text = notes[index]["title"];
                                  descriptionController.text =
                                      notes[index]["description"];
                                         
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return Container(
                                        padding: const EdgeInsets.all(20),
                                        width: double.infinity,
                                        child: Column(
                                          children: [
                                            Text(
                                              "Edit Note",
                                              style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(height: 20),
                    
                                            TextField(
                                              controller: titleController,
                                              decoration: const InputDecoration(
                                                labelText: "Title",
                                              ),
                                            ),
                    
                                            TextField(
                                              controller: descriptionController,
                                              decoration: const InputDecoration(
                                                labelText: "Description",
                                              ),
                                            ),
                    
                                            ElevatedButton(
                                              onPressed: () async {
                                                String title =
                                                    titleController.text;
                                                String description =
                                                    descriptionController.text;
                                                if (title.isNotEmpty &&
                                                    description.isNotEmpty) {
                                                  dbHelper!.updateNotes(
                                                    mid: notes[index]["id"],
                                                    mtitle: title,
                                                    mdescription: description,
                                                  );
                                                  getNotes();
                                                  titleController.clear();
                                                  descriptionController.clear();
                                              
                                                  Navigator.pop(context);
                                                } else {
                                                  showDialog(
                                                    context: context,
                                                    builder: (context) {
                                                      return AlertDialog(
                                                        actions: [
                                                          Text(
                                                            "Please fill all fields",
                                                          ),
                                                          ElevatedButton(
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                context,
                                                              );
                                                            },
                                                            child: const Text(
                                                              "OK",
                                                            ),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                }
                                              },
                                              child: const Text("Update Note"),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                                icon: Icon(Icons.edit),
                              ),
                    
                              // Delete
                              IconButton(
                                color: Colors.red,
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text("Delete Note"),
                                        content: Text(
                                          "Are you sure you want to delete this note?",
                                        ),
                    
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text("Cancel"),
                                          ),
                    
                                          TextButton(
                                            onPressed: () async {
                                              dbHelper!.deleteNote(
                                                mid: notes[index]["id"],
                                              );
                                              getNotes();
                                              Navigator.pop(context);
                                            },
                                            child: Text("Delete"),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                icon: Icon(Icons.delete),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              )
              : Center(child: Text("No notes available")),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return Container(
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                child: Column(
                  children: [
                    Text(
                      "Add Note",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),

                    TextField(
                      controller: titleController,
                      decoration: const InputDecoration(labelText: "Title"),
                    ),

                    TextField(
                      controller: descriptionController,
                      decoration: const InputDecoration(
                        labelText: "Description",
                      ),
                    ),

                    ElevatedButton(
                      onPressed: () async {
                        String title = titleController.text;
                        String description = descriptionController.text;
                        if (title.isNotEmpty && description.isNotEmpty) {
                          dbHelper!.addNote(
                            mtitle: title,
                            mdescription: description,
                          );
                          getNotes();
                          titleController.clear();
                          descriptionController.clear();
                          Navigator.pop(context);
                        } else {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                actions: [
                                  Text("Please fill all fields"),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text("OK"),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                      child: const Text("Add Note"),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
