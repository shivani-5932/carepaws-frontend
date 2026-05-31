import 'package:care_paws/modules/doctor/doctor_wallet/widget/bank_card.dart';
import 'package:care_paws/modules/doctor/doctor_wallet/widget/chart_widget.dart';
import 'package:care_paws/modules/doctor/doctor_wallet/widget/earning_card.dart';
import 'package:care_paws/modules/doctor/doctor_wallet/widget/empty_wallet.dart';
import 'package:care_paws/modules/doctor/doctor_wallet/widget/income_tile.dart';
import 'package:care_paws/modules/doctor/doctor_wallet/widget/pending_card.dart';
import 'package:care_paws/modules/doctor/doctor_wallet/widget/stats_row.dart';
import 'package:care_paws/modules/doctor/doctor_wallet/widget/wallet_header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/wallet_controller.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => WalletController(),
      child: const _View(),
    );
  }
}

class _View extends StatelessWidget {
  const _View();

  @override
  Widget build(BuildContext context) {

    final controller = context.watch<WalletController>();

    return Scaffold(
      backgroundColor: const Color(0xFFFDFCFA),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),

          child: controller.isEmpty
              ? const EmptyWallet()
              : SingleChildScrollView( // 🔥 ADDED
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                /// HEADER
                Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context), // ✅ fix
                      icon: const Icon(Icons.arrow_back),
                    ),
                    const SizedBox(width: 6),
                    const Text(
                      "Doctor Wallet",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                const WalletHeader(),

                const SizedBox(height: 20),

                /// TABS
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      controller.tabs.length,
                          (i) => GestureDetector(
                        onTap: () => controller.changeTab(i),
                        child: Container(
                          margin: const EdgeInsets.only(right: 8),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 6),
                          decoration: BoxDecoration(
                            color: controller.selectedTab == i
                                ? const Color(0xff7B5B44)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          child: Text(
                            controller.tabs[i],
                            style: TextStyle(
                              color: controller.selectedTab == i
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                EarningsCard(total: controller.wallet.total),

                const SizedBox(height: 10),

                StatsRow(data: controller.wallet),

                const SizedBox(height: 15),

                ChartWidget(data: controller.chartData),

                const SizedBox(height: 15),

                const PendingCard(),

                const SizedBox(height: 15),

                const IncomeTile(title: "Video Call", amount: "Rs 7000"),
                const IncomeTile(title: "Call", amount: "Rs 3000"),
                const IncomeTile(title: "Message", amount: "Rs 2600"),

                const SizedBox(height: 15),

                const BankCard(),

                const SizedBox(height: 30),

                /// 🔥 BUTTON (NOW SCROLLABLE)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  decoration: BoxDecoration(
                    color: const Color(0xff7B5B44),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: Text(
                      "Withdraw Now →",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),

                const SizedBox(height: 20), // bottom space
              ],
            ),
          ),
        ),
      ),
    );
  }
}