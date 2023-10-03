import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:image_picker/image_picker.dart';
import 'package:tonyyaooo/screens/home/discussion/view/discussion_screen.dart';

enum ButtonState {init, loading, done}

class PostSharing extends StatefulWidget {
  const PostSharing({super.key, required this.title});

  final String title;


  @override
  State<PostSharing> createState() => _PostSharingState();
}

class _PostSharingState extends State<PostSharing> {
  final TextEditingController textController = TextEditingController();
  ButtonState state = ButtonState.init;
  bool isAnimating = true;

  _PostSharingState() {
    SelectChord();

  }
  String test = "";

  Future<void> SelectChord() async {
    print("hello trying to select a chord");
    Map<String, String> headers = {
      "Connection": "Keep-Alive",
      "Keep-Alive": "timeout=5, max=1000"
    };

    http.MultipartRequest request = http.MultipartRequest(
        'POST', Uri.parse('https://tonyintroduction.jackwagner7.repl.co/add/1/2')); //post request to URL/analize
    request.headers.addAll(headers);

    await request.send().then((r) async {
      print(r.statusCode);
      if (r.statusCode == 200) {
        r.stream.bytesToString().then((value) {
          print(jsonDecode(value));
          setState(() {
            test = jsonDecode(value).toString();
          });
        }
        );
      }
    });
  }


  uploadPostToFirebase() async {
    if (textController.text==null){
      return;
    }
    if (isUploading){
      return;
    }
    final user = FirebaseAuth.instance.currentUser;
    if (user==null){
      return;
    }
    isUploading = true;

    String imageURL = "Null";
    final date = DateTime.now().toString();

    // Create a storage reference from our app
    Reference storageRef = FirebaseStorage.instance.ref();
    Reference refDirImage = storageRef.child('images');
    print(date);
    Reference referenceImageToUpload = refDirImage.child((user.displayName ?? "Unknown" ": ")+ date.toString());

    if (file!=null){
      try{
        await referenceImageToUpload.putFile(File(file));
        imageURL = await referenceImageToUpload.getDownloadURL();
      }catch(error){
        print(error);
      }
    }

    final post = <String, Object>{
      "sender": user?.displayName ?? "Unknown",
      "email": user?.email ?? "Unknown",
      "time": date,
      "body": textController.text,
      "imageURL": imageURL,
      "likeNumber": 0,
      "commentNumber": 0,
      "shareNumber": 0
    };

    db.collection("posts")
        .doc((user?.displayName ?? "Unknown") + ": "+DateTime.now().toString())
        .set(post)
        .whenComplete(() => (){print("complete"); isUploading = false;})
        .onError((e, _) => print("Error writing document: $e"));
  }

  Widget buildButton()=>OutlinedButton(
    style: OutlinedButton.styleFrom(
        minimumSize: const Size.fromHeight(60),
        shape: const StadiumBorder(),
        side: const BorderSide(width: 2, color: Colors.indigo)
    ),
    onPressed: () async{
      setState(()=> state = ButtonState.loading);
      await uploadPostToFirebase();
      setState(()=> state = ButtonState.done);
      await Future.delayed(Duration(seconds: 3));
      setState(()=> state = ButtonState.init);
    },
    child: const FittedBox(
      child: Text(
          "Share",
          style: TextStyle(
              color: Colors.indigo,
              fontSize: 24,
              letterSpacing: 1.2,
              fontWeight: FontWeight.w600
          )
      ),
    ),
  );

  Widget buildSmallButton(bool isDone){
    final color = isDone ? Colors.green :Colors.indigo;
    return Container(
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      child: Center(
        child: isDone
            ?const Icon(Icons.done, size: 52, color: Colors.white,)
            :const CircularProgressIndicator(color: Colors.white),
      ),
    );
  }

  var db = FirebaseFirestore.instance;
  var image1, file;
  var isUploading = false;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    textController.dispose();
    super.dispose();
  }
  

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isStretched = isAnimating || state == ButtonState.init;
    final isDone = state == ButtonState.done;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(CupertinoIcons.back),
          onPressed: () => Get.off(
                  ()=> const DiscussionScreen(),
              transition: Transition.fade
          ),
        ),
      ),
      body: Column(
        children: [
          Column(
            children: [
              const Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 10, 0),
                  child: Text(
                    "Share, discuss, ask anything about stocks",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
                child: SizedBox(
                  height: 130, // <-- TextField height
                  child: TextField(
                    controller: textController,
                    //cursorColor: Colors.blue,
                    maxLines: null,
                    expands: true,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(top: 20),
                        hintText: "What's happening..."+test,
                        hintStyle: TextStyle(
                          fontSize: 20,
                        )
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Row(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: const Icon(Icons.add_photo_alternate_sharp),
                      iconSize: 90,
                      onPressed: () async {
                        ImagePicker imagepicker = ImagePicker();
                        XFile? image1 = await imagepicker.pickImage(source: ImageSource.gallery);
                        file = image1?.path;
                      },
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeIn,
                    width: state==ButtonState.init ? width: 70,
                    onEnd: () => setState(()=> isAnimating =!isAnimating),
                    height: 60,
                    child: isStretched ? buildButton(): buildSmallButton(isDone),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}