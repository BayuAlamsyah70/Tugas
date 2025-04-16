import 'package:flutter/material.dart';
import 'gallery_pages.dart';
import 'package:provider/provider.dart';
import '../theme/theme_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final List<String> fyiImages = [
      "https://awsimages.detik.net.id/customthumb/2010/04/20/10/michaeljack_200.jpg?w=600&q=90",
      "https://img-highend.okezone.com/okz/900/pictureArticle/images_29If8tP1_40p7Oc.jpg",
      "https://pophariini.com/wp-content/uploads/2022/04/Juicy-Luicy-Photo-2.jpg",
    ];

    final List<String> fyiTitles = [
      "Lagu Michael Jackson Booming lagi!",
      "Lisa tampil di coachella dengan sangat keren!",
      "Lagu baru Juicy Luicy!",
    ];

    final List<String> fyiDates = [
      "14-04-2024",
      "12-04-2025",
      "16-04-2025",
    ];

    final List<String> galleryImages = [
      "https://awsimages.detik.net.id/community/media/visual/2022/11/11/juicy-luicy_43.jpeg?w=1200",
      "https://asset.kompas.com/crops/nHGiALP_OofX7564gf8tjJcLGSc=/0x130:719x609/1200x800/data/photo/2020/01/13/5e1c9992f1d2a.jpg",
      "https://img.okezone.com/content/2018/05/03/205/1894154/gun-n-roses-pastikan-konser-reuni-ultah-ke-31-dihadiri-semua-personel-CgoREQdF3Z.jpg",
      "https://asset.kompas.com/crops/ir_3oZTLhN_APv4auIFPizbRauc=/137x16:737x416/1200x800/data/photo/2022/06/12/62a53848ccce6.jpg",
    ];

    final List<String> albumImages = [
      "https://cdns.klimg.com/kapanlagi.com/p/lovestorytaylorswirft.jpg",
      "https://i.scdn.co/image/ab67616d0000b27349055dce3554e72e82082980",
      "https://i.scdn.co/image/ab67616d0000b273fadca79809c06f6afe7de0d9",
    ];

    final List<String> albumTitles = [
      "Love Story",
      "When I Was Your Man",
      "Lampu Kuning",
    ];

    final List<String> albumDescriptions = [
      "Lagu yang ditulis dan direkam oleh penyanyi-penulis lagu Amerika Taylor Swift. Lagu ini diproduksi oleh Nathan Chapman bersama Swift.",
      "Lagu When I Was Your Man oleh Bruno Mars berlatar belakang penyesalan seseorang terhadap mantan kekasihnya.",
      "Lagu Lampu Kuning dari Juicy Luicy berlatar belakang tentang perasaan cinta yang penuh risiko, terutama ketika hanya dirasakan oleh satu pihak.",
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Bayu Alamsyah"),
        actions: [
          Switch(
            value: Theme.of(context).brightness == Brightness.dark,
            onChanged: (val) {
              final provider = context.read<ThemeProvider>();
              provider.toggleTheme(val);
            },
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              "assets/images/bayu.jpg",
              height: 220,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 16),

          // FYI Section
          Text("FYI", style: theme.textTheme.titleLarge),
          const SizedBox(height: 8),
          SizedBox(
            height: 160,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: fyiImages.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 160,
                  margin: const EdgeInsets.only(right: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: theme.cardColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 6,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                        child: Image.network(
                          fyiImages[index],
                          height: 80,
                          width: 160,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        height: 60,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                fyiTitles[index],
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                fyiDates[index],
                                style: const TextStyle(fontSize: 11),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 24),

          // Gallery Section
          Text("Galeri", style: theme.textTheme.titleLarge),
          const SizedBox(height: 8),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: List.generate(galleryImages.length, (index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => GalleryPage(imageUrl: galleryImages[index]),
                    ),
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    galleryImages[index],
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }),
          ),

          const SizedBox(height: 24),

          // Disc / Album Section
          Text("Disc", style: theme.textTheme.titleLarge),
          const SizedBox(height: 8),
          Column(
            children: List.generate(albumImages.length, (index) {
              return ListTile(
                contentPadding: EdgeInsets.zero,
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    albumImages[index],
                    height: 50,
                    width: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(albumTitles[index], style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(albumDescriptions[index]),
              );
            }),
          ),

          const SizedBox(height: 24),

          // Bio Section
          Text("Bio", style: theme.textTheme.titleLarge),
          const SizedBox(height: 8),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const CircleAvatar(
              backgroundImage: AssetImage("assets/images/bayu.jpg"),
            ),
            title: const Text("Bayu Alamsyah"),
            subtitle: const Text("Listening Fav Songs"),
          )
        ],
      ),
    );
  }
}
