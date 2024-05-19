import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: screenSize.width * 0.3,
                    height: screenSize.height * 0.1,
                    child: CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: Icon(
                        color: Colors.grey.shade100,
                        Icons.person,
                        size: 50,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: screenSize.width * 0.01,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Yell Htet Kyaw',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(
                        'level 1',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: screenSize.width * 0.1,
                  ),
                  IconButton(onPressed: () {}, icon: Icon(Icons.settings))
                ],
              ),
              SizedBox(
                height: screenSize.height * 0.01,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                ),
              ),
              SizedBox(
                height: screenSize.height * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Your Fav Items',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                  InkWell(
                    onTap: () {},
                    child: const Text(
                      'show all',
                      style: TextStyle(color: Colors.blue),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
