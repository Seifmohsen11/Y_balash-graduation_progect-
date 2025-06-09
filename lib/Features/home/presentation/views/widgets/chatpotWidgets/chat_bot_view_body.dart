import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/chatpotWidgets/app_bar_of_chat_bot.dart';
import 'package:y_balash/core/constants/constants.dart';
import 'package:y_balash/core/data/services/home/send_question_to_chat_bot_service.dart';
import 'package:y_balash/core/helper/shared_pref_helper.dart';

class ChatPotViewBody extends StatefulWidget {
  const ChatPotViewBody({super.key});

  @override
  State<ChatPotViewBody> createState() => _ChatPotViewBodyState();
}

class _ChatPotViewBodyState extends State<ChatPotViewBody> {
  String? userImagePath;
  bool isLoading = false;

  // List فيها الرسائل (سؤال - رد)
  final List<Map<String, String>> _messages = [];
  String selectedLanguage = 'ar';

  // Controller علشان ناخد النص اللي المستخدم كتبه
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  // دالة لبناء كل رسالة (user أو bot)
  Widget _buildMessage(String role, String text) {
    final isUser = role == 'user';
    final messageTime = TimeOfDay.now().format(context);

    return Container(
      margin: EdgeInsets.symmetric(vertical: 6.h, horizontal: 12.w),
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment:
            isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          // الرسالة نفسها
          Padding(
            padding: isUser
                ? EdgeInsets.only(right: 20.w)
                : EdgeInsets.only(left: 20.w),
            child: Container(
              padding: EdgeInsets.all(12.h),
              decoration: BoxDecoration(
                color: isUser ? Colors.grey[200] : const Color(0xFF003C1C),
                borderRadius: isUser
                    ? BorderRadius.only(
                        topLeft: Radius.circular(12.w),
                        topRight: Radius.circular(12.w),
                        bottomLeft: Radius.circular(12.w),
                      )
                    : BorderRadius.only(
                        topLeft: Radius.circular(12.w),
                        topRight: Radius.circular(12.w),
                        bottomRight: Radius.circular(12.w),
                      ),
              ),
              child: Text(
                text,
                style: TextStyle(
                  color: isUser ? Colors.black : Colors.white,
                  fontSize: 15.sp,
                ),
              ),
            ),
          ),

          SizedBox(height: 4.h),

          // الصورة + الساعة + الصح
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: isUser
                ? [
                    // ترتيب اليوزر

                    Text(
                      messageTime,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Icon(
                      Icons.done,
                      size: 16.sp,
                      color: Colors.grey,
                    ),
                    SizedBox(width: 6.w),
                    CircleAvatar(
                      backgroundImage: userImagePath != null
                          ? FileImage(File(userImagePath!))
                          : const AssetImage('assets/images/user.png')
                              as ImageProvider,
                      radius: 20.h,
                    ),
                  ]
                : [
                    // ترتيب البوت
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 24.h,
                      child: SvgPicture.asset(
                        'assets/icons/chat_bot.svg',
                      ),
                    ),
                    SizedBox(width: 6.w),
                    Text(
                      messageTime,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
          ),
        ],
      ),
    );
  }

  // أزرار ثابتة تحت الشات
  Widget _buildBottomButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _ChatBottomButton(
            text: "❓ What is WappGPT?",
            onTap: () => _sendMessage("What is WappGPT?"),
          ),
          _ChatBottomButton(
            text: "💰 Pricing",
            onTap: () => _sendMessage("Pricing"),
          ),
          _ChatBottomButton(
            text: "📄 FAQs",
            onTap: () => _sendMessage("FAQs"),
          ),
        ],
      ),
    );
  }

// اختيار اللغه
  void _showLanguageDialog() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        barrierDismissible: false, // المستخدم لازم يختار
        builder: (context) => AlertDialog(
          title: Text(
            "Select Language /اختر اللغة",
            style: TextStyle(fontSize: 24.sp, color: kTextFieldAndButtomColor),
          ),
          content: Text(
            "يرجى اختيار اللغة التي تفضلها",
            style: TextStyle(
                fontSize: 18.sp,
                color: const Color.fromARGB(255, 119, 117, 117)),
          ),
          contentPadding: EdgeInsets.only(left: 26.w, top: 6.h, bottom: 30.h),
          actionsPadding: EdgeInsets.only(right: 12.w, bottom: 6.h),
          actions: [
            TextButton(
              onPressed: () async {
                setState(() {
                  selectedLanguage = 'ar';
                });
                Navigator.of(context).pop();
                final response = await sendChatQuestion(
                  language: selectedLanguage,
                  question: '',
                );
                setState(() {
                  _messages.add({'role': 'bot', 'text': response});
                });
                _scrollToBottom();
              },
              child: Text(
                "العربية",
                style:
                    TextStyle(fontSize: 18.sp, color: kTextFieldAndButtomColor),
              ),
            ),
            TextButton(
              onPressed: () async {
                setState(() {
                  selectedLanguage = 'en';
                });
                Navigator.of(context).pop();
                final response = await sendChatQuestion(
                  language: selectedLanguage,
                  question: '',
                );
                setState(() {
                  _messages.add({'role': 'bot', 'text': response});
                });
                _scrollToBottom();
              },
              child: Text(
                "English",
                style:
                    TextStyle(fontSize: 18.sp, color: kTextFieldAndButtomColor),
              ),
            ),
          ],
        ),
      );
    });
  }

  // إرسال الرسالة (هنا المفروض هنبعت API و نستقبل الرد)
  void _sendMessage(String text) async {
    if (text.trim().isEmpty) return;

    setState(() {
      _messages.add({'role': 'user', 'text': text});
      _controller.clear();
      isLoading = true;
      _messages.add({'role': 'bot', 'text': 'typing...'}); // مؤقت
    });

    _scrollToBottom();
    try {
      // إرسال السؤال إلى API واستقبال الرد
      final response = await sendChatQuestion(
        question: text,
        language: selectedLanguage, // en أو ar حسب لغة المستخدم
      );

      setState(() {
        _messages.removeLast(); // إزالة 'typing...' المؤقتة

        _messages.add({'role': 'bot', 'text': response});
        isLoading = false;
      });
      _scrollToBottom();
    } catch (e) {
      setState(() {
        _messages.removeLast(); // إزالة 'typing...'

        _messages.add(
            {'role': 'bot', 'text': 'حدث خطأ أثناء جلب الرد، حاول مرة أخرى.'});
        isLoading = false;
      });
    }
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void _loadUserImage() async {
    final path = await SharedPrefHelper.getUserImage();
    setState(() {
      userImagePath = path;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadUserImage();
    _showLanguageDialog();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Column(
        children: [
          const AppBarOfChatBot(),
          // رسائل الشات
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: EdgeInsets.zero,
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final msg = _messages[index];
                return _buildMessage(msg['role']!, msg['text']!);
              },
            ),
          ),

          // الأزرار السفلية
          _buildBottomButtons(),

          // خانة إدخال الرسالة وزر الإرسال
          Padding(
            padding: EdgeInsets.only(left: 8.h, right: 8.h, bottom: 42.h),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: "Type your message here...",
                hintStyle:
                    TextStyle(color: const Color(0xFF646464), fontSize: 18.sp),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.w)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.w),
                    borderSide:
                        const BorderSide(color: kTextFieldAndButtomColor)),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
                suffixIcon: IconButton(
                  onPressed: () => _sendMessage(_controller.text.trim()),
                  icon: SvgPicture.asset(
                    'assets/icons/sendIcon.svg',
                    width: 24.w,
                    height: 24.h,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// عنصر الأزرار السفلية (Chip)
class _ChatBottomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const _ChatBottomButton({required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Chip(
        label: Text(text, style: const TextStyle(fontSize: 12)),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
