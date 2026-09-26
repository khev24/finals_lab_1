import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// ============================================================
// EA&LMS APP
// ============================================================

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EA&LMS',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: const Color(0xFFF3F4F1),
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryTeal,
          brightness: Brightness.light,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 15,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(9),
            borderSide: const BorderSide(
              color: Color(0xFFD7D2C8),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(9),
            borderSide: const BorderSide(
              color: Color(0xFFD7D2C8),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(9),
            borderSide: const BorderSide(
              color: primaryTeal,
              width: 1.5,
            ),
          ),
        ),
      ),
      initialRoute: '/LoginScreen',
      routes: {
        '/LoginScreen': (context) => const LoginScreen(),
        '/SignUpScreen': (context) => const SignUpScreen(),
        '/HomeScreen': (context) => const HomeScreen(),
      },
    );
  }
}

// ============================================================
// COLORS
// ============================================================

const Color primaryTeal = Color(0xFF1B5363);
const Color darkTeal = Color(0xFF123B47);
const Color tealLight = Color(0xFF2C6372);

const Color amber = Color(0xFFC98919);

const Color pageBackground = Color(0xFFF3F4F1);
const Color white = Color(0xFFFFFFFF);

const Color textDark = Color(0xFF20252B);
const Color textMuted = Color(0xFF68727D);
const Color borderColor = Color(0xFFD7D2C8);

const Color dangerRed = Color(0xFFDC2626);

// ============================================================
// EA&LMS LOGO
// ============================================================

class EalmsLogo extends StatelessWidget {
  final double size;
  final bool compact;

  const EalmsLogo({
    super.key,
    this.size = 70,
    this.compact = false,
  });

  @override
  Widget build(BuildContext context) {
    if (compact) {
      return Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.10),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.white.withOpacity(0.25),
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          'EA',
          style: TextStyle(
            color: Colors.white,
            fontSize: size * 0.25,
            fontWeight: FontWeight.w800,
            letterSpacing: 0.5,
          ),
        ),
      );
    }

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            primaryTeal,
            darkTeal,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(size * 0.25),
        boxShadow: [
          BoxShadow(
            color: primaryTeal.withOpacity(0.20),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Icon(
            Icons.business_center_rounded,
            color: Colors.white,
            size: size * 0.46,
          ),
          Positioned(
            right: size * 0.13,
            bottom: size * 0.13,
            child: Container(
              width: size * 0.25,
              height: size * 0.25,
              decoration: BoxDecoration(
                color: amber,
                shape: BoxShape.circle,
                border: Border.all(
                  color: darkTeal,
                  width: 2,
                ),
              ),
              child: Icon(
                Icons.check_rounded,
                color: darkTeal,
                size: size * 0.15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// LOGIN SCREEN
// ============================================================

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController usernameController =
      TextEditingController();

  final TextEditingController passwordController =
      TextEditingController();

  bool obscurePassword = true;

  String fullname = '';
  String registeredEmail = '';
  String registeredPassword = '';
  bool hasAccount = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final args = ModalRoute.of(context)?.settings.arguments;

    if (args is Map) {
      fullname = args['fullname'] ?? fullname;
      registeredEmail = args['email'] ?? registeredEmail;
      registeredPassword =
          args['password'] ?? registeredPassword;
      hasAccount = args['signedUp'] ?? hasAccount;
    }
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // ==========================================================
  // LOGIN
  // ==========================================================

  void login() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final username = usernameController.text.trim();
    final password = passwordController.text.trim();

    if (!hasAccount) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text(
            'Please create an employee account first.',
          ),
          behavior: SnackBarBehavior.floating,
          backgroundColor: darkTeal,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
      return;
    }

    if (username != registeredEmail ||
        password != registeredPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text(
            'Invalid username or password.',
          ),
          behavior: SnackBarBehavior.floating,
          backgroundColor: dangerRed,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
      return;
    }

    Navigator.pushNamedAndRemoveUntil(
      context,
      '/HomeScreen',
      (route) => false,
      arguments: {
        'fullname': fullname,
      },
    );
  }

  // ==========================================================
  // LOGIN PAGE
  // ==========================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pageBackground,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final bool desktop = constraints.maxWidth >= 850;

            if (desktop) {
              return _buildDesktopLogin();
            }

            return _buildMobileLogin();
          },
        ),
      ),
    );
  }

  // ==========================================================
  // DESKTOP LOGIN
  // ==========================================================

  Widget _buildDesktopLogin() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(28),
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 1180,
            maxHeight: 680,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(22),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.10),
                  blurRadius: 35,
                  offset: const Offset(0, 15),
                ),
              ],
            ),
            clipBehavior: Clip.antiAlias,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: _buildBrandPanel(),
                ),
                Expanded(
                  flex: 1,
                  child: _buildLoginForm(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ==========================================================
  // BRAND PANEL
  // ==========================================================

  Widget _buildBrandPanel() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            darkTeal,
            primaryTeal,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        children: [
          // TOP RIGHT CIRCLE
          Positioned(
            right: -65,
            top: -80,
            child: Container(
              width: 240,
              height: 240,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.055),
              ),
            ),
          ),

          // BOTTOM LEFT CIRCLE
          Positioned(
            left: -75,
            bottom: -90,
            child: Container(
              width: 195,
              height: 195,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.055),
              ),
            ),
          ),

          // CONTENT
          Padding(
            padding: const EdgeInsets.fromLTRB(
              42,
              46,
              42,
              42,
            ),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                // LOGO
                const EalmsLogo(
                  size: 46,
                  compact: true,
                ),

                const Spacer(),

                const Text(
                  'Manage your workforce\nwith confidence.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 27,
                    height: 1.18,
                    fontWeight: FontWeight.w900,
                    letterSpacing: -0.5,
                  ),
                ),

                const SizedBox(height: 20),

                const SizedBox(
                  width: 370,
                  child: Text(
                    'Track attendance, review leave requests, and '
                    'keep every department running on schedule — '
                    'all from one place.',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                      height: 1.6,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

                const SizedBox(height: 28),

                _brandFeature(
                  'Real-time attendance tracking',
                ),

                const SizedBox(height: 13),

                _brandFeature(
                  'Streamlined leave approvals',
                ),

                const SizedBox(height: 13),

                _brandFeature(
                  'Organization-wide reporting',
                ),

                const Spacer(),

                const Text(
                  '© 2026 EA&LMS. All rights reserved.',
                  style: TextStyle(
                    color: Colors.white60,
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _brandFeature(String text) {
    return Row(
      children: [
        Container(
          width: 18,
          height: 18,
          alignment: Alignment.center,
          child: const Icon(
            Icons.check_rounded,
            color: Colors.white,
            size: 18,
          ),
        ),
        const SizedBox(width: 9),
        Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }

  // ==========================================================
  // LOGIN FORM
  // ==========================================================

  Widget _buildLoginForm() {
    return Container(
      color: Colors.white,
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 42,
            vertical: 40,
          ),
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 430,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  // TOP LABEL
                  Row(
                    children: [
                      Container(
                        width: 16,
                        height: 2,
                        color: amber,
                      ),
                      const SizedBox(width: 9),
                      const Text(
                        'EMPLOYEE PORTAL',
                        style: TextStyle(
                          color: amber,
                          fontSize: 11,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 0.8,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 17),

                  const Text(
                    'Welcome back',
                    style: TextStyle(
                      color: textDark,
                      fontSize: 27,
                      fontWeight: FontWeight.w900,
                      letterSpacing: -0.6,
                    ),
                  ),

                  const SizedBox(height: 6),

                  const Text(
                    'Sign in to continue to Attendance & Leave Management.',
                    style: TextStyle(
                      color: textMuted,
                      fontSize: 13,
                      height: 1.5,
                    ),
                  ),

                  const SizedBox(height: 28),

                  // USERNAME
                  const Text(
                    'Username',
                    style: TextStyle(
                      color: textDark,
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                    ),
                  ),

                  const SizedBox(height: 7),

                  TextFormField(
                    controller: usernameController,
                    keyboardType:
                        TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: 'Enter your username',
                      hintStyle: TextStyle(
                        color: Color(0xFF9AA2AA),
                        fontSize: 14,
                      ),
                      prefixIcon: Icon(
                        Icons.person_outline_rounded,
                        color: Color(0xFF929BA3),
                        size: 20,
                      ),
                    ),
                    validator: (value) {
                      if (value == null ||
                          value.trim().isEmpty) {
                        return 'Please enter your username.';
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: 19),

                  // PASSWORD
                  const Text(
                    'Password',
                    style: TextStyle(
                      color: textDark,
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                    ),
                  ),

                  const SizedBox(height: 7),

                  TextFormField(
                    controller: passwordController,
                    obscureText: obscurePassword,
                    decoration: InputDecoration(
                      hintText: 'Enter your password',
                      hintStyle: const TextStyle(
                        color: Color(0xFF9AA2AA),
                        fontSize: 14,
                      ),
                      prefixIcon: const Icon(
                        Icons.lock_outline_rounded,
                        color: Color(0xFF929BA3),
                        size: 20,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            obscurePassword =
                                !obscurePassword;
                          });
                        },
                        icon: Icon(
                          obscurePassword
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: const Color(0xFF929BA3),
                          size: 19,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty) {
                        return 'Please enter your password.';
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: 25),

                  // SIGN IN
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: login,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryTeal,
                        foregroundColor: Colors.white,
                        elevation: 2,
                        shadowColor:
                            primaryTeal.withOpacity(0.30),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(7),
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment:
                            MainAxisAlignment.center,
                        children: [
                          Text(
                            'Sign In',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          SizedBox(width: 9),
                          Icon(
                            Icons.arrow_forward_rounded,
                            size: 18,
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 27),

                  // SIGN UP
                  Center(
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account? ",
                          style: TextStyle(
                            color: textMuted,
                            fontSize: 13,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              '/SignUpScreen',
                            );
                          },
                          child: const Text(
                            'Create Account',
                            style: TextStyle(
                              color: primaryTeal,
                              fontSize: 13,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 27),

                  Center(
                    child: Text(
                      'Having trouble signing in? Contact your system administrator.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 11,
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ==========================================================
  // MOBILE LOGIN
  // ==========================================================

  Widget _buildMobileLogin() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SizedBox(height: 18),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  darkTeal,
                  primaryTeal,
                ],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                const EalmsLogo(
                  size: 48,
                  compact: true,
                ),
                const SizedBox(height: 30),
                const Text(
                  'Manage your workforce\nwith confidence.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    height: 1.2,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 14),
                const Text(
                  'Track attendance, review leave requests, '
                  'and keep your organization running smoothly.',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 13,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.07),
                  blurRadius: 25,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: _buildMobileForm(),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 15,
                height: 2,
                color: amber,
              ),
              const SizedBox(width: 8),
              const Text(
                'EMPLOYEE PORTAL',
                style: TextStyle(
                  color: amber,
                  fontSize: 10,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 0.7,
                ),
              ),
            ],
          ),

          const SizedBox(height: 15),

          const Text(
            'Welcome back',
            style: TextStyle(
              color: textDark,
              fontSize: 25,
              fontWeight: FontWeight.w900,
            ),
          ),

          const SizedBox(height: 6),

          const Text(
            'Sign in to continue to Attendance & Leave Management.',
            style: TextStyle(
              color: textMuted,
              fontSize: 13,
              height: 1.5,
            ),
          ),

          const SizedBox(height: 26),

          const Text(
            'Username',
            style: TextStyle(
              color: textDark,
              fontSize: 12,
              fontWeight: FontWeight.w800,
            ),
          ),

          const SizedBox(height: 7),

          TextFormField(
            controller: usernameController,
            decoration: const InputDecoration(
              hintText: 'Enter your username',
              prefixIcon: Icon(
                Icons.person_outline_rounded,
              ),
            ),
            validator: (value) {
              if (value == null ||
                  value.trim().isEmpty) {
                return 'Please enter your username.';
              }

              return null;
            },
          ),

          const SizedBox(height: 18),

          const Text(
            'Password',
            style: TextStyle(
              color: textDark,
              fontSize: 12,
              fontWeight: FontWeight.w800,
            ),
          ),

          const SizedBox(height: 7),

          TextFormField(
            controller: passwordController,
            obscureText: obscurePassword,
            decoration: InputDecoration(
              hintText: 'Enter your password',
              prefixIcon: const Icon(
                Icons.lock_outline_rounded,
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    obscurePassword =
                        !obscurePassword;
                  });
                },
                icon: Icon(
                  obscurePassword
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                ),
              ),
            ),
            validator: (value) {
              if (value == null ||
                  value.isEmpty) {
                return 'Please enter your password.';
              }

              return null;
            },
          ),

          const SizedBox(height: 24),

          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: login,
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryTeal,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Row(
                mainAxisAlignment:
                    MainAxisAlignment.center,
                children: [
                  Text(
                    'Sign In',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(width: 8),
                  Icon(
                    Icons.arrow_forward_rounded,
                    size: 18,
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 22),

          Center(
            child: Wrap(
              alignment: WrapAlignment.center,
              children: [
                const Text(
                  "Don't have an account? ",
                  style: TextStyle(
                    color: textMuted,
                    fontSize: 13,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/SignUpScreen',
                    );
                  },
                  child: const Text(
                    'Create Account',
                    style: TextStyle(
                      color: primaryTeal,
                      fontWeight: FontWeight.w800,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// SIGN UP SCREEN
// ============================================================

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() =>
      _SignUpScreenState();
}

class _SignUpScreenState
    extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  final fullNameController =
      TextEditingController();

  final emailController =
      TextEditingController();

  final passwordController =
      TextEditingController();

  final confirmPasswordController =
      TextEditingController();

  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void signUp() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final fullname =
        fullNameController.text.trim();

    final email =
        emailController.text.trim();

    final password =
        passwordController.text.trim();

    Navigator.pushNamedAndRemoveUntil(
      context,
      '/LoginScreen',
      (route) => false,
      arguments: {
        'fullname': fullname,
        'email': email,
        'password': password,
        'signedUp': true,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pageBackground,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 620,
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_rounded,
                      ),
                      color: primaryTeal,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(32),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.circular(22),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black
                              .withOpacity(0.08),
                          blurRadius: 30,
                          offset:
                              const Offset(0, 12),
                        ),
                      ],
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Column(
                              children: [
                                const EalmsLogo(
                                  size: 65,
                                ),
                                const SizedBox(
                                  height: 18,
                                ),
                                const Text(
                                  'Create Employee Account',
                                  style: TextStyle(
                                    color: textDark,
                                    fontSize: 25,
                                    fontWeight:
                                        FontWeight.w900,
                                  ),
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  'Register your account to access EA&LMS.',
                                  style: TextStyle(
                                    color:
                                        textMuted,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 30),

                          const Text(
                            'Employee Information',
                            style: TextStyle(
                              color: primaryTeal,
                              fontSize: 17,
                              fontWeight:
                                  FontWeight.w900,
                            ),
                          ),

                          const SizedBox(height: 20),

                          _fieldLabel(
                            'Full Name',
                          ),

                          const SizedBox(height: 7),

                          TextFormField(
                            controller:
                                fullNameController,
                            textCapitalization:
                                TextCapitalization.words,
                            decoration:
                                const InputDecoration(
                              hintText:
                                  'Juan Dela Cruz',
                              prefixIcon: Icon(
                                Icons
                                    .person_outline_rounded,
                              ),
                            ),
                            validator: (value) {
                              if (value == null ||
                                  value
                                      .trim()
                                      .isEmpty) {
                                return 'Please enter your full name.';
                              }

                              return null;
                            },
                          ),

                          const SizedBox(height: 18),

                          _fieldLabel(
                            'Employee Email',
                          ),

                          const SizedBox(height: 7),

                          TextFormField(
                            controller:
                                emailController,
                            keyboardType:
                                TextInputType
                                    .emailAddress,
                            decoration:
                                const InputDecoration(
                              hintText:
                                  'employee@email.com',
                              prefixIcon: Icon(
                                Icons
                                    .email_outlined,
                              ),
                            ),
                            validator: (value) {
                              if (value == null ||
                                  value
                                      .trim()
                                      .isEmpty) {
                                return 'Please enter your email.';
                              }

                              if (!value.contains('@')) {
                                return 'Enter a valid email address.';
                              }

                              return null;
                            },
                          ),

                          const SizedBox(height: 18),

                          _fieldLabel('Password'),

                          const SizedBox(height: 7),

                          TextFormField(
                            controller:
                                passwordController,
                            obscureText:
                                obscurePassword,
                            decoration:
                                InputDecoration(
                              hintText:
                                  'Create a password',
                              prefixIcon:
                                  const Icon(
                                Icons
                                    .lock_outline_rounded,
                              ),
                              suffixIcon:
                                  IconButton(
                                onPressed: () {
                                  setState(() {
                                    obscurePassword =
                                        !obscurePassword;
                                  });
                                },
                                icon: Icon(
                                  obscurePassword
                                      ? Icons
                                          .visibility_outlined
                                      : Icons
                                          .visibility_off_outlined,
                                ),
                              ),
                            ),
                            validator: (value) {
                              if (value == null ||
                                  value.length <
                                      6) {
                                return 'Password must be at least 6 characters.';
                              }

                              return null;
                            },
                          ),

                          const SizedBox(height: 18),

                          _fieldLabel(
                            'Confirm Password',
                          ),

                          const SizedBox(height: 7),

                          TextFormField(
                            controller:
                                confirmPasswordController,
                            obscureText:
                                obscureConfirmPassword,
                            decoration:
                                InputDecoration(
                              hintText:
                                  'Re-enter your password',
                              prefixIcon:
                                  const Icon(
                                Icons
                                    .lock_reset_outlined,
                              ),
                              suffixIcon:
                                  IconButton(
                                onPressed: () {
                                  setState(() {
                                    obscureConfirmPassword =
                                        !obscureConfirmPassword;
                                  });
                                },
                                icon: Icon(
                                  obscureConfirmPassword
                                      ? Icons
                                          .visibility_outlined
                                      : Icons
                                          .visibility_off_outlined,
                                ),
                              ),
                            ),
                            validator: (value) {
                              if (value !=
                                  passwordController
                                      .text) {
                                return 'Passwords do not match.';
                              }

                              return null;
                            },
                          ),

                          const SizedBox(height: 26),

                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child:
                                ElevatedButton(
                              onPressed: signUp,
                              style:
                                  ElevatedButton
                                      .styleFrom(
                                backgroundColor:
                                    primaryTeal,
                                foregroundColor:
                                    Colors.white,
                                shape:
                                    RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius
                                          .circular(
                                    8,
                                  ),
                                ),
                              ),
                              child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment
                                        .center,
                                children: [
                                  Icon(
                                    Icons
                                        .person_add_alt_1_rounded,
                                    size: 19,
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    'Create Account',
                                    style:
                                        TextStyle(
                                      fontWeight:
                                          FontWeight
                                              .w800,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          const SizedBox(height: 18),

                          Center(
                            child: TextButton(
                              onPressed: () {
                                Navigator
                                    .pushReplacementNamed(
                                  context,
                                  '/LoginScreen',
                                );
                              },
                              child: const Text(
                                'Already have an account? Sign In',
                                style: TextStyle(
                                  color:
                                      primaryTeal,
                                  fontWeight:
                                      FontWeight.w800,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    'EA&LMS • Employee Portal',
                    style: TextStyle(
                      color: textMuted,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _fieldLabel(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: textDark,
        fontSize: 12,
        fontWeight: FontWeight.w800,
      ),
    );
  }
}

// ============================================================
// HOME SCREEN
// ============================================================

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments;

    String fullname = 'Employee';

    if (args is Map &&
        args['fullname'] != null) {
      fullname = args['fullname'];
    }

    return Scaffold(
      backgroundColor: pageBackground,

      // ========================================================
      // APP BAR
      // ========================================================

      appBar: AppBar(
        backgroundColor: pageBackground,
        elevation: 0,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        titleSpacing: 20,
        title: Row(
          children: [
            const EalmsLogo(
              size: 42,
            ),

            const SizedBox(width: 12),

            const Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  'EA&LMS',
                  style: TextStyle(
                    color: primaryTeal,
                    fontSize: 17,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  'Employee Portal',
                  style: TextStyle(
                    color: textMuted,
                    fontSize: 10,
                  ),
                ),
              ],
            ),

            const Spacer(),

            IconButton(
              onPressed: () {},
              tooltip: 'Notifications',
              icon: const Icon(
                Icons.notifications_none_rounded,
                color: primaryTeal,
              ),
            ),

            // LOGOUT AT TOP
            IconButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/LoginScreen',
                  (route) => false,
                );
              },
              tooltip: 'Logout',
              icon: const Icon(
                Icons.logout_rounded,
                color: dangerRed,
              ),
            ),
          ],
        ),
      ),

      // ========================================================
      // BODY
      // ========================================================

      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(
          20,
          12,
          20,
          30,
        ),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            // ====================================================
            // WELCOME HERO
            // ====================================================

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    primaryTeal,
                    darkTeal,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius:
                    BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: primaryTeal
                        .withOpacity(0.25),
                    blurRadius: 22,
                    offset:
                        const Offset(0, 10),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Positioned(
                    right: -30,
                    top: -30,
                    child: Container(
                      width: 130,
                      height: 130,
                      decoration:
                          BoxDecoration(
                        shape:
                            BoxShape.circle,
                        color: Colors.white
                            .withOpacity(
                          0.06,
                        ),
                      ),
                    ),
                  ),

                  Column(
                    crossAxisAlignment:
                        CrossAxisAlignment
                            .start,
                    children: [
                      Container(
                        padding:
                            const EdgeInsets
                                .symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration:
                            BoxDecoration(
                          color: amber
                              .withOpacity(
                            0.18,
                          ),
                          borderRadius:
                              BorderRadius
                                  .circular(
                            20,
                          ),
                        ),
                        child: const Row(
                          mainAxisSize:
                              MainAxisSize.min,
                          children: [
                            Icon(
                              Icons
                                  .wb_sunny_outlined,
                              color: amber,
                              size: 15,
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Text(
                              'EMPLOYEE DASHBOARD',
                              style:
                                  TextStyle(
                                color:
                                    Colors.white,
                                fontSize: 10,
                                fontWeight:
                                    FontWeight
                                        .w800,
                                letterSpacing:
                                    0.8,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(
                        height: 18,
                      ),

                      Text(
                        'Welcome, $fullname!',
                        style:
                            const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight:
                              FontWeight.w900,
                        ),
                      ),

                      const SizedBox(
                        height: 7,
                      ),

                      const Text(
                        'Manage your attendance, leaves, and employee records in one place.',
                        style:
                            TextStyle(
                          color:
                              Colors.white70,
                          fontSize: 13,
                          height: 1.5,
                        ),
                      ),

                      const SizedBox(
                        height: 20,
                      ),

                      Row(
                        children: [
                          Expanded(
                            child:
                                _HeroStat(
                              icon: Icons
                                  .access_time_rounded,
                              title:
                                  'Today',
                              value:
                                  'Not Recorded',
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child:
                                _HeroStat(
                              icon: Icons
                                  .event_available_rounded,
                              title:
                                  'Leave',
                              value:
                                  'Available',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            // ====================================================
            // TODAY'S ATTENDANCE
            // ====================================================

            const Text(
              "Today's Attendance",
              style: TextStyle(
                fontSize: 19,
                fontWeight:
                    FontWeight.w900,
                color: textDark,
              ),
            ),

            const SizedBox(height: 14),

            Container(
              width: double.infinity,
              padding:
                  const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.circular(20),
                border: Border.all(
                  color:
                      const Color(0xFFE5E7EB),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 48,
                        height: 48,
                        decoration:
                            BoxDecoration(
                          color: amber
                              .withOpacity(
                            0.15,
                          ),
                          borderRadius:
                              BorderRadius
                                  .circular(
                            14,
                          ),
                        ),
                        child: const Icon(
                          Icons
                              .access_time_rounded,
                          color: amber,
                        ),
                      ),

                      const SizedBox(
                        width: 14,
                      ),

                      const Expanded(
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment
                                  .start,
                          children: [
                            Text(
                              'Attendance Status',
                              style:
                                  TextStyle(
                                fontWeight:
                                    FontWeight
                                        .w800,
                                color:
                                    textDark,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              'You have not recorded attendance today.',
                              style:
                                  TextStyle(
                                color:
                                    textMuted,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        padding:
                            const EdgeInsets
                                .symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration:
                            BoxDecoration(
                          color: amber
                              .withOpacity(
                            0.12,
                          ),
                          borderRadius:
                              BorderRadius
                                  .circular(
                            20,
                          ),
                        ),
                        child:
                            const Text(
                          'PENDING',
                          style:
                              TextStyle(
                            color:
                                Color(
                              0xFFB77900,
                            ),
                            fontSize: 10,
                            fontWeight:
                                FontWeight
                                    .w900,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 18,
                  ),

                  Row(
                    children: [
                      Expanded(
                        child:
                            _AttendanceTime(
                          icon: Icons
                              .login_rounded,
                          label:
                              'Time In',
                          value:
                              '--:--',
                        ),
                      ),
                      Container(
                        width: 1,
                        height: 42,
                        color:
                            Colors.grey.shade200,
                      ),
                      Expanded(
                        child:
                            _AttendanceTime(
                          icon: Icons
                              .logout_rounded,
                          label:
                              'Time Out',
                          value:
                              '--:--',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 26),

            // ====================================================
            // SYSTEM INFO
            // ====================================================

            Container(
              width: double.infinity,
              padding:
                  const EdgeInsets.all(20),
              decoration:
                  BoxDecoration(
                color:
                    const Color(0xFFEAF2F4),
                borderRadius:
                    BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Container(
                    width: 46,
                    height: 46,
                    decoration:
                        BoxDecoration(
                      color: primaryTeal,
                      borderRadius:
                          BorderRadius.circular(
                        14,
                      ),
                    ),
                    child:
                        const Icon(
                      Icons
                          .info_outline_rounded,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(
                    width: 14,
                  ),

                  const Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment
                              .start,
                      children: [
                        Text(
                          'EA&LMS Employee Portal',
                          style:
                              TextStyle(
                            color:
                                primaryTeal,
                            fontWeight:
                                FontWeight
                                    .w800,
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          'Keep your attendance and leave records up to date.',
                          style:
                              TextStyle(
                            color:
                                textMuted,
                            fontSize: 12,
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 25,
            ),

            const Center(
              child: Text(
                'Employee Attendance & Leave Management System',
                textAlign:
                    TextAlign.center,
                style: TextStyle(
                  color: textMuted,
                  fontSize: 11,
                ),
              ),
            ),

            const SizedBox(height: 5),

            const Center(
              child: Text(
                'EA&LMS • Employee Portal',
                style: TextStyle(
                  color: primaryTeal,
                  fontSize: 11,
                  fontWeight:
                      FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// HERO STAT
// ============================================================

class _HeroStat extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _HeroStat({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color:
            Colors.white.withOpacity(0.08),
        borderRadius:
            BorderRadius.circular(14),
        border: Border.all(
          color:
              Colors.white.withOpacity(0.10),
        ),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: amber,
            size: 20,
          ),

          const SizedBox(width: 9),

          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style:
                      const TextStyle(
                    color:
                        Colors.white60,
                    fontSize: 10,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  value,
                  overflow:
                      TextOverflow.ellipsis,
                  style:
                      const TextStyle(
                    color:
                        Colors.white,
                    fontSize: 11,
                    fontWeight:
                        FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// ATTENDANCE TIME
// ============================================================

class _AttendanceTime
    extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _AttendanceTime({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 20,
          color: primaryTeal,
        ),

        const SizedBox(width: 9),

        Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style:
                  const TextStyle(
                color: textMuted,
                fontSize: 11,
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              value,
              style:
                  const TextStyle(
                color: textDark,
                fontSize: 14,
                fontWeight:
                    FontWeight.w800,
              ),
            ),
          ],
        ),
      ],
    );
  }
}