class ApiUrlList {
  static String baseUrl = 'https://hungry-duck-zipper.cyclic.app/api/v1/';
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
  static String fetchServiceCategories =
      "${baseUrl}option/fetchServiceCategories";
  static String fetchServiceTypes = "${baseUrl}option/fetchServiceTypes";
  static String getClientPersonalInfo =
      "${baseUrl}client/getClientPersonalInfo";
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
  static String getBookedPendingAppointment = "${baseUrl}client/getBookedPendingAppointment";
  static String getAppointmentList = "${baseUrl}client/getAppointmentList?status=past";
  static String getRecentBeauticians = "${baseUrl}client/getRecentBeauticians";
  static String getBusinessDeatils = "${baseUrl}client/getBusinessDeatils";
  static String postlogoimage = "${logowork}beautician/addBusinessLogo";
  static String addWorkSpaceImg = "${logowork}beautician/addWorkSpaceImg";
  static String getlogoimage = "${baseUrl}beautician/getBeauticianLogoImg";

  ///Appointments
  static String getUpcomingAppointmentList =
      "${baseUrl}client/getAppointmentList?status=upcoming";

  ///Beautician Apps
  static String addBusinessDetail = "${baseUrl}beautician/addBusinessDetail";

  ///add business type
  static String addBusinessType = "${baseUrl}beautician/addBusinessType";
  static String addServiceDetails = "${baseUrl}beautician/addServiceDetails";

  ///calender

  static String addWorkHours = "${baseUrl}beautician/addWorkHours";

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
}
