import 'package:UIKit/screens/auth/ForgotPassword1Screen.dart';
import 'package:UIKit/screens/auth/ForgotPassword2Screen.dart';
import 'package:UIKit/screens/auth/Login1Screen.dart';
import 'package:UIKit/screens/auth/Login2Screen.dart';
import 'package:UIKit/screens/auth/LoginRegisterScreen.dart';
import 'package:UIKit/screens/auth/OTPVerificationScreen.dart';
import 'package:UIKit/screens/auth/Register1Screen.dart';
import 'package:UIKit/screens/auth/Register2Screen.dart';
import 'package:UIKit/screens/chat/ChatFacebookPage.dart';
import 'package:UIKit/screens/chat/ChatHomeScreen.dart';
import 'package:UIKit/screens/handyman/HandymanFullApp.dart';
import 'package:UIKit/screens/lms/LMSFullApp.dart';
import 'package:UIKit/screens/chat/ChatWhatsAppPage.dart';
import 'package:UIKit/screens/course/CourseFullApp.dart';
import 'package:UIKit/screens/dashboard/LMSDashboardScreen.dart';
import 'package:UIKit/screens/dashboard/SellerDashboardScreen.dart';
import 'package:UIKit/screens/event/EventFullApp.dart';
import 'package:UIKit/screens/food/FoodOnboardingScreen.dart';
import 'package:UIKit/screens/health/HealthFullApp.dart';
import 'package:UIKit/screens/hotel/HotelLoginScreen.dart';
import 'package:UIKit/screens/hotel/HotelOnboardingScreen.dart';
import 'package:UIKit/screens/hotel/HotelPasswordScreen.dart';
import 'package:UIKit/screens/hotel/HotelRegisterScreen.dart';
import 'package:UIKit/screens/mail/MailHomeScreen.dart';
import 'package:UIKit/screens/music/MusicLoginScreen.dart';
import 'package:UIKit/screens/music/MusicOnboardingScreen.dart';
import 'package:UIKit/screens/music/MusicPasswordScreen.dart';
import 'package:UIKit/screens/music/MusicProfileScreen.dart';
import 'package:UIKit/screens/music/MusicRegisterScreen.dart';
import 'package:UIKit/screens/news/NewsCategeryScreen.dart';
import 'package:UIKit/screens/other/AboutAppScreen.dart';
import 'package:UIKit/screens/other/EmptyCartScreen.dart';
import 'package:UIKit/screens/other/FAQQuestionScreen.dart';
import 'package:UIKit/screens/other/MaintenanceScreen.dart';
import 'package:UIKit/screens/other/NoInternetScreen.dart';
import 'package:UIKit/screens/other/PageNotFoundScreen.dart';
import 'package:UIKit/screens/other/ProductSoldOutScreen.dart';
import 'package:UIKit/screens/profile/CompanyProfileScreen.dart';
import 'package:UIKit/screens/profile/EditProfileScreen.dart';
import 'package:UIKit/screens/hotel/HotelProfileScreen.dart';
import 'package:UIKit/screens/profile/ProfileScreen.dart';
import 'package:UIKit/screens/quiz/QuizCustomizeScreen.dart';
import 'package:UIKit/screens/quiz/QuizHomeScreen.dart';
import 'package:UIKit/screens/quiz/QuizQuestionType1Screen.dart';
import 'package:UIKit/screens/quiz/QuizQuestionType2Screen.dart';
import 'package:UIKit/screens/setting/AccountSettingScreen.dart';
import 'package:UIKit/screens/setting/BasicSettingScreen.dart';
import 'package:UIKit/screens/setting/NotificationSettingScreen.dart';
import 'package:UIKit/screens/setting/PrivacySecuritySettingScreen.dart';
import 'package:UIKit/screens/shopping/ShoppingLoginScreen.dart';
import 'package:UIKit/screens/shopping/ShoppingOnboardingScreen.dart';
import 'package:UIKit/screens/shopping/ShoppingPasswordScreen.dart';
import 'package:UIKit/screens/shopping/ShoppingProfileScreen.dart';
import 'package:UIKit/screens/shopping/ShoppingRegisterScreen.dart';
import 'package:UIKit/screens/social/SocialFullApp.dart';
import 'package:UIKit/screens/wallet/WalletCryptoScreen.dart';
import 'package:UIKit/screens/wallet/WalletHomeScreen.dart';
import 'package:UIKit/screens/wallet/WalletPaymentScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'AppTheme.dart';
import 'AppThemeNotifier.dart';
import 'SingleGridItem.dart';

class ScreensHome extends StatefulWidget {
  @override
  _ScreensHomeState createState() => _ScreensHomeState();
}

class _ScreensHomeState extends State<ScreensHome> {

  CustomAppTheme? customAppTheme;

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);


    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget? child) {
        customAppTheme = AppTheme.getCustomAppTheme(value.themeMode());
        return Container(
            padding: EdgeInsets.only(
                left: 8, right: 8, bottom: 12),
            child: ListView(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(
                      top: 16,
                      left: 8,
                      bottom: 12),
                  child: Text(
                    "APPS",
                    style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
                        fontWeight: 700),
                  ),
                ),
                GridView.count(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    crossAxisCount: 2,
                    padding: EdgeInsets.all(4),
                    mainAxisSpacing: 16,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 16,children: <Widget>[
                      SinglePageItem(
                        icon: './assets/icons/newspaper-outline.png',
                        title: "News",
                        navigation: NewsCategoryScreen(),
                      ),
                      SinglePageItem(
                        icon: './assets/icons/worker.png',
                        title: "Handyman",
                        navigation: HandymanFullApp(),
                      ),
                      SinglePageItem(
                        icon: './assets/icons/school-outline.png',
                        title: "LMS",
                        navigation: LMSFullApp(),
                      ),
                      SinglePageItem(
                        icon: './assets/icons/health-outline.png',
                        title: "Health",
                        navigation: HealthFullApp(),
                      ),
                      SinglePageItem(
                        icon: './assets/icons/instagram-outline.png',
                        title: "Social",
                        navigation: SocialFullApp(),
                      ),
                      SinglePageItem(
                        title: "Event",
                        icon: './assets/icons/ticket-outline.png',
                        navigation: EventFullApp(),
                      ),
                      SinglePageItem(
                        icon: './assets/icons/course-outline.png',
                        title: "Course",
                        navigation: CourseFullApp(),
                      ),
                      SinglePageItem(
                        title: "Shopping",
                        icon: './assets/icons/shop-outline.png',
                        navigation: ShoppingOnboardingScreen(),
                      ),
                      SinglePageItem(
                        title: "Chat",
                        icon: './assets/icons/chat-outline.png',
                        navigation: ChatHomeScreen(),
                      ),
                      SinglePageItem(
                        title: "Food",
                        icon: './assets/icons/food-outline.png',
                        navigation: FoodOnboardingScreen(),
                      ),
                      SinglePageItem(
                        title: "Hotel",
                        icon: './assets/icons/hotel-outline.png',
                        navigation: HotelOnboardingScreen(),
                      ),
                      SinglePageItem(
                        title: "Music",
                        icon: './assets/icons/music-outline.png',
                        navigation: MusicOnboardingScreen(),
                      ),

                    ]),
                Container(
                  padding: EdgeInsets.only(top: 16, left: 8, bottom: 12),
                  child: Text(
                    "PAGES",
                    style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
                        fontWeight: 700),
                  ),
                ),
                GridView.count(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    crossAxisCount: 2,
                    padding: EdgeInsets.all(4),
                    mainAxisSpacing: 16,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 16,
                    children: <Widget>[
                      SingleGridItem(
                        title: "Quiz",
                        icon: './assets/icons/quiz-outline.png',
                        isComingSoon: true,
                        comingSoonText: "Quiz app is coming soon",
                        items: [
                          SinglePageItem(
                            icon: './assets/icons/quiz-outline.png',
                            title: "Home",
                            navigation: QuizHomeScreen(),
                          ),
                          SinglePageItem(
                            icon: './assets/icons/quiz-outline.png',
                            title: "Customize",
                            navigation: QuizCustomizeScreen(),
                          ),
                          SinglePageItem(
                            icon: './assets/icons/quiz-outline.png',
                            title: "Question 1",
                            navigation: QuizQuestionType1Screen(),
                          ),
                          SinglePageItem(
                            icon: './assets/icons/quiz-outline.png',
                            title: "Question 2",
                            navigation: QuizQuestionType2Screen(),
                          ),
                        ],
                      ),
                      SinglePageItem(
                        title: "Mail",
                        icon: './assets/icons/email-outline.png',
                        navigation: MailHomeScreen(),
                      ),
                      SingleGridItem(
                        title: "Authentication",
                        icon: './assets/icons/auth-outline.png',
                        items: <SinglePageItem>[
                          SinglePageItem(
                            title: "Login 1",
                            navigation: ShoppingLoginScreen(),
                            icon: './assets/icons/auth-outline.png',
                          ),
                          SinglePageItem(
                            title: "Login 2",
                            icon: './assets/icons/auth-outline.png',
                            navigation: HotelLoginScreen(),
                          ),
                          SinglePageItem(
                            title: "Login 3",
                            icon: './assets/icons/auth-outline.png',
                            navigation: MusicLoginScreen(),
                          ),
                          SinglePageItem(
                            title: "Login 4",
                            icon: './assets/icons/auth-outline.png',
                            navigation: Login1Screen(),
                          ),
                          SinglePageItem(
                            title: "Login 5",
                            icon: './assets/icons/auth-outline.png',
                            navigation: Login2Screen(),
                          ),
                          SinglePageItem(
                            title: "Register 1",
                            icon: './assets/icons/auth-outline.png',
                            navigation: ShoppingRegisterScreen(),
                          ),
                          SinglePageItem(
                            title: "Register 2",
                            icon: './assets/icons/auth-outline.png',
                            navigation: HotelRegisterScreen(),
                          ),
                          SinglePageItem(
                            title: "Register 3",
                            icon: './assets/icons/auth-outline.png',
                            navigation: MusicRegisterScreen(),
                          ),
                          SinglePageItem(
                            title: "Register 4",
                            icon: './assets/icons/auth-outline.png',
                            navigation: Register1Screen(),
                          ),
                          SinglePageItem(
                            title: "Register 5",
                            icon: './assets/icons/auth-outline.png',
                            navigation: Register2Screen(),
                          ),
                          SinglePageItem(
                            title: "Reset Password 1",
                            icon: './assets/icons/auth-outline.png',
                            navigation: ShoppingPasswordScreen(),
                          ),
                          SinglePageItem(
                            title: "Reset Password 2",
                            icon: './assets/icons/auth-outline.png',
                            navigation: HotelPasswordScreen(),
                          ),
                          SinglePageItem(
                            title: "Reset Password 3",
                            icon: './assets/icons/auth-outline.png',
                            navigation: MusicPasswordScreen(),
                          ),
                          SinglePageItem(
                            title: "Reset Password 4",
                            icon: './assets/icons/auth-outline.png',
                            navigation: ForgotPassword1Screen(),
                          ),
                          SinglePageItem(
                            title: "Reset Password 5",
                            icon: './assets/icons/auth-outline.png',
                            navigation: ForgotPassword2Screen(),
                          ),
                          SinglePageItem(
                            title: "Login \& Register",
                            icon: './assets/icons/auth-outline.png',
                            navigation: LoginRegisterScreen(),
                          ),
                          SinglePageItem(
                            title: "OTP Verification",
                            icon: './assets/icons/auth-outline.png',
                            navigation: OTPVerificationScreen(),
                          ),
                        ],
                      ),
                      SingleGridItem(
                        title: "Settings",
                        icon: './assets/icons/setting-outline.png',
                        items: <SinglePageItem>[
                          SinglePageItem(
                            title: "Basic",
                            icon: './assets/icons/setting-outline.png',
                            navigation: BasicSettingScreen(),
                          ),
                          SinglePageItem(
                            title: "Account",
                            icon: './assets/icons/setting-outline.png',
                            navigation: AccountSettingScreen(),
                          ),
                          SinglePageItem(
                            title: "Notification",
                            icon: './assets/icons/setting-outline.png',
                            navigation: NotificationSettingScreen(),
                          ),
                          SinglePageItem(
                            title: "Privacy",
                            icon: './assets/icons/setting-outline.png',
                            navigation: PrivacySecuritySettingScreen(),
                          ),
                        ],
                      ),
                      SingleGridItem(
                        title: "Profile",
                        icon: './assets/icons/profile-outline.png',
                        items: <SinglePageItem>[
                          SinglePageItem(
                            title: "Social",
                            icon: './assets/icons/profile-outline.png',
                            navigation: ProfileScreen(),
                          ),
                          SinglePageItem(
                            title: "Company",
                            icon: './assets/icons/profile-outline.png',
                            navigation: CompanyProfileScreen(),
                          ),
                          SinglePageItem(
                            title: "Shopping",
                            icon: './assets/icons/profile-outline.png',
                            navigation: ShoppingProfileScreen(),
                          ),
                          SinglePageItem(
                            title: "Music",
                            icon: './assets/icons/profile-outline.png',
                            navigation: MusicProfileScreen(),
                          ),
                          SinglePageItem(
                            title: "Hotel",
                            icon: './assets/icons/profile-outline.png',
                            navigation: HotelProfileScreen(),
                          ),
                          SinglePageItem(
                            title: "Edit",
                            icon: './assets/icons/profile-outline.png',
                            navigation: EditProfileScreen(),
                          ),
                        ],
                      ),
                      SingleGridItem(
                        title: "Dashboard",
                        icon: './assets/icons/dashboard-outline.png',
                        items: <SinglePageItem>[
                          SinglePageItem(
                            title: "LMS",
                            icon: './assets/icons/dashboard-outline.png',
                            navigation: LMSDashboardScreen(),
                          ),
                          SinglePageItem(
                            title: "Seller",
                            icon: './assets/icons/dashboard-outline.png',
                            navigation: SellerDashboardScreen(),
                          ),
                        ],
                      ),
                      SingleGridItem(
                        title: "Wallet",
                        icon: './assets/icons/wallet-outline.png',
                        items: <SinglePageItem>[
                          SinglePageItem(
                            title: "Home",
                            icon: './assets/icons/wallet-outline.png',
                            navigation: WalletHomeScreen(),
                          ),
                          SinglePageItem(
                            title: "Payment",
                            icon: './assets/icons/wallet-outline.png',
                            navigation: WalletPaymentScreen(),
                          ),
                          SinglePageItem(
                            title: "Crypto",
                            icon: './assets/icons/wallet-outline.png',
                            navigation: WalletCryptoScreen(),
                          ),
                        ],
                      ),
                      SingleGridItem(
                        title: "Other",
                        icon: './assets/icons/tablet-landscape-outline.png',
                        items: <SinglePageItem>[
                          SinglePageItem(
                            title: "Whatsapp",
                            icon: './assets/icons/chat-outline.png',
                            navigation: ChatWhatsAppPage(),
                          ),
                          SinglePageItem(
                            title: "Facebook",
                            icon: './assets/icons/chat-outline.png',
                            navigation: ChatFacebookScreen(),
                          ),
                          SinglePageItem(
                            title: "About App",
                            icon: './assets/icons/tablet-landscape-outline.png',
                            navigation: AboutAppScreen(),
                          ),
                          SinglePageItem(
                            title: "Empty cart",
                            icon: './assets/icons/tablet-landscape-outline.png',
                            navigation: EmptyCartScreen(),
                          ),
                          SinglePageItem(
                            title: "FAQ",
                            icon: './assets/icons/tablet-landscape-outline.png',
                            navigation: FAQQuestionScreen(),
                          ),
                          SinglePageItem(
                            title: "Maintenance",
                            icon: './assets/icons/tablet-landscape-outline.png',
                            navigation: MaintenanceScreen(),
                          ),
                          SinglePageItem(
                            title: "No internet",
                            icon: './assets/icons/tablet-landscape-outline.png',
                            navigation: NoInternetScreen(),
                          ),
                          SinglePageItem(
                            title: "Page not found",
                            icon: './assets/icons/tablet-landscape-outline.png',
                            navigation: PageNotFoundScreen(),
                          ),
                          SinglePageItem(
                            title: "Sold out",
                            icon: './assets/icons/tablet-landscape-outline.png',
                            navigation: ProductSoldOutScreen(),
                          ),
                        ],
                      ),
                    ]),
                Container(
                  margin:
                  EdgeInsets.only(top: 16, bottom: 16),
                  child: Center(
                    child: Text("More Apps are coming soon...",
                        style: AppTheme.getTextStyle(
                          themeData.textTheme.bodyText2,
                          letterSpacing: 0.5,
                          fontWeight: 500,
                        )),
                  ),
                )
              ],
            ));
      },
    );
  }
}
