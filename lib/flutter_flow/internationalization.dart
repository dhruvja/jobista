import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations);

  static List<String> languages() => ['en', 'kn', 'hi'];

  String get languageCode => locale.languageCode;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.languageCode] ?? '';

  String getVariableText({
    String en = '',
    String kn = '',
    String hi = '',
  }) =>
      [en, kn, hi][languageIndex] ?? '';
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      FFLocalizations.languages().contains(locale.languageCode);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Login
  {
    'vwllsest': {
      'en': 'Email Address',
      'hi': '',
      'kn': 'ಇಮೇಲ್ ವಿಳಾಸ',
    },
    '2yd6fm57': {
      'en': 'Enter your email here...',
      'hi': '',
      'kn': 'ನಿಮ್ಮ ಇಮೇಲ್ ಅನ್ನು ಇಲ್ಲಿ ನಮೂದಿಸಿ...',
    },
    'dnlp1030': {
      'en': 'Enter a valid email address',
      'hi': '',
      'kn': 'ಮಾನ್ಯವಾದ ಇಮೇಲ್ ವಿಳಾಸವನ್ನು ನಮೂದಿಸಿ',
    },
    '9wjt11gv': {
      'en': 'Password',
      'hi': '',
      'kn': 'ಗುಪ್ತಪದ',
    },
    'x8dgp2je': {
      'en': 'Enter your email here...',
      'hi': '',
      'kn': 'ನಿಮ್ಮ ಇಮೇಲ್ ಅನ್ನು ಇಲ್ಲಿ ನಮೂದಿಸಿ...',
    },
    '8ezefndp': {
      'en': 'enter a valid password',
      'hi': '',
      'kn': 'ಮಾನ್ಯವಾದ ಗುಪ್ತಪದವನ್ನು ನಮೂದಿಸಿ',
    },
    'itv2kiem': {
      'en': 'Forgot Password?',
      'hi': '',
      'kn': 'ಪಾಸ್ವರ್ಡ್ ಮರೆತಿರಾ?',
    },
    'm71606y3': {
      'en': 'Login',
      'hi': '',
      'kn': 'ಲಾಗಿನ್ ಮಾಡಿ',
    },
    'ivzlonz9': {
      'en': 'Dont have an Account, Register here',
      'hi': '',
      'kn': 'ಖಾತೆಯನ್ನು ಹೊಂದಿಲ್ಲ, ಇಲ್ಲಿ ನೋಂದಾಯಿಸಿ',
    },
    'h739prhu': {
      'en': 'Use a Social Platform to Login',
      'hi': '',
      'kn': 'ಲಾಗಿನ್ ಮಾಡಲು ಸಾಮಾಜಿಕ ವೇದಿಕೆಯನ್ನು ಬಳಸಿ',
    },
  },
  // RegisterClient
  {
    '8hko1ko8': {
      'en': 'Your Name',
      'hi': '',
      'kn': 'ನಿಮ್ಮ ಹೆಸರು',
    },
    '7b8ym083': {
      'en': 'Please enter a valid Name',
      'hi': '',
      'kn': 'ದಯವಿಟ್ಟು ಮಾನ್ಯವಾದ ಹೆಸರನ್ನು ನಮೂದಿಸಿ',
    },
    'lkwj53ja': {
      'en': 'Mobile Number',
      'hi': '',
      'kn': 'ಮೊಬೈಲ್ ನಂಬರ',
    },
    'ktndmazq': {
      'en': 'Please  Provide your Mobile number',
      'hi': '',
      'kn': 'ದಯವಿಟ್ಟು ನಿಮ್ಮ ಮೊಬೈಲ್ ಸಂಖ್ಯೆಯನ್ನು ಒದಗಿಸಿ',
    },
    'f9z6qz26': {
      'en': 'Number is incomplete',
      'hi': '',
      'kn': 'ಸಂಖ್ಯೆ ಅಪೂರ್ಣವಾಗಿದೆ',
    },
    'kbec75gr': {
      'en': 'Email Address',
      'hi': '',
      'kn': 'ಇಮೇಲ್ ವಿಳಾಸ',
    },
    'awtzqw31': {
      'en': 'Please Enter  a valid email address',
      'hi': '',
      'kn': 'ದಯವಿಟ್ಟು ಸರಿಯಾದ ಇಮೇಲ್ ವಿಳಾಸವನ್ನು ನಮೂದಿಸಿ',
    },
    'fywdqati': {
      'en': 'Password',
      'hi': '',
      'kn': 'ಗುಪ್ತಪದ',
    },
    'ue6pn6lm': {
      'en': 'Please Enter your password',
      'hi': '',
      'kn': 'ದಯವಿಟ್ಟು ನಿಮ್ಮ ಗುಪ್ತಪದವನ್ನು ನಮೂದಿಸಿ',
    },
    'dp3wbmwk': {
      'en': 'Confirm Password',
      'hi': '',
      'kn': 'ಪಾಸ್ವರ್ಡ್ ದೃಢೀಕರಿಸಿ',
    },
    'k5h9brav': {
      'en': 'Sign Up',
      'hi': '',
      'kn': 'ಸೈನ್ ಅಪ್ ಮಾಡಿ',
    },
    't30nnymt': {
      'en': 'Use a Social Platform to Login',
      'hi': '',
      'kn': 'ಲಾಗಿನ್ ಮಾಡಲು ಸಾಮಾಜಿಕ ವೇದಿಕೆಯನ್ನು ಬಳಸಿ',
    },
  },
  // onboard
  {
    '1pxf9vlv': {
      'en': 'Want a nurse?',
      'hi': '',
      'kn': 'ನರ್ಸ್ ಬೇಕೇ?',
    },
    'wlz0j8pa': {
      'en':
          'Are somebody in emergency care and you are in need/ready to take care of them? ',
      'hi': '',
      'kn':
          'ಯಾರಾದರೂ ತುರ್ತು ಆರೈಕೆಯಲ್ಲಿದ್ದಾರೆಯೇ ಮತ್ತು ನೀವು ಅವರ ಅಗತ್ಯತೆ/ಅವರನ್ನು ನೋಡಿಕೊಳ್ಳಲು ಸಿದ್ಧರಿದ್ದೀರಾ?',
    },
    '9of34jml': {
      'en': 'Oh!! the water supply is out !!',
      'hi': '',
      'kn': 'ಓಹ್!! ನೀರು ಸರಬರಾಜು ಮುಗಿದಿದೆ !!',
    },
    'r5mhb3c2': {
      'en': 'Get your plumber right in click, post the need get the man.',
      'hi': '',
      'kn':
          'ನಿಮ್ಮ ಪ್ಲಂಬರ್ ಅನ್ನು ಕ್ಲಿಕ್‌ನಲ್ಲಿ ಪಡೆಯಿರಿ, ಅಗತ್ಯವನ್ನು ಪೋಸ್ಟ್ ಮಾಡಿ ಮನುಷ್ಯನನ್ನು ಪಡೆಯಿರಿ.',
    },
    'gladbkai': {
      'en': 'Oh!! the water supply is out ',
      'hi': '',
      'kn': 'ಓಹ್!! ನೀರು ಸರಬರಾಜು ಮುಗಿದಿದೆ',
    },
    'flgp8hd6': {
      'en': 'Get your plumber right in click, post the need get the man.',
      'hi': '',
      'kn':
          'ನಿಮ್ಮ ಪ್ಲಂಬರ್ ಅನ್ನು ಕ್ಲಿಕ್‌ನಲ್ಲಿ ಪಡೆಯಿರಿ, ಅಗತ್ಯವನ್ನು ಪೋಸ್ಟ್ ಮಾಡಿ ಮನುಷ್ಯನನ್ನು ಪಡೆಯಿರಿ.',
    },
    '7cfcew2j': {
      'en': 'Log-IN',
      'hi': '',
      'kn': 'ಲಾಗ್-ಇನ್',
    },
    'rkuoy843': {
      'en': 'Sign-UP',
      'hi': '',
      'kn': 'ಸೈನ್-ಅಪ್',
    },
  },
  // Base
  {
    'vjp0r5d5': {
      'en': 'WORKER',
      'hi': '',
      'kn': 'ಕೆಲಸಗಾರ',
    },
    '52r2wyx9': {
      'en': 'CLIENT',
      'hi': '',
      'kn': 'ಗ್ರಾಹಕ',
    },
  },
  // Worker-1
  {
    'nuo5mcm8': {
      'en': 'Your Name',
      'hi': '',
      'kn': 'ನಿಮ್ಮ ಹೆಸರು',
    },
    'fm27td5k': {
      'en': 'Please enter a valid Name',
      'hi': '',
      'kn': 'ದಯವಿಟ್ಟು ಮಾನ್ಯವಾದ ಹೆಸರನ್ನು ನಮೂದಿಸಿ',
    },
    'o0r19cud': {
      'en': 'Mobile Number',
      'hi': '',
      'kn': 'ಮೊಬೈಲ್ ನಂಬರ',
    },
    '2gpb7s9c': {
      'en': 'Please  Provide your Mobile number',
      'hi': '',
      'kn': 'ದಯವಿಟ್ಟು ನಿಮ್ಮ ಮೊಬೈಲ್ ಸಂಖ್ಯೆಯನ್ನು ಒದಗಿಸಿ',
    },
    'lfw67hik': {
      'en': 'Number is incomplete',
      'hi': '',
      'kn': 'ಸಂಖ್ಯೆ ಅಪೂರ್ಣವಾಗಿದೆ',
    },
    '5l0erm8k': {
      'en': 'Password',
      'hi': '',
      'kn': 'ಗುಪ್ತಪದ',
    },
    'ctr67f4k': {
      'en': 'Please Enter your password',
      'hi': '',
      'kn': 'ದಯವಿಟ್ಟು ನಿಮ್ಮ ಗುಪ್ತಪದವನ್ನು ನಮೂದಿಸಿ',
    },
    'pc2aw0w3': {
      'en': 'Confirm Password',
      'hi': '',
      'kn': 'ಪಾಸ್ವರ್ಡ್ ದೃಢೀಕರಿಸಿ',
    },
    'sx97rhnh': {
      'en': 'Next',
      'hi': '',
      'kn': 'ಮುಂದೆ',
    },
  },
  // Worker-2
  {
    'jjofs55q': {
      'en': 'Type of JOB experienced',
      'hi': '',
      'kn': 'ಅನುಭವದ ಉದ್ಯೋಗದ ಪ್ರಕಾರ',
    },
    'ig1l2c4m': {
      'en': 'Please enter a valid Name',
      'hi': '',
      'kn': 'ದಯವಿಟ್ಟು ಮಾನ್ಯವಾದ ಹೆಸರನ್ನು ನಮೂದಿಸಿ',
    },
    '9f8s0dnp': {
      'en': 'Location',
      'hi': '',
      'kn': 'ಸ್ಥಳ',
    },
    'ukujigkl': {
      'en': 'Please  Provide your Mobile number',
      'hi': '',
      'kn': 'ದಯವಿಟ್ಟು ನಿಮ್ಮ ಮೊಬೈಲ್ ಸಂಖ್ಯೆಯನ್ನು ಒದಗಿಸಿ',
    },
    'qqh9g5jj': {
      'en': 'Number is incomplete',
      'hi': '',
      'kn': 'ಸಂಖ್ಯೆ ಅಪೂರ್ಣವಾಗಿದೆ',
    },
    's3moadki': {
      'en': 'PIN Code',
      'hi': '',
      'kn': 'ಪಿನ್ ಕೋಡ್',
    },
    'uafh0lg5': {
      'en': 'Please enter a valid Name',
      'hi': '',
      'kn': 'ದಯವಿಟ್ಟು ಮಾನ್ಯವಾದ ಹೆಸರನ್ನು ನಮೂದಿಸಿ',
    },
    'bhrd3evn': {
      'en': 'Next',
      'hi': '',
      'kn': 'ಮುಂದೆ',
    },
  },
  // search_client
  {
    'tzeomyng': {
      'en': 'Select job',
      'hi': '',
      'kn': 'ಕೆಲಸವನ್ನು ಆಯ್ಕೆಮಾಡಿ',
    },
    '9nnov7qp': {
      'en': 'Select job',
      'hi': '',
      'kn': 'ಕೆಲಸವನ್ನು ಆಯ್ಕೆಮಾಡಿ',
    },
    'xsnb97td': {
      'en': 'Pincode',
      'hi': '',
      'kn': 'ಪಿನ್‌ಕೋಡ್',
    },
    'fdq51rio': {
      'en': 'Education',
      'hi': '',
      'kn': 'ಶಿಕ್ಷಣ',
    },
    '8767v2ig': {
      'en': 'Experience',
      'hi': '',
      'kn': 'ಅನುಭವ',
    },
    '0f0ze5o9': {
      'en': 'Salary Range',
      'hi': '',
      'kn': 'ಸಂಬಳ ಶ್ರೇಣಿ',
    },
    'x830aihf': {
      'en': 'Rating',
      'hi': '',
      'kn': 'ರೇಟಿಂಗ್',
    },
    'iu8vggle': {
      'en': 'Filter',
      'hi': '',
      'kn': 'ಫಿಲ್ಟರ್',
    },
    'uybv4ztb': {
      'en': 'Search JOB',
      'hi': '',
      'kn': 'ಉದ್ಯೋಗವನ್ನು ಹುಡುಕಿ',
    },
    'cjmx3hfn': {
      'en': 'Job type',
      'hi': '',
      'kn': 'ಕೆಲಸದ ಪ್ರಕಾರ',
    },
    '7ai0esfd': {
      'en': 'Location',
      'hi': '',
      'kn': 'ಸ್ಥಳ',
    },
    'l4nzh0g6': {
      'en': 'Education',
      'hi': '',
      'kn': 'ಶಿಕ್ಷಣ',
    },
  },
  // home_client
  {
    'ze5g5vwp': {
      'en': 'Quick Service',
      'hi': '',
      'kn': 'ತ್ವರಿತ ಸೇವೆ',
    },
    'z6nshyje': {
      'en': 'Activities',
      'hi': '',
      'kn': 'ಚಟುವಟಿಕೆಗಳು',
    },
  },
  // search_customer
  {
    '6ynf09fd': {
      'en': 'Select job',
      'hi': '',
      'kn': 'ಕೆಲಸವನ್ನು ಆಯ್ಕೆಮಾಡಿ',
    },
    'r690ybrr': {
      'en': 'Select job',
      'hi': '',
      'kn': 'ಕೆಲಸವನ್ನು ಆಯ್ಕೆಮಾಡಿ',
    },
    'z2vf7jxp': {
      'en': 'Pincode',
      'hi': '',
      'kn': 'ಪಿನ್‌ಕೋಡ್',
    },
    '0ah2e6b0': {
      'en': 'Education',
      'hi': '',
      'kn': 'ಶಿಕ್ಷಣ',
    },
    'sjifso7b': {
      'en': 'Experience',
      'hi': '',
      'kn': 'ಅನುಭವ',
    },
    '737d49p7': {
      'en': 'Salary Range',
      'hi': '',
      'kn': 'ಸಂಬಳ ಶ್ರೇಣಿ',
    },
    'xh1djepg': {
      'en': 'Rating',
      'hi': '',
      'kn': 'ರೇಟಿಂಗ್',
    },
    'v9a8crgl': {
      'en': 'Filter',
      'hi': '',
      'kn': 'ಫಿಲ್ಟರ್',
    },
    'oznoe6s9': {
      'en': 'Search JOB',
      'hi': '',
      'kn': 'ಉದ್ಯೋಗವನ್ನು ಹುಡುಕಿ',
    },
    'q84ejfgc': {
      'en': 'Job type',
      'hi': '',
      'kn': 'ಕೆಲಸದ ಪ್ರಕಾರ',
    },
    'a2p1mf67': {
      'en': 'Location',
      'hi': '',
      'kn': 'ಸ್ಥಳ',
    },
    's7eaf58f': {
      'en': 'Education',
      'hi': '',
      'kn': 'ಶಿಕ್ಷಣ',
    },
  },
  // worker_info
  {
    'ddb4sxyy': {
      'en': 'Name',
      'hi': '',
      'kn': 'ಹೆಸರು',
    },
    'tnyq59xn': {
      'en': 'Location',
      'hi': '',
      'kn': 'ಸ್ಥಳ',
    },
    'pkrzxz3f': {
      'en': 'match %',
      'hi': '',
      'kn': 'ಹೊಂದಾಣಿಕೆ%',
    },
    'fzpxz2sr': {
      'en': 'Overall Rating',
      'hi': '',
      'kn': 'ಒಟ್ಟಾರೆ ಅರ್ಹತೆ',
    },
    'k9dhu2e6': {
      'en': 'Education ',
      'hi': '',
      'kn': 'ಶಿಕ್ಷಣ',
    },
    '4tj89y5v': {
      'en': '10+',
      'hi': '',
      'kn': '10+',
    },
    'filjpq7j': {
      'en': 'Experience',
      'hi': '',
      'kn': 'ಅನುಭವ',
    },
    'qffwzxb4': {
      'en': '2 Years',
      'hi': '',
      'kn': '2 ವರ್ಷಗಳು',
    },
    'cbjbyaqg': {
      'en': 'Book Appointment',
      'hi': '',
      'kn': 'ಪುಸ್ತಕ ನೇಮಕಾತಿ',
    },
    'k99h9kxc': {
      'en': 'Call now',
      'hi': '',
      'kn': 'ಈಗ ಕರೆ ಮಾಡು',
    },
    '28dep6dm': {
      'en': 'Verified',
      'hi': '',
      'kn': 'ಪರಿಶೀಲಿಸಲಾಗಿದೆ',
    },
    'c324xcd9': {
      'en': 'Check now',
      'hi': '',
      'kn': 'ಈಗ ಪರಿಶೀಲಿಸು',
    },
    'wxo33tgp': {
      'en': 'Book Now',
      'hi': '',
      'kn': 'ಈಗಲೇ ಬುಕ್ ಮಾಡಿ',
    },
    'x7a5444p': {
      'en': 'Wishlist',
      'hi': '',
      'kn': 'ಇಚ್ಛೆಪಟ್ಟಿ',
    },
  },
  // Worker-3
  {
    'vc5lfzin': {
      'en': 'Upload Photo',
      'hi': '',
      'kn': 'ಫೋಟೋ ಅಪ್ಲೋಡ್ ಮಾಡಿ',
    },
    'c1bc84j6': {
      'en': 'Experience ',
      'hi': '',
      'kn': 'ಅನುಭವ',
    },
    '827f7yes': {
      'en': 'Please enter your experience',
      'hi': '',
      'kn': 'ದಯವಿಟ್ಟು ನಿಮ್ಮ ಅನುಭವವನ್ನು ನಮೂದಿಸಿ',
    },
    'u3iw98l3': {
      'en': 'Upload Age Proof',
      'hi': '',
      'kn': 'ವಯಸ್ಸಿನ ಪುರಾವೆಯನ್ನು ಅಪ್‌ಲೋಡ್ ಮಾಡಿ',
    },
    'iw03yq27': {
      'en': 'Expected Salary',
      'hi': '',
      'kn': 'ನಿರೀಕ್ಷಿತ ಸಂಬಳ',
    },
    'qcqnjohc': {
      'en': 'I agree for terms and conditions',
      'hi': '',
      'kn': 'ನಾನು ನಿಯಮಗಳು ಮತ್ತು ಷರತ್ತುಗಳಿಗೆ ಒಪ್ಪುತ್ತೇನೆ',
    },
    'zxxiadt3': {
      'en': 'Sign UP',
      'hi': '',
      'kn': 'ಸೈನ್ ಅಪ್ ಮಾಡಿ',
    },
  },
  // PostJOB
  {
    '21822noc': {
      'en': 'Jobtype',
      'hi': '',
      'kn': 'ಉದ್ಯೋಗ ಪ್ರಕಾರ',
    },
    'ut03bwlc': {
      'en': 'Electrician',
      'hi': '',
      'kn': 'ಎಲೆಕ್ಟ್ರಿಷಿಯನ್',
    },
    'mbe3n7jb': {
      'en': 'Plumber',
      'hi': '',
      'kn': 'ಪ್ಲಂಬರ್',
    },
    'ys5cvmd2': {
      'en': 'Education',
      'hi': '',
      'kn': 'ಶಿಕ್ಷಣ',
    },
    'c501wbye': {
      'en': '10th',
      'hi': '',
      'kn': '10 ನೇ',
    },
    'cnmui9sh': {
      'en': '12th',
      'hi': '',
      'kn': '12 ನೇ',
    },
    'edlmp780': {
      'en': 'Location',
      'hi': '',
      'kn': 'ಸ್ಥಳ',
    },
    'kcpd61v7': {
      'en': 'Pincode',
      'hi': '',
      'kn': 'ಪಿನ್‌ಕೋಡ್',
    },
    '0zd8hogj': {
      'en': 'Job Description',
      'hi': '',
      'kn': 'ಕೆಲಸದ ವಿವರ',
    },
    'judqx35i': {
      'en': 'Experience',
      'hi': '',
      'kn': 'ಅನುಭವ',
    },
    'vs91m0gl': {
      'en': 'Salary',
      'hi': '',
      'kn': 'ಸಂಬಳ',
    },
    '5ar4lbj6': {
      'en': 'I  accept for all terms and conditions',
      'hi': '',
      'kn': 'ನಾನು ಎಲ್ಲಾ ನಿಯಮಗಳು ಮತ್ತು ಷರತ್ತುಗಳಿಗೆ ಸಮ್ಮತಿಸುತ್ತೇನೆ',
    },
    '4vxxddcu': {
      'en': 'Post JOB',
      'hi': '',
      'kn': 'ಪೋಸ್ಟ್ ಜಾಬ್',
    },
  },
  // BookJob
  {
    'bhn57zdt': {
      'en': 'Electrician',
      'hi': '',
      'kn': 'ಎಲೆಕ್ಟ್ರಿಷಿಯನ್',
    },
    'jh0zctwa': {
      'en': 'Select Ad',
      'hi': '',
      'kn': 'ಜಾಹೀರಾತು ಆಯ್ಕೆಮಾಡಿ',
    },
    '1j8gh6uk': {
      'en': 'Experience',
      'hi': '',
      'kn': 'ಅನುಭವ',
    },
    'kmv18z8m': {
      'en': 'Pincode',
      'hi': '',
      'kn': 'ಪಿನ್‌ಕೋಡ್',
    },
    'xmzcs1lk': {
      'en': 'Address',
      'hi': '',
      'kn': 'ವಿಳಾಸ',
    },
    'kxx8sgp0': {
      'en': 'JOB Information ',
      'hi': '',
      'kn': 'ಉದ್ಯೋಗ ಮಾಹಿತಿ',
    },
    '9ns2rn6s': {
      'en': 'Please enter your experience',
      'hi': '',
      'kn': 'ದಯವಿಟ್ಟು ನಿಮ್ಮ ಅನುಭವವನ್ನು ನಮೂದಿಸಿ',
    },
    '6qlvmpkm': {
      'en': 'Salary Stake',
      'hi': '',
      'kn': 'ಸಂಬಳದ ಪಾಲು',
    },
    'jdgn7qjd': {
      'en': 'I agree for terms and conditions',
      'hi': '',
      'kn': 'ನಾನು ನಿಯಮಗಳು ಮತ್ತು ಷರತ್ತುಗಳಿಗೆ ಒಪ್ಪುತ್ತೇನೆ',
    },
    'yp3yvwdx': {
      'en': 'BOOK ',
      'hi': '',
      'kn': 'ಪುಸ್ತಕ',
    },
  },
  // dashboard_client
  {
    '0bjk0r4o': {
      'en': 'All Adds',
      'hi': '',
      'kn': 'ಎಲ್ಲಾ ಸೇರ್ಪಡೆಗಳು',
    },
    'i7bedxa5': {
      'en': '10+',
      'hi': '',
      'kn': '10+',
    },
    'pzivv91f': {
      'en': 'Applied Candidates',
      'hi': '',
      'kn': 'ಅರ್ಜಿ ಸಲ್ಲಿಸಿದ ಅಭ್ಯರ್ಥಿಗಳು',
    },
    't1cgawx7': {
      'en': '22',
      'hi': '',
      'kn': '22',
    },
    'tz38brkm': {
      'en': 'Shortlisted',
      'hi': '',
      'kn': 'ಶಾರ್ಟ್‌ಲಿಸ್ಟ್ ಮಾಡಲಾಗಿದೆ',
    },
    '5m8vb364': {
      'en': 'Call now',
      'hi': '',
      'kn': 'ಈಗ ಕರೆ ಮಾಡು',
    },
    'n1k7f5d8': {
      'en': 'Wishlist',
      'hi': '',
      'kn': 'ಇಚ್ಛೆಪಟ್ಟಿ',
    },
    'qbjpifdo': {
      'en': 'Check now',
      'hi': '',
      'kn': 'ಈಗ ಪರಿಶೀಲಿಸು',
    },
  },
  // select_job
  {
    '3hkg3idm': {
      'en': 'Choose AD',
      'hi': '',
      'kn': 'AD ಆಯ್ಕೆಮಾಡಿ',
    },
    'n5h634a5': {
      'en': 'Choose AD',
      'hi': '',
      'kn': 'AD ಆಯ್ಕೆಮಾಡಿ',
    },
    '29ru2vni': {
      'en': 'AD-1',
      'hi': '',
      'kn': 'AD-1',
    },
    'd6xye4sa': {
      'en': 'AD-2',
      'hi': '',
      'kn': 'AD-2',
    },
    'ufg5w6xo': {
      'en': 'Go',
      'hi': '',
      'kn': 'ಹೋಗು',
    },
    'ao49ow5r': {
      'en': 'No add? post new one!',
      'hi': '',
      'kn': 'ಸೇರಿಸುವುದಿಲ್ಲವೇ? ಹೊಸದನ್ನು ಪೋಸ್ಟ್ ಮಾಡಿ!',
    },
    'mxq43acp': {
      'en': 'Post AD',
      'hi': '',
      'kn': 'ಪೋಸ್ಟ್ AD',
    },
  },
  // worker_home
  {
    'jm6jab2c': {
      'en': 'Welcome,',
      'hi': '',
      'kn': 'ಸ್ವಾಗತ,',
    },
    '8yjbrtox': {
      'en': 'Andrew',
      'hi': '',
      'kn': 'ಆಂಡ್ರ್ಯೂ',
    },
    'mduxmeu7': {
      'en': 'Your latest updates are below.',
      'hi': '',
      'kn': 'ನಿಮ್ಮ ಇತ್ತೀಚಿನ ನವೀಕರಣಗಳು ಕೆಳಗಿವೆ.',
    },
    'cdhar0x7': {
      'en': 'Cureent Status',
      'hi': '',
      'kn': 'ಪ್ರಸ್ತುತ ಸ್ಥಿತಿ',
    },
    'dxqxhdxq': {
      'en': '1',
      'hi': '',
      'kn': '1',
    },
    'jxdmhtnd': {
      'en': 'Customer name',
      'hi': '',
      'kn': 'ಗ್ರಾಹಕ ಹೆಸರು',
    },
    'e144f6zy': {
      'en': 'Quick Service',
      'hi': '',
      'kn': 'ತ್ವರಿತ ಸೇವೆ',
    },
    'ud9xy3dn': {
      'en': 'Applications',
      'hi': '',
      'kn': 'ಅರ್ಜಿಗಳನ್ನು',
    },
    'kylun0pr': {
      'en': 'Activity',
      'hi': '',
      'kn': 'ಚಟುವಟಿಕೆ',
    },
    '0dqk52ho': {
      'en': 'Job offered',
      'hi': '',
      'kn': 'ಉದ್ಯೋಗ ನೀಡಲಾಯಿತು',
    },
    '6pzbe7nw': {
      'en': 'Accepted',
      'hi': '',
      'kn': 'ಸ್ವೀಕರಿಸಲಾಗಿದೆ',
    },
    '88zh93e2': {
      'en': 'Activities',
      'hi': '',
      'kn': 'ಚಟುವಟಿಕೆಗಳು',
    },
  },
  // worker_sa
  {
    'kf2uiwgp': {
      'en': 'Applications',
      'hi': '',
      'kn': 'ಅರ್ಜಿಗಳನ್ನು',
    },
    '49fes3xe': {
      'en': 'All Activity from this past month.',
      'hi': '',
      'kn': 'ಕಳೆದ ತಿಂಗಳಿನಿಂದ ಎಲ್ಲಾ ಚಟುವಟಿಕೆಗಳು.',
    },
    'kfxg5iuk': {
      'en': '14, Sept. 2021',
      'hi': '',
      'kn': '14, ಸೆಪ್ಟೆಂಬರ್ 2021',
    },
    'r1yn7xyu': {
      'en': 'New job',
      'hi': '',
      'kn': 'ಹೊಸ ಉದ್ಯೋಗ',
    },
    '9krtmebb': {
      'en': 'Accepted',
      'hi': '',
      'kn': 'ಸ್ವೀಕರಿಸಲಾಗಿದೆ',
    },
    'kyfzy3sk': {
      'en': 'Andrew F.',
      'hi': '',
      'kn': 'ಆಂಡ್ರ್ಯೂ ಎಫ್.',
    },
    'pa25c4kd': {
      'en': 'Details',
      'hi': '',
      'kn': 'ವಿವರಗಳು',
    },
    'qfq5w5dx': {
      'en': '14, Sept. 2021',
      'hi': '',
      'kn': '14, ಸೆಪ್ಟೆಂಬರ್ 2021',
    },
    'x9u7xf5g': {
      'en': 'Job role',
      'hi': '',
      'kn': 'ಕೆಲಸದ ಪಾತ್ರ',
    },
    'qd42ojox': {
      'en': 'declined',
      'hi': '',
      'kn': 'ನಿರಾಕರಿಸಿದರು',
    },
    '3rr85n5b': {
      'en': 'Andrew F.',
      'hi': '',
      'kn': 'ಆಂಡ್ರ್ಯೂ ಎಫ್.',
    },
    'njzmaac7': {
      'en': 'Details',
      'hi': '',
      'kn': 'ವಿವರಗಳು',
    },
    'z96zdp8w': {
      'en': '14, Sept. 2021',
      'hi': '',
      'kn': '14, ಸೆಪ್ಟೆಂಬರ್ 2021',
    },
    'kziuzhck': {
      'en': 'New job offer',
      'hi': '',
      'kn': 'ಹೊಸ ಉದ್ಯೋಗ ಆಫರ್',
    },
    'khqxyt39': {
      'en': '#001 Plumbing',
      'hi': '',
      'kn': '#001 ಕೊಳಾಯಿ',
    },
    'ey3nudh3': {
      'en': 'Andrew F.',
      'hi': '',
      'kn': 'ಆಂಡ್ರ್ಯೂ ಎಫ್.',
    },
    'nebw0zj6': {
      'en': 'Apply',
      'hi': '',
      'kn': 'ಅನ್ವಯಿಸು',
    },
    'bsax9z0s': {
      'en': 'Beginning of Activity',
      'hi': '',
      'kn': 'ಚಟುವಟಿಕೆಯ ಆರಂಭ',
    },
  },
  // client_sa
  {
    '4gvvucu4': {
      'en': 'Ads',
      'hi': '',
      'kn': 'ಜಾಹೀರಾತುಗಳು',
    },
    '4dm4zqx1': {
      'en': 'All Activity from this past month.',
      'hi': '',
      'kn': 'ಕಳೆದ ತಿಂಗಳಿನಿಂದ ಎಲ್ಲಾ ಚಟುವಟಿಕೆಗಳು.',
    },
    '8f5rj5iu': {
      'en': '14, Sept. 2021',
      'hi': '',
      'kn': '14, ಸೆಪ್ಟೆಂಬರ್ 2021',
    },
    'w4qrecwd': {
      'en': 'New job',
      'hi': '',
      'kn': 'ಹೊಸ ಉದ್ಯೋಗ',
    },
    '7jlsfsz4': {
      'en': 'posted',
      'hi': '',
      'kn': 'ಪೋಸ್ಟ್',
    },
    'o5kfm3rt': {
      'en': 'Andrew F.',
      'hi': '',
      'kn': 'ಆಂಡ್ರ್ಯೂ ಎಫ್.',
    },
    '73vl3jnz': {
      'en': 'Details',
      'hi': '',
      'kn': 'ವಿವರಗಳು',
    },
    'v7dggo21': {
      'en': '14, Sept. 2021',
      'hi': '',
      'kn': '14, ಸೆಪ್ಟೆಂಬರ್ 2021',
    },
    's7y3eopm': {
      'en': 'Offer rolled',
      'hi': '',
      'kn': 'ಆಫರ್ ರೋಲ್ ಮಾಡಲಾಗಿದೆ',
    },
    '63r2515x': {
      'en': 'declined',
      'hi': '',
      'kn': 'ನಿರಾಕರಿಸಿದರು',
    },
    'q1mp6r86': {
      'en': 'Andrew F.',
      'hi': '',
      'kn': 'ಆಂಡ್ರ್ಯೂ ಎಫ್.',
    },
    'u57vikd3': {
      'en': 'Details',
      'hi': '',
      'kn': 'ವಿವರಗಳು',
    },
    'zseki77f': {
      'en': '14, Sept. 2021',
      'hi': '',
      'kn': '14, ಸೆಪ್ಟೆಂಬರ್ 2021',
    },
    'c08p5qm7': {
      'en': 'Looking for workers',
      'hi': '',
      'kn': 'ಕೆಲಸಗಾರರನ್ನು ಹುಡುಕುತ್ತಿದ್ದೇವೆ',
    },
    'q7qoiuqy': {
      'en': '#post jo',
      'hi': '',
      'kn': '#ಪೋಸ್ಟ್ ಜೋ',
    },
    '3bn7h5zn': {
      'en': 'Andrew F.',
      'hi': '',
      'kn': 'ಆಂಡ್ರ್ಯೂ ಎಫ್.',
    },
    'jom5lfgm': {
      'en': 'Post',
      'hi': '',
      'kn': 'ಪೋಸ್ಟ್ ಮಾಡಿ',
    },
    'qp5xmrl0': {
      'en': 'Beginning of Activity',
      'hi': '',
      'kn': 'ಚಟುವಟಿಕೆಯ ಆರಂಭ',
    },
  },
  // Ad_standalone
  {
    'q2c7lx85': {
      'en': 'Posted AD',
      'hi': '',
      'kn': 'ಪೋಸ್ಟ್ ಮಾಡಿದ ಕ್ರಿ.ಶ',
    },
    'a38i8pao': {
      'en': 'Posted \nAD',
      'hi': '',
      'kn': 'ಪೋಸ್ಟ್ ಮಾಡಿದ ಕ್ರಿ.ಶ',
    },
    '7u9783w8': {
      'en': '^ 25%',
      'hi': '',
      'kn': '^ 25%',
    },
    '9ryql7x1': {
      'en': '4',
      'hi': '',
      'kn': '4',
    },
    'mu9rwhr3': {
      'en': 'Number of Applicants',
      'hi': '',
      'kn': 'ಅರ್ಜಿದಾರರ ಸಂಖ್ಯೆ',
    },
    'xkyh6pp3': {
      'en': '^ 25%',
      'hi': '',
      'kn': '^ 25%',
    },
    'v502ejw8': {
      'en': '20',
      'hi': '',
      'kn': '20',
    },
    'e4ji5gsn': {
      'en': 'This Month',
      'hi': '',
      'kn': 'ಈ ತಿಂಗಳು',
    },
  },
  // applicants
  {
    'b9jxnzof': {
      'en': 'Applicants',
      'hi': '',
      'kn': 'ಅಭ್ಯರ್ಥಿಗಳು',
    },
    'goz7h770': {
      'en': 'Selected \ncandidates',
      'hi': '',
      'kn': 'ಆಯ್ಕೆಯಾದ ಅಭ್ಯರ್ಥಿಗಳು',
    },
    'bj4qdtno': {
      'en': '^ 25%',
      'hi': '',
      'kn': '^ 25%',
    },
    'idq620ps': {
      'en': '4',
      'hi': '',
      'kn': '4',
    },
    '8ufi7pso': {
      'en': 'Number of Applicants',
      'hi': '',
      'kn': 'ಅರ್ಜಿದಾರರ ಸಂಖ್ಯೆ',
    },
    'soycg0nv': {
      'en': '^ 25%',
      'hi': '',
      'kn': '^ 25%',
    },
    't4qrumqs': {
      'en': '20',
      'hi': '',
      'kn': '20',
    },
    'bwz811uz': {
      'en': 'This Month',
      'hi': '',
      'kn': 'ಈ ತಿಂಗಳು',
    },
  },
  // Ad_info
  {
    'up6vpga5': {
      'en': 'Hello World',
      'hi': '',
      'kn': 'ಹಲೋ ವರ್ಲ್ಡ್',
    },
    'yids139h': {
      'en': 'Hello World',
      'hi': '',
      'kn': 'ಹಲೋ ವರ್ಲ್ಡ್',
    },
    '9vks6afa': {
      'en': 'Hello World',
      'hi': '',
      'kn': 'ಹಲೋ ವರ್ಲ್ಡ್',
    },
    'tqzwtspd': {
      'en': 'Hello World',
      'hi': '',
      'kn': 'ಹಲೋ ವರ್ಲ್ಡ್',
    },
    'k4flv7dx': {
      'en': 'Hello World',
      'hi': '',
      'kn': 'ಹಲೋ ವರ್ಲ್ಡ್',
    },
    'zwqtee16': {
      'en': 'Hello World',
      'hi': '',
      'kn': 'ಹಲೋ ವರ್ಲ್ಡ್',
    },
    'hrwk9l0g': {
      'en': 'Hello World',
      'hi': '',
      'kn': 'ಹಲೋ ವರ್ಲ್ಡ್',
    },
    '9vhyvqmz': {
      'en': 'Hello World',
      'hi': '',
      'kn': 'ಹಲೋ ವರ್ಲ್ಡ್',
    },
    'mr78leey': {
      'en': '[Some hint text...]',
      'hi': '',
      'kn': '[ಕೆಲವು ಸುಳಿವು ಪಠ್ಯ...]',
    },
    '7h1wvbe9': {
      'en': 'location',
      'hi': '',
      'kn': 'ಸ್ಥಳ',
    },
    'vdfegtap': {
      'en': 'Accept',
      'hi': '',
      'kn': 'ಒಪ್ಪಿಕೊಳ್ಳಿ',
    },
  },
  // allinone
  {
    'cqvb2scm': {
      'en': 'landing page',
      'hi': '',
      'kn': 'ಲ್ಯಾಂಡಿಂಗ್ ಪುಟ',
    },
    'cbocitbk': {
      'en': 'worker home',
      'hi': '',
      'kn': 'ಕೆಲಸಗಾರ ಮನೆ',
    },
    '2uixqxu9': {
      'en': 'client home',
      'hi': '',
      'kn': 'ಗ್ರಾಹಕ ಮನೆ',
    },
    'qavglxis': {
      'en': 'post job',
      'hi': '',
      'kn': 'ಪೋಸ್ಟ್ ಕೆಲಸ',
    },
    'jvthly1l': {
      'en': 'Book job',
      'hi': '',
      'kn': 'ಪುಸ್ತಕದ ಕೆಲಸ',
    },
    'yhe5uurd': {
      'en': 'client dashboard',
      'hi': '',
      'kn': 'ಕ್ಲೈಂಟ್ ಡ್ಯಾಶ್ಬೋರ್ಡ್',
    },
    'h33n1jii': {
      'en': 'woker dashboard',
      'hi': '',
      'kn': 'ವೋಕರ್ ಡ್ಯಾಶ್‌ಬೋರ್ಡ್',
    },
    'el02whho': {
      'en': 'Worker info',
      'hi': '',
      'kn': 'ಕೆಲಸಗಾರ ಮಾಹಿತಿ',
    },
    '8s6x7hfh': {
      'en': 'client SA',
      'hi': '',
      'kn': 'ಗ್ರಾಹಕ SA',
    },
    '3x9z29sa': {
      'en': 'AD SA/worker confirmation',
      'hi': '',
      'kn': 'AD SA/ಕಾರ್ಮಿಕ ದೃಢೀಕರಣ',
    },
    'cru0qn0v': {
      'en': 'Ad standalone',
      'hi': '',
      'kn': 'ಜಾಹೀರಾತು ಸ್ವತಂತ್ರ',
    },
    'iwimur4u': {
      'en': 'applicants',
      'hi': '',
      'kn': 'ಅಭ್ಯರ್ಥಿಗಳು',
    },
    '2oxr2957': {
      'en': 'Ad info',
      'hi': '',
      'kn': 'ಜಾಹೀರಾತು ಮಾಹಿತಿ',
    },
  },
  // temp_job_post
  {
    'ivvfexnp': {
      'en': 'Jobtype',
      'hi': '',
      'kn': 'ಉದ್ಯೋಗ ಪ್ರಕಾರ',
    },
    '8binzi4l': {
      'en': 'Electrician',
      'hi': '',
      'kn': 'ಎಲೆಕ್ಟ್ರಿಷಿಯನ್',
    },
    'xehv6wq3': {
      'en': 'Plumber',
      'hi': '',
      'kn': 'ಪ್ಲಂಬರ್',
    },
    '3wza0btd': {
      'en': 'Location',
      'hi': '',
      'kn': 'ಸ್ಥಳ',
    },
    '8wwgwml7': {
      'en': 'Job Description',
      'hi': '',
      'kn': 'ಕೆಲಸದ ವಿವರ',
    },
    '1bdr2ms2': {
      'en': 'I  accept for all terms and conditions',
      'hi': '',
      'kn': 'ನಾನು ಎಲ್ಲಾ ನಿಯಮಗಳು ಮತ್ತು ಷರತ್ತುಗಳಿಗೆ ಸಮ್ಮತಿಸುತ್ತೇನೆ',
    },
    'zh90775s': {
      'en': 'Post JOB',
      'hi': '',
      'kn': 'ಪೋಸ್ಟ್ ಜಾಬ್',
    },
  },
  // worker_confirmation
  {
    'sztxx489': {
      'en': 'Hello World',
      'hi': '',
      'kn': 'ಹಲೋ ವರ್ಲ್ಡ್',
    },
    'mwangw35': {
      'en': 'Hello World',
      'hi': '',
      'kn': 'ಹಲೋ ವರ್ಲ್ಡ್',
    },
    'zzz3ksv4': {
      'en': 'Hello World',
      'hi': '',
      'kn': 'ಹಲೋ ವರ್ಲ್ಡ್',
    },
    '5ylxvc7x': {
      'en': 'Hello World',
      'hi': '',
      'kn': 'ಹಲೋ ವರ್ಲ್ಡ್',
    },
    'frjmmue9': {
      'en': 'Hello World',
      'hi': '',
      'kn': 'ಹಲೋ ವರ್ಲ್ಡ್',
    },
    'q35g3n4q': {
      'en': 'About',
      'hi': '',
      'kn': 'ಬಗ್ಗೆ',
    },
    '6h4os39l': {
      'en': 'Call now',
      'hi': '',
      'kn': 'ಈಗ ಕರೆ ಮಾಡು',
    },
    'tfrpzxlg': {
      'en': 'Report',
      'hi': '',
      'kn': 'ವರದಿ',
    },
  },
  // Billing
  {
    'sd6ayysb': {
      'en': 'Payment Confirmed!',
      'hi': '',
      'kn': 'ಪಾವತಿಯನ್ನು ದೃಢೀಕರಿಸಲಾಗಿದೆ!',
    },
    'i57qyqa8': {
      'en': '\$425.24',
      'hi': '',
      'kn': '\$425.24',
    },
    'ylzqk663': {
      'en':
          'Your payment has been confirmed, it may take 1-2 hours in order for your payment to go through and show up in your transation list.',
      'hi': '',
      'kn':
          'ನಿಮ್ಮ ಪಾವತಿಯನ್ನು ದೃಢೀಕರಿಸಲಾಗಿದೆ, ನಿಮ್ಮ ಪಾವತಿಯನ್ನು ಪೂರ್ಣಗೊಳಿಸಲು ಮತ್ತು ನಿಮ್ಮ ವಹಿವಾಟಿನ ಪಟ್ಟಿಯಲ್ಲಿ ತೋರಿಸಲು ಇದು 1-2 ಗಂಟೆಗಳನ್ನು ತೆಗೆದುಕೊಳ್ಳಬಹುದು.',
    },
    '4fevrgsj': {
      'en': 'Total Billing',
      'hi': '',
      'kn': 'ಒಟ್ಟು ಬಿಲ್ಲಿಂಗ್',
    },
    'b7dfzp3f': {
      'en': '\$425.24',
      'hi': '',
      'kn': '\$425.24',
    },
    'drmjedni': {
      'en': 'Submit',
      'hi': '',
      'kn': 'ಸಲ್ಲಿಸು',
    },
  },
  // Generate_bill
  {
    't0o0mv7j': {
      'en': ' ',
      'hi': '',
      'kn': '',
    },
    'hrwoqiln': {
      'en': 'Hello World',
      'hi': '',
      'kn': 'ಹಲೋ ವರ್ಲ್ಡ್',
    },
    'k0rn6qbd': {
      'en': 'Plumber work',
      'hi': '',
      'kn': 'ಪ್ಲಂಬರ್ ಕೆಲಸ',
    },
    'qs12ok5a': {
      'en': '\$50.00',
      'hi': '',
      'kn': '\$50.00',
    },
    'o9n5smd7': {
      'en': 'Date: 31/12/2021',
      'hi': '',
      'kn': 'ದಿನಾಂಕ: 31/12/2021',
    },
    'a5bdg9aa': {
      'en': 'Name of  customer',
      'hi': '',
      'kn': 'ಗ್ರಾಹಕರ ಹೆಸರು',
    },
    'z5m1i8m6': {
      'en': 'Small',
      'hi': '',
      'kn': 'ಚಿಕ್ಕದು',
    },
    '9kqyln7q': {
      'en': 'Medium',
      'hi': '',
      'kn': 'ಮಾಧ್ಯಮ',
    },
    '4a0sf7z4': {
      'en': 'Large',
      'hi': '',
      'kn': 'ದೊಡ್ಡದು',
    },
    'yjl15xr3': {
      'en': 'Add Bill',
      'hi': '',
      'kn': 'ಬಿಲ್ ಸೇರಿಸಿ',
    },
  },
  // home_clientCopy
  {
    't0gq55e2': {
      'en': 'Quick Service',
      'hi': '',
      'kn': 'ತ್ವರಿತ ಸೇವೆ',
    },
    's4ocmrlm': {
      'en': 'Activities',
      'hi': '',
      'kn': 'ಚಟುವಟಿಕೆಗಳು',
    },
  },
  // Phone_Auth
  {
    'xigfr14o': {
      'en': 'Phone Sign In',
      'hi': '',
      'kn': 'ಫೋನ್ ಸೈನ್ ಇನ್',
    },
    'd1a1tceh': {
      'en': 'Your Phone Number...',
      'hi': '',
      'kn': 'ನಿಮ್ಮ ಫೋನ್ ಸಂಖ್ಯೆ...',
    },
    'za35p7us': {
      'en': '+1 (204) 204-2056',
      'hi': '',
      'kn': '+1 (204) 204-2056',
    },
    '4x6ycyuc': {
      'en': 'Your Phone Number...',
      'hi': '',
      'kn': 'ನಿಮ್ಮ ಫೋನ್ ಸಂಖ್ಯೆ...',
    },
    'dlex86ic': {
      'en': '+1 (204) 204-2056',
      'hi': '',
      'kn': '+1 (204) 204-2056',
    },
    'w74prsxr': {
      'en': 'Sign In',
      'hi': '',
      'kn': 'ಸೈನ್ ಇನ್ ಮಾಡಿ',
    },
  },
  // profile
  {
    '01vjuzj8': {
      'en': 'Change Cover Photo',
      'hi': '',
      'kn': 'ಕವರ್ ಫೋಟೋ ಬದಲಾಯಿಸಿ',
    },
    'dyf26l56': {
      'en': 'Edit Image',
      'hi': '',
      'kn': 'ಚಿತ್ರವನ್ನು ಸಂಪಾದಿಸಿ',
    },
    'ye71l1xo': {
      'en': 'Your Nam',
      'hi': '',
      'kn': 'ನಿಮ್ಮ ನಾಮ',
    },
    '4dcz1xqi': {
      'en': 'What do people call you...?',
      'hi': '',
      'kn': 'ಜನರು ನಿಮ್ಮನ್ನು ಏನೆಂದು ಕರೆಯುತ್ತಾರೆ...?',
    },
    'q534ab74': {
      'en': '[User Name]',
      'hi': '',
      'kn': '[ಬಳಕೆದಾರ ಹೆಸರು]',
    },
    '4rngeeqs': {
      'en': 'Email Address',
      'hi': '',
      'kn': 'ಇಮೇಲ್ ವಿಳಾಸ',
    },
    'e1okvbi1': {
      'en': 'Enter a new email',
      'hi': '',
      'kn': 'ಹೊಸ ಇಮೇಲ್ ಅನ್ನು ನಮೂದಿಸಿ',
    },
    'xokut03u': {
      'en': '[User Email]',
      'hi': '',
      'kn': '[ಬಳಕೆದಾರ ಇಮೇಲ್]',
    },
    'tck6o6yz': {
      'en': 'Recieve Notifications',
      'hi': '',
      'kn': 'ಅಧಿಸೂಚನೆಗಳನ್ನು ಸ್ವೀಕರಿಸಿ',
    },
    'w3rhkj5j': {
      'en': 'Turn on notifications.',
      'hi': '',
      'kn': 'ಅಧಿಸೂಚನೆಗಳನ್ನು ಆನ್ ಮಾಡಿ.',
    },
    'ja0fj5uq': {
      'en': 'Save Changes',
      'hi': '',
      'kn': 'ಬದಲಾವಣೆಗಳನ್ನು ಉಳಿಸು',
    },
    'cwplrgd9': {
      'en': 'Edit Profile',
      'hi': '',
      'kn': 'ಪ್ರೊಫೈಲ್ ಬದಲಿಸು',
    },
  },
  // Ad_standaloneCopy
  {
    'l8fi2s4q': {
      'en': 'Offer',
      'hi': '',
      'kn': 'ಆಫರ್',
    },
    'r79taxxl': {
      'en': 'Jobs \nOffered',
      'hi': '',
      'kn': 'ಉದ್ಯೋಗಗಳನ್ನು ನೀಡಲಾಗಿದೆ',
    },
    'jrs7ekib': {
      'en': '^ 25%',
      'hi': '',
      'kn': '^ 25%',
    },
    'om2r6bx2': {
      'en': '4',
      'hi': '',
      'kn': '4',
    },
    'y1r8wzud': {
      'en': 'Profit',
      'hi': '',
      'kn': 'ಲಾಭ',
    },
    'g80x715v': {
      'en': '^ 25%',
      'hi': '',
      'kn': '^ 25%',
    },
    'p9cudy20': {
      'en': '20',
      'hi': '',
      'kn': '20',
    },
    '4wghgvja': {
      'en': 'This Month',
      'hi': '',
      'kn': 'ಈ ತಿಂಗಳು',
    },
  },
  // conirmation
  {
    'vsjvv4ay': {
      'en': 'Confirm',
      'hi': '',
      'kn': 'ದೃಢೀಕರಿಸಿ',
    },
  },
  // perm_worker
  {
    'ww713nmk': {
      'en': 'Welcome,',
      'hi': '',
      'kn': 'ಸ್ವಾಗತ,',
    },
    'fppt27j1': {
      'en': 'Andrew',
      'hi': '',
      'kn': 'ಆಂಡ್ರ್ಯೂ',
    },
    'oba2lpwy': {
      'en': 'Your latest updates are below.',
      'hi': '',
      'kn': 'ನಿಮ್ಮ ಇತ್ತೀಚಿನ ನವೀಕರಣಗಳು ಕೆಳಗಿವೆ.',
    },
    'pqzz31eh': {
      'en': 'Jobs \nOffered',
      'hi': '',
      'kn': 'ಉದ್ಯೋಗಗಳನ್ನು ನೀಡಲಾಗಿದೆ',
    },
    'vxgd907j': {
      'en': '^ 25%',
      'hi': '',
      'kn': '^ 25%',
    },
    'q3968h26': {
      'en': '4',
      'hi': '',
      'kn': '4',
    },
    'z7ko8shl': {
      'en': 'click here',
      'hi': '',
      'kn': 'ಇಲ್ಲಿ ಕ್ಲಿಕ್ ಮಾಡಿ',
    },
    '7pjztks9': {
      'en': 'Profit',
      'hi': '',
      'kn': 'ಲಾಭ',
    },
    '770sq9go': {
      'en': '^ 25%',
      'hi': '',
      'kn': '^ 25%',
    },
    'artbfg6t': {
      'en': '20',
      'hi': '',
      'kn': '20',
    },
    'nmfa7g0m': {
      'en': 'click here',
      'hi': '',
      'kn': 'ಇಲ್ಲಿ ಕ್ಲಿಕ್ ಮಾಡಿ',
    },
    'qmbnk4a1': {
      'en': 'Activities',
      'hi': '',
      'kn': 'ಚಟುವಟಿಕೆಗಳು',
    },
  },
  // setting
  {
    'je4y4mto': {
      'en': '[User Name Here]',
      'hi': '',
      'kn': '[ಬಳಕೆದಾರರ ಹೆಸರು ಇಲ್ಲಿ]',
    },
    'cxfx7nxm': {
      'en': 'User.name@domainname.com',
      'hi': '',
      'kn': 'User.name@domainname.com',
    },
    'hiomhfqc': {
      'en': 'Account Settings',
      'hi': '',
      'kn': 'ಖಾತೆ ಸೆಟ್ಟಿಂಗ್‌ಗಳು',
    },
    'e36iomud': {
      'en': 'Order History',
      'hi': '',
      'kn': 'ಆದೇಶ ಇತಿಹಾಸ',
    },
    '6lgevfo9': {
      'en': 'My Settings',
      'hi': '',
      'kn': 'ನನ್ನ ಸೆಟ್ಟಿಂಗ್‌ಗಳು',
    },
    'rg6d9dmr': {
      'en': 'My Notifications',
      'hi': '',
      'kn': 'ನನ್ನ ಅಧಿಸೂಚನೆಗಳು',
    },
    '5f4pqxpf': {
      'en': 'Terms of Service',
      'hi': '',
      'kn': 'ಸೇವಾ ನಿಯಮಗಳು',
    },
    'j4mktw6i': {
      'en': 'Log Out',
      'hi': '',
      'kn': 'ಲಾಗ್ ಔಟ್',
    },
    'hg87mb4a': {
      'en': '[User Name]',
      'hi': '',
      'kn': '[ಬಳಕೆದಾರ ಹೆಸರು]',
    },
    'xrrytm66': {
      'en': '[username@domain.com]',
      'hi': '',
      'kn': '[username@domain.com]',
    },
  },
  // offer_client
  {
    '5jjnatg2': {
      'en': 'Applicants',
      'hi': '',
      'kn': 'ಅಭ್ಯರ್ಥಿಗಳು',
    },
    '0lhuybri': {
      'en': 'Selected \ncandidates',
      'hi': '',
      'kn': 'ಆಯ್ಕೆಯಾದ ಅಭ್ಯರ್ಥಿಗಳು',
    },
    'txwtfbcp': {
      'en': '^ 25%',
      'hi': '',
      'kn': '^ 25%',
    },
    'n3vf297b': {
      'en': '4',
      'hi': '',
      'kn': '4',
    },
    'npjeum8s': {
      'en': 'Number of Applicants',
      'hi': '',
      'kn': 'ಅರ್ಜಿದಾರರ ಸಂಖ್ಯೆ',
    },
    '3tll3hc7': {
      'en': '^ 25%',
      'hi': '',
      'kn': '^ 25%',
    },
    'tzue9p22': {
      'en': '20',
      'hi': '',
      'kn': '20',
    },
    'mf3jgf8p': {
      'en': 'This Month',
      'hi': '',
      'kn': 'ಈ ತಿಂಗಳು',
    },
  },
  // search_home
  {
    'p7risnqg': {
      'en': 'Job Type',
      'hi': '',
      'kn': 'ಉದ್ಯೋಗದ ಪ್ರಕಾರ',
    },
    '5n7wazc9': {
      'en': 'Electrician',
      'hi': '',
      'kn': 'ಎಲೆಕ್ಟ್ರಿಷಿಯನ್',
    },
    'm8bkzuho': {
      'en': 'Pincode',
      'hi': '',
      'kn': 'ಪಿನ್‌ಕೋಡ್',
    },
    '8zgp8zp8': {
      'en': 'Please Enter the pincode before proceeding',
      'hi': '',
      'kn': 'ಮುಂದುವರಿಯುವ ಮೊದಲು ದಯವಿಟ್ಟು ಪಿನ್‌ಕೋಡ್ ಅನ್ನು ನಮೂದಿಸಿ',
    },
    'ktcp3zoa': {
      'en': 'Expereince',
      'hi': '',
      'kn': 'ಅನುಭವ',
    },
    '85g87hhi': {
      'en': 'Search',
      'hi': '',
      'kn': 'ಹುಡುಕಿ Kannada',
    },
  },
  // search_client_comp
  {
    'lavbthdg': {
      'en': 'JOB1',
      'hi': '',
      'kn': 'ಕೆಲಸ1',
    },
    '3avy0mqh': {
      'en': 'JOB2',
      'hi': '',
      'kn': 'ಕೆಲಸ 2',
    },
    'v7q3j1cs': {
      'en': 'Name',
      'hi': '',
      'kn': 'ಹೆಸರು',
    },
    '8xappu8f': {
      'en': 'Location',
      'hi': '',
      'kn': 'ಸ್ಥಳ',
    },
    'a41msen0': {
      'en': 'Experience',
      'hi': '',
      'kn': 'ಅನುಭವ',
    },
    'muo01zwn': {
      'en': ' 3 Years',
      'hi': '',
      'kn': '3 ವರ್ಷಗಳು',
    },
    'medr04y7': {
      'en': 'Book Now',
      'hi': '',
      'kn': 'ಈಗಲೇ ಬುಕ್ ಮಾಡಿ',
    },
    'ig77paup': {
      'en': 'Education',
      'hi': '',
      'kn': '',
    },
    'kikgld27': {
      'en': '10+',
      'hi': '',
      'kn': '',
    },
  },
  // search_worker_comp
  {
    'lc2esx1z': {
      'en': 'Job type',
      'hi': '',
      'kn': 'ಕೆಲಸದ ಪ್ರಕಾರ',
    },
    'nz3di8w8': {
      'en': 'Location',
      'hi': '',
      'kn': 'ಸ್ಥಳ',
    },
    '58sz0b6r': {
      'en': 'Experience',
      'hi': '',
      'kn': 'ಅನುಭವ',
    },
    '4f93475k': {
      'en': ' 3 Years',
      'hi': '',
      'kn': '3 ವರ್ಷಗಳು',
    },
    'k76ruhiy': {
      'en': 'Apply now',
      'hi': '',
      'kn': 'ಈಗಲೇ ಅನ್ವಯಿಸಿ',
    },
    'p6gws1wc': {
      'en': 'Education',
      'hi': '',
      'kn': 'ಶಿಕ್ಷಣ',
    },
    'n1d3wcpz': {
      'en': '10+',
      'hi': '',
      'kn': '10+',
    },
  },
  // client_filter
  {
    'jjnxlxar': {
      'en': 'Select AD',
      'hi': '',
      'kn': 'AD ಆಯ್ಕೆಮಾಡಿ',
    },
    '25hetqpe': {
      'en': 'Electrician',
      'hi': '',
      'kn': 'ಎಲೆಕ್ಟ್ರಿಷಿಯನ್',
    },
    'op8wniii': {
      'en': 'Pincode',
      'hi': '',
      'kn': 'ಪಿನ್‌ಕೋಡ್',
    },
    'migzux8o': {
      'en': 'Please Enter the pincode before proceeding',
      'hi': '',
      'kn': 'ಮುಂದುವರಿಯುವ ಮೊದಲು ದಯವಿಟ್ಟು ಪಿನ್‌ಕೋಡ್ ಅನ್ನು ನಮೂದಿಸಿ',
    },
    '4h0ulreu': {
      'en': 'Education',
      'hi': '',
      'kn': 'ಶಿಕ್ಷಣ',
    },
    't8wvnmr9': {
      'en': '10th Pass',
      'hi': '',
      'kn': '10 ನೇ ಪಾಸ್',
    },
    'qwlrsh1d': {
      'en': 'Expereince',
      'hi': '',
      'kn': 'ಅನುಭವ',
    },
    'zg7vauo5': {
      'en': 'Sort',
      'hi': '',
      'kn': 'ವಿಂಗಡಿಸು',
    },
  },
  // job_choice
  {
    'c36k2n4g': {
      'en': 'Electrician',
      'hi': '',
      'kn': 'ಎಲೆಕ್ಟ್ರಿಷಿಯನ್',
    },
    'gmcom3e4': {
      'en': 'Plumber',
      'hi': '',
      'kn': 'ಪ್ಲಂಬರ್',
    },
    'aglgoex6': {
      'en': 'Nurse',
      'hi': '',
      'kn': 'ನರ್ಸ್',
    },
  },
  // filter
  {
    'gwz6itag': {
      'en': 'Select job',
      'hi': '',
      'kn': 'ಕೆಲಸವನ್ನು ಆಯ್ಕೆಮಾಡಿ',
    },
    'o8eh3rur': {
      'en': 'Select job',
      'hi': '',
      'kn': 'ಕೆಲಸವನ್ನು ಆಯ್ಕೆಮಾಡಿ',
    },
    'xsouemnx': {
      'en': 'Pincode',
      'hi': '',
      'kn': 'ಪಿನ್‌ಕೋಡ್',
    },
    'ygytxgey': {
      'en': 'Education',
      'hi': '',
      'kn': 'ಶಿಕ್ಷಣ',
    },
    'mim4ikzy': {
      'en': 'Experience',
      'hi': '',
      'kn': 'ಅನುಭವ',
    },
    'hsecnqfw': {
      'en': 'Salary Range',
      'hi': '',
      'kn': 'ಸಂಬಳ ಶ್ರೇಣಿ',
    },
    'dmxg3lh1': {
      'en': 'Rating',
      'hi': '',
      'kn': 'ರೇಟಿಂಗ್',
    },
    't2mqi1c2': {
      'en': 'Filter',
      'hi': '',
      'kn': 'ಫಿಲ್ಟರ್',
    },
  },
  // activities
  {
    'm2lsyec0': {
      'en': ' Call for electrician',
      'hi': '',
      'kn': 'ಎಲೆಕ್ಟ್ರಿಷಿಯನ್ಗೆ ಕರೆ ಮಾಡಿ',
    },
    'twecns67': {
      'en': 'Income',
      'hi': '',
      'kn': 'ಆದಾಯ',
    },
    'gg7uthks': {
      'en': '5000 Rs ',
      'hi': '',
      'kn': '5000 ರೂ',
    },
    'kpqiixxs': {
      'en': 'Apply',
      'hi': '',
      'kn': 'ಅನ್ವಯಿಸು',
    },
  },
  // ad_SA
  {
    'kx9l48on': {
      'en': 'Plumber',
      'hi': '',
      'kn': 'ಪ್ಲಂಬರ್',
    },
    '6ava00n0': {
      'en': '12-12-21',
      'hi': '',
      'kn': '12-12-21',
    },
    'v973k3l2': {
      'en': 'Need a plumber for quixk repair',
      'hi': '',
      'kn': 'ಕ್ವಿಕ್ಸ್ ರಿಪೇರಿಗಾಗಿ ಪ್ಲಂಬರ್ ಅಗತ್ಯವಿದೆ',
    },
  },
  // result_customer
  {
    'p8rp1bhh': {
      'en': 'Job type',
      'hi': '',
      'kn': 'ಕೆಲಸದ ಪ್ರಕಾರ',
    },
    '5q5t8rzc': {
      'en': 'Name',
      'hi': '',
      'kn': 'ಹೆಸರು',
    },
    'q49gag7t': {
      'en': 'Location',
      'hi': '',
      'kn': 'ಸ್ಥಳ',
    },
    'ji6xdogt': {
      'en': 'AD-1',
      'hi': '',
      'kn': 'AD-1',
    },
    '1hp2yjf5': {
      'en': 'Experience',
      'hi': '',
      'kn': 'ಅನುಭವ',
    },
    'kjhg0dfs': {
      'en': ' 3 Years',
      'hi': '',
      'kn': '3 ವರ್ಷಗಳು',
    },
    '756wrkc7': {
      'en': 'Book',
      'hi': '',
      'kn': 'ಬುಕ್ ಮಾಡಲಾಗಿದೆ',
    },
    'sx05halw': {
      'en': 'Reject',
      'hi': '',
      'kn': 'ಕಾಯುವಿಕೆ ಪಟ್ಟಿ',
    },
  },
  // ad_info_sa
  {
    'livq9ng6': {
      'en': 'Plumber',
      'hi': '',
      'kn': 'ಪ್ಲಂಬರ್',
    },
    'y00xa9tw': {
      'en': '12-12-21',
      'hi': '',
      'kn': '12-12-21',
    },
    'wl6wfk6u': {
      'en': 'Need a plumber for quixk repair',
      'hi': '',
      'kn': 'ಕ್ವಿಕ್ಸ್ ರಿಪೇರಿಗಾಗಿ ಪ್ಲಂಬರ್ ಅಗತ್ಯವಿದೆ',
    },
  },
  // worker_entry
  {
    'h9diuede': {
      'en': 'Name',
      'hi': '',
      'kn': 'ಹೆಸರು',
    },
    'nu3nc12r': {
      'en': 'Service',
      'hi': '',
      'kn': 'ಸೇವೆ',
    },
    'srgrgp70': {
      'en': '15 mins',
      'hi': '',
      'kn': '15 ನಿಮಿಷಗಳು',
    },
  },
  // Experience
  {
    '4l8pl03x': {
      'en': 'Rate our service',
      'hi': '',
      'kn': 'ನಮ್ಮ ಸೇವೆಯನ್ನು ರೇಟ್ ಮಾಡಿ',
    },
  },
  // Options
  {
    'dgq40pab': {
      'en': 'Plumber',
      'hi': '',
      'kn': 'ಪ್ಲಂಬರ್',
    },
    'cf2zq7sj': {
      'en': 'Electrician',
      'hi': '',
      'kn': 'ಎಲೆಕ್ಟ್ರಿಷಿಯನ್',
    },
    '5lq43wen': {
      'en': 'Nurse',
      'hi': '',
      'kn': 'ನರ್ಸ್',
    },
    'kr7024k6': {
      'en': 'Carpenting',
      'hi': '',
      'kn': 'ಕಾರ್ಪೆಂಟಿಂಗ್',
    },
  },
  // client_db
  {
    'u41uk0o7': {
      'en': 'DOUBLE\nVaccinated',
      'hi': '',
      'kn': 'ಡಬಲ್ ಲಸಿಕೆ ಹಾಕಲಾಗಿದೆ',
    },
    'f01bahf7': {
      'en': 'AADHAR \nAuntenticated',
      'hi': '',
      'kn': 'ಆಧಾರ್ ರದ್ದುಗೊಳಿಸಲಾಗಿದೆ',
    },
  },
  // activity
  {
    'p6hxnga2': {
      'en': '14, Sept. 2021',
      'hi': '',
      'kn': '14, ಸೆಪ್ಟೆಂಬರ್ 2021',
    },
    'wi9i8dhb': {
      'en': 'New job',
      'hi': '',
      'kn': 'ಹೊಸ ಉದ್ಯೋಗ',
    },
    'fhtcpmsp': {
      'en': 'posted',
      'hi': '',
      'kn': 'ಪೋಸ್ಟ್',
    },
    'fq97pyyd': {
      'en': 'Andrew F.',
      'hi': '',
      'kn': 'ಆಂಡ್ರ್ಯೂ ಎಫ್.',
    },
    '4ghdsk1x': {
      'en': 'Details',
      'hi': '',
      'kn': 'ವಿವರಗಳು',
    },
  },
  // worker_ad
  {
    'n431qru1': {
      'en': 'OFFERED',
      'hi': '',
      'kn': 'ನೀಡಲಾಗಿದೆ',
    },
    '9e062579': {
      'en': 'Plumber',
      'hi': '',
      'kn': 'ಪ್ಲಂಬರ್',
    },
    'vq7hd88u': {
      'en': '12-12-21',
      'hi': '',
      'kn': '12-12-21',
    },
    '6wzm3cvn': {
      'en': 'Need a plumber for quixk repair',
      'hi': '',
      'kn': 'ಕ್ವಿಕ್ಸ್ ರಿಪೇರಿಗಾಗಿ ಪ್ಲಂಬರ್ ಅಗತ್ಯವಿದೆ',
    },
    'q3jvsves': {
      'en': 'Address',
      'hi': '',
      'kn': 'ವಿಳಾಸ',
    },
  },
  // Miscellaneous
  {
    'jzez2p3b': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    '0sme2idw': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'j2fzpch8': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'fxooc4zl': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    '20ltfhe0': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'itlqkyd7': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'zmos09r2': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    '5sotwfiz': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'mjw5vszj': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    's5s8ijf0': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'kldv555b': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'a1us75uk': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    's3t0pcai': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    '1tiy538e': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    '64y06x8f': {
      'en': '',
      'hi': '',
      'kn': '',
    },
    'awawrzvv': {
      'en': '',
      'hi': '',
      'kn': '',
    },
  },
].reduce((a, b) => a..addAll(b));
