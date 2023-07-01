class ApiUrlList {
  // static String baseUrl = 'https://hungry-duck-zipper.cyclic.app/api/v1/';
  static String baseUrl = 'https://sliike-server.onrender.com/api/v1/';
  static String logowork = 'https://sliike-server.onrender.com/api/v1/';
  // static String baseUrl = 'https://cyan-friendly-reindeer.cyclic.app/api/v1/';

  /// Client or Beautician LOGIN API
  static String signInApiUrl = "${baseUrl}auth/Signin";
  static String signUpApiUrl = "${baseUrl}auth/Signup";
  static String sendOtp = "${baseUrl}auth/sendOtp";
  static String verifyOtp = "${baseUrl}auth/verifyOtp";
  static String forgotPassword = "${baseUrl}auth/forgotPassword";
  static String verifyResetCode = "${baseUrl}auth/verifyResetCode";
  static String resetPassword = "${baseUrl}auth/resetPassword";
  static String handleLogout = "${baseUrl}auth/handleLogOut";
  static String saveStripeCode = "${baseUrl}beautician/saveStripeAccId";
  static String fetchServiceCategories =
      "${baseUrl}option/fetchServiceCategories";
  static String fetchServiceTypes = "${baseUrl}option/fetchServiceTypes";
  static String getClientPersonalInfo =
      "${baseUrl}client/getClientPersonalInfo";
  static String getProvince = "${baseUrl}option/getProvinceList";
  static String getLocationDetails = "${baseUrl}beautician/getLocationDetails";
  static String addPersonalInfo = "${baseUrl}client/addPersonalInfo";
  static String updateProfileImage = "${baseUrl}client/updateProfileImage";
  static String addClientAddress = "${baseUrl}client/addClientAddress";
  static String deleteClientAccount = "${baseUrl}client/deleteClientAccount";
  static String getClientFavoriteList =
      "${baseUrl}client/getClientFavoriteList";
  static String saveNotification = "${baseUrl}client/saveNotification";
  static String getDemography = "${baseUrl}option/getDemography";
  static String findServices = "${baseUrl}client/findServices";
  static String addToMyFavorites = "${baseUrl}client/addToMyFavorites";
  static String removeFromMyFavorites =
      "${baseUrl}client/removeFromMyFavorites";
  static String getBeauticianDetails = "${baseUrl}client/getBeauticianDetails";
  static String getStylistList = "${baseUrl}client/getStylistList";
  static String addAppointment = "${baseUrl}client/addAppointment";
  static String getBookedPendingAppointment =
      "${baseUrl}client/getBookedPendingAppointment";

  static String getAppointmentList =
      "${baseUrl}client/getAppointmentList?status=past";
  static String getRecentBeauticians = "${baseUrl}client/getRecentBeauticians";
  static String getBusinessDeatils =
      "${baseUrl}client/getBusinessDeatils";
  static String getBusinessDeatilsNew =
      "${baseUrl}client/getBusinessDetailsNew";
  static String getRecomadedBeauticians =
      "${baseUrl}client/getRecomadedBeauticians";
  static String getSingleAppointmentData =
      "${baseUrl}client/getSingleAppointmentData/";
  static String updateAppointment = "${baseUrl}client/updateAppointment/";
  static String appointmentDetails = "${baseUrl}client/appointmentDetails";
  static String postlogoimage = "${logowork}beautician/addBusinessLogo";
  static String addWorkSpaceImg = "${logowork}beautician/addWorkSpaceImg";
  static String updateWorkSpaceImg = "${logowork}beautician/addWorkSpaceImg";
  static String getlogoimage = "${baseUrl}beautician/getBeauticianLogoImg";

  static String getTaxSetUpStatus = "${baseUrl}beautician/getTaxSetUpStatus";
  static String getBeauticianLogoImage =
      "${baseUrl}beautician/getBeauticianLogoImg";
  static String getBeauticianWorkSpaceImage =
      "${baseUrl}beautician/getWorkSpaceImg";
  static String addBusinessLicense = "${logowork}beautician/addBusinessLicense";
  static String getLicenseDetails = "${logowork}beautician/getLicenseDetails";

  ///Appointments
  static String getUpcomingAppointmentList =
      "${baseUrl}client/getAppointmentList?status=upcoming";
  static String getpastAppointmentList =
      "${baseUrl}client/getAppointmentList?status=past";

  ///Beautician Apps
  static String addBusinessDetail = "${baseUrl}beautician/addBusinessDetail";

  ///add business type
  static String addBusinessType = "${baseUrl}beautician/addBusinessType";
  static String addServiceDetails = "${baseUrl}beautician/addServiceDetails";

  ///calender

  static String addWorkHours = "${baseUrl}beautician/addWorkHours";
  static String updateWorkHours = "${baseUrl}beautician/updateWorkHours/";
  static String getCalenderAppointmentList =
      "${baseUrl}beautician/getCalenderAppointmentList";
  static String getAppointmentDetails =
      "${baseUrl}beautician/getAppointmentDetails";
  static String getAppointmentPaymentDetails =
      "${baseUrl}beautician/getAppointmentPaymentDetails";
  static String handlePastAppointmentStatus =
      "${baseUrl}beautician/handlePastAppointmentStatus";
  static String cancelAppointment = "${baseUrl}beautician/cancelAppointment";
  static String getEmployeeList = "${baseUrl}beautician/getEmployeeList";

  static String getTerms = "${baseUrl}admin/getTerms";

  ///Beautician Profile
  static String getBeauticianProfile =
      "${baseUrl}beautician/getBeauticianProfile";
  static String updateBeauticianProfile =
      "${baseUrl}beautician/updateBeauticianProfile";
  static String deleteBeauticianProfile =
      "${baseUrl}beautician/deleteBeauticianAccount";

  ///Beautician get scrren
  static String getScreenStatus = "${baseUrl}beautician/getScreenStatus";

  /// UTILS API
  static String logger = '${baseUrl}util/log';

//  static SharedPreferences?preferences;
  static String sucsessMsg = "";

  /// Payment APIs
  static String paymentDetail = '${baseUrl}client/getPrePaymentDetails';
  static String makePayment = '${baseUrl}client/maKePayment';

  /// FAQ ENDPOINT
  // client //
  static String getClientFAQList = "${baseUrl}help/getFAQList/client";
  //beautician//
  static String getBeautyFAQList = "${baseUrl}help/getFAQList/beautician";

  /// FEEDBACK ENDPOINT ///
  // client //
  static String addFeedbackClient = "${baseUrl}help/addFeedback/client";
  //beautician//
  static String addFeedbackBeauty = "${baseUrl}help/addFeedback/beautician";
  static String SendAppointmentReminder = "${baseUrl}beautician/SendAppointmentReminder";

  static String updateBAppointment = "${baseUrl}beautician/updateAppointment/";



  /// Update Buisness Details //
  static String updateBusinessDetails =
      "${baseUrl}beautician/updateBusinessDetails";
  static String addBeauticianServiceMethod =
      "${baseUrl}beautician/addBeauticianServiceMethod";
  static String getAmenityList = "${baseUrl}option/getAmenityList";
  static String getAmenity = "${baseUrl}}beautician/getAmenities";
  static String saveAmenities = "${baseUrl}beautician/saveAmenities";
  static String getHealthSafetyList = "${baseUrl}option/getHealthSafetyList";
  static String getHealthSafety = "${baseUrl}beautician/getHealthSafety";
  static String saveHealthSafety = "${baseUrl}beautician/saveHealthSafety";
  static String addMyDemographics = "${baseUrl}beautician/addMyDemographics";
  static String getWorkHours = "${baseUrl}beautician/getWorkHours";

  ///Business Setup
  static String getCancellationStatus =
      "${baseUrl}beautician/getNOShow&CancellationProtection";
  static String updateProtectionStatus =
      "${baseUrl}beautician/saveNoShowProtection";
  static String updateCancellationStatus =
      "${baseUrl}beautician/saveCancelProtection";
  static String getBookingSetting = "${baseUrl}beautician/getBookingSettings";
  static String saveBookingSetting = "${baseUrl}beautician/saveBookingSettings";

  static String getScheduleForDate = "${baseUrl}beautician/getScheduleForDate";
  static String saveCalenderAdjustment =
      "${baseUrl}beautician/saveCalenderAdjustment";
  static String GetServiceDetails = "${baseUrl}beautician/getServiceDetails";
  static String getSingleServiceDetails =
      "${baseUrl}beautician/getSingleServiceDetails/";
  static String deleteServiceDetails =
      "${baseUrl}beautician/deleteServiceDetails/";
  static String deleteWorkSpaceImg = "${baseUrl}beautician/deleteWorkSpaceImg";

  static String addSingleServiceDetails =
      "${baseUrl}beautician/addSingleServiceDetails";
  // static String addSingleServiceDetails = "${baseUrl}beautician/addSingleServiceDetails";
  static String updateServiceDetails =
      "${baseUrl}beautician/updateServiceDetails/";
  static String updateSalonLocation =
      "${baseUrl}beautician/updateSalonLocation";
  // static String updateSalonLocationClient =
  //     "${baseUrl}client/updateSalonLocation";

  /// Card Services Endpoints (Client)///
  static String getCardDetails = "${baseUrl}client/getCardDetails";
  static String addCardDetails = "${baseUrl}client/addCardDetails";

  /// Promotion Services Endpoints (Beautician) ///
  static String getServicesList = "${baseUrl}beautician/getServicesList";
  static String getProductList = "${baseUrl}beautician/getProductList";
  static String addPromotion = "${baseUrl}beautician/addPromotion";
  static String getServices = "${baseUrl}beautician/getPromotionList/service";

  /// Client Add Rating ///
  static String addRating = "${baseUrl}client/addRating";

  /// Switch Account ///
  static String switchAccount = "${baseUrl}auth/switch-account/";

  /// Appointment Services Endpoints ///
  static String getServiceDetails = "${baseUrl}beautician/getServiceDetails";
  static String getStaffData = "${baseUrl}beautician/getEmployeeList";

  static String addBAppointment = "${baseUrl}beautician/addBAppointment";
  static String getAppointmentPreDetails =
      "${baseUrl}beautician/getAppointmentPreDetails";
  static String saveAppointmentDetails =
      "${baseUrl}beautician/saveAppointmentDetails";

  /// Invite Services Endpoints ///
  static String inviteContacts = "${baseUrl}beautician/inviteContacts";
  static String getInvitedClientList =
      "${baseUrl}beautician/getInvitedClientList";
}
