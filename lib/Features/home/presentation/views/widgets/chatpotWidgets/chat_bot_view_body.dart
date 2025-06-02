// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:y_balash/core/constants/constants.dart';

// class ChatPotViewBody extends StatefulWidget {
//   const ChatPotViewBody({super.key});

//   @override
//   State<ChatPotViewBody> createState() => _ChatPotViewBodyState();
// }

// class _ChatPotViewBodyState extends State<ChatPotViewBody>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _scaleAnimation;
//   late Animation<Offset> _slideAnimation;

//   @override
//   void initState() {
//     super.initState();

//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 2),
//     )..repeat(reverse: true);

//     _scaleAnimation = Tween<double>(begin: 0.9, end: 1.1).animate(
//       CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
//     );

//     _slideAnimation = Tween<Offset>(
//       begin: const Offset(0, 0.05),
//       end: const Offset(0, -0.05),
//     ).animate(
//       CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
//     );
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [
//               Color.fromARGB(255, 174, 166, 149),
//               Color.fromARGB(255, 189, 185, 177),
//               kPrimaryColor
//             ],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         child: Center(
//           child: SlideTransition(
//             position: _slideAnimation,
//             child: ScaleTransition(
//               scale: _scaleAnimation,
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   SizedBox(
//                     height: 120,
//                     child: SvgPicture.asset(
//                       'assets/icons/chat_bot.svg',
//                       fit: BoxFit.contain,
//                     ),
//                   ),
//                   Text(
//                     'Coming Soon',
//                     style: TextStyle(
//                       fontSize: 40,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                       shadows: [
//                         Shadow(
//                           blurRadius: 20,
//                           color: Colors.black.withOpacity(0.3),
//                           offset: const Offset(2, 2),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/chatpotWidgets/app_bar_of_chat_bot.dart';
import 'package:y_balash/core/constants/constants.dart';

class ChatPotViewBody extends StatefulWidget {
  const ChatPotViewBody({super.key});

  @override
  State<ChatPotViewBody> createState() => _ChatPotViewBodyState();
}

class _ChatPotViewBodyState extends State<ChatPotViewBody> {
  // List فيها الرسائل (سؤال - رد)
  final List<Map<String, String>> _messages = [];

  // Controller علشان ناخد النص اللي المستخدم كتبه
  final TextEditingController _controller = TextEditingController();

  // دالة لبناء كل رسالة (user أو bot)
  Widget _buildMessage(String role, String text) {
    final isUser = role == 'user';

    return Container(
      margin: EdgeInsets.symmetric(vertical: 6.h, horizontal: 12.w),
      child: Row(
        mainAxisAlignment:
            isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // صورة البوت
          if (!isUser)
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 24.h,
              child: SvgPicture.asset(
                'assets/icons/chat_bot.svg',
              ),
            ),
          if (!isUser) SizedBox(width: 8.w),

          // الرسالة نفسها
          Flexible(
            child: Container(
              padding: EdgeInsets.all(12.h),
              decoration: BoxDecoration(
                color: isUser ? Colors.grey[200] : const Color(0xFF003C1C),
                borderRadius: BorderRadius.circular(12.h),
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

          if (isUser) SizedBox(width: 8.w),

          // صورة المستخدم
          if (isUser)
            CircleAvatar(
              backgroundImage: const AssetImage('assets/images/user.png'),
              radius: 20.h,
            ),
        ],
      ),
    );
  }

  // أزرار ثابتة تحت الشات
  Widget _buildBottomButtons() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _ChatBottomButton(text: "❓ What is WappGPT?"),
          _ChatBottomButton(text: "💰 Pricing"),
          _ChatBottomButton(text: "📄 FAQs"),
        ],
      ),
    );
  }

  // إرسال الرسالة (هنا المفروض هنبعت API و نستقبل الرد)
  void _sendMessage() async {
    final text = _controller.text.trim();

    if (text.isEmpty) return;

    setState(() {
      _messages.add({'role': 'user', 'text': text});
      _controller.clear();
    });

    // هنا المفروض تبعت الرسالة للـ API وتنتظر الرد
    await Future.delayed(const Duration(seconds: 1)); // مؤقت بدل الـ API

    // الرد المفترض يرجع من الـ API
    const botReply =
        'هذا رد تجريبي. هنا هيظهر الرد الحقيقي اللي هييجي من الـ API.';

    setState(() {
      _messages.add({'role': 'bot', 'text': botReply});
    });
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
            padding: EdgeInsets.all(8.h),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: "Type your message here...",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: _sendMessage,
                  icon: const Icon(Icons.send, color: Color(0xFF003C1C)),
                ),
              ],
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

  const _ChatBottomButton({required this.text});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(text, style: const TextStyle(fontSize: 12)),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
