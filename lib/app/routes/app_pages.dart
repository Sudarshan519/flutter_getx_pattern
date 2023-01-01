import 'package:get/get.dart';

import '../modules/add_employee/bindings/add_employee_binding.dart';
import '../modules/add_employee/views/add_employee_view.dart';
import '../modules/candidate_login/bindings/candidate_login_binding.dart';
import '../modules/candidate_login/views/candidate_login_view.dart';
import '../modules/company_detail/bindings/company_detail_binding.dart';
import '../modules/company_detail/views/company_detail_view.dart';
import '../modules/create_company/bindings/create_company_binding.dart';
import '../modules/create_company/views/create_company_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/employer_dashboard/bindings/employer_dashboard_binding.dart';
import '../modules/employer_dashboard/views/employer_dashboard_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/language/bindings/language_binding.dart';
import '../modules/language/views/language_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/mobile_opt/bindings/mobile_opt_binding.dart';
import '../modules/mobile_opt/views/mobile_opt_view.dart';
import '../modules/welcome/bindings/welcome_binding.dart';
import '../modules/welcome/views/welcome_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LANGUAGE;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LANGUAGE,
      page: () => const LanguageView(),
      binding: LanguageBinding(),
    ),
    GetPage(
      name: _Paths.WELCOME,
      page: () => const WelcomeView(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.MOBILE_OPT,
      page: () => const MobileOptView(),
      binding: MobileOptBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.CANDIDATE_LOGIN,
      page: () => const CandidateLoginView(),
      binding: CandidateLoginBinding(),
    ),
    GetPage(
      name: _Paths.EMPLOYER_DASHBOARD,
      page: () => const EmployerDashboardView(),
      binding: EmployerDashboardBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_COMPANY,
      page: () => const CreateCompanyView(),
      binding: CreateCompanyBinding(),
    ),
    GetPage(
      name: _Paths.COMPANY_DETAIL,
      page: () => const CompanyDetailView(),
      binding: CompanyDetailBinding(),
    ),
    GetPage(
      name: _Paths.ADD_EMPLOYEE,
      page: () => const AddEmployeeView(),
      binding: AddEmployeeBinding(),
    ),
  ];
}
