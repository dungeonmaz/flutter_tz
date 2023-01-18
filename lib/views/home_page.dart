import 'package:flutter/material.dart';
import 'package:flutter_first/models/exchange.dart';
import 'package:flutter_first/services/remote_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Datum?>? data;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();

    getData();
  }

  getData() async {
    Exchange? exchange = await RemoteService().getExchanges();
    if (exchange != null) {
      setState(() {
        isLoaded = true;
        data = exchange.data;
        data?.sort((a, b) =>
            b!.values!.usd!.volume24H!.compareTo(a!.values!.usd!.volume24H!));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Exchanges')),
        body: Visibility(
          visible: isLoaded,
          replacement: const Center(
            child: CircularProgressIndicator(),
          ),
          child: ListView.builder(
            itemCount: data?.length,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.all(8),
                child: Text(
                  "${data![index]?.name} | ${data![index]?.values?.usd?.volume24H} usd",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w600),
                ),
              );
            },
          ),
        ));
  }
}
