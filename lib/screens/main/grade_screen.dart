import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'package:clone_everytime/const.dart';
import 'package:clone_everytime/models/grade_data.dart';
import 'package:clone_everytime/screens/main/widgets/time_table_widget.dart';
import 'package:clone_everytime/widgets/everytime_card.dart';

List<GradeData> gradeData = [
  GradeData(x: "1학년\n1학기", y: 4.24, majorY: 4.5),
  GradeData(x: "1학년\n2학기", y: 4.32, majorY: 4.5),
  GradeData(x: "2학년\n1학기", y: 4.5, majorY: 4.5),
  GradeData(x: "2학년\n2학기", y: 4.5, majorY: 4.5),
  GradeData(x: "3학년\n1학기", y: 4.42, majorY: 4.42),
  GradeData(x: "3학년\n2학기", y: 4.32, majorY: 4.3),
];

class GradeScreen extends StatelessWidget {
  GradeScreen({super.key});

  late TooltipBehavior _tooltipBehavior;

  Widget buildGpaGraph(BuildContext context) {
    _tooltipBehavior = TooltipBehavior(enable: true, format: 'point.y점');

    return OutlinedCard(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildGPAColumn(title: "전체 평점", gpa: 4.38, maxGPA: 4.5),
                buildGPAColumn(title: "전공 평점", gpa: 4.43, maxGPA: 4.5),
                buildGPAColumn(title: "취득 학점", gpa: 112.25, maxGPA: 130, isTotal: true),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: SfCartesianChart(
              plotAreaBorderWidth: 0,
              legend: Legend(
                isVisible: true,
                alignment: ChartAlignment.far,
                position: LegendPosition.top,
                iconHeight: 8,
                iconWidth: 8,
              ),
              primaryXAxis: CategoryAxis(
                axisLine: const AxisLine(width: 0),
                majorGridLines: const MajorGridLines(width: 0),
                majorTickLines: const MajorTickLines(size: 20.0, color: Colors.transparent),
              ),
              primaryYAxis: NumericAxis(
                maximum: 4.5,
                minimum: 1.0,
                visibleMinimum: 2.0,
                interval: 1.0,
                axisLine: const AxisLine(width: 0),
                majorTickLines: const MajorTickLines(size: 10.0, color: Colors.transparent),
                labelFormat: r'{value}.0',
              ),
              series: [
                LineSeries<GradeData, String>(
                    dataSource: gradeData,
                    xValueMapper: (GradeData gradeData, _) => gradeData.x,
                    yValueMapper: (GradeData gradeData, _) => gradeData.majorY,
                    name: "전공",
                    color: Colors.grey,
                    width: 4.0,
                    markerSettings: const MarkerSettings(isVisible: true),
                    enableTooltip: true,
                    legendIconType: LegendIconType.circle,
                    animationDuration: 0.0),
                LineSeries<GradeData, String>(
                    dataSource: gradeData,
                    xValueMapper: (GradeData gradeData, _) => gradeData.x,
                    yValueMapper: (GradeData gradeData, _) => gradeData.y,
                    name: "전체",
                    color: EveryTimeColor.red,
                    width: 2.0,
                    markerSettings: const MarkerSettings(isVisible: true),
                    enableTooltip: true,
                    legendIconType: LegendIconType.circle,
                    animationDuration: 0.0),
              ],
              tooltipBehavior: _tooltipBehavior,
            ),
          ),
          const SizedBox(height: 12.0),
          buildGpaLine(context: context, grade: "A+", percent: 70, color: const Color(0xFFE87C73)),
          buildGpaLine(context: context, grade: "P", percent: 17, color: const Color(0xFFE8C95f)),
          buildGpaLine(context: context, grade: "B+", percent: 7, color: const Color(0xFFA2D164)),
          buildGpaLine(context: context, grade: "A0", percent: 4, color: const Color(0xFF86DCC1)),
          buildGpaLine(context: context, grade: "D0", percent: 2, color: const Color(0xFF7D9EDB)),
          const SizedBox(height: 8.0),
        ],
      ),
    );
  }

  Widget buildGpaLine({required BuildContext context, required String grade, required int percent, required Color color}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: MediaQuery.of(context).size.width * 0.1, child: Text(grade)),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8 * percent / 100,
            child: Divider(
              color: color,
              thickness: 5.0,
            ),
          ),
          const SizedBox(width: 10.0),
          Text("${percent.toString()}%", style: TextStyle(color: color))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.close))],
        title: const Text("학점계산기"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            buildGpaGraph(context),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
