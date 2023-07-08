class ServiceAddModel {
  String serviceCatId;
  String serviceCatName;
  String serviceId;
  String serviceName;
  String servicePrice;
  String serviceDurationMin;
  String priceStatus;
  String description;
  String imgName;
  bool isBookOnline;
  bool isHomeService;
  String noOfParallelClient;
  String inBetweenInterval;
  String serviceImagePath;

  ServiceAddModel(
      {required this.serviceCatId,
      required this.serviceCatName,
      required this.serviceDurationMin,
      required this.serviceId,
      required this.serviceName,
      required this.servicePrice,
      required this.priceStatus,
      required this.description,
      required this.imgName,
      required this.isBookOnline,
      required this.isHomeService,
      required this.noOfParallelClient,
      required this.inBetweenInterval,
      required this.serviceImagePath
    
      });
}
