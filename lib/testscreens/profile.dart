import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile EiEi"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 30),
          Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(radius: 60, backgroundColor: Colors.grey[350]),
              CircleAvatar(
                radius: 55,
                backgroundImage: NetworkImage(
                  'https://hips.hearstapps.com/hmg-prod/images/dog-puppy-on-garden-royalty-free-image-1586966191.jpg?crop=0.752xw:1.00xh;0.175xw,0&resize=1200:*',
                ),
              ),
            ],
          ),
          SizedBox(height: 10),

          // Text Management
          Column(
            children: [
              Text("Jirayu Sakchoowong", style: TextStyle(fontSize: 25)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.location_on,
                    size: 18,
                    semanticLabel: 'Location_On',
                  ),
                  Text(
                    " Wat chalo, Nonthaburi",
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
              Text(
                "เคยละเมอตกเตียงตอนนอนบนเสื่อ",
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          SizedBox(height: 15),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      "36",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("Posts", style: TextStyle(fontSize: 18)),
                  ],
                ),

                Column(
                  children: [
                    Text(
                      "3.5K",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("Following", style: TextStyle(fontSize: 18)),
                  ],
                ),

                Column(
                  children: [
                    Text(
                      "15K",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("Followers", style: TextStyle(fontSize: 18)),
                  ],
                ),
              ],
            ),
          ),

          SizedBox(height: 15),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,

              children: [Text("PHOTOS", style: TextStyle(fontSize: 20))],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(8),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: 6,
              itemBuilder: (context, index) {
                return Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  // elevation: 0, // ปิดเงาเพื่อให้ดูเหมือน Grid รูปภาพ ใส่ทำไม
                  child: Image.network(
                    'https://picsum.photos/200?random=$index',
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
