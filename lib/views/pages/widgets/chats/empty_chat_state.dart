import 'package:flutter/material.dart';

class EmptyChatState extends StatelessWidget {
  final String userName;
  final VoidCallback onCreateChat;

  const EmptyChatState({
    required this.userName,
    required this.onCreateChat,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Bienvenid@',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.w900,
                color: Color(0xFF0077B6),
                fontFamily: 'Courier',
                shadows: [
                  Shadow(
                    color: Colors.black26,
                    offset: Offset(2, 2),
                    blurRadius: 3,
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            
            Text(
              userName.split(' ').skip(2).join(' '),
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w700,
                color: Color(0xFF0077B6),
                fontFamily: 'Courier',
              ),
            ),
            SizedBox(height: 30),
            
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              decoration: BoxDecoration(
                color: Color(0xFFFFF0F0),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Color(0xFF0077B6).withOpacity(0.3),
                  width: 2,
                ),
              ),
              child: Column(
                children: [
                  Text(
                    'Cuenta Conmigo',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2C3E50),
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Siempre',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF2C3E50),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            
            Icon(
              Icons.favorite,
              color: Colors.red,
              size: 80,
            ),
            SizedBox(height: 40),
            
            _StartChatButton(onPressed: onCreateChat),
          ],
        ),
      ),
    );
  }
}

class _StartChatButton extends StatelessWidget {
  final VoidCallback onPressed;

  const _StartChatButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF0077B6), Color(0xFF00B4D8)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 119, 182, 0.5),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        child: Text(
          'Inicia tu Conversación',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 1,
          ),
        ),
      ),
    );
  }
}