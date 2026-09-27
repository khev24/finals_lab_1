import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
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
        scaffoldBackgroundColor: const Color(0xFFF3F5F4),
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryTeal,
          brightness: Brightness.light,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 17,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: Color(0xFFD8D4CC),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: Color(0xFFD8D4CC),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: primaryTeal,
              width: 1.5,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: Color(0xFFDC2626),
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: Color(0xFFDC2626),
              width: 1.5,
            ),
          ),
        ),
      ),
      initialRoute: '/LoginScreen',
      routes: {
        '/LoginScreen': (context) => const LoginScreen(),
        '/SignUpScreen': (context) => const MySignUpForm(),
        '/HomeScreen': (context) => const HomeScreen(),
      },
    );
  }
}

// ============================================================
// COLORS
// ============================================================

const Color primaryTeal = Color(0xFF1B5261);
const Color darkTeal = Color(0xFF123B47);
const Color deepTeal = Color(0xFF0E303A);

const Color amber = Color(0xFFC98A18);

const Color backgroundColor = Color(0xFFF3F5F4);
const Color textDark = Color(0xFF20262D);
const Color textMuted = Color(0xFF69727C);
const Color borderColor = Color(0xFFD8D4CC);

const Color successGreen = Color(0xFF16A34A);
const Color dangerRed = Color(0xFFDC2626);

// ============================================================
// EA&LMS LOGO
// ============================================================

class EalmsLogo extends StatelessWidget {
  final double size;
  final bool dark;

  const EalmsLogo({
    super.key,
    this.size = 54,
    this.dark = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: dark
            ? Colors.white.withOpacity(0.12)
            : primaryTeal,
        borderRadius: BorderRadius.circular(13),
        border: dark
            ? Border.all(
                color: Colors.white.withOpacity(0.25),
              )
            : null,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Icon(
            Icons.business_center_rounded,
            color: Colors.white,
            size: size * 0.43,
          ),
          Positioned(
            right: size * 0.13,
            bottom: size * 0.13,
            child: Container(
              width: size * 0.23,
              height: size * 0.23,
              decoration: BoxDecoration(
                color: amber,
                shape: BoxShape.circle,
                border: Border.all(
                  color: dark ? darkTeal : primaryTeal,
                  width: 1.5,
                ),
              ),
              child: Icon(
                Icons.check_rounded,
                color: darkTeal,
                size: size * 0.14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// BRAND PANEL
// ============================================================

class AuthBrandPanel extends StatelessWidget {
  final bool signUp;

  const AuthBrandPanel({
    super.key,
    this.signUp = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 420,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            deepTeal,
            primaryTeal,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        children: [
          // TOP DECORATION
          Positioned(
            top: -95,
            right: -70,
            child: Container(
              width: 240,
              height: 240,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.055),
                shape: BoxShape.circle,
              ),
            ),
          ),

          // BOTTOM DECORATION
          Positioned(
            bottom: -105,
            left: -100,
            child: Container(
              width: 220,
              height: 220,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.055),
                shape: BoxShape.circle,
              ),
            ),
          ),

          // MIDDLE DECORATION
          Positioned(
            top: 70,
            left: 290,
            child: Container(
              width: 95,
              height: 95,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.025),
                shape: BoxShape.circle,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(
              42,
              46,
              42,
              42,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // LOGO
                const EalmsLogo(
                  size: 54,
                  dark: true,
                ),

                const Spacer(),

                // SMALL LABEL
                Row(
                  children: [
                    Container(
                      width: 20,
                      height: 2,
                      color: amber,
                    ),
                    const SizedBox(width: 9),
                    Text(
                      signUp
                          ? 'EMPLOYEE REGISTRATION'
                          : 'EMPLOYEE ATTENDANCE & LEAVE MANAGEMENT',
                      style: const TextStyle(
                        color: amber,
                        fontSize: 10,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.9,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 18),

                Text(
                  signUp
                      ? 'Create your employee account.'
                      : 'Manage your workforce\nwith confidence.',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    height: 1.13,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -0.5,
                  ),
                ),

                const SizedBox(height: 18),

                Text(
                  signUp
                      ? 'Register your employee information to access attendance, leave management, and employee services.'
                      : 'Track attendance, review leave requests, and keep every department running on schedule — all from one place.',
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    height: 1.65,
                  ),
                ),

                const SizedBox(height: 28),

                _BrandFeature(
                  icon: Icons.access_time_rounded,
                  text: 'Real-time attendance tracking',
                ),

                const SizedBox(height: 14),

                _BrandFeature(
                  icon: Icons.check_circle_outline_rounded,
                  text: 'Streamlined leave management',
                ),

                const SizedBox(height: 14),

                _BrandFeature(
                  icon: Icons.analytics_outlined,
                  text: 'Organization-wide reporting',
                ),

                const Spacer(),

                const Text(
                  '© 2026 EA&LMS. All rights reserved.',
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: 11,
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
// BRAND FEATURE
// ============================================================

class _BrandFeature extends StatelessWidget {
  final IconData icon;
  final String text;

  const _BrandFeature({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 18,
        ),
        const SizedBox(width: 11),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12.5,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
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

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String? fullname;
  String? registeredEmail;
  String? registeredPassword;

  bool hasAccount = false;
  bool obscurePassword = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final args = ModalRoute.of(context)?.settings.arguments;

    if (args is Map) {
      fullname = args['fullname'];
      registeredEmail = args['email'];
      registeredPassword = args['password'];

      if (registeredEmail != null &&
          registeredPassword != null) {
        hasAccount = true;
      }

      if (args['signedUp'] == true) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!mounted) return;

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text(
                'Account created successfully. Please sign in.',
              ),
              behavior: SnackBarBehavior.floating,
              backgroundColor: primaryTeal,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          );
        });
      }
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void login() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final email = _emailController.text.trim();
    final password = _passwordController.text;

    if (!hasAccount) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Please create an employee account first.',
          ),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    if (email != registeredEmail ||
        password != registeredPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Incorrect email or password.',
          ),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    Navigator.pushNamedAndRemoveUntil(
      context,
      '/HomeScreen',
      (route) => false,
      arguments: {
        'fullname': fullname ?? 'Employee',
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isDesktop = constraints.maxWidth >= 900;

            if (isDesktop) {
              return Center(
                child: Container(
                  width: 940,
                  height: 620,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.10),
                        blurRadius: 35,
                        offset: const Offset(0, 18),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      const Expanded(
                        flex: 5,
                        child: AuthBrandPanel(),
                      ),
                      Expanded(
                        flex: 5,
                        child: _LoginForm(),
                      ),
                    ],
                  ),
                ),
              );
            }

            return SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: _LoginForm(),
            );
          },
        ),
      ),
    );
  }
}

// ============================================================
// LOGIN FORM
// ============================================================

class _LoginForm extends StatelessWidget {
  const _LoginForm();

  @override
  Widget build(BuildContext context) {
    final state =
        context.findAncestorStateOfType<_LoginScreenState>()!;

    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 42,
          vertical: 42,
        ),
        child: Form(
          key: state._formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // MOBILE LOGO
              if (MediaQuery.of(context).size.width < 900)
                const Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 28),
                    child: EalmsLogo(
                      size: 58,
                    ),
                  ),
                ),

              Row(
                children: [
                  Container(
                    width: 17,
                    height: 2,
                    color: amber,
                  ),
                  const SizedBox(width: 9),
                  const Text(
                    'EMPLOYEE PORTAL',
                    style: TextStyle(
                      color: Color(0xFFA86F0B),
                      fontSize: 11,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 0.9,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 13),

              const Text(
                'Welcome back',
                style: TextStyle(
                  color: textDark,
                  fontSize: 27,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.4,
                ),
              ),

              const SizedBox(height: 7),

              const Text(
                'Sign in to continue to Attendance & Leave Management.',
                style: TextStyle(
                  color: textMuted,
                  fontSize: 13.5,
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 30),

              const _FormLabel(
                text: 'Employee Email',
              ),

              const SizedBox(height: 8),

              TextFormField(
                controller: state._emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: 'Enter your Employee Email',
                  prefixIcon: Icon(
                    Icons.person_outline_rounded,
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

              const SizedBox(height: 20),

              const _FormLabel(
                text: 'Password',
              ),

              const SizedBox(height: 8),

              TextFormField(
                controller: state._passwordController,
                obscureText: state.obscurePassword,
                decoration: InputDecoration(
                  hintText: 'Enter your password',
                  prefixIcon: const Icon(
                    Icons.lock_outline_rounded,
                    size: 20,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      state.setState(() {
                        state.obscurePassword =
                            !state.obscurePassword;
                      });
                    },
                    icon: Icon(
                      state.obscurePassword
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      size: 20,
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password.';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 8),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Please contact your system administrator.',
                        ),
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size.zero,
                    tapTargetSize:
                        MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: primaryTeal,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 17),

              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: state.login,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryTeal,
                    foregroundColor: Colors.white,
                    elevation: 2,
                    shadowColor:
                        primaryTeal.withOpacity(0.25),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
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
                      SizedBox(width: 8),
                      Icon(
                        Icons.arrow_forward_rounded,
                        size: 18,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              Center(
                child: Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account? ",
                      style: TextStyle(
                        color: textMuted,
                        fontSize: 12.5,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          '/SignUpScreen',
                        );
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size.zero,
                        tapTargetSize:
                            MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: const Text(
                        'Create Account',
                        style: TextStyle(
                          color: primaryTeal,
                          fontSize: 12.5,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              const Center(
                child: Text(
                  'Having trouble signing in? Contact your system administrator.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF9AA1A8),
                    fontSize: 10.5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================================
// FORM LABEL
// ============================================================

class _FormLabel extends StatelessWidget {
  final String text;

  const _FormLabel({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: textDark,
        fontSize: 12,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

// ============================================================
// SIGN UP SCREEN
// ============================================================

class MySignUpForm extends StatefulWidget {
  const MySignUpForm({super.key});

  @override
  State<MySignUpForm> createState() => _MySignUpFormState();
}

class _MySignUpFormState extends State<MySignUpForm> {
  final _formKey = GlobalKey<FormState>();

  final _fullnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController =
      TextEditingController();

  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  @override
  void dispose() {
    _fullnameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void signUp() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final fullname =
        _fullnameController.text.trim();

    final email =
        _emailController.text.trim();

    final password =
        _passwordController.text;

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
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isDesktop = constraints.maxWidth >= 900;

            if (isDesktop) {
              return Center(
                child: Container(
                  width: 940,
                  height: 650,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.10),
                        blurRadius: 35,
                        offset: const Offset(0, 18),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      const Expanded(
                        flex: 5,
                        child: AuthBrandPanel(
                          signUp: true,
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: _SignUpForm(),
                      ),
                    ],
                  ),
                ),
              );
            }

            return SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: _SignUpForm(),
            );
          },
        ),
      ),
    );
  }
}

// ============================================================
// SIGN UP FORM
// ============================================================

class _SignUpForm extends StatelessWidget {
  const _SignUpForm();

  @override
  Widget build(BuildContext context) {
    final state =
        context.findAncestorStateOfType<_MySignUpFormState>()!;

    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 42,
          vertical: 35,
        ),
        child: Form(
          key: state._formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (MediaQuery.of(context).size.width < 900)
                const Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 24),
                    child: EalmsLogo(
                      size: 58,
                    ),
                  ),
                ),

              Row(
                children: [
                  Container(
                    width: 17,
                    height: 2,
                    color: amber,
                  ),
                  const SizedBox(width: 9),
                  const Text(
                    'EMPLOYEE REGISTRATION',
                    style: TextStyle(
                      color: Color(0xFFA86F0B),
                      fontSize: 10.5,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 0.8,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 13),

              const Text(
                'Create your account',
                style: TextStyle(
                  color: textDark,
                  fontSize: 26,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.4,
                ),
              ),

              const SizedBox(height: 7),

              const Text(
                'Register your information to access the employee portal.',
                style: TextStyle(
                  color: textMuted,
                  fontSize: 13.5,
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 25),

              const _FormLabel(
                text: 'Full Name',
              ),

              const SizedBox(height: 8),

              TextFormField(
                controller: state._fullnameController,
                textCapitalization:
                    TextCapitalization.words,
                decoration: const InputDecoration(
                  hintText: 'Juan Dela Cruz',
                  prefixIcon: Icon(
                    Icons.person_outline_rounded,
                    size: 20,
                  ),
                ),
                validator: (value) {
                  if (value == null ||
                      value.trim().isEmpty) {
                    return 'Please enter your full name.';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 16),

              const _FormLabel(
                text: 'Employee Email',
              ),

              const SizedBox(height: 8),

              TextFormField(
                controller: state._emailController,
                keyboardType:
                    TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: 'employee@email.com',
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    size: 20,
                  ),
                ),
                validator: (value) {
                  if (value == null ||
                      value.trim().isEmpty) {
                    return 'Please enter your email.';
                  }

                  if (!RegExp(
                    r'^[^@]+@[^@]+\.[^@]+',
                  ).hasMatch(value.trim())) {
                    return 'Please enter a valid email.';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 16),

              const _FormLabel(
                text: 'Password',
              ),

              const SizedBox(height: 8),

              TextFormField(
                controller: state._passwordController,
                obscureText: state.obscurePassword,
                decoration: InputDecoration(
                  hintText: 'Create a password',
                  prefixIcon: const Icon(
                    Icons.lock_outline_rounded,
                    size: 20,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      state.setState(() {
                        state.obscurePassword =
                            !state.obscurePassword;
                      });
                    },
                    icon: Icon(
                      state.obscurePassword
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      size: 20,
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null ||
                      value.trim().isEmpty) {
                    return 'Please enter your password.';
                  }

                  if (value.length < 6) {
                    return 'Password must be at least 6 characters.';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 16),

              const _FormLabel(
                text: 'Confirm Password',
              ),

              const SizedBox(height: 8),

              TextFormField(
                controller:
                    state._confirmPasswordController,
                obscureText:
                    state.obscureConfirmPassword,
                decoration: InputDecoration(
                  hintText: 'Re-enter your password',
                  prefixIcon: const Icon(
                    Icons.lock_reset_outlined,
                    size: 20,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      state.setState(() {
                        state.obscureConfirmPassword =
                            !state.obscureConfirmPassword;
                      });
                    },
                    icon: Icon(
                      state.obscureConfirmPassword
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      size: 20,
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null ||
                      value.trim().isEmpty) {
                    return 'Please confirm your password.';
                  }

                  if (value !=
                      state._passwordController.text) {
                    return 'Passwords do not match.';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 23),

              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: state.signUp,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryTeal,
                    foregroundColor: Colors.white,
                    elevation: 2,
                    shadowColor:
                        primaryTeal.withOpacity(0.25),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment:
                        MainAxisAlignment.center,
                    children: [
                      Text(
                        'Create Account',
                        style: TextStyle(
                          fontSize: 14,
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

              const SizedBox(height: 20),

              Center(
                child: Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    const Text(
                      'Already have an account? ',
                      style: TextStyle(
                        color: textMuted,
                        fontSize: 12.5,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          '/LoginScreen',
                          (route) => false,
                        );
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size.zero,
                        tapTargetSize:
                            MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: const Text(
                        'Sign In',
                        style: TextStyle(
                          color: primaryTeal,
                          fontSize: 12.5,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
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

    if (args is Map) {
      fullname =
          args['fullname']?.toString() ?? 'Employee';
    }

    return Scaffold(
      backgroundColor: backgroundColor,

      // ======================================================
      // TOP BAR
      // ======================================================

      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        titleSpacing: 22,
        title: Row(
          children: [
            const EalmsLogo(
              size: 40,
            ),
            const SizedBox(width: 11),
            const Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  'EA&LMS',
                  style: TextStyle(
                    color: primaryTeal,
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  'Employee Portal',
                  style: TextStyle(
                    color: textMuted,
                    fontSize: 9.5,
                  ),
                ),
              ],
            ),
            const Spacer(),
            IconButton(
              tooltip: 'Logout',
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/LoginScreen',
                  (route) => false,
                );
              },
              icon: const Icon(
                Icons.logout_rounded,
                color: dangerRed,
                size: 21,
              ),
            ),
          ],
        ),
      ),

      // ======================================================
      // BODY
      // ======================================================

      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(
          22,
          22,
          22,
          35,
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 1050,
            ),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                // ==================================================
                // WELCOME CARD
                // ==================================================

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(26),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        darkTeal,
                        primaryTeal,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius:
                        BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color:
                            primaryTeal.withOpacity(0.20),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        right: -35,
                        top: -50,
                        child: Container(
                          width: 170,
                          height: 170,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white
                                .withOpacity(0.055),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'EMPLOYEE DASHBOARD',
                            style: TextStyle(
                              color: amber,
                              fontSize: 10,
                              fontWeight:
                                  FontWeight.w900,
                              letterSpacing: 1,
                            ),
                          ),
                          const SizedBox(height: 9),
                          Text(
                            'Welcome, $fullname',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 27,
                              fontWeight:
                                  FontWeight.w800,
                            ),
                          ),
                          const SizedBox(height: 7),
                          const Text(
                            'Manage your attendance and leave information from your employee portal.',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 13,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 26),

                const Text(
                  'Today',
                  style: TextStyle(
                    color: textDark,
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),

                const SizedBox(height: 13),

                // ==================================================
                // ATTENDANCE
                // ==================================================

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.circular(16),
                    border: Border.all(
                      color: const Color(0xFFE4E7E9),
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 46,
                            height: 46,
                            decoration: BoxDecoration(
                              color:
                                  const Color(0xFFFDF4DC),
                              borderRadius:
                                  BorderRadius.circular(11),
                            ),
                            child: const Icon(
                              Icons.access_time_rounded,
                              color: amber,
                              size: 22,
                            ),
                          ),
                          const SizedBox(width: 13),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Today's Attendance",
                                  style: TextStyle(
                                    color: textDark,
                                    fontSize: 14,
                                    fontWeight:
                                        FontWeight.w800,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'Attendance has not been recorded yet.',
                                  style: TextStyle(
                                    color: textMuted,
                                    fontSize: 11.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding:
                                const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color:
                                  const Color(0xFFFFF6DE),
                              borderRadius:
                                  BorderRadius.circular(20),
                            ),
                            child: const Text(
                              'PENDING',
                              style: TextStyle(
                                color: Color(0xFFA86F0B),
                                fontSize: 9,
                                fontWeight:
                                    FontWeight.w900,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 18),
                      Row(
                        children: [
                          Expanded(
                            child: _TimeInfo(
                              icon:
                                  Icons.login_rounded,
                              label: 'Time In',
                              value: '--:--',
                            ),
                          ),
                          Container(
                            width: 1,
                            height: 38,
                            color:
                                const Color(0xFFE5E7EB),
                          ),
                          Expanded(
                            child: _TimeInfo(
                              icon:
                                  Icons.logout_rounded,
                              label: 'Time Out',
                              value: '--:--',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                // ==================================================
                // INFORMATION
                // ==================================================

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEAF1F3),
                    borderRadius:
                        BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 43,
                        height: 43,
                        decoration: BoxDecoration(
                          color: primaryTeal,
                          borderRadius:
                              BorderRadius.circular(11),
                        ),
                        child: const Icon(
                          Icons.info_outline_rounded,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 13),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            Text(
                              'EA&LMS Employee Portal',
                              style: TextStyle(
                                color: primaryTeal,
                                fontSize: 13,
                                fontWeight:
                                    FontWeight.w800,
                              ),
                            ),
                            SizedBox(height: 3),
                            Text(
                              'Keep your attendance and leave records up to date.',
                              style: TextStyle(
                                color: textMuted,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 22),

                const Center(
                  child: Text(
                    'Employee Attendance & Leave Management System',
                    style: TextStyle(
                      color: textMuted,
                      fontSize: 10.5,
                    ),
                  ),
                ),

                const SizedBox(height: 5),

                const Center(
                  child: Text(
                    'EA&LMS • Employee Portal',
                    style: TextStyle(
                      color: primaryTeal,
                      fontSize: 10.5,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ============================================================
// TIME INFO
// ============================================================

class _TimeInfo extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _TimeInfo({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: primaryTeal,
          size: 19,
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(
                color: textMuted,
                fontSize: 10.5,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              value,
              style: const TextStyle(
                color: textDark,
                fontSize: 14,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
