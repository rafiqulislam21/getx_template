class NewsModel {
  int newsId;
  int identityType;
  String subType;
  String createdDate;
  String updatedDate;
  String postDate;
  String headline;
  String title;
  String linkType;
  String newsType;
  String subTitle;
  String category;
  String details;
  String img;
  String link;
  String relavantTicker;
  String tradingCode;
  int status;

  NewsModel();

  NewsModel.fromJson(Map json){
//    print(json['details']);
    newsId = json['id'];
    createdDate = json['created_date'];
    updatedDate = json['updated_date'];
    headline = json['headline']??"";
    title = json['title'];
    linkType = json['link_type'];
    newsType = json['news_type'];
    identityType = json['identity_type'];
    subTitle = json['subtitle'];
    category = json['category'];
    subType = json['sub_type'];
    details = json['details']??json['description'];
    img = json['img'];
    link = json['link'];
    relavantTicker = json['relavant_ticker'];
    tradingCode = json['trading_code'];
    postDate = json['post_date'];
    status = json['status'];
  }
}