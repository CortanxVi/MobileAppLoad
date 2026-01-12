import 'package:flutter/material.dart';

class Myprofile extends StatefulWidget {
  const Myprofile({super.key});

  @override
  State<Myprofile> createState() => _ProfileState();
}

List images = [
  "https://scontent.fbkk35-1.fna.fbcdn.net/v/t39.30808-6/473620314_1290972855455382_935323258247950810_n.jpg?_nc_cat=100&cb2=99be929b-bd9a46d7&ccb=1-7&_nc_sid=f727a1&_nc_ohc=ovzV2J7lT5IQ7kNvwFVKNoU&_nc_oc=Adm-W4-QGabuSCR7W7LwPfTTxQIbZbay1YGmiqGddpFGnbQfPK0XaI-te_s5orYd1SdNK6WQUlEYOEfGHVcLmEYM&_nc_zt=23&_nc_ht=scontent.fbkk35-1.fna&_nc_gid=XkM2Zcgm-I8v18gvQytJsg&oh=00_AfrokUYCRQI6CnBDiRs6oT6WNodd9CWE2SGTAlw9jZAZQQ&oe=69604669",
  "https://scontent.fbkk35-1.fna.fbcdn.net/v/t39.30808-6/561320624_1489836338902365_2130542992296178428_n.jpg?stp=cp6_dst-jpg_tt6&_nc_cat=108&cb2=99be929b-bd9a46d7&ccb=1-7&_nc_sid=833d8c&_nc_ohc=JTEsSmmWbZoQ7kNvwFHk3RK&_nc_oc=AdkWHDJqEc-JWHIsKSxcDFZxWIY-4cCQnSgZuiiLbuzxKQtVS2zVOBu9cEVdGzYxRtk6806pStG6qx4yrTk6QTi0&_nc_zt=23&_nc_ht=scontent.fbkk35-1.fna&_nc_gid=T8FZ3WpvDFBOoKxz5I-zkg&oh=00_AfpAFgQUO_9JOcI4sxWtmo4x09ccyRcL19cK3p47pc8TpA&oe=69606783",
  "https://scontent.fbkk35-1.fna.fbcdn.net/v/t39.30808-6/594077766_1533573967861935_5570257735486701548_n.jpg?stp=cp6_dst-jpg_tt6&_nc_cat=103&cb2=99be929b-bd9a46d7&ccb=1-7&_nc_sid=833d8c&_nc_ohc=Xyx_iLEn7d4Q7kNvwGfhaO9&_nc_oc=AdnSGt2mxH9y-BrdoneJQuIycJ--yvk_PP1vCE-4e4GI6tqY73k0zNMxd774b2pR3okvSBq0bXN-7A1d8SAYX3Yz&_nc_zt=23&_nc_ht=scontent.fbkk35-1.fna&_nc_gid=QTHUuM9CIqLcObXjR50CBA&oh=00_AfoE8M03lrd34KdcedfLJ24Yx9zPjs438vleQcQcldx7BQ&oe=69604A3A",
  "https://scontent.fbkk35-1.fna.fbcdn.net/v/t39.30808-6/480803192_1315870212965646_3796040870942110066_n.jpg?stp=cp6_dst-jpg_tt6&_nc_cat=110&cb2=99be929b-bd9a46d7&ccb=1-7&_nc_sid=833d8c&_nc_ohc=FEmcw3pkdGIQ7kNvwGc5nTS&_nc_oc=AdnreGHuvExhsgGSUEG16OWNhLupeDbo40t2EphvtVubev_xNsPUeTQXj2XAfWYv_KiQybYgunm7a4EGW4NR_eai&_nc_zt=23&_nc_ht=scontent.fbkk35-1.fna&_nc_gid=Muh79xfbufo2n_lpKgU8ig&oh=00_AfrV93Hg3jGeN_avmGg7Rjclo8dyyuh-zIgdz3InmF7URA&oe=696056B8",
  "https://scontent.fbkk35-1.fna.fbcdn.net/v/t39.30808-6/475770384_1302455037640497_4715937107207557619_n.jpg?_nc_cat=103&cb2=99be929b-bd9a46d7&ccb=1-7&_nc_sid=833d8c&_nc_ohc=aWJ_Dyp7wacQ7kNvwHzx1pQ&_nc_oc=AdkK2BGxUNlTFCsqaN223CeL_YukSLgl_XSFMep0M4yq04RHX3Dlo5E9O4KYijNTx85nNvu3JDbOvWaKJmH4OhGU&_nc_zt=23&_nc_ht=scontent.fbkk35-1.fna&_nc_gid=4C2KF8LJ9lMlCNf0y46hYg&oh=00_Afp48dWC4BP_9MHdVB4lv-Ol8cUKNkLgrFoby-9ZIV0xFw&oe=69606584",
  "https://scontent.fbkk35-1.fna.fbcdn.net/v/t39.30808-6/470811929_1273074857245182_4063481456134510754_n.jpg?_nc_cat=100&cb2=99be929b-bd9a46d7&ccb=1-7&_nc_sid=833d8c&_nc_ohc=E0iz3XiXDxAQ7kNvwHc6uhc&_nc_oc=AdmMsunjQ-noMlWtcnn7GUBVcF-M3dJUuNmpCqDjQpUihCXtxq1GTTxJ7O5zg4upRRz_Pbw6IwXKp377pDNQ9ORA&_nc_zt=23&_nc_ht=scontent.fbkk35-1.fna&_nc_gid=oQ4ZeUsQ7q0EqZSD3ZJuyA&oh=00_Afr4OU9qsxiEv0HGt81pHFolTr8u91XvOAQeR6e_ViH2vw&oe=69605091",
];

class _ProfileState extends State<Myprofile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 30),
          Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(radius: 60, backgroundColor: Colors.grey[350]),
              CircleAvatar(
                radius: 55,
                backgroundImage: NetworkImage(
                  // 'https://hips.hearstapps.com/hmg-prod/images/dog-puppy-on-garden-royalty-free-image-1586966191.jpg?crop=0.752xw:1.00xh;0.175xw,0&resize=1200:*',
                  "https://scontent.fbkk35-1.fna.fbcdn.net/v/t39.30808-6/592111231_1529417311610934_7370043902831445554_n.jpg?_nc_cat=110&cb2=99be929b-bd9a46d7&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=2gfqN8MlmzUQ7kNvwGOLXZ0&_nc_oc=AdlYu6IA55gSzR8YI8jZ9ab-ajjiGI5pTZfRA0KuZgfFk-tpY8GTpM5-tVw2iTqiK70kwS6BpwQ8qBC2At6jcuTw&_nc_zt=23&_nc_ht=scontent.fbkk35-1.fna&_nc_gid=X1Sj0rxKdAG5e9gWtbwwvA&oh=00_AfpRG7WOyyeVP6uXxiSbwQ7z5HECXuDzNHy0EBbJsoHAhQ&oe=6960640C",
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
                  child: Image.network(images[index], fit: BoxFit.cover),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
