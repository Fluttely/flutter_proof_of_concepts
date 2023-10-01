import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_nasted_navigation_poc/core/app.routes.dart';
import 'package:flutter_modular_nasted_navigation_poc/core/navigation_manager.dart';

class FindPersonDetailsView extends StatefulWidget {
  const FindPersonDetailsView({super.key});

  @override
  State<FindPersonDetailsView> createState() => _FindPersonDetailsViewState();
}

abstract class FindPersonDetailsViewViewModel
    extends State<FindPersonDetailsView> {}

class _FindPersonDetailsViewState extends FindPersonDetailsViewViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.white,
                expandedHeight: MediaQuery.of(context).size.height * 0.60,
                floating: true,
                pinned: true,
                snap: true,
                collapsedHeight: 116,
                actionsIconTheme: const IconThemeData(opacity: 0.0),
                toolbarHeight: 56,
                titleSpacing: 0,
                centerTitle: false,
                leading: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: 40,
                    width: 40,
                    margin: const EdgeInsets.only(left: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 0,
                          blurRadius: 4,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: IconButton(
                      onPressed: () {
                        NavigationManager.navigate(AppAbsolutPathsRoutes.findPerson);
                      },
                      icon: const Icon(
                        Icons.arrow_back_rounded,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                flexibleSpace: FlexibleSpaceBar(
                  titlePadding: const EdgeInsets.all(0),
                  title: Container(
                    height: 67,
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(28),
                        topRight: Radius.circular(28),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const SizedBox(width: 2),
                                const Text(
                                  'Mirian, 24',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(width: 6),
                                SizedBox(
                                  height: 12,
                                  width: 12,
                                  child: Stack(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.blue[300],
                                          borderRadius:
                                              BorderRadius.circular(100),
                                        ),
                                      ),
                                      const Center(
                                        child: Icon(
                                          Icons.check,
                                          size: 10,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 2),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Icon(
                                  Icons.location_on_outlined,
                                  color: Colors.redAccent,
                                  size: 14,
                                ),
                                Text(
                                  'New York . 25km',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.grey[400],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 34,
                          width: 34,
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.green[300],
                                  borderRadius: BorderRadius.circular(100),
                                ),
                              ),
                              Container(
                                height: 18,
                                width: 18,
                                color: Colors.white,
                              ),
                              Center(
                                child: Container(
                                  height: 28,
                                  width: 28,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                ),
                              ),
                              const Center(
                                child: Text(
                                  '9.2',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  background: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.50,
                    child: Stack(
                      children: <Widget>[
                        Positioned.fill(
                          child: Container(
                            padding: const EdgeInsets.only(bottom: 86),
                            child: Image.network(
                              'https://www.digitaletextil.com.br/blog/wp-content/uploads/2020/12/modelos-de-maio-corpo6.jpeg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: 150,
                            margin: const EdgeInsets.only(bottom: 60),
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                end: Alignment(0.0, 0.4),
                                begin: Alignment(0.0, -1),
                                colors: <Color>[
                                  Colors.transparent,
                                  Colors.black,
                                ],
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: 120,
                            padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                            margin: const EdgeInsets.only(bottom: 100),
                            width: double.infinity,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: const [
                                SizedBox(width: 8),
                                // EvenirePersonDetailsImagePreview(
                                //   imagePath:
                                //       'https://cdn.eutotal.com/imagens/maio-eu-total-0-cke.jpg',
                                // ),
                                // EvenirePersonDetailsImagePreview(
                                //   imagePath:
                                //       'https://cdn1.mundodastribos.com/704989-Moda-praia-2015-biquinis-e-maiôs-10.jpg',
                                // ),
                                // EvenirePersonDetailsImagePreview(
                                //   imagePath:
                                //       'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRlIFMpaujqAcM7I-YWk8-dUME9ayoo1NWzARnc0Bb_T6Tv0slrMQvF6kbJN_LOQhbU9S4&usqp=CAU',
                                // ),
                                // EvenirePersonDetailsImagePreview(
                                //   imagePath:
                                //       'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRlIFMpaujqAcM7I-YWk8-dUME9ayoo1NWzARnc0Bb_T6Tv0slrMQvF6kbJN_LOQhbU9S4&usqp=CAU',
                                // ),
                                // const SizedBox(width: 8),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const Divider(
                      height: 1,
                      thickness: 1,
                      indent: 32,
                      endIndent: 32,
                    ),
                    const SizedBox(height: 16),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Interests',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            '3 Similar',
                            style: TextStyle(
                              color: Colors.redAccent,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(8),
                            padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                            decoration: BoxDecoration(
                              color: Colors.redAccent.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: const Row(
                              children: [
                                Icon(
                                  Icons.shopping_cart_rounded,
                                  color: Colors.redAccent,
                                  size: 16,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  'Shopping',
                                  style: TextStyle(
                                    color: Colors.redAccent,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(8),
                            padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                            decoration: BoxDecoration(
                              color: Colors.redAccent.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: const Row(
                              children: [
                                Icon(
                                  Icons.library_music,
                                  color: Colors.redAccent,
                                  size: 16,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  'Music',
                                  style: TextStyle(
                                    color: Colors.redAccent,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(8),
                            padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                            decoration: BoxDecoration(
                              color: Colors.redAccent.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: const Row(
                              children: [
                                Icon(
                                  Icons.local_drink_sharp,
                                  color: Colors.redAccent,
                                  size: 16,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  'Coffe',
                                  style: TextStyle(
                                    color: Colors.redAccent,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(8),
                            padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: const Row(
                              children: [
                                Icon(
                                  Icons.menu_book_rounded,
                                  color: Colors.redAccent,
                                  size: 16,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  'Books',
                                  style: TextStyle(
                                    color: Colors.redAccent,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(8),
                            padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: const Row(
                              children: [
                                Icon(
                                  Icons.airplanemode_active,
                                  color: Colors.redAccent,
                                  size: 16,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  'Travel',
                                  style: TextStyle(
                                    color: Colors.redAccent,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(8),
                            padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: const Row(
                              children: [
                                Icon(
                                  Icons.sports_basketball,
                                  color: Colors.redAccent,
                                  size: 16,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  'Basketball',
                                  style: TextStyle(
                                    color: Colors.redAccent,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Testing the description of the page, testing the description of the page, testing the description of the page, testing the description of the page, testing the description of the page, testing the description of the page, testing the description of the page, testing the description of the page, testing the description of the page, testing the description of the page, testing the description of the page...',
                        style: TextStyle(
                          color: Colors.grey[600],
                        ),
                      ),
                      const SizedBox(height: 800),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 64,
                        width: 64,
                        margin: const EdgeInsets.fromLTRB(16, 16, 10, 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 0,
                              blurRadius: 4,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.close_rounded,
                            color: Colors.redAccent,
                            size: 28,
                          ),
                        ),
                      ),
                      Container(
                        height: 64,
                        width: 64,
                        margin: const EdgeInsets.fromLTRB(10, 16, 16, 16),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            end: Alignment(0.0, 0.4),
                            begin: Alignment(0.0, -1),
                            colors: <Color>[
                              Colors.redAccent,
                              Colors.redAccent,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(100),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 0,
                              blurRadius: 4,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: IconButton(
                          onPressed: () {
                            Modular.to
                                .navigate(AppAbsolutPathsRoutes.findPersonMatch);
                          },
                          icon: const Icon(
                            Icons.favorite_rounded,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
