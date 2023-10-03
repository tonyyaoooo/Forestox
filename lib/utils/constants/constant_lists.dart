import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:tonyyaooo/models/discussion_model/discussion_model.dart';

import '../../generated/assets.dart';
import '../../models/bottom_navigation_bar_model/bottom_navigation_bar_model.dart';
import '../../models/forecast_model/forecast_model.dart';
import '../../models/notifications_model/notifications_model.dart';
import '../../models/stocks_model/stocks_model.dart';

class ConstantLists {
  ConstantLists._();
  static var loaded = false;

  static List<BottomNavigationBarModel> bottomBarList = [
    BottomNavigationBarModel(
      itemIndex: 0,
      assetString: Assets.bottomAppBarIconsStocksIcon,
      title: "Stocks",
    ),
    BottomNavigationBarModel(
      itemIndex: 1,
      assetString: Assets.bottomAppBarIconsForecastIcon,
      title: "Forecast",
    ),
    BottomNavigationBarModel(
      itemIndex: 2,
      assetString: Assets.bottomAppBarIconsDiscussionIcon,
      title: "Discussion",
    ),
    BottomNavigationBarModel(
      itemIndex: 3,
      assetString: Assets.bottomAppBarIconsNotificationsIcon,
      title: "Notification",
    ),
  ];

  static List<StocksModel> stocksModelList = [
    StocksModel(
      companyImage: Assets.forecastImageTeslaIcon,
      companyName: "TESLA",
      corporateName: "Tesla, Inc",
      publicOpinion: "Negative",
      price: "343.43",
      publicAttention: "1523.3",
      publicPercentageAttention: "+233.3%",
      predictionPrice: "333.2",
      pricePercentageRaise: "+5.94%",
      predictionPercentagePrice: "+2.3%",
      aiSuggestionAndAnalysis:
      "Lorem ipsum dolor sit amet consectetur. Viverra morbi tempus tristique ut odio est massa iaculis. Neque nibh cursus mi ipsum enim. Pellentesque in in vulputate cras purus lectus ut. Sapien facilisi amet magna facilisi sapien. Nisl rutrum sapien gravida consequat aliquam vitae diam fringilla ipsum. Ornare tellus nullam nunc rhoncus fames. Ut nec nisi ut dictum consequat at posuere in.",
    ),
    StocksModel(
      companyImage: Assets.forecastImageMetaIcon,
      companyName: "META",
      corporateName: "Meta, Inc",
      publicOpinion: "Neutral",
      price: "343.43",
      publicAttention: "1523.3",
      publicPercentageAttention: "+233.3%",
      predictionPrice: "333.2",
      pricePercentageRaise: "+5.94%",
      predictionPercentagePrice: "+2.3%",
      aiSuggestionAndAnalysis:
      "Lorem ipsum dolor sit amet consectetur. Viverra morbi tempus tristique ut odio est massa iaculis. Neque nibh cursus mi ipsum enim. Pellentesque in in vulputate cras purus lectus ut. Sapien facilisi amet magna facilisi sapien. Nisl rutrum sapien gravida consequat aliquam vitae diam fringilla ipsum. Ornare tellus nullam nunc rhoncus fames. Ut nec nisi ut dictum consequat at posuere in.",
    ),
    StocksModel(
      companyImage: Assets.forecastImageMetaIcon,
      companyName: "META",
      corporateName: "Meta, Inc",
      publicOpinion: "Neutral",
      price: "343.43",
      publicAttention: "1523.3",
      publicPercentageAttention: "+233.3%",
      predictionPrice: "333.2",
      pricePercentageRaise: "+5.94%",
      predictionPercentagePrice: "+2.3%",
      aiSuggestionAndAnalysis:
      "Lorem ipsum dolor sit amet consectetur. Viverra morbi tempus tristique ut odio est massa iaculis. Neque nibh cursus mi ipsum enim. Pellentesque in in vulputate cras purus lectus ut. Sapien facilisi amet magna facilisi sapien. Nisl rutrum sapien gravida consequat aliquam vitae diam fringilla ipsum. Ornare tellus nullam nunc rhoncus fames. Ut nec nisi ut dictum consequat at posuere in.",
    )
  ];
  static List<ForecastModel> forecastModelList = [
    ForecastModel(
      typeOfForecast: "News",
      dateOfForecast: "Aug.28 2023",
      forecastTitle:
      "Elon Musk vs Mark Zukerberg fight will be streamed on X, according to Musk",
      forecastDescription:
      "Lorem ipsum dolor sit amet consectetur. Viverra morbi tempus tristique ut odio est massa iaculis. Neque nibh cursus mi ipsum enim. Pellentesque in in vulputate cras purus lectus ut. Sapien facilisi amet magna facilisi sapien. Nisl rutrum sapien gravida consequat aliquam vitae diam fringilla ipsum. Ornare tellus nullam nunc rhoncus fames. Ut nec nisi ut dictum consequat at posuere in.",
      forecastImage: Assets.forecastImageForecastModelImage,
      forecastDetailImage: Assets.forecastImageStockDetailImage,
      realtimeDataModel: RealtimeDataModel(
          usersReached: "439,432,201",
          totalTweets: "2435",
          eventInfluence: "Positive"),
      stockAnalysisAndPredictionList: [
        StocksAnalysisAndPredictionsModel(
          stockAnalysisImage: Assets.forecastImageTeslaIcon,
          stockAnalysisCompany: "TESLA",
          stockAnalysisCorporateName: "Tesla, Inc.",
          stockAttention: "2346.8",
          stockPolarities: "+123.5",
          prediction: "Rise",
        ),
        StocksAnalysisAndPredictionsModel(
          stockAnalysisImage: Assets.forecastImageMetaIcon,
          stockAnalysisCompany: "Meta",
          stockAnalysisCorporateName: "Meta, Inc.",
          stockAttention: "1342.4",
          stockPolarities: "-0.23",
          prediction: "Fluctuates",
        ),
      ],
    ),
  ];

  static List<DiscussionModel> discussionModelList = [];

  static getDiscussions() async {
    var db = FirebaseFirestore.instance;
    await db.collection("posts").get().then(
          (querySnapshot) {
        print("Successfully completed");
        for (var docSnapshot in querySnapshot.docs) {
          var image = null;
          if (docSnapshot.get("imageURL")!=null){
            image = docSnapshot.get("imageURL");
          }
          discussionModelList.add(DiscussionModel(documentID: docSnapshot.id, discussionPostedByImage: Assets.notificationImagesNitificationImageOne, discussionPostedByName: docSnapshot.get("sender"), postedTimeAgo: docSnapshot.get("time"), postDescription: docSnapshot.get("body"), postImage: image, noOfLikes: docSnapshot.get("likeNumber"), noOfComments: docSnapshot.get("commentNumber"), numbersOfShares: docSnapshot.get("shareNumber")));
        }
      },
      onError: (e) => print("Error completing: $e"),
    );
  }

  static List<NotificationModel> notificationModelList = [
    NotificationModel(
      imageAsset: Assets.notificationImagesNitificationImageOne,
      notificationTitle: "Leo Posted a Photo",
      notificationDescription: "Lorem ipsum dolor sit amet consectetur.",
      notificationTime: "12:30 AM",
    ),
    NotificationModel(
      imageAsset: Assets.notificationImagesNotificationImageTwo,
      notificationTitle: "Tesla Stock Prediction",
      notificationDescription: "Lorem ipsum dolor sit amet consectetur.",
      notificationTime: "12:30 AM",
    ),
    NotificationModel(
      imageAsset: Assets.notificationImagesNotificationImageThree,
      notificationTitle: "Meta Stock Prediction",
      notificationDescription: "Lorem ipsum dolor sit amet consectetur.",
      notificationTime: "12:30 AM",
    ),
    NotificationModel(
      imageAsset: Assets.notificationImagesNotificationImageFour,
      notificationTitle: "Haylie Posted a Photo",
      notificationDescription: "Lorem ipsum dolor sit amet consectetur.",
      notificationTime: "12:30 AM",
    ),
    NotificationModel(
      imageAsset: Assets.notificationImagesNitificationImageOne,
      notificationTitle: "Leo Posted a Photo",
      notificationDescription: "Lorem ipsum dolor sit amet consectetur.",
      notificationTime: "12:30 AM",
    ),
    NotificationModel(
      imageAsset: Assets.notificationImagesNotificationImageTwo,
      notificationTitle: "Tesla Stock Prediction",
      notificationDescription: "Lorem ipsum dolor sit amet consectetur.",
      notificationTime: "12:30 AM",
    ),
    NotificationModel(
      imageAsset: Assets.notificationImagesNotificationImageThree,
      notificationTitle: "Meta Stock Prediction",
      notificationDescription: "Lorem ipsum dolor sit amet consectetur.",
      notificationTime: "12:30 AM",
    ),
    NotificationModel(
      imageAsset: Assets.notificationImagesNotificationImageFour,
      notificationTitle: "Haylie Posted a Photo",
      notificationDescription: "Lorem ipsum dolor sit amet consectetur.",
      notificationTime: "12:30 AM",
    ),
    NotificationModel(
      imageAsset: Assets.notificationImagesNitificationImageOne,
      notificationTitle: "Leo Posted a Photo",
      notificationDescription: "Lorem ipsum dolor sit amet consectetur.",
      notificationTime: "12:30 AM",
    ),
    NotificationModel(
      imageAsset: Assets.notificationImagesNotificationImageTwo,
      notificationTitle: "Tesla Stock Prediction",
      notificationDescription: "Lorem ipsum dolor sit amet consectetur.",
      notificationTime: "12:30 AM",
    ),
    NotificationModel(
      imageAsset: Assets.notificationImagesNotificationImageThree,
      notificationTitle: "Meta Stock Prediction",
      notificationDescription: "Lorem ipsum dolor sit amet consectetur.",
      notificationTime: "12:30 AM",
    ),
    NotificationModel(
      imageAsset: Assets.notificationImagesNotificationImageFour,
      notificationTitle: "Haylie Posted a Photo",
      notificationDescription: "Lorem ipsum dolor sit amet consectetur.",
      notificationTime: "12:30 AM",
    ),
  ];
}
