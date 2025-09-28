import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  static const String route = '/dashboard';

  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final transactions = const [
      _Txn(merchant: 'Tokopedia', time: '28 Sep 2025, 16:45', amount: -125000),
      _Txn(merchant: 'Gojek', time: '28 Sep 2025, 14:10', amount: -27000),
      _Txn(merchant: 'Transfer Masuk', time: '28 Sep 2025, 10:02', amount: 350000),
      _Txn(merchant: 'Alfamart', time: '27 Sep 2025, 19:21', amount: -48000),
      _Txn(merchant: 'PLN Tagihan', time: '27 Sep 2025, 08:00', amount: -235000),
    ];

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Dashboard'),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0.5,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Greeting
            Text(
              'Selamat Datang, ',
              style: TextStyle(fontSize: 18, color: Colors.grey[600]),
            ),
            const Text(
              'Sulthon Abdul Hakim',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Saldo Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.12),
                    spreadRadius: 2,
                    blurRadius: 12,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.account_balance_wallet_outlined, color: Colors.grey[500]),
                      const SizedBox(width: 8),
                      Text(
                        'Saldo Saat Ini',
                        style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.08),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text('IDR', style: TextStyle(fontSize: 12, color: Colors.blue)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Rp 1.234.567',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                          icon: const Icon(Icons.visibility_outlined),
                          label: const Text('Lihat Detail'),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                          icon: const Icon(Icons.history_rounded),
                          label: const Text('Riwayat'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 18),

            // Ringkasan
            const Text('Ringkasan', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            Row(
              children: const [
                Expanded(
                  child: _SummaryCard(
                    title: 'Pemasukan',
                    value: 'Rp 500.000',
                    icon: Icons.trending_up_rounded,
                    accent: Colors.green,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: _SummaryCard(
                    title: 'Pengeluaran',
                    value: 'Rp 915.000',
                    icon: Icons.trending_down_rounded,
                    accent: Colors.red,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 18),

            // Transaksi Terakhir
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Transaksi Terakhir', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                TextButton(
                  onPressed: () {},
                  child: const Text('Semua transaksi'),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: transactions.length,
                separatorBuilder: (_, __) => Divider(height: 1, color: Colors.grey[200]),
                itemBuilder: (context, i) {
                  final t = transactions[i];
                  return ListTile(
                    leading: _txnLeadingIcon(t),
                    title: Text(t.merchant, style: const TextStyle(fontWeight: FontWeight.w600)),
                    subtitle: Text(t.time, style: TextStyle(color: Colors.grey[600])),
                    trailing: Text(
                      (t.amount >= 0 ? '+ ' : '- ') + _formatCurrency(t.amount.abs()),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: t.amount >= 0 ? Colors.green[700] : Colors.red[700],
                      ),
                    ),
                    onTap: () {},
                  );
                },
              ),
            ),

            const SizedBox(height: 18),
          ],
        ),
      ),
    );
  }

  // ===== Helpers =====

  static Widget _txnLeadingIcon(_Txn t) {
    IconData icon;
    Color bg;

    if (t.merchant.toLowerCase().contains('transfer')) {
      icon = t.amount >= 0 ? Icons.call_received_rounded : Icons.call_made_rounded;
      bg = Colors.indigo;
    } else if (t.merchant.toLowerCase().contains('pln')) {
      icon = Icons.bolt_rounded;
      bg = Colors.amber;
    } else if (t.merchant.toLowerCase().contains('gojek')) {
      icon = Icons.motorcycle_rounded;
      bg = Colors.green;
    } else if (t.merchant.toLowerCase().contains('alfamart')) {
      icon = Icons.store_mall_directory_rounded;
      bg = Colors.deepOrange;
    } else {
      icon = Icons.shopping_bag_rounded;
      bg = Colors.blueGrey;
    }

    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: bg.withOpacity(0.12),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(icon, color: bg),
    );
  }

  static String _formatCurrency(int value) {
    // Format sederhana: 1.234.567
    final s = value.toString();
    final buffer = StringBuffer();
    int count = 0;
    for (int i = s.length - 1; i >= 0; i--) {
      buffer.write(s[i]);
      count++;
      if (count % 3 == 0 && i != 0) buffer.write('.');
    }
    return 'Rp ${buffer.toString().split('').reversed.join()}';
  }
}

// ===== Models & Widgets yang dipakai =====

class _Txn {
  final String merchant;
  final String time;
  final int amount; // negatif: pengeluaran, positif: pemasukan
  const _Txn({required this.merchant, required this.time, required this.amount});
}

class _SummaryCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color accent;

  const _SummaryCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.accent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 10, offset: const Offset(0, 4)),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: accent.withOpacity(0.12),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: accent),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                const SizedBox(height: 4),
                Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
