import 'package:news_app/core/EndPoints.dart';
import 'package:news_app/core/api_manger.dart';
import 'package:news_app/core/constants.dart';
import 'package:news_app/models/NewsResponse.dart';
import 'package:news_app/models/sourse_response.dart';

class NewsRepo {
  ApiManger apiManger;

  NewsRepo(this.apiManger);

   Future<SourcesResponse>getSources() async{
    var response= await apiManger.getApi(EndPoints.sources,params:  {"apiKey":
    Constants.API_KEY,
    });
    SourcesResponse sourcesResponse=SourcesResponse.fromJson(response.data);
    return sourcesResponse;
  }
   Future<NewsResponse>getnews(String sourceId)async{
   var response=await  apiManger.getApi(EndPoints.everything,params: {"apikey":Constants.API_KEY,
     "sources":sourceId});
    NewsResponse data=NewsResponse.fromJson(response.data);
    return data;
  }

}
