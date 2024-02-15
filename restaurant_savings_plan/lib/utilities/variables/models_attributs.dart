// ignore_for_file: constant_identifier_names

class ModelsAttributs {
  // ModelUser
  static const String UID = "uid";
  static const String TOKEN = "token";
  static const String FIRST_NAME = "firstName";
  static const String LAST_NAME = "lastName";
  static const String PHONE_NUMBER = "phoneNumber";
  static const String EMAIL = "email";
  static const String PASSWORD = "password";
  static const String PHOTO_URL = "photoUrl";
  static const String IS_ACTIVE = "isActive";
  static const String DRIVER_CERTIFIED = "driverCertifed";
  static const String PUSH_TOKEN = "pushToken";

  // ModelWallet
  static const String AUTHOR_REFERENCE = "authorReference";
  static const String WALLET_UID = "walletUid";
  static const String AMOUNT = "amount";
  static const String AMOUNT_RECEIVED = "amountReceived";
  static const String RESERVE = "reserve";
  static const String RESERVE_FOR_DRIVE = "reserveForDrive";
  static const String RESERVE_FOR_RECOMMANDATION = "reserveForRecommandation";

  // ModelCarpooling
  static const String MODEL_ID = "modelId";
  static const String TITLE = "title";
  static const String CREATED_TIMESTAMP = "createdTimestamp";
  static const String UPDATED_TIMESTAMP = "updatedTimestamp";
  static const String START_TIMESTAMP = "startTimestamp";
  static const String END_TIMESTAMP = "endTimestamp";
  static const String PLACES_COUNT = "placesCount";
  static const String PLACES_TAKEN_COUNT = "placesTakenCount";
  static const String START = "start";
  static const String END = "end";
  static const String VEHICLE = "vehicle";
  static const String DESTINATION = "destination";
  static const String DESTINATION_DESCRIPTION = "destinationDescription";
  static const String CAR_PICTURE = "carPicture";
  static const String CAR_PICTURES = "carPictures";
  static const String DRIVER_REFERENCE = "driverReference";
  static const String CAR_DESCRIPTION = "carDescription";
  static const String CARPOOLING_COUNTER = "carpoolingCounter";
  static const String START_PLACE_DESCRIPTION = "startPlaceDescription";
  static const String DESTINATION_PLACE_DESCRIPTION =
      "destinationPlaceDescription";
  static const String END_PLACE = "endPlace";
  static const String START_PLACE = "startPlace";
  static const String PATH_DISTANCE = "pathDistance";

  // ModelChoiceCarpooling
  static const String CHOICE_ID = "choiceId";
  static const String CARPOOLING_REFERENCE = "carpoolingReference";
  static const String CLIENT_REFERENCE = "clientReference";
  static const String PRICE = "price";
  static const String FEES = "fees";
  static const String CONFIRMED = "confirmed";
  static const String NEGOCIATIONS = "negociations";
  static const String DRIVE_START = "driveStart";
  static const String DRIVE_END = "driveEnd";
  static const String DRIVE_END_BY_CLIENT = "driveEndByClient";
  static const String DRIVE_END_BY_DRIVER = "driveEndByDriver";

  // ModelNegociation
  static const String NEGOCIATION_ID = "negociationId";
  static const String IS_VALID = "isValid";

  // ModelNotification
  static const String NOTIFICATION_ID = "notificationId";
  static const String CONTENT = "content";
  static const String ALREADY_READ = "alreadyRead";
  static const String SENT = "sent";

  // ModelLocation
  static const String NAME = "name";
  static const String LATITUDE = "latitude";
  static const String LONGITUDE = "longitude";
  static const String DESCRIPTION = "description";
  static const String STREET = "street";
  static const String LOCALITY = "locality";
  static const String COUNTRY = "country";
  static const String PLACE_ID = "placeId";

  // ModelVehicle
  static const String CAR_PAPER_URL = "carPaperUrl";
  static const String REGISTRATION_NUMBER = "registrationNumber";
  static const String CAR_ASSURANCE = "carAssurance";
  static const String CAR_GRAY_CARD = "carGrayCard";

  // ModelRecommandation
  static const String REASON = "reason";
  static const String STATUS = "status";

  // ModelOtherOperation
  static const String SUBJECT = "subject";
  static const String MESSAGE = "message";

  // ModelRatingReview
  static const String TARGET_REFERENCE = "targetReference";
  static const String RATING = "rating";
  static const String REVIEW = "review";

  // ModelAppValues
  static const String FUEL_PRICE = "fuelPrice";
  static const String DRIVE_TVA = "driveTva";
  static const String PAIEMENT_PERCENT = "paiementPercent";
  static const String REDISTRIBUTION_PRICE = "redistributionPrice";
  static const String ADMIN_NUMBER = "adminNumber";
  static const String ADMIN_LINK = "adminLink";

  // Api
  static const String RESPONSE_CODE = "responseCode";
  static const String RESPONSE_STATUS = "responseStatus";
  static const String RESPONSE_MESSAGE = "responseMessage";
  static const String RESPONSE_COMMENT = "responseComment";
  static const String RESPONSE_BODY = "responseBody";

  static const String SUCCESS = "success";
  static const String FAILURE = "failure";
  static const String WAITING = "waiting";
  static const String DATA = "data";



}
