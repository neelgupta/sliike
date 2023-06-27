// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class TermsOfService extends StatefulWidget {
  const TermsOfService({Key? key}) : super(key: key);

  @override
  State<TermsOfService> createState() => TermsOfServiceState();
}

class TermsOfServiceState extends State<TermsOfService> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width -
        MediaQuery.of(context).padding.right -
        MediaQuery.of(context).padding.left;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: height * 0.13, // Set this height
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            color: Color(0xFFFCF0E6),
            image: DecorationImage(
              image: AssetImage("assets/images/Rectangle 28.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 20, bottom: 10),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        height: height * 0.05,
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          child: const Image(
                            image: AssetImage("assets/images/Vector.png"),
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Terms of Service",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontFamily: "spartan",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 25),
              Text(
                "Terms and Conditions Agreement",
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "spartan",
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                "Effective: November 22, 2021",
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "spartan",
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 40),
              Text(
                "PLEASE READ THE TERMS AND CONDITIONS CAREFULLY. THE TERMS AND CONDITIONS (“AGREEMENT”) CONSTITUTE A LEGAL AGREEMENT BETWEEN YOU AND SLIIKE CORPORATION).",
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "spartan",
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 20),
              const Text(
                "1. Acceptance of this Agreement",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: "spartan",
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 10),
              const Text(
                "SLIIKE provides an online marketplace connection, using web-based technology that connects you and other users (client), established beauticians (salon & studio owners) and independent beauticians (freelance).  Sliike App or Website (the “Platform”) permits users to search, find, booking, and pay for beauty services with established or independent beauticians, either home service or at the beautician’s salon/studio. Once a booking is made and transaction completed, the Platform notifies the beautician that a beauty service has been requested and the Platform will notify both the beautician and the user. Sliike is not a beauty salon or beauty service provider.\n\nIf you access our app and website or install or use our Platform, or access any information, function, or service available or enabled by Sliike (each, a “Service” and collectively, the “Services”), or complete the Sliike sign-up registration process, you, your heirs, assigns, and successors (collectively, “you” or “your”) hereby represent and warrant that: \n\n(a) you have read, understand, and agree to be bound by this Agreement; \n\n(b) you are of legal age in the jurisdiction in which you reside to form a binding contract with sliike and\n\n(c) you have the authority to enter into the Agreement personally and, if applicable, on behalf of any organization on whose behalf you have created an account and to bind such organization to the Agreement.\n\nThe terms “User” and “Users” refer to all individuals and other persons who access or use the Services, including, without limitation, any organizations that register accounts or otherwise access or use the Services through their respective representatives. Except as otherwise provided in this Agreement, if you do not agree to be bound by the Agreement, you may not access or use the Services. ",
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "spartan",
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 20),
              const Text(
                "2. Modifications",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: "spartan",
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 10),
              const Text(
                "Sliike reserves the right to modify the terms and conditions of this Agreement or its policies relating to the Platform or Services at any time, effective upon posting of an updated version of this Agreement through the Services. You should regularly review this Agreement, as your continued use of the Services after any such changes constitutes your agreement to such changes.",
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "spartan",
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 15),
              const Text(
                "3. Additional Terms and Policies",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: "spartan",
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 10),
              const Text(
                "By using the Services, you agree to be bound by this Agreement and acknowledge and agree to the collection, use, and disclosure of your personal information in accordance with Sliike’s Privacy Policy, which is incorporated in this Agreement by reference. You also agree to abide by any additional Sliike policies for Beauticians and Users that are published on our website or mobile application. Certain features of our Services may be subject to additional terms and conditions, which are incorporated herein by reference.",
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "spartan",
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 15),
              const Text(
                "4. Rules and Prohibitions",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: "spartan",
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 10),
              const Text(
                "Without limiting other rules and prohibitions in this Agreement, by using the Services, you agree that:\n\n(a) You will only use the Services for lawful purposes; you will not use the Services for sending or storing any unlawful material or for deceptive or fraudulent purposes; and you will not engage in conduct that harms other Beauticians or Users, Sliike employees, or our community.\n\n(b) You will not copy or distribute the Platform or any content displayed through the Services, including Beauticians’ work and reviews, for republication in any format or media.\n\n(c) You will only access the Services using means explicitly authorized by Sliike.\n\n(d) You will not compile, directly or indirectly, any content displayed through the Services except for your personal, noncommercial use.\n\n(e) You will not use the Services to cause nuisance, annoyance or inconvenience.\n\n(f) You will not probe, scan, or test the vulnerability of any system or network or breach or circumvent any security or authentication measures Sliike may use to prevent or restrict access to the Services or use of the Services or the content therein.\n\n(g) You will only use the Services in accordance with all applicable laws, including copyrights, trade secrets, or other rights of any third party, including privacy or publicity rights.\n\n(h) You will not use another Beautician or User’s account, impersonate any person or entity, or forge or manipulate headers or identifiers to disguise the origin of any content transmitted through the Services.\n\n(i) The information you provide to us when you register an account or otherwise communicate with us is accurate, you will promptly notify us of any changes to such information, and you will provide us with whatever proof of identity we may reasonably request.\n\n(j) You will keep secure and confidential your account password or any identification credentials we provide you which allows access to the Services.\n\n(k) You will not abuse our promotional or credit code system, including by redeeming multiple coupons at once or by opening multiple accounts to benefit from offers available only to first-time users.\n\n(l) You will not use the Services in any way that could damage, disable, overburden or impair any Sliike server, or the networks connected to any Sliike server.\n\n(m) You will not attempt to gain unauthorized access to the Services and/or to any account, resource, computer system, and/or network connected to any Sliike server.\n\n(n) You will not use the Services, or any content accessible through the Services, for any commercial purpose, including but not limited to contacting, advertising to, soliciting or selling to, any Beautician, User or unless Sliike has given you prior permission to do so in writing.\n\n(o) You will report any errors, bugs, unauthorized access methodologies or any breach of our intellectual property rights that you uncover in your use of the Services.\n\n(p) You will not scrape or otherwise conduct any systematic retrieval of data or other content from the Services.\n\n(q) You will not try to harm other Beauticians or Users, Sliike, or the Services in any way whatsoever.\n\n(r) You will not engage in threatening, harassing, racist, sexist or any other behavior that Sliike deems inappropriate when using the Services.\n\n(s) You will not use any unlawful act to access our websites manually or with any robot, spider, web crawler, extraction software, automated process and/or device to scrape, copy, index, frame, or monitor any portion of our websites or any content on our websites.\n\n(t) You will use the Platform and Services only for your own use and will not directly or indirectly resell, license or transfer the Software, Services or content displayed by the Services to a third party.\n\n(u) You will not attempt to undertake any of the foregoing. In the event that we believe or determine that you have breached any of the aforementioned, we reserve the right to suspend and/or permanently deactivate your account at our sole discretion.",
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "spartan",
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 15),
              const Text(
                "5. Beauticians (Establishes and Independents)",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: "spartan",
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 10),
              const Text(
                "Are Independent You understand and agree that Sliike provides a technology platform connecting you with beauty service providers and others that provide the products/services offered through the Services (“Beauticians”).  You acknowledge and agree that Sliike does not itself offer beauty services and has no responsibility or liability for the acts or omissions of any Beauticians. Beautician is the beaty service provider in at a salon/studio or in your home; the services offered by Sliike pursuant to this Agreement do not include any beauty services. Sliike is not a beauty service provider nor a salon/studio nor an employer of beauticians. Sliike provides a technology platform facilitating the transmission of beauty service booking by Users (Clients) to Beauticians at the beautician’s salon/studio or at the home of the Users. Sliike will not assess or guarantee the suitability, legality, or ability of any Beautician. You agree that Sliike is not responsible for the Beautician’s services or the safety of the service or whether the photographs or images displayed through the Services accurately reflect the work and skills of the Beautician and does not verify Beauticians’ compliance with applicable laws or regulations. Sliike has no responsibility or liability for acts or omissions by any Beautician.\n\nYou agree that the beauty service that you order will be carried out by the Beautician that you have selected, that the service is provided to you either at the Beautician’s salon/studio or in your home. You agree that Sliike does not hold title to or acquires any ownership interest in any beauty service that you order through the Services. ",
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "spartan",
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 15),
              const Text(
                "6. User Account",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: "spartan",
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 10),
              const Text(
                "You may be required to register for an account to use parts of the Services. You must provide accurate, current, and complete information during the registration process and at all other times when you use the Services, and to update the information to keep it accurate, current, and complete. You are the sole authorized user of any account you create through the Services. You are solely and fully responsible for all activities that occur under your password or account. You agree that you shall monitor your account to prevent use by minors, and you will accept full responsibility for any unauthorized use of your password or your account. You may not authorize others to use your Beautician or User status, and you may not assign or otherwise transfer your User account to any other person or entity. Should you suspect that any unauthorized party may be using your password or account, you will notify Sliike immediately. Sliike will not be liable and you may be liable for losses, damages, liability, expenses, and fees incurred by Sliike or a third party arising from someone else using your account, regardless of whether you have notified us of such unauthorized use. If you provide any information that is untrue, inaccurate, not current, or incomplete, or Sliike has reasonable grounds to suspect that such information is untrue, inaccurate, not current, or incomplete, Sliike has the right to suspend or terminate your account and refuse any and all current or future use of the Services (or any portion thereof). You agree not to create an account or use the Services if you have been previously removed by Sliike or if you have been previously banned from use of the Services. ",
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "spartan",
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 15),
              const Text(
                "7. User Content",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: "spartan",
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 10),
              const Text(
                "(a) Sliike may provide you with interactive opportunities through the Services, including, by way of example, the ability to post User ratings and reviews (collectively, “User Content”). You represent and warrant that you are the owner of, or otherwise have the right to provide, all User Content that you submit, post and/or otherwise transmit through the Services. You further represent and warrant that any User Content that you submit, post and/or otherwise transmit through the Services (i) does not violate any third-party right, including any copyright, trademark, patent, trade secret, privacy right, right of publicity, or any other intellectual property or proprietary right; (ii) does not contain material that is false, intentionally misleading, or defamatory; (iii) does not contain any material that is unlawful; (iv) does not violate any law or regulation; and (v) does not violate this Agreement. You hereby grant Sliike a perpetual, irrevocable, transferable, fully paid, royalty-free, non-exclusive, worldwide, fully sublicenseable right and license to use, copy, display, publish, modify, remove, publicly perform, translate, create derivative works, distribute and/or otherwise use the User Content in connection with Sliike business and in all forms now known or hereafter invented (“Uses”), without notification to and/or approval by you. You further grant Sliike a license to use your username, first name and last initial, and/or other User profile information, including without limitation, your ratings history, to attribute User Content to you in connection with such Uses, without notification or approval by you. You agree that this license includes the right for other Users to access and use your User Content in conjunction with participation in the Services and as permitted through the functionality of the Services. In the interest of clarity, the license granted to Sliike herein shall survive termination of the Services or your account. Sliike reserves the right in its sole discretion to remove or disable access to any User Content from the Services, suspend or terminate your account at any time, or pursue any other remedy or relief available under equity or law if you post any User Content that violates this Agreement or any community or content guidelines we may publish or that we consider to be objectionable for any reason. You agree that Sliike may monitor and/or delete your User Content (but does not assume the obligation) for any reason in Sliike’s sole discretion. Sliike may also access, read, preserve, and disclose any information as Sliike reasonably believes is necessary to (a) satisfy any applicable law, regulation, legal process, or governmental request, (b) enforce this Agreement, including investigation of potential violations hereof, (c) detect, prevent, or otherwise address fraud, security, or technical issues, (d) respond to User support requests, or (e) protect the rights, property or safety of Sliike, its Users and the public.\n\n(b) Feedback. You agree that any submission of any ideas, suggestions, and/or proposals to Sliike through its suggestion, feedback on the platform (“Feedback”) is at your own risk and that Sliike has no obligations (including without limitation, obligations of confidentiality) with respect to such Feedback. You represent and warrant that you have all rights necessary to submit the Feedback and you hereby grant to Sliike a perpetual, irrevocable, transferable, fully paid, royalty-free, non-exclusive, worldwide, fully sublicenseable right and license to use, copy, display, publish, modify, remove, publicly perform, translate, create derivative works, distribute and/or otherwise use such Feedback.\n\n(c) Ratings and Reviews. To the extent that you are asked to rate and post reviews of Beauticians or other businesses (“Ratings” and “Reviews”), such Ratings and Reviews are considered User Content and are governed by this Agreement. Ratings and Reviews are not endorsed by Sliike and do not represent the views of Sliike. Sliike shall have no liability for Ratings and Reviews or for any claims for economic loss resulting from such Ratings and Reviews. Because we strive to maintain a high level of integrity with respect to Ratings and Reviews posted or otherwise made available through the Services, you agree that: (i) you will base any Rating or Review on first-hand experience with the Beautician; (ii) you will not provide a Rating or Review for any Beautician for which you have an ownership interest, employment relationship or other affiliation or for any of that company’s competitors; (iii) you will not submit a Rating or Review in exchange for payment, free beauty service, or other benefits from a Beautician; and (iv) your Rating or Review will comply with the terms of this Agreement. If we determine, in our sole discretion, that any Rating or Review could diminish the integrity of the Ratings and Reviews or otherwise violates this Agreement, we may remove such User Content without notice. ",
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "spartan",
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 15),
              const Text(
                "8. E-SIGN Disclosure",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: "spartan",
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 10),
              const Text(
                "By creating a Sliike account, you also consent to the use of an electronic record to document your agreement. You may withdraw your consent to the use of the electronic record by emailing Sliike at connect@sliike.com with “Revoke My Electronic Consent” in the subject line.\n\nTo view and retain a copy of this disclosure, you will need (i) a device (such as a computer or mobile phone) with a web browser and Internet access and (ii) either a printer or storage space on such device.  ",
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "spartan",
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 15),
              const Text(
                "9. Communications with Sliike",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: "spartan",
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 10),
              const Text(
                "By creating a Sliike account, you electronically agree to accept and receive communications from Sliike including via email, text message, calls, and push notifications to the cellular telephone number you provided to Sliike. You understand and agree that you may receive communications generated by automatic telephone dialing systems and/or which will deliver prerecorded messages sent by or on behalf of Sliike including but not limited to communications concerning beauty service booking placed through your account on the Services. Message and data rates may apply. If you do not wish to receive promotional emails, text messages, or other communications, you may change your notification preferences by accessing Settings in your account. To opt out of receiving promotional text messages from Sliike, you must reply “STOP” from the mobile device receiving the messages. For purposes of clarity, delivery text messages between you and Beauticians are transactional text messages, not promotional text messages",
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "spartan",
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 15),
              const Text(
                "10. Intellectual Property Ownership",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: "spartan",
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 10),
              const Text(
                "Sliike alone shall own all right, title and interest, including all related intellectual property rights, in and to the Platform and the Services. This Agreement is not a sale and does not convey to you any rights of ownership in or related to the Platform or the Services, or any intellectual property rights owned by Sliike. Sliike names, Sliike logos, and the product names associated with the Platform and Services are trademarks of Sliike or third parties, and no right or license is granted to use them. You agree that you will not remove, alter or obscure any copyright, trademark, service mark or other proprietary rights notices incorporated in or accompanying the Platform or the Services",
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "spartan",
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 15),
              const Text(
                "11. Payment Terms ",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: "spartan",
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 10),
              const Text(
                "(a) Prices & Charges. You understand that: (a) the prices/fees for beauty services displayed through the Services may differ from the prices/fees offered or published by Beauticians for the same beauty service from prices/fees available at third-party websites and that such prices may not be the lowest prices at which the beauty services are charged; (b) Sliike has no obligation to itemize its costs, profits or margins when publishing such prices/fees; and (c) Sliike reserves the right to change such prices/fees at any time, at its discretion. For certain transactions, the subtotals shown at checkout are estimates that may be higher or lower depending on the final beauty services consumed. In those situations, Sliike reserves the right to charge your payment method the final price after checkout. You are liable for all transaction taxes on the Services provided under this Agreement (other than taxes based on Sliike’s income). In the event that the charge to your payment method may incorrectly differ from the total amount, including subtotal, fees, and gratuity, displayed to you at checkout and/or after gratuity is selected, Sliike reserves the right to make an additional charge to your payment method after the initial charge so that the total amount charged is consistent with the total amount displayed to you at checkout and/or after gratuity is selected. All payments will be processed by Sliike or its payments processor, using the payment method on the Sliike Platform. If your payment details change, your card provider may provide us with updated card details. We may use these new details or details from other cards on file in order to help prevent any interruption to your Use of the Services.\n\n(b) No Refunds. Charges paid by you for completed and provided/completed beauty service are final and non-refundable. Sliike has no obligation to provide refunds or credits, but may grant them, in each case in Sliike’s sole discretion.\n\n(c) Promotional Offers and Credits.Sliike, at its sole discretion, may make promotional offers with different features and different rates to any Beautician or User. These promotional offers are subject to the terms of this Agreement and may be valid only for certain Beauticians or Users as indicated in the offer. You agree that promotional offers: (i) may only be used by the intended audience, for the intended purpose, and in a lawful manner; (ii) may not be duplicated, sold or transferred in any manner, or made available to the general public, unless expressly permitted by Sliike; (iii) are subject to the specific terms that Sliike establishes for such promotional offer; (iv) cannot be redeemed for cash or cash equivalent; and (v) are not valid for use after the date indicated in the offer or in Sliike’s Terms and Conditions for Promotional Offers and Credits. Sliike reserves the right to withhold or deduct credits or benefits obtained through a promotion in the event that Sliike determines or believes that the redemption of the promotion or receipt of the credit or benefit was in error, fraudulent, illegal, or in violation of the applicable promotion terms or this Agreement. Sliike reserves the right to modify or cancel an offer at any time. Sliike’s Terms and Conditions for Promotional Offers and Credits that is published by Sliike (and which is incorporated in this Agreement by reference) apply to all promotional offers. You agree that we may change Sliike’s Terms and Conditions for Promotional Offers and Credits at any time. Sliike may also offer gratuitous credits, which can be used for the Services. Any credit issued by Sliike is valid for 6 months from the date of issue except to the extent prohibited under applicable law and may not be redeemed for cash or cash equivalent. Upon expiration, credits will be removed from your account. Expired credits are no longer redeemable and cannot be used towards any order.\n\n(d) Fees for Services. Sliike may change the fees for our Services as we deem necessary or appropriate for our business, including but not limited to the Platform fee. It may apply to any other service that Sliike offers to its clients (Beauticians, Users and Others).  Sliike may also charge beauticians fees on beauty services booking that you place through the Services, including commissions and other fees, and may change those beautician fees as we deem necessary or appropriate for our business or to comply with applicable law.\n\n(e) Referral Program. Sliike Referral Program Terms and Conditions will be published on our Platform (“Referral Program”). Under the Referral Program, Sliike offers its registered Users in good standing the opportunity to earn gratuitous Sliike credits as promotional rewards by inviting their eligible family members, relatives and friends to sign-up as new Sliike Users and place their initial order through the Services by using a unique referral ID link (“User Link”). For each Qualified Referral (as defined in the Referral Program) generated through a User’s Link, the User may receive a gratuitous credit as specified on Sliike’s Referral Program page. You agree that we may change the terms and conditions of the Referral Program or terminate the Referral Program at any time. ",
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "spartan",
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 15),
              const Text(
                "12. Dispute Resolution.",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: "spartan",
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 10),
              const Text(
                """IT IS IMPORTANT TO READ THE FOLLOWING SECTION CAREFULLY. IT REQUIRES YOU TO ARBITRATE DISPUTES WITH SLIIKE AND LIMITS THE MANNER IN WHICH YOU CAN SEEK RELIEF. THIS SECTION OF THIS AGREEMENT SHALL BE REFERRED TO AS THE “ARBITRATION AGREEMENT”.\n\n(a) Scope of Arbitration Agreement. You agree that any dispute or claim relating in any way to your access or use of the Services as a User of the Services or Provider (Beauticians) of Services, to any advertising or marketing communications regarding Sliike or the Services, to any products or services sold or distributed through the Services that you received as a User of our Services, or to any aspect of your relationship or transactions with Sliike as a User of our Services will be resolved by binding arbitration, rather than in court, except that (1) you may assert claims in small claims court if your claims qualify, so long as the matter remains in such court and advances only on an individual (non-class, non-representative) basis; and (2) you or Sliike may seek equitable relief in court for infringement or other misuse of intellectual property rights (such as trademarks, trade dress, domain names, trade secrets, copyrights, and patents). This Arbitration Agreement shall apply, without limitation, to all claims that arose or were asserted before the Effective Date of this Agreement. 
                  \nBy accepting this arbitration, you elect to not participate in any class action against Sliike. If you agree to arbitration with Sliike, you are agreeing in advance that you will not participate in or seek to recover monetary or other relief in any such class, collective and/or representative lawsuit. Instead, by agreeing to Arbitration, you may bring your claims against Sliike in an individual arbitration proceeding. If successful on such claims, you could be awarded money or other relief by an arbitrator. 
                  \n(b) Informal Resolution. You and Sliike agree that good-faith informal efforts to resolve disputes often can result in a prompt, low-cost and mutually beneficial outcome. You and Sliike therefore agree that, before either you or Sliike demands arbitration against the other, we will personally meet and confer, via telephone or videoconference, in a good-faith effort to resolve informally any claim covered by this mutual Arbitration Agreement. If you are represented by counsel, your counsel may participate in the conference, but you shall also fully participate in the conference. The party initiating the claim must give notice to the other party in writing of its, his, or her intent to initiate an informal dispute resolution conference, which shall occur within 60 days after the other party receives such notice, unless an extension is mutually agreed upon by the parties. To notify Sliike that you intend to initiate an informal dispute resolution conference, email connect@sliike.com, providing your name, telephone number associated with your Sliike account (if any), the email address associated with your Sliike account, and a description of your claim. In the interval between the party receiving such notice and the informal dispute resolution conference, the parties shall be free to attempt to resolve the initiating party’s claims. Engaging in an informal dispute resolution conference is a requirement that must be fulfilled before commencing arbitration.   The statute of limitations and any filing fee deadlines shall be tolled while the parties engage in the informal dispute resolution process required by this paragraph. 
                  \n(c) Arbitration Rules and Forum. This Arbitration Agreement is governed by Quebec’s Arbitration - Dispute prevention and resolution (“DPR”) processes in all respects. If for whatever reason the rules and procedures of the DPR cannot apply, the Canada commercial arbitration act will apply. Before a party may begin an arbitration proceeding, that party must send notice of an intent to initiate arbitration and certifying completion of the informal dispute resolution conference pursuant to paragraph 12(b). If this notice is being sent to Sliike, it must be sent by email to the counsel who represented Sliike in the informal dispute resolution process, or if there was no such counsel then by mail to Sliike published address. The arbitration will be conducted by ADR Institute of Canada (“ADRIC”) under its rules and pursuant to the terms of this Agreement. Arbitration demands filed with ADRIC must include (1) the name, telephone number, mailing address, and e-mail address of the party seeking arbitration; (2) a statement of the legal claims being asserted and the factual bases of those claims; (3) a description of the remedy sought and an accurate, good-faith calculation of the amount in controversy, enumerated in Canadian Dollars (any request for injunctive relief or attorneys’ fees shall not count toward the calculation of the amount in controversy unless such injunctive relief seeks the payment of money); and (4) the signature of the party seeking arbitration. Disputes shall be subject to ADRIC’s most current version of its Arbitration Rules, available as of December 1, 2016 at https://adric.ca/rules-codes/arbrules/ or by calling ADRIC at 416-487-4733. The fees that shall apply to arbitrations administered by ADRIC are set forth on ADRIC’s website at https https://adric.ca/case-administration-services/ . Payment of all filing, administration, and arbitration fees will be governed by ADRIC’s rules. If the arbitrator finds that you cannot afford to pay ADRIC’s filing, administrative, hearing and/or other fees and cannot obtain a waiver of fees from ADRIC., Sliike will pay them for you. If ADRIC is not available to arbitrate, the parties will mutually select an alternative arbitral forum. You may choose to have the arbitration conducted by telephone, video conference, based on written submissions, or in person in the county where you live or at another mutually agreed location. 
                  \n(d) Arbitrator Powers. The arbitrator, and not any federal, provincial or city court or agency, shall have exclusive authority to resolve any dispute relating to the interpretation, applicability, enforceability, or formation of this Arbitration Agreement including, but not limited to any claim that all or any part of this Arbitration Agreement is void or voidable. All disputes regarding the payment of arbitrator or arbitration-organization fees including the timing of such payments and remedies for nonpayment, shall be determined exclusively by an arbitrator, and not by any court. The arbitration will decide the rights and liabilities, if any, of you and Sliike. Except as expressly agreed to in Section 12(g) of this Agreement, the arbitration proceeding will not be consolidated with any other matters or joined with any other proceedings or parties. The arbitrator will have the authority to grant motions dispositive of all or part of any claim or dispute. The arbitrator will have the authority to award, on an individual basis, monetary damages and to grant any non-monetary remedy or relief available to an individual under applicable law, the arbitral forum’s rules, and this Agreement (including this Arbitration Agreement). The arbitrator will issue a written statement of decision describing the essential findings and conclusions on which any award (or decision not to render an award) is based, including the calculation of any damages awarded. The award shall be binding only among the parties and shall have no preclusive effect in any other arbitration or other proceeding involving a different party. The arbitrator shall follow the applicable law. The arbitrator has the same authority to award relief on an individual basis that a judge in a court of law would have. The arbitrator’s decision is final and binding on you and Sliike. 
                  \n(e) Waiver of Court Trial. YOU AND SLIIKE WAIVE ANY CONSTITUTIONAL AND STATUTORY RIGHTS TO SUE IN COURT AND RECEIVE A JUDGE TRIAL. You and Sliike are instead electing to have claims and disputes resolved by arbitration, except as specified in Section 11(a) above. There is no judge in arbitration, and court review of an arbitration award is limited. 
                  \n(f) Waiver of Class or Consolidated Actions. EXCEPT AS EXPRESSLY AGREED TO IN SECTION 12(G) OF THIS AGREEMENT, YOU AND SLIIKE AGREE TO WAIVE ANY RIGHT TO RESOLVE CLAIMS WITHIN THE SCOPE OF THIS ARBITRATION AGREEMENT ON A CLASS, COLLECTIVE, OR REPRESENTATIVE BASIS. ALL CLAIMS AND DISPUTES WITHIN THE SCOPE OF THIS ARBITRATION AGREEMENT MUST BE ARBITRATED ON AN INDIVIDUAL BASIS AND NOT ON A CLASS OR COLLECTIVE BASIS EXCEPT AS SET FORTH IN SECTION 12(G). CLAIMS OF MORE THAN ONE BEAUTICIAN OR USER CANNOT BE ARBITRATED OR LITIGATED JOINTLY OR CONSOLIDATED WITH THOSE OF ANY OTHER BEAUTICIAN OR USER EXCEPT AS SET FORTH IN SECTION 12(G). If, however, this waiver of class or consolidated actions is deemed invalid or unenforceable with respect to a particular claim or dispute, neither you nor Sliike is entitled to arbitration of such claim or dispute. Instead, all such claims and disputes will then be resolved in a court as set forth in Section 19. This provision does not prevent you or Sliike from participating in a class-wide settlement of claims. 
                  \n(g) Batch Arbitrations. To increase efficiency of resolution, in the event 100 or more similar arbitration demands against Sliike, presented by or with the assistance of the same law firm or organization, are submitted to an arbitration provider selected in accordance with the rules described above within a 30-day period, the arbitration provider shall (i) group the arbitration demands into batches of no more than 100 demands per batch (plus, to the extent there are less than 100 arbitration demands left over after the batching described above, a final batch consisting of the remaining demands); and (ii) provide for resolution of each batch as a single arbitration with one set of filing and administrative fees and one arbitrator assigned per batch. You agree to cooperate in good faith with Sliike and the arbitration provider to implement such a batch approach to resolution and fees. 
                  \n(h) Survival. This Arbitration Agreement will survive any termination of your relationship with Sliike.  
                  \n(k) Modification. Notwithstanding any provision in the Agreement to the contrary, we agree that if Sliike makes any future material change to this Arbitration Agreement, it will not apply to any individual claim(s) that you had already provided notice of to Sliike.""",
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "spartan",
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 15),
              const Text(
                "13. Third-Party Interactions.",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: "spartan",
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 10),
              const Text(
                """(a) Third-Party Websites, Applications and Advertisements. The Services may contain links to third-party websites (“Third-Party Websites”) and applications (“Third-Party Applications”) and advertisements (“Third-Party Advertisements”) (collectively, “Third-Party Websites & Advertisements”). When you click on a link to a Third-Party Website, Third-Party Application or Third-Party Advertisement, Sliike will not warn you that you have left Sliike’s website or Services and will not warn you that you are subject to the terms and conditions (including privacy policies) of another website or destination. Such Third-Party Websites & Advertisements are not under the control of Sliike. Sliike is not responsible for any Third-Party Websites, Third-Party Applications or any Third-Party Advertisements. Sliike does not review, approve, monitor, endorse, warrant, or make any representations with respect to such Third-Party Websites & Advertisements, or their products or services. You use all links in Third-Party Websites & Advertisements at your own risk. You should review applicable terms and policies, including privacy and data gathering practices of any Third-Party Websites or Third-Party Applications, and make whatever investigation you feel necessary or appropriate before proceeding with any transaction with any third party.
                   (b) App Stores. You acknowledge and agree that the availability of the Platform and the Services is dependent on the third party from which you received the application license, e.g., the Apple iPhone or Android app stores (“App Store”). You acknowledge and agree that this Agreement is between you and Sliike and not with the App Store. Sliike, not the App Store, is solely responsible for the Platform and the Services, including the mobile application(s), the content thereof, maintenance, support services and warranty therefor, and addressing any claims relating thereto (e.g., product liability, legal compliance or intellectual property infringement). In order to use the Platform and the Services, you must have access to a wireless network, and you agree to pay all fees associated with such access. You also agree to pay all fees (if any) charged by the App Store in connection with the Platform or the Services. You agree to comply with, and your license to use the Platform and the Services is conditioned upon your compliance with, all applicable third-party terms of agreement (e.g., the App Store’s terms and policies) when using the Platform or the Services. You represent and warrant that you are not located in a country that is subject to a Canada ban, or that has been designated by the Canadian Government as a “terrorist supporting” country, and you represent and warrant that you are not listed on any Canada Government list of prohibited or restricted parties. You acknowledge and agree that each App Store (and its affiliates) is an intended third-party beneficiary of this Agreement and has the right to enforce the terms and conditions of this Agreement. """,
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "spartan",
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 15),
              const Text(
                "13. Third-Party Interactions.",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: "spartan",
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 10),
              const Text(
                """(a) Third-Party Websites, Applications and Advertisements. The Services may contain links to third-party websites (“Third-Party Websites”) and applications (“Third-Party Applications”) and advertisements (“Third-Party Advertisements”) (collectively, “Third-Party Websites & Advertisements”). When you click on a link to a Third-Party Website, Third-Party Application or Third-Party Advertisement, Sliike will not warn you that you have left Sliike’s website or Services and will not warn you that you are subject to the terms and conditions (including privacy policies) of another website or destination. Such Third-Party Websites & Advertisements are not under the control of Sliike. Sliike is not responsible for any Third-Party Websites, Third-Party Applications or any Third-Party Advertisements. Sliike does not review, approve, monitor, endorse, warrant, or make any representations with respect to such Third-Party Websites & Advertisements, or their products or services. You use all links in Third-Party Websites & Advertisements at your own risk. You should review applicable terms and policies, including privacy and data gathering practices of any Third-Party Websites or Third-Party Applications, and make whatever investigation you feel necessary or appropriate before proceeding with any transaction with any third party.
                   (b) App Stores. You acknowledge and agree that the availability of the Platform and the Services is dependent on the third party from which you received the application license, e.g., the Apple iPhone or Android app stores (“App Store”). You acknowledge and agree that this Agreement is between you and Sliike and not with the App Store. Sliike, not the App Store, is solely responsible for the Platform and the Services, including the mobile application(s), the content thereof, maintenance, support services and warranty therefor, and addressing any claims relating thereto (e.g., product liability, legal compliance or intellectual property infringement). In order to use the Platform and the Services, you must have access to a wireless network, and you agree to pay all fees associated with such access. You also agree to pay all fees (if any) charged by the App Store in connection with the Platform or the Services. You agree to comply with, and your license to use the Platform and the Services is conditioned upon your compliance with, all applicable third-party terms of agreement (e.g., the App Store’s terms and policies) when using the Platform or the Services. You represent and warrant that you are not located in a country that is subject to a Canada ban, or that has been designated by the Canadian Government as a “terrorist supporting” country, and you represent and warrant that you are not listed on any Canada Government list of prohibited or restricted parties. You acknowledge and agree that each App Store (and its affiliates) is an intended third-party beneficiary of this Agreement and has the right to enforce the terms and conditions of this Agreement. """,
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "spartan",
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 15),
              const Text(
                "14. Social Media Guidelines.",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: "spartan",
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 10),
              const Text(
                """Sliike maintains certain social media pages for the benefit of the Sliike community. By posting, commenting, or otherwise interacting with these pages, you agree to abide by our Social Media Community Guidelines. """,
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "spartan",
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 15),
              const Text(
                "15. Indemnification",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: "spartan",
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 10),
              const Text(
                """You agree to indemnify and hold harmless Sliike and its officers, directors, employees, agents and affiliates (each, an “Indemnified Party”), from and against any losses, claims, actions, costs, damages, penalties, fines and expenses, including without limitation, attorneys’ fees and expenses, that may be incurred by an Indemnified Party arising out of, relating to or resulting from (a) your Beautician or User Content; (b) your misuse of the Platform or Services; (c) your breach of this Agreement or any representation, warranty or covenant in this Agreement; or (d) your violation of any applicable laws, rules or regulations through or related to the use of the Platform or Services. In the event of any claim, allegation, suit or proceeding alleging any matter potentially covered by the agreements in this Section, you agree to pay for the defense of the Indemnified Party, including reasonable costs and attorneys’ fees incurred by the Indemnified Party. Sliike reserves the right, at its own cost, to assume the exclusive defense and control of any matter otherwise subject to indemnification by you, in which event you will fully cooperate with Sliike in asserting any available defenses. This provision does not require you to indemnify any Indemnified Party for any unconscionable commercial practice by such party, or for such party’s negligence, fraud, deception, false promise, misrepresentation or concealment, suppression or omission of any material fact in connection with the Platform or Services. You agree that the provisions in this section will survive any termination of your account, this Agreement, or your access to the Software and/or Services.""",
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "spartan",
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 15),
              const Text(
                "16. Disclaimer of Warranties ",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: "spartan",
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 10),
              const Text(
                """YOU EXPRESSLY UNDERSTAND AND AGREE THAT TO THE FULLEST EXTENT OF LAW, YOUR USE OF THE PLATFORM AND SERVICES IS ENTIRELY AT YOUR OWN RISK. CHANGES ARE PERIODICALLY MADE TO THE PLATFORM AND SERVICES AND MAY BE MADE AT ANY TIME WITHOUT NOTICE TO YOU. THE PLATFORM AND SERVICES ARE PROVIDED ON AN “AS IS” BASIS WITHOUT WARRANTIES OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. SLIIKE MAKES NO WARRANTIES OR REPRESENTATIONS ABOUT THE ACCURACY, RELIABILITY, COMPLETENESS OR TIMELINESS OF THE CONTENT MADE AVAILABLE THROUGH THE PLATFORM OR SERVICES, OR THE SERVICES, SOFTWARE, TEXT, GRAPHICS OR LINKS.
                  \nSLIIKE DOES NOT WARRANT THAT THE PLATFORM OR SERVICES WILL OPERATE ERROR-FREE OR THAT THE PLATFORM OR SERVICES ARE FREE OF COMPUTER VIRUSES AND OTHER HARMFUL MALWARE. IF YOUR USE OF THE PLATFORM OR SERVICES RESULTS IN THE NEED FOR SERVICING OR REPLACING EQUIPMENT OR DATA, SLIIKE SHALL NOT BE RESPONSIBLE FOR THOSE ECONOMIC COSTS. """,
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "spartan",
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 15),
              const Text(
                "17. Breach And Limitation of Liability",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: "spartan",
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 10),
              const Text(
                """(a) General. You understand and agree that a key element of the Services and this Agreement is your and our mutual desire to keep the Services simple and efficient, and to provide the Platform and Services at low cost.  You understand and agree to the limitations on remedies and liabilities set forth in this Section 18 to keep the Platform and Services simple and efficient, and costs low, for all Beauticians and Users.
                \n(b) Cap on Liability. TO THE FULLEST EXTENT PERMITTED BY LAW, SLIIKE’S AGGREGATE LIABILITY SHALL NOT EXCEED THE GREATER OF AMOUNTS ACTUALLY PAID BY AND/OR DUE FROM YOU TO SLIIKE IN THE SIX (6) MONTH PERIOD IMMEDIATELY PRECEDING THE EVENT GIVING RISE TO SUCH CLAIM. THIS CAP ON LIABILITY SHALL APPLY FULLY TO RESIDENTS OF CANADA. 
                \n(c) Disclaimer of Certain Damages. TO THE FULLEST EXTENT OF LAW, SLIIKE SHALL NOT BE LIABLE TO YOU OR ANYONE ELSE FOR ANY INDIRECT, PUNITIVE, SPECIAL, EXEMPLARY, INCIDENTAL, CONSEQUENTIAL OR OTHER DAMAGES OF ANY TYPE OR KIND (INCLUDING PERSONAL INJURY, LOST PROFITS, PAIN AND SUFFERING, EMOTIONAL DISTRESS, AND LOSS OF DATA, REVENUE, USE AND ECONOMIC ADVANTAGE). THE FOREGOING DISCLAIMER OF PUNITIVE AND EXEMPLARY DAMAGES, AND THE ENTIRE DISCLAIMER OF DAMAGES FOR PERSONAL INJURY OR PROPERTY DAMAGE, OR FOR ANY INJURY CAUSED BY SLIIKE’S FRAUD OR FRAUDULENT MISREPRESENTATION, SHALL NOT APPLY TO USERS WHO RESIDE IN CANADA. """,
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "spartan",
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 15),
              const Text(
                "18. Exclusive Venue",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: "spartan",
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 10),
              const Text(
                """To the extent the parties are permitted under this Agreement to initiate litigation in a court, both you and Sliike agree that all claims and disputes arising out of or relating to the Agreement will be litigated exclusively in the city or provincial court in the SouthShore of Quebec if you resident of Quebec, and in the city or provincial court for the province in which you reside if you are not a resident of Quebec. """,
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "spartan",
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 15),
              const Text(
                "19. Termination",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: "spartan",
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 10),
              const Text(
                """If you violate this Agreement, Sliike may respond based on a number of factors including, but not limited to, the egregiousness of your actions and whether a pattern of harmful behavior exists.
                  \nIn addition, at its sole discretion, Sliike may modify or discontinue the Platform or Service, or may modify, suspend or terminate your access to the Platform or the Services, for any reason, with or without notice to you and without liability to you or any third party. In addition to suspending or terminating your access to the Platform or the Service, Sliike reserves the right to take appropriate legal action, including without limitation, pursuing civil, criminal or injunctive redress. Even after your right to use the Platform or the Services is terminated, this Agreement will remain enforceable against you. All provisions which by their nature should survive to give effect to those provisions shall survive the termination of this Agreement. """,
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "spartan",
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 15),
              const Text(
                "20. Procedure for Making Claims of Copyright Infringement.",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: "spartan",
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 10),
              const Text(
                """It is Sliike’s policy to terminate membership privileges of any Beautician or User who repeatedly infringes copyright upon prompt notification to Sliike by the copyright owner or the copyright owner’s legal agent. Without limiting the foregoing, if you believe that your work has been copied and posted on the Services in a way that constitutes copyright infringement, please send an email to connect@sliike.com with the following information: (a) an electronic or physical signature of the person authorized to act on behalf of the owner of the copyright interest; (b) a description of the copyrighted work that you claim has been infringed; (c) a description of the location on the Services of the material that you claim is infringing; (d) your address, telephone number and e-mail address; (e) a written statement by you that you have a good faith belief that the disputed use is not authorized by the copyright owner, its agent or the law; and (f) a statement by you, made under penalty of perjury, that the above information in your notice is accurate and that you are the copyright owner or authorized to act on the copyright owner’s behalf.""",
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "spartan",
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 15),
              const Text(
                "21. General",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: "spartan",
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 10),
              const Text(
                """(a) No Joint Venture or Partnership. No joint venture, partnership, employment, or agency relationship exists between you, Sliike or any third-party provider as a result of this Agreement or use of the Platform or Services. 
\n(b) Choice of Law. This Agreement is governed by the civil codes of Quebec, without giving effect to any principles that provide for the application of the law of any other jurisdiction. 
\n(c) Severability. Except as otherwise provided in this Agreement, if any provision of this Agreement is found to be invalid, the invalidity of such provision shall not affect the validity of the remaining provisions of this Agreement, which shall remain in full force and effect. 
\n(d) Consumer Complaints. In accordance with Quebec consumer protection law, you may report complaints to connect@sliike.com. 
\n(e) Notice. Where Sliike requires that you provide an e-mail address, you are responsible for providing Sliike to Sliike is not valid, or for any reason is not capable of delivering to you any notices required or permitted by this Agreement, Sliike’s dispatch of the e-mail containing such notice will nonetheless constitute effective notice. You may give notice to Sliike through our Platform. Such notice shall be deemed given on the next business day after such e-mail is actually received by Sliike. 
\n(f) Electronic Communications. For contractual purposes, you (1) consent to receive communications from Sliike in an electronic form; and (2) agree that all terms and conditions, agreements, notices, disclosures, and other communications that Sliike provides to you electronically satisfy any legal requirement that such communications would satisfy if they were in writing. You agree to keep your contact information, including email address, current. This subparagraph does not affect your statutory rights. 
\n(g) Transfer and Assignment. This Agreement, and any rights and licenses granted hereunder, may not be transferred or assigned by you, but may be assigned by Sliike without restriction. Any attempted transfer or assignment in violation hereof shall be null and void. This Agreement binds and inures to the benefit of each party and the party’s successors and permitted assigns. 
\n(i) Entire Agreement. This Agreement is the final, complete and exclusive agreement of the parties with respect to the subject matter hereof and supersedes and merges all prior discussions between the parties with respect to such subject matter. However, nothing in this Agreement shall supersede, amend, or modify the terms of any separate agreement(s) between you and Sliike relating to your work as an employee or independent beautician, including, without limitation, any Independent or Employment Beautician Agreement governing your efforts as a Beautician.""",
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "spartan",
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 15),
              const Text(
                "21. Contact Information ",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: "spartan",
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 10),
              const Text(
                """Do not hesitate to send us questions or comments regarding the Terms: 
\nSliike Corporation 
\n3746 rue Belcourt 
\nLongueuil, J4M 2M3 
\nQuebec, CANADA """,
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "spartan",
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }
}
