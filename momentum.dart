import 'package:flutter/material.dart';

class Momentum extends StatefulWidget {
  const Momentum({super.key});
  @override
  State<Momentum> createState() => _MomentumState();
}

class _MomentumState extends State<Momentum> {
  dynamic __nav = "Home";
  dynamic day = 12;
  dynamic streak = 4;
  dynamic habits = [{"name": "Drink 2L of water", "done": true}, {"name": "Morning run · 20 min", "done": false}, {"name": "Read 20 pages", "done": true}, {"name": "Meditate · 10 min", "done": false}, {"name": "Sleep before 11pm", "done": true}];
  dynamic week = [{"d": "Mon", "p": 60}, {"d": "Tue", "p": 80}, {"d": "Wed", "p": 40}, {"d": "Thu", "p": 100}, {"d": "Fri", "p": 60}, {"d": "Sat", "p": 20}, {"d": "Sun", "p": 80}];
  dynamic doneCount() {
    dynamic n = 0;
    for (final h in habits) {
      if (h["done"]) {
        n += 1;
      }
    }
    return n;
  }
  dynamic percent() {
    return (doneCount() / (habits).length);
  }
  dynamic doneColor(var d) {
    if (d) {
      return "#35B88E";
    } else {
      return "#E5E5EA";
    }
  }
  dynamic checkIcon(var d) {
    if (d) {
      return "✓";
    } else {
      return "○";
    }
  }
  dynamic habitToggle(var h) {
    return ElevatedButton(
    onPressed: () {
      setState(() {
      if (h["done"]) {
        h["done"] = false;
      } else {
        h["done"] = true;
      }
      });
    },
    child: Text(h["name"]),
    style: ElevatedButton.styleFrom(backgroundColor: kiteColor(doneColor(h["done"]))),
  );
  }
  @override
  Widget build(BuildContext context) {
    Widget body;
    if (__nav == "Home") {
      body = Column(
            children: [
              SizedBox(height: 24),
              Text("Momentum",
                  style: TextStyle(fontSize: 40, color: Color(0x5E5CE6))),
              SizedBox(height: 6),
              Text("Day ${day} · ${streak}-day streak",
                  style: TextStyle(fontSize: 16, color: Color(0x6E6E73))),
              SizedBox(height: 20),
              LinearProgressIndicator(
                  value: (percent()).clamp(0.0, 1.0).toDouble(),
                ),
              SizedBox(height: 8),
              Text("${doneCount()} of ${(habits).length} done today",
                  style: TextStyle(fontSize: 14, color: Color(0x24292F))),
              SizedBox(height: 20),
              for (final h in habits) ...[
                  habitToggle(h),
                  SizedBox(height: 10),
                ],
              SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                    __nav = "Stats";
                    });
                  },
                  child: Text("Statistics"),
                  style: ElevatedButton.styleFrom(backgroundColor: Color(0x24292F)),
                ),
              SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                    __nav = "Streak";
                    });
                  },
                  child: Text("Week view"),
                  style: ElevatedButton.styleFrom(backgroundColor: Color(0x24292F)),
                ),
            ],
          );
    }
    else if (__nav == "Stats") {
      body = Column(
            children: [
              SizedBox(height: 24),
              Text("Statistics",
                  style: TextStyle(fontSize: 32, color: Color(0x1F2328))),
              SizedBox(height: 20),
              Text("${doneCount()} / ${(habits).length} habits complete",
                  style: TextStyle(fontSize: 18, color: Color(0x1F2328))),
              SizedBox(height: 10),
              LinearProgressIndicator(
                  value: (percent()).clamp(0.0, 1.0).toDouble(),
                ),
              SizedBox(height: 20),
              for (final h in habits) ...[
                  Row(
                    children: [
                      Text(checkIcon(h["done"]),
                          style: TextStyle(fontSize: 20, color: kiteColor(doneColor(h["done"])))),
                      SizedBox(height: 10),
                      Text(h["name"],
                          style: TextStyle(fontSize: 16, color: Color(0x1F2328))),
                    ],
                  ),
                  SizedBox(height: 14),
                ],
              SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                    __nav = "Home";
                    });
                  },
                  child: Text("Back home"),
                  style: ElevatedButton.styleFrom(backgroundColor: Color(0x5E5CE6)),
                ),
            ],
          );
    }
    else if (__nav == "Streak") {
      body = Column(
            children: [
              SizedBox(height: 24),
              Text("This week",
                  style: TextStyle(fontSize: 32, color: Color(0x1F2328))),
              SizedBox(height: 6),
              Text("${streak}-day streak going",
                  style: TextStyle(fontSize: 16, color: Color(0x6E6E73))),
              SizedBox(height: 20),
              for (final d in week) ...[
                  Text(d["d"],
                    style: TextStyle(fontSize: 14, color: Color(0x6E6E73))),
                  SizedBox(height: 4),
                  LinearProgressIndicator(
                    value: ((d["p"] / 100)).clamp(0.0, 1.0).toDouble(),
                  ),
                  SizedBox(height: 12),
                ],
              SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                    __nav = "Home";
                    });
                  },
                  child: Text("Back home"),
                  style: ElevatedButton.styleFrom(backgroundColor: Color(0x5E5CE6)),
                ),
            ],
          );
    }
    else {
      body = Column(
            children: [
              SizedBox(height: 24),
              Text("This week",
                  style: TextStyle(fontSize: 32, color: Color(0x1F2328))),
              SizedBox(height: 6),
              Text("${streak}-day streak going",
                  style: TextStyle(fontSize: 16, color: Color(0x6E6E73))),
              SizedBox(height: 20),
              for (final d in week) ...[
                  Text(d["d"],
                    style: TextStyle(fontSize: 14, color: Color(0x6E6E73))),
                  SizedBox(height: 4),
                  LinearProgressIndicator(
                    value: ((d["p"] / 100)).clamp(0.0, 1.0).toDouble(),
                  ),
                  SizedBox(height: 12),
                ],
              SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                    __nav = "Home";
                    });
                  },
                  child: Text("Back home"),
                  style: ElevatedButton.styleFrom(backgroundColor: Color(0x5E5CE6)),
                ),
            ],
          );
    }
    return Scaffold(
      body: SafeArea(
        child: body,
      ),
    );
  }
}

void main() => runApp(const KiteApp());

class KiteApp extends StatelessWidget {
  const KiteApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Momentum(),
    );
  }
}

Color kiteColor(String hex) {
  var h = hex.replaceAll('#', '');
  if (h.length == 6) h = 'FF' + h;
  return Color(int.parse('0x$h'));
}

