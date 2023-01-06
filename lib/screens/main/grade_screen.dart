import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'package:clone_everytime/const.dart';
import 'package:clone_everytime/models/grade_graph_data.dart';
import 'package:clone_everytime/providers/grade_provider.dart';
import 'package:clone_everytime/screens/main/widgets/gpa_table.dart';
import 'package:clone_everytime/screens/main/widgets/time_table_widget.dart';
import 'package:clone_everytime/widgets/everytime_card.dart';

List<Color> graphColor = const [
  Color(0xFFE87C73),
  Color(0xFFE8C95f),
  Color(0xFFA2D164),
  Color(0xFF86DCC1),
  Color(0xFF7D9EDB),
];

class GradeScreen extends StatelessWidget {
  GradeScreen({super.key});

  late GradeProvider _gradeProvider;
  late TooltipBehavior _tooltipBehavior;

  Widget buildGpaGraph(BuildContext context) {
    _tooltipBehavior = TooltipBehavior(enable: true, format: 'point.y점');

    return Consumer<GradeProvider>(builder: (context, provider, child) {
      return OutlinedCard(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildGPAColumn(title: "전체 평점", gpa: _gradeProvider.totalGpa, maxGPA: 4.5),
                  buildGPAColumn(title: "전공 평점", gpa: _gradeProvider.totalMajorGpa, maxGPA: 4.5),
                  buildGPAColumn(title: "취득 학점", gpa: _gradeProvider.totalCredit, maxGPA: 130, isTotal: true),
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
                  LineSeries<GradeGraphData, String>(
                      dataSource: _gradeProvider.gpaList,
                      xValueMapper: (GradeGraphData gradeData, _) => gradeData.x,
                      yValueMapper: (GradeGraphData gradeData, _) => gradeData.majorY,
                      name: "전공",
                      color: Colors.grey,
                      width: 4.0,
                      markerSettings: const MarkerSettings(isVisible: true),
                      enableTooltip: true,
                      legendIconType: LegendIconType.circle,
                      animationDuration: 0.0),
                  LineSeries<GradeGraphData, String>(
                      dataSource: _gradeProvider.gpaList,
                      xValueMapper: (GradeGraphData gradeData, _) => gradeData.x,
                      yValueMapper: (GradeGraphData gradeData, _) => gradeData.y,
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
            for (int i = 0; i < _gradeProvider.gradeResult.length; i++)
              buildGpaLine(
                  context: context,
                  grade: _gradeProvider.gradeResult[i][0],
                  percent: _gradeProvider.gradeResult[i][1] / _gradeProvider.totalCnt * 100,
                  color: graphColor[i]),
            const SizedBox(height: 8.0),
          ],
        ),
      );
    });
  }

  Widget buildGpaLine({required BuildContext context, required String grade, required double percent, required Color color}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: MediaQuery.of(context).size.width * 0.1, child: Text(grade)),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.6 * percent / 100,
            child: Divider(
              color: color,
              thickness: 5.0,
            ),
          ),
          const SizedBox(width: 10.0),
          Text("${percent.round().toString()}%", style: TextStyle(color: color))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _gradeProvider = Provider.of<GradeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 90.0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("학점계산기"),
                ),
                IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.close))
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: SizedBox(
                height: 25.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _gradeProvider.tabTitleList.length,
                  itemBuilder: (BuildContext context, int i) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: GestureDetector(
                        onTap: () {
                          _gradeProvider.gradeIndex = i;
                        },
                        child: Column(
                          children: [
                            Text(
                              _gradeProvider.tabTitleList[i],
                              style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w600,
                                color: _gradeProvider.gradeIndex == i ? Colors.black : Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Container(
                              width: 8 * _gradeProvider.tabTitleList.length.toDouble(),
                              height: 2.0,
                              color: _gradeProvider.gradeIndex == i ? Colors.black : Colors.transparent,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              buildGpaGraph(context),
              const SizedBox(height: 20),
              const GpaTable(),
            ],
          ),
        ),
      ),
    );
  }
}
