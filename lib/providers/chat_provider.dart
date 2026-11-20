import 'package:flutter/material.dart';
import 'package:gemeni_chatbot_app/constants.dart';
import 'package:gemeni_chatbot_app/hive/chat_history.dart';
import 'package:gemeni_chatbot_app/hive/settings.dart';
import 'package:gemeni_chatbot_app/hive/user_model.dart';
import 'package:gemeni_chatbot_app/models/message.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart' as path;
import 'package:image_picker/image_picker.dart';

class ChatProvider extends ChangeNotifier{

  //list of messages
  List<Message> _inChatMessages = [];

  //Page controller
  final PageController _pageController = PageController();

  //list of images
  List<XFile>? _imageFiles = [];

  //index of the current screen
  int currentIndex = 0;

  //current chatId
  String _currentChatId = '';

  //initilize generative model
  GenerativeModel? _gModel;

  //initialize text model
  GenerativeModel? _textModel;

  //initialize image model
  GenerativeModel? _imageModel;

  //current model
  String _modelType = 'gemeni-pro';

  //loading bool
  bool isLoading = false;

  //getters
  List<Message> get inChatMessages => _inChatMessages;
  PageController get pageController => _pageController;
  List<XFile>? get imageFiles => _imageFiles;
  String get currentChatId => _currentChatId;
  int get currentScreenIndex => currentIndex;
  GenerativeModel? get model => _gModel;
  GenerativeModel? get textModel => _textModel;
  GenerativeModel? get imageModel => _imageModel;
  String get modelType => _modelType;
  bool get loading => isLoading;

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