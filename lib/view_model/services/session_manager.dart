class SessionController{
  static final SessionController _sessionController = SessionController._internal();

  String? userID;
  factory SessionController(){
    return _sessionController;
  }
  SessionController._internal(){

  }
}