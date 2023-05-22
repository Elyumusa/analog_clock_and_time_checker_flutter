import 'package:analog_clock_flutter/screens/time_page.dart';
import 'package:analog_clock_flutter/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SearchZone extends StatelessWidget {
  const SearchZone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.grey,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Text(
              "Explore Zones",
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(fontSize: 25),
            ),
            SizedBox(
              height: 25,
            ),
            Autocomplete<String>(
              onSelected: (option) {},
              fieldViewBuilder: (context, textEditingController, focusNode,
                  onFieldSubmitted) {
                return TextFormField(
                    validator: (value) {},
                    focusNode: focusNode,
                    controller: textEditingController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Theme.of(context).primaryIconTheme.color));
              },
              optionsBuilder: (textEditingValue) async {
                final query = textEditingValue.text;
                List zones = await APIservice().getAllAvailableTimeZones();
                if (query.isNotEmpty) {
                  final zonesFound =
                      zones.map((e) => e.toString()).where((element) {
                    return element.contains(query);
                  });

                  if (zonesFound.isNotEmpty) {
                    return zonesFound;
                  } else {
                    return Iterable.empty();
                  }
                } else {
                  print("Query Empty");
                  return Iterable.empty();
                }
              },
              optionsViewBuilder: (context, onSelected, options) {
                if (options.isNotEmpty) {
                  return Material(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 8.0, left: 8, right: 18),
                      child: SafeArea(
                          child: ListView(
                        children: [
                          ...List.generate(options.length, (index) {
                            return InkResponse(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return TimePage(
                                        timeZone: options.toList()[index]);
                                  },
                                ));
                              },
                              child: Container(
                                padding: EdgeInsets.only(top: 12, left: 10),
                                child: Text(
                                  options.toList()[index],
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ),
                            );
                          })
                        ],
                      )),
                    ),
                  );
                } else {
                  print("But then nothing");
                  return Column();
                }
              },
            )
          ],
        )),
      ),
    );
  }
}
