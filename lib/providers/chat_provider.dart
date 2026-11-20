import 'package:flutter/material.dart';
import 'package:gemeni_chatbot_app/constants.dart';
import 'package:gemeni_chatbot_app/hive/chat_history.dart';
import 'package:gemeni_chatbot_app/hive/settings.dart';
import 'package:gemeni_chatbot_app/hive/user_model.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart' as path;

class ChatProvider extends ChangeNotifier{

  //init the hive box
  static initHive()async{
    final dir =  await path.getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    await Hive.initFlutter(Constants.gemeniDB);


    //register adapter
    if(!Hive.isAdapterRegistered(0)){
      Hive.registerAdapter(ChatHistoryAdapter());

      //open the chat history box
      await Hive.openBox<ChatHistory>(Constants.chatHistoryBox);
    }
    if(!Hive.isAdapterRegistered(1)){
      Hive.registerAdapter(UserModelAdapter());
      await Hive.openBox<UserModel>(Constants.userBox);

      
    }
    if(!Hive.isAdapterRegistered(2)){
      Hive.registerAdapter(SettingsAdapter());
      await Hive.openBox<Settings>(Constants.settingsBox);

      
    }
  }

}