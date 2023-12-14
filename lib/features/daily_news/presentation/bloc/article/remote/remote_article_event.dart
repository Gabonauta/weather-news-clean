abstract class RemoteArcticlesEvent {
  RemoteArticlesEvent();
}

class GetArticles extends RemoteArcticlesEvent{
     GetArticles();
     
       @override
       RemoteArticlesEvent() {
         // TODO: implement RemoteArticlesEvent
         throw UnimplementedError();
       }
     
    
}