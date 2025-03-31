import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class StatsScreen extends StatefulWidget {
  @override
  _StatsScreenState createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  String selectedPeriod = 'Week';
  List<String> periods = ['Day', 'Week', 'Month'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F9FC),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          "Your Stats",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF2E7D32),
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.share_outlined, color: Color(0xFF2E7D32)),
            onPressed: () {},
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Color(0xFF2E7D32)),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Period selection
              Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children:
                      periods.map((period) {
                        bool isSelected = period == selectedPeriod;
                        return Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedPeriod = period;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color:
                                    isSelected
                                        ? const Color(0xFF2E7D32)
                                        : Colors.transparent,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: Text(
                                  period,
                                  style: TextStyle(
                                    color:
                                        isSelected
                                            ? Colors.white
                                            : Colors.grey.shade700,
                                    fontWeight:
                                        isSelected
                                            ? FontWeight.bold
                                            : FontWeight.normal,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                ),
              ),

              const SizedBox(height: 24),

              // Screen time overview
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Screen Time Overview",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2E7D32),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Total: 28h 15m this week",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 200,
                      child: BarChart(
                        BarChartData(
                          alignment: BarChartAlignment.spaceAround,
                          maxY: 8,
                          barTouchData: BarTouchData(
                            enabled: true,
                            touchTooltipData: BarTouchTooltipData(
                              //   tooltipBgColor: Colors.grey.shade800,
                              getTooltipItem: (
                                group,
                                groupIndex,
                                rod,
                                rodIndex,
                              ) {
                                String weekDay;
                                switch (group.x.toInt()) {
                                  case 0:
                                    weekDay = 'MON';
                                    break;
                                  case 1:
                                    weekDay = 'TUE';
                                    break;
                                  case 2:
                                    weekDay = 'WED';
                                    break;
                                  case 3:
                                    weekDay = 'THU';
                                    break;
                                  case 4:
                                    weekDay = 'FRI';
                                    break;
                                  case 5:
                                    weekDay = 'SAT';
                                    break;
                                  case 6:
                                    weekDay = 'SUN';
                                    break;
                                  default:
                                    weekDay = '';
                                }
                                return BarTooltipItem(
                                  '$weekDay\n${rod.toY.toStringAsFixed(1)} hrs',
                                  const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                );
                              },
                            ),
                          ),
                          titlesData: FlTitlesData(
                            show: true,
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                getTitlesWidget: (value, meta) {
                                  const style = TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  );
                                  Widget text;
                                  switch (value.toInt()) {
                                    case 0:
                                      text = const Text('M', style: style);
                                      break;
                                    case 1:
                                      text = const Text('T', style: style);
                                      break;
                                    case 2:
                                      text = const Text('W', style: style);
                                      break;
                                    case 3:
                                      text = const Text('T', style: style);
                                      break;
                                    case 4:
                                      text = const Text('F', style: style);
                                      break;
                                    case 5:
                                      text = const Text('S', style: style);
                                      break;
                                    case 6:
                                      text = const Text('S', style: style);
                                      break;
                                    default:
                                      text = const Text('', style: style);
                                  }
                                  return text;
                                },
                              ),
                            ),
                            leftTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                getTitlesWidget: (value, meta) {
                                  if (value % 2 != 0) return const Text('');
                                  return Text(
                                    '${value.toInt()}h',
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  );
                                },
                                reservedSize: 28,
                              ),
                            ),
                            rightTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            topTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                          ),
                          borderData: FlBorderData(show: false),
                          gridData: const FlGridData(show: false),
                          barGroups: [
                            BarChartGroupData(
                              x: 0,
                              barRods: [
                                BarChartRodData(
                                  toY: 3.8,
                                  color: const Color(0xFF2E7D32),
                                  width: 22,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ],
                            ),
                            BarChartGroupData(
                              x: 1,
                              barRods: [
                                BarChartRodData(
                                  toY: 5.2,
                                  color: const Color(0xFF2E7D32),
                                  width: 22,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ],
                            ),
                            BarChartGroupData(
                              x: 2,
                              barRods: [
                                BarChartRodData(
                                  toY: 4.3,
                                  color: const Color(0xFF2E7D32),
                                  width: 22,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ],
                            ),
                            BarChartGroupData(
                              x: 3,
                              barRods: [
                                BarChartRodData(
                                  toY: 3.6,
                                  color: const Color(0xFF2E7D32),
                                  width: 22,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ],
                            ),
                            BarChartGroupData(
                              x: 4,
                              barRods: [
                                BarChartRodData(
                                  toY: 3.2,
                                  color: const Color(0xFF2E7D32),
                                  width: 22,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ],
                            ),
                            BarChartGroupData(
                              x: 5,
                              barRods: [
                                BarChartRodData(
                                  toY: 6.5,
                                  color: const Color(0xFF2E7D32),
                                  width: 22,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ],
                            ),
                            BarChartGroupData(
                              x: 6,
                              barRods: [
                                BarChartRodData(
                                  toY: 4.1,
                                  color: const Color(0xFF2E7D32),
                                  width: 22,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // App usage breakdown
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "App Usage Breakdown",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2E7D32),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: SizedBox(
                            height: 180,
                            child: PieChart(
                              PieChartData(
                                sectionsSpace: 2,
                                centerSpaceRadius: 40,
                                sections: [
                                  PieChartSectionData(
                                    value: 35,
                                    color: Colors.pink,
                                    title: '35%',
                                    radius: 50,
                                    titleStyle: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  PieChartSectionData(
                                    value: 25,
                                    color: Colors.blue,
                                    title: '25%',
                                    radius: 50,
                                    titleStyle: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  PieChartSectionData(
                                    value: 20,
                                    color: Colors.black,
                                    title: '20%',
                                    radius: 50,
                                    titleStyle: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  PieChartSectionData(
                                    value: 20,
                                    color: Colors.amber,
                                    title: '20%',
                                    radius: 50,
                                    titleStyle: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildLegendItem("Instagram", Colors.pink),
                              const SizedBox(height: 15),
                              _buildLegendItem("Twitter", Colors.blue),
                              const SizedBox(height: 15),
                              _buildLegendItem("TikTok", Colors.black),
                              const SizedBox(height: 15),
                              _buildLegendItem("Others", Colors.amber),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Daily usage patterns
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Daily Usage Patterns",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2E7D32),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "When you use your phone most",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 180,
                      child: LineChart(
                        LineChartData(
                          gridData: FlGridData(
                            show: true,
                            drawVerticalLine: false,
                            drawHorizontalLine: true,
                            horizontalInterval: 1,
                            getDrawingHorizontalLine: (value) {
                              return FlLine(
                                color: Colors.grey.shade200,
                                strokeWidth: 1,
                              );
                            },
                          ),
                          titlesData: FlTitlesData(
                            show: true,
                            rightTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            topTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                reservedSize: 30,
                                interval: 4,
                                getTitlesWidget: (value, meta) {
                                  int hour = value.toInt();
                                  String period = hour >= 12 ? 'PM' : 'AM';
                                  hour = hour % 12;
                                  if (hour == 0) hour = 12;
                                  return Text(
                                    '$hour$period',
                                    style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 12,
                                    ),
                                  );
                                },
                              ),
                            ),
                            leftTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                reservedSize: 30,
                                interval: 1,
                                getTitlesWidget: (value, meta) {
                                  return Text(
                                    value.toInt().toString(),
                                    style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 12,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          borderData: FlBorderData(show: false),
                          minX: 0,
                          maxX: 23,
                          minY: 0,
                          maxY: 3,
                          lineBarsData: [
                            LineChartBarData(
                              spots: [
                                const FlSpot(0, 0.5),
                                const FlSpot(4, 0.3),
                                const FlSpot(8, 1.2),
                                const FlSpot(12, 2.1),
                                const FlSpot(16, 1.8),
                                const FlSpot(20, 2.3),
                                const FlSpot(23, 1.2),
                              ],
                              isCurved: true,
                              color: const Color(0xFF2E7D32),
                              barWidth: 3,
                              isStrokeCapRound: true,
                              dotData: const FlDotData(show: false),
                              belowBarData: BarAreaData(
                                show: true,
                                color: const Color(0xFF2E7D32).withOpacity(0.2),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLegendItem(String label, Color color) {
    return Row(
      children: [
        Container(
          width: 14,
          height: 14,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 8),
        Text(
          label,
          style: TextStyle(fontSize: 14, color: Colors.grey.shade800),
        ),
      ],
    );
  }
}
