// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class privacy_policy extends StatefulWidget {
  const privacy_policy({Key? key}) : super(key: key);

  @override
  State<privacy_policy> createState() => _privacy_policyState();
}

class _privacy_policyState extends State<privacy_policy> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top-MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width-MediaQuery.of(context).padding.right-MediaQuery.of(context).padding.left;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: height * 0.13, // Set this height
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              color: Color(0xFFFCF0E6),
              image: DecorationImage(image: AssetImage("assets/images/Rectangle 28.png"),fit: BoxFit.fill)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 20,bottom: 10),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        height: height*0.05,
                        child:Container(
                            padding: const EdgeInsets.all(5),
                            child: const Image(image: AssetImage("assets/images/Vector.png"),color: Colors.black,)),
                      ),
                    ),
                    SizedBox(width: width*0.20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("Privacy Policy",
                            style: TextStyle(
                                fontSize: 23,
                                color: Colors.black,
                                fontFamily: "spartan",
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height*0.04,),
              const Text("PLEASE READ THIS SLIIKE PRIVACY POLICY (“PRIVACY POLICY”) WHICH IS PART OF THE SLIIKE CORPORATION LICENSED APPLICATION TERMS AND CONDITIONS OF USE. THIS PRIVACY POLICY PERTAINS TO YOUR (“YOU”) ACCESSING AND USING THE SLIIKE APP OR WEBSITE. ",
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: "spartan",
                      color: Colors.black,
                    fontWeight: FontWeight.w500
                  )
              ),
              SizedBox(height: height*0.02,),
              const Text("1. Information We Collect Consent",
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: "spartan",
                      color: Colors.black
                  )
              ),
              SizedBox(height: height*0.02,),
              const Text("As permitted by law, Your consent may be implied by Your use of the Service and Your acceptance of, and agreement to, this Privacy Policy. Sliike may seek consent to use and disclose Your personal information after it has been collected in those cases where We wish to use the information for a new or different purpose where You have not already consented to such a use of Your personal information.In most cases and subject to legal and contractual restrictions, You are free to refuse or withdraw Your consent at any time upon reasonable, advance notice. It should be noted that in certain circumstances, the Service can only be offered if you provide Us with Your personal information. Consequently, if You choose not provide Us with the required personal information, we may not be able to offer You the Service. ",
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: "spartan",
                      color: Colors.black54
                  )
              ),
              SizedBox(height: height*0.02,),
              const Text("Information You Provide to Us ",
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: "spartan",
                      color: Colors.black
                  )
              ),
              SizedBox(height: height*0.02,),
              const Text("We may collect identifiers from You when You register for and use the Service, contact or interact with us, fill out a form, and voluntarily provide Us with Your comments and other content in connection with using the Service.  When calling us, Your telephone number and name may be collected.\n\nWhen You register on the Website or the Apps, We may collect identifiers including Your name, email address, telephone number, address, IP address, password, and any other information that You provide in the registration process. We may associate commercial information with you including shopping lists, receipts and any other information You provide with Your registered profile.\n\nWhen You submit a “Contact Us” form, We collect identifiers including Your name, phone number, email address, and any other information You choose to provide to Us.\n\nWhen You create a support ticket, We collect identifiers including Your email address and any other information You choose to provide to Us.\n\nWhen You enter contests or respond to promotions, We may collect identifiers and commercial information included in Your entry information such as name, email address, physical address, phone number, age, photo, videos, social account information and any other information You provide. ",
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: "spartan",
                      color: Colors.black54
                  )
              ),
              SizedBox(height: height*0.02,),
              const Text("2. How We Use Your Information ",
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: "spartan",
                      color: Colors.black
                  )
              ),
              SizedBox(height: height*0.02,),
              const Text("We use the information that We collect for several business and commercial purposes, including:\nThe purposes for which You provided it;\nTo provide services to You;\nTo provide user verification services;\nTo create or update Your account;\nTo connect with Your social media accounts and post content You choose to share;\nTo process and respond to Your inquiries and comments;\nTo send You information about Your relationship or transactions with us;\nTo develop new products and services;\nTo personalize and enhance Your experience using the Service;\nTo personalize and enhance Your shopping experience;\nTo send notifications through the Apps;\nAs permitted by law, to send periodic emails. The email address You provide may be used to send You information and updates pertaining to Your account, in addition to receiving occasional company news, updates, related product or service information, etc.  Note: If at any time You would like to unsubscribe from receiving future emails, We include detailed unsubscribe instructions at the bottom of each email;\nTo generate and review reports and data about our user base and service usage patterns;\nTo compile aggregate data for internal and external business purposes;\nTo display relevant advertising and remarketing across websites;\nTo prevent fraud and abuse of the Service and to otherwise protect users and visitors and our business;\nTo administer, operate and improve the Service and for internal business purposes;\nTo assist law enforcement and respond to subpoenas; and\nTo perform other business activities as needed, or as described elsewhere in this Privacy Policy.\nAs explained elsewhere in this Privacy Policy, personal information We collect may be processed by our partners in providing related services to the Service (such as administration services, technical services relating to the maintenance, servicing, and upgrading of the products, software, hosting services, data migration services and analytical services, among others). ",
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: "spartan",
                      color: Colors.black54
                  )
              ),
              SizedBox(height: height*0.02,),
              const Text("3. How Your Information is Disclosed ",
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: "spartan",
                      color: Colors.black
                  )
              ),
              SizedBox(height: height*0.02,),
              const Text("Information may be disclosed to third parties in accordance with our Privacy Policy, including our service providers and business partners, employment service providers, partners, media companies, and advertising partners. In certain instances, and jurisdictions, this disclosure may be deemed to be a sale of your personal information. This information includes Your personal information (such as Your address and e-mail address), location data, and information about Your use of the Service.\n\na. Third Party Service Providers and Business Partners.\nWe may use remarketing cookies or pixels from Google and Facebook and share some of Your personal information with Facebook and Google for use in advertising. For information on how You can disable these cookies.\n\nb. Cookies and Similar Technologies.\nThese and other third parties may collect or receive information about Your use of the Service, including through the use of cookies, web beacons and other technologies, and this information may be collected over time and combined with information collected on different websites and online services, which may be used for remarketing and may track users across websites and apps and over time.  For instance, Facebook and Google enable us to present users with retargeting advertising on other sites based on users’ previous interaction with the Service.  You can instruct Your browser to stop accepting cookies.  But if You do not accept cookies, You may not be able to use all portions of all functionality of the Service.\n\n(i) Cookies.\nWe use cookies, which are small data files that are saved to Your device when You visit our website and use the Service.\n\n(ii) Type of cookies we use.\nSliike may use both session cookies and persistent cookies. A session cookie is a temporary file which is only active while You are on the website and is erased once You close Your browser. Unlike a session cookie, a persistent cookie is not deleted when You close Your browser and will remain on Your device indefinitely. We use cookies to identify when You return to our website, save login information (excluding passwords), track usage statistics and store Your preferences.\n\n(iii) Adjusting cookie settings on your browser.\nBy default, most browsers will automatically accept cookies. However, You can disable cookies completely, or be prompted prior to a cookie being loaded, by adjusting Your browser’s settings. Consult each individual browser’s “help” feature for more information.\n\n\n\n(c) Web beacons.\nWeb beacons are small graphic images or other programming code (also known as “web bugs,”  “1×1 GIFs” or “clear GIFs”) used to keep track of Your navigation through the website and Your electronic communication with us. We may include web beacons in our web pages and email messages. Web beacons may be invisible to You, but any electronic image or other web programming code inserted into a web page or email can act as a web beacon. Web beacons or similar technologies may be used for a number of purposes, including, without limitation, to count visitors to our website, to monitor how users navigate the website, to count how many emails that were sent were actually opened or to count how many particular articles or links were actually viewed. Web beacons may be used to collect certain personal information (for example, the email address associated with an email message).\n\n\n(d) Embedded Scripts.\nAn embedded script is a programming code that is designed to collect information about Your interactions with our website, such as information about the links on which You click. The code is temporarily downloaded onto Your device from our web server or a third party service provider. The code is active only while You are connected to our website, and is deactivated or deleted once You disconnect from the website. ",
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: "spartan",
                      color: Colors.black54
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
