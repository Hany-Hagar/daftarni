import 'package:flutter/material.dart';

class IconPickerModel {
  final IconData icon;
  final List<String> titles; // [english, arabic (+ optional no-hamza)]
  IconPickerModel({required this.icon, required this.titles});
}

List<IconPickerModel> financeIcons = [
  // =========================
  // 💸 المصاريف اليومية / التسوق
  IconPickerModel(
    icon: Icons.shopping_cart,
    titles: ["Groceries", "بقالة / بقاله"],
  ),
  IconPickerModel(
    icon: Icons.restaurant,
    titles: ["Restaurants / Meals", "مطاعم / أكل / اكل"],
  ),
  IconPickerModel(
    icon: Icons.local_cafe,
    titles: ["Coffee / Drinks", "قهوة / قهوه"],
  ),
  IconPickerModel(icon: Icons.cake, titles: ["Sweets / Bakery", "حلويات"]),
  IconPickerModel(
    icon: Icons.checkroom,
    titles: ["Clothes / Fashion", "ملابس / هدوم"],
  ),
  IconPickerModel(
    icon: Icons.watch,
    titles: ["Shoes / Accessories", "أحذية / احذية"],
  ),
  IconPickerModel(
    icon: Icons.kitchen,
    titles: ["Household Items", "أدوات منزلية / ادوات منزلية"],
  ),
  IconPickerModel(
    icon: Icons.devices,
    titles: ["Electronics", "أدوات إلكترونية / ادوات الكترونية"],
  ),
  IconPickerModel(
    icon: Icons.child_care,
    titles: ["Kids Supplies", "مستلزمات أطفال / مستلزمات اطفال"],
  ),
  IconPickerModel(
    icon: Icons.pets,
    titles: ["Pets / Pet Supplies", "حيوانات أليفة / حيوانات اليفة"],
  ),
  IconPickerModel(
    icon: Icons.menu_book,
    titles: ["Office / Stationery", "أدوات مكتبية / ادوات مكتبية"],
  ),
  IconPickerModel(
    icon: Icons.local_mall,
    titles: ["Shopping / Malls", "تسوق / شراء / مول"],
  ),

  // =========================
  // 🏠 فواتير وخدمات منزلية
  IconPickerModel(icon: Icons.flash_on, titles: ["Electricity", "كهرباء"]),
  IconPickerModel(icon: Icons.water, titles: ["Water", "مياه"]),
  IconPickerModel(icon: Icons.local_gas_station, titles: ["Gas", "غاز"]),
  IconPickerModel(
    icon: Icons.wifi,
    titles: ["Internet / Data / WiFi", "إنترنت / انترنت / واي فاي"],
  ),
  IconPickerModel(
    icon: Icons.smartphone,
    titles: ["Phone / Calls", "هاتف / مكالمات "],
  ),
  IconPickerModel(
    icon: Icons.home,
    titles: ["Rent / Housing", "إيجار / ايجار"],
  ),
  IconPickerModel(
    icon: Icons.build,
    titles: ["Home Maintenance", "صيانة المنزل / صيانة المنزل"],
  ),
  IconPickerModel(
    icon: Icons.tv,
    titles: ["TV / Subscriptions", "تلفاز / تلفزبون / اشتراكات"],
  ),
  IconPickerModel(
    icon: Icons.cleaning_services,
    titles: ["Cleaning / Home Services", "تنظيف / خدمات منزلية"],
  ),

  // =========================
  // 🚗 مواصلات وتنقل
  IconPickerModel(
    icon: Icons.directions_car,
    titles: ["Car / Fuel", "سيارة / وقود / بنزين / عربية / عربيه"],
  ),
  IconPickerModel(icon: Icons.commute, titles: ["Taxi / Uber", "تاكسي"]),
  IconPickerModel(
    icon: Icons.directions_bus,
    titles: ["Bus / Train", "حافلات / قطار / اتوبيس / مواصلات"],
  ),
  IconPickerModel(
    icon: Icons.flight,
    titles: ["Flights / Travel", "رحلات / سفر / طيران"],
  ),
  IconPickerModel(
    icon: Icons.pedal_bike,
    titles: ["Biking / Walking", "دراجات"],
  ),
  IconPickerModel(icon: Icons.subway, titles: ["Subway / Metro", "مترو"]),
  IconPickerModel(
    icon: Icons.local_parking,
    titles: ["Parking", "مواقف سيارات"],
  ),

  // =========================
  // 🏥 الصحة والجمال
  IconPickerModel(
    icon: Icons.local_hospital,
    titles: ["Medicines / Hospital", "أدوية / ادوية"],
  ),
  IconPickerModel(
    icon: Icons.fitness_center,
    titles: ["Fitness / Exercise", "تمارين"],
  ),
  IconPickerModel(icon: Icons.face, titles: ["Cosmetics", "منتجات تجميل"]),
  IconPickerModel(
    icon: Icons.health_and_safety,
    titles: ["Personal Care", "مستلزمات شخصية"],
  ),
  IconPickerModel(
    icon: Icons.medical_services,
    titles: ["Doctor / Special Treatment", "زيارة طبيب"],
  ),
  IconPickerModel(icon: Icons.local_pharmacy, titles: ["Pharmacy", "صيدلية"]),

  // =========================
  // 🎬 الترفيه والهوايات
  IconPickerModel(icon: Icons.movie, titles: ["Cinema / Theater", "سينما"]),
  IconPickerModel(icon: Icons.menu_book, titles: ["Books / Education", "كتب"]),
  IconPickerModel(
    icon: Icons.sports_esports,
    titles: ["Games / Video Games", "ألعاب / العاب"],
  ),
  IconPickerModel(
    icon: Icons.music_note,
    titles: ["Music / Instruments", "موسيقى"],
  ),
  IconPickerModel(icon: Icons.brush, titles: ["Art / Creative Hobbies", "فن"]),
  IconPickerModel(
    icon: Icons.local_activity,
    titles: ["Trips / Events", "رحلات"],
  ),
  IconPickerModel(
    icon: Icons.sports_soccer,
    titles: ["Sports / Outdoor Activities", "رياضة"],
  ),
  IconPickerModel(
    icon: Icons.camera_alt,
    titles: ["Photography / Cameras", "تصوير"],
  ),

  // =========================
  // 💰 الادخار والاستثمار
  IconPickerModel(
    icon: Icons.savings,
    titles: ["Savings / Bank", "ادخار/ إدخار / بنك / فلوس"],
  ),
  IconPickerModel(
    icon: Icons.trending_up,
    titles: ["Investment / Stocks", "استثمار / استثمار / أسهم / اسهم"],
  ),
  IconPickerModel(
    icon: Icons.verified_user,
    titles: ["Pension / Insurance", " تامين / تأمين / معاش / معاش"],
  ),
  IconPickerModel(
    icon: Icons.credit_card,
    titles: ["Loans / Installments", "قروض"],
  ),
  IconPickerModel(
    icon: Icons.schedule,
    titles: ["Future Purchases", "مشتريات مستقبلية"],
  ),

  // =========================
  // 🎁 هدايا وتبرعات
  IconPickerModel(
    icon: Icons.card_giftcard,
    titles: ["Gifts / Occasions", "هدايا"],
  ),
  IconPickerModel(
    icon: Icons.volunteer_activism,
    titles: ["Donations / Charity", "تبرعات / صدقات / خيرية"],
  ),
  IconPickerModel(
    icon: Icons.event,
    titles: ["Birthdays / Celebrations", "أعياد ميلاد / اعياد ميلاد"],
  ),
  IconPickerModel(
    icon: Icons.local_florist,
    titles: ["Flowers / Small Gifts", "زهور / ورد"],
  ),
  IconPickerModel(
    icon: Icons.celebration,
    titles: ["Parties / Special Events", "حفلات"],
  ),

  // =========================
  // 🛠️ مشاريع شخصية وأعمال
  IconPickerModel(icon: Icons.work, titles: ["Projects / Work", "مشاريع"]),
  IconPickerModel(
    icon: Icons.engineering,
    titles: ["Office / Home Library", "أدوات مكتبية / ادوات مكتبية"],
  ),
  IconPickerModel(
    icon: Icons.subscriptions,
    titles: ["Subscriptions / Digital Services", "إشتراكات / اشتراكات"],
  ),
  IconPickerModel(
    icon: Icons.devices,
    titles: ["Equipment / Tech Tools", "معدات"],
  ),
  IconPickerModel(
    icon: Icons.school,
    titles: ["Personal Development / Learning", "تطوير شخصي / كورسات "],
  ),

  // =========================
  // 🔄 متنوعة / طوارئ / أخرى
  IconPickerModel(
    icon: Icons.help_outline,
    titles: ["Uncategorized Expenses", "مصاريف غير مصنفة"],
  ),
  IconPickerModel(
    icon: Icons.warning_amber,
    titles: ["Emergency / Surprise", "طوارئ"],
  ),
  IconPickerModel(
    icon: Icons.account_balance_wallet,
    titles: ["Money Transfer / Payments", "نقل أموال / نقل اموال"],
  ),
  IconPickerModel(
    icon: Icons.receipt_long,
    titles: ["Taxes / Government Fees", "ضرائب"],
  ),
  IconPickerModel(
    icon: Icons.groups,
    titles: ["Social Activities / Clubs", "أنشطة اجتماعية / انشطة اجتماعية"],
  ),
  IconPickerModel(
    icon: Icons.emoji_people,
    titles: ["Charity / Alms", "صدقات"],
  ),
  IconPickerModel(
    icon: Icons.support_agent,
    titles: ["Consultation / Professional", "استشارات"],
  ),

  // =========================
  // 💰 مصادر الدخل
  IconPickerModel(icon: Icons.attach_money, titles: ["Salary / Wage", "راتب"]),
  IconPickerModel(
    icon: Icons.business_center,
    titles: ["Business Income", "دخل من أعمال / دخل من اعمال"],
  ),
  IconPickerModel(
    icon: Icons.trending_up,
    titles: ["Investments / Stocks", "استثمار"],
  ),
  IconPickerModel(
    icon: Icons.account_balance,
    titles: ["Bank Interest / Savings", "فوائد بنك"],
  ),
  IconPickerModel(
    icon: Icons.payments,
    titles: ["Freelance / Projects", "عمل حر"],
  ),
  IconPickerModel(
    icon: Icons.card_giftcard,
    titles: ["Gifts / Bonus", "هدايا"],
  ),
  IconPickerModel(
    icon: Icons.star,
    titles: ["Extra Income / Side Job", "دخل إضافي / دخل اضافي"],
  ),
  IconPickerModel(
    icon: Icons.monetization_on,
    titles: ["Rental Income", "دخل إيجار / دخل ايجار"],
  ),
  IconPickerModel(
    icon: Icons.group,
    titles: ["Family Support / Allowance", "معونة عائلية"],
  ),
  IconPickerModel(
    icon: Icons.local_activity,
    titles: ["Bonuses / Rewards", "مكافآت"],
  ),
  IconPickerModel(
    icon: Icons.shopping_bag,
    titles: ["Selling Products / Services", "بيع منتجات / خدمات"],
  ),
  IconPickerModel(
    icon: Icons.store,
    titles: ["Small Business Profit", "أرباح شركات صغيرة"],
  ),
  IconPickerModel(
    icon: Icons.card_membership,
    titles: ["Government Grants / Aid", "مساعدات حكومية"],
  ),
  IconPickerModel(
    icon: Icons.school,
    titles: ["E-learning / Online Courses Income", "دخل من تعلم مهارات"],
  ),
  IconPickerModel(
    icon: Icons.handshake,
    titles: ["Partnership / Collaboration", "شراكات"],
  ),
  IconPickerModel(
    icon: Icons.emoji_events,
    titles: ["Awards / Competitions", "جوائز"],
  ),
  IconPickerModel(
    icon: Icons.trending_flat,
    titles: ["Passive Income", "دخل سلبي"],
  ),
  IconPickerModel(
    icon: Icons.autorenew,
    titles: ["Recurring Income", "دخل متكرر"],
  ),
  IconPickerModel(
    icon: Icons.lightbulb,
    titles: ["Ideas / Innovations Profit", "أرباح من أفكار / ارباح من افكار"],
  ),
  IconPickerModel(
    icon: Icons.local_atm,
    titles: ["Cashback / Rewards", "استرداد نقدي"],
  ),
  IconPickerModel(
    icon: Icons.volunteer_activism,
    titles: ["Charity / Donations Received", "تبرعات مستلمة"],
  ),
  IconPickerModel(
    icon: Icons.account_balance_wallet,
    titles: ["Wallet / Digital Payments Income", "دخل من محفظة"],
  ),
  IconPickerModel(
    icon: Icons.agriculture,
    titles: ["Agriculture / Farming Income", "دخل من زراعة"],
  ),
  IconPickerModel(
    icon: Icons.handyman,
    titles: ["Services / Jobs Income", "دخل من خدمات"],
  ),
];
