import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: '일정 관리',
      home: SchedulePage(),
    );
  }
}

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  List<Meeting> meetings = [
    Meeting('디자인 회의', const TimeOfDay(hour: 11, minute: 30),
        const TimeOfDay(hour: 12, minute: 20), ['알렉스', '헬레나', '나나']),
    Meeting('일일 프로젝트', const TimeOfDay(hour: 12, minute: 35),
        const TimeOfDay(hour: 14, minute: 10), ['나', '리차드', '시리']),
    Meeting('주간 계획', const TimeOfDay(hour: 15, minute: 0),
        const TimeOfDay(hour: 16, minute: 30), ['덴', '나나', '마크']),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('일정 관리'),
      ),
      body: Column(
        children: [
          const DateBar(),
          Expanded(
            child: ListView.builder(
              itemCount: meetings.length,
              itemBuilder: (context, index) {
                return MeetingTile(meetings[index]);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 새 일정 추가 로직
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class DateBar extends StatelessWidget {
  const DateBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.black,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            '16',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'TODAY',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              Text(
                '17',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Text(
            '18',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          Text(
            '19',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          Text(
            '20',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}

class MeetingTile extends StatelessWidget {
  final Meeting meeting;

  const MeetingTile(this.meeting, {super.key});

  @override
  Widget build(BuildContext context) {
    String startTime = meeting.startTime.format(context);
    String endTime = meeting.endTime.format(context);
    String attendees = meeting.attendees.join(', ');

    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: meeting.color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              meeting.title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text('$startTime - $endTime'),
            const SizedBox(height: 8),
            Text('참석자: $attendees'),
          ],
        ),
      ),
    );
  }
}

class Meeting {
  final String title;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final List<String> attendees;
  final Color color;

  Meeting(this.title, this.startTime, this.endTime, this.attendees)
      : color = Colors.primaries[
            DateTime.now().millisecondsSinceEpoch % Colors.primaries.length];
}
