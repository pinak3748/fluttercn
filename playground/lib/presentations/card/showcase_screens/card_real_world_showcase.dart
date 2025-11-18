import 'package:flutter/material.dart';

import '../../../widgets/card.dart';
import '../../../widgets/button.dart';
import '../../../widgets/avatar.dart';
import '../../../config/theme.dart';

class CardRealWorldShowcase extends StatelessWidget {
  const CardRealWorldShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Real-world Examples'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Real-world Examples',
              style: AppTheme.displaySmall.copyWith(
                color: AppTheme.textPrimary,
                fontWeight: AppTheme.fontWeightBold,
              ),
            ),
            AppTheme.gapVerticalMd,
            Text(
              'Common card use cases in applications',
              style: AppTheme.bodyLarge.copyWith(
                color: AppTheme.textTertiary,
              ),
            ),
            AppTheme.gapVertical4xl,
            Text(
              'User Profile Card',
              style: AppTheme.labelMedium.copyWith(
                color: AppTheme.textTertiary,
                fontWeight: AppTheme.fontWeightMedium,
              ),
            ),
            AppTheme.gapVerticalMd,
            CNCard(
              onTap: () => _showMessage(context, 'Profile'),
              content: CardContent(
                child: Column(
                  children: [
                    const Avatar(
                      size: AvatarSize.xl2,
                      imageUrl: 'https://i.pravatar.cc/150?img=16',
                      fallbackName: 'Sarah Johnson',
                      showBorder: true,
                      borderWidth: 3,
                    ),
                    AppTheme.gapVerticalLg,
                    Text(
                      'Sarah Johnson',
                      style: AppTheme.headlineSmall.copyWith(
                        color: AppTheme.textPrimary,
                        fontWeight: AppTheme.fontWeightBold,
                      ),
                    ),
                    AppTheme.gapVerticalXs,
                    Text(
                      'Product Designer',
                      style: AppTheme.bodyMedium.copyWith(
                        color: AppTheme.textTertiary,
                      ),
                    ),
                    AppTheme.gapVerticalSm,
                    Text(
                      'San Francisco, CA',
                      style: AppTheme.bodySmall.copyWith(
                        color: AppTheme.textTertiary,
                      ),
                    ),
                    AppTheme.gapVerticalLg,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildStat('1,234', 'Posts'),
                        _buildStat('5.6K', 'Followers'),
                        _buildStat('789', 'Following'),
                      ],
                    ),
                  ],
                ),
              ),
              footer: CardFooter(
                child: Row(
                  children: [
                    Expanded(
                      child: Button(
                        variant: ButtonVariant.outline,
                        size: ButtonSize.sm,
                        onPressed: () => _showMessage(context, 'Message'),
                        child: const Text('Message'),
                      ),
                    ),
                    AppTheme.gapHorizontalMd,
                    Expanded(
                      child: Button(
                        size: ButtonSize.sm,
                        onPressed: () => _showMessage(context, 'Follow'),
                        child: const Text('Follow'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            AppTheme.gapVertical3xl,
            Text(
              'Product Card',
              style: AppTheme.labelMedium.copyWith(
                color: AppTheme.textTertiary,
                fontWeight: AppTheme.fontWeightMedium,
              ),
            ),
            AppTheme.gapVerticalMd,
            CNCard(
              content: CardContent(
                padding: EdgeInsets.zero,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 160,
                      decoration: BoxDecoration(
                        color: AppTheme.surfaceVariant,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(AppTheme.radiusXl),
                          topRight: Radius.circular(AppTheme.radiusXl),
                        ),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.headphones,
                          size: 64,
                          color: AppTheme.textTertiary,
                        ),
                      ),
                    ),
                    Padding(
                      padding: AppTheme.paddingLg,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: AppTheme.success.withValues(alpha: 0.1),
                                  borderRadius: AppTheme.borderRadiusSm,
                                ),
                                child: Text(
                                  'NEW',
                                  style: AppTheme.labelSmall.copyWith(
                                    color: AppTheme.success,
                                    fontWeight: AppTheme.fontWeightBold,
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Row(
                                children: [
                                  Icon(Icons.star, color: AppTheme.warning, size: 16),
                                  AppTheme.gapHorizontalXs,
                                  Text(
                                    '4.8',
                                    style: AppTheme.labelSmall.copyWith(
                                      color: AppTheme.textPrimary,
                                      fontWeight: AppTheme.fontWeightSemiBold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          AppTheme.gapVerticalMd,
                          Text(
                            'Premium Wireless Headphones',
                            style: AppTheme.titleLarge.copyWith(
                              color: AppTheme.textPrimary,
                              fontWeight: AppTheme.fontWeightSemiBold,
                            ),
                          ),
                          AppTheme.gapVerticalXs,
                          Text(
                            'High-quality sound with noise cancellation',
                            style: AppTheme.bodySmall.copyWith(
                              color: AppTheme.textTertiary,
                            ),
                          ),
                          AppTheme.gapVerticalMd,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '\$299.99',
                                style: AppTheme.headlineSmall.copyWith(
                                  color: AppTheme.primary,
                                  fontWeight: AppTheme.fontWeightBold,
                                ),
                              ),
                              Row(
                                children: [
                                  Button(
                                    variant: ButtonVariant.outline,
                                    size: ButtonSize.icon,
                                    onPressed: () => _showMessage(context, 'Wishlist'),
                                    child: const Icon(Icons.favorite_border),
                                  ),
                                  AppTheme.gapHorizontalMd,
                                  Button(
                                    size: ButtonSize.sm,
                                    icon: const Icon(Icons.shopping_cart),
                                    onPressed: () => _showMessage(context, 'Add to cart'),
                                    child: const Text('Add'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            AppTheme.gapVertical3xl,
            Text(
              'Notification Card',
              style: AppTheme.labelMedium.copyWith(
                color: AppTheme.textTertiary,
                fontWeight: AppTheme.fontWeightMedium,
              ),
            ),
            AppTheme.gapVerticalMd,
            CNCard(
              onTap: () => _showMessage(context, 'Notification'),
              content: CardContent(
                child: Row(
                  children: [
                    Container(
                      padding: AppTheme.paddingMd,
                      decoration: BoxDecoration(
                        color: AppTheme.info.withValues(alpha: 0.1),
                        borderRadius: AppTheme.borderRadiusMd,
                      ),
                      child: Icon(Icons.notifications, color: AppTheme.info, size: 24),
                    ),
                    AppTheme.gapHorizontalMd,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'New message from John',
                            style: AppTheme.titleSmall.copyWith(
                              color: AppTheme.textPrimary,
                              fontWeight: AppTheme.fontWeightSemiBold,
                            ),
                          ),
                          AppTheme.gapVerticalXs,
                          Text(
                            'Hey, how are you doing today?',
                            style: AppTheme.bodySmall.copyWith(
                              color: AppTheme.textSecondary,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          AppTheme.gapVerticalXs,
                          Text(
                            '2 minutes ago',
                            style: AppTheme.labelSmall.copyWith(
                              color: AppTheme.textTertiary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: AppTheme.primary,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            AppTheme.gapVertical2xl,
            CNCard(
              showDividers: true,
              header: CardHeader(
                title: CardTitle('Dashboard Stats'),
                description: CardDescription('Overview of your metrics'),
              ),
              content: CardContent(
                child: Column(
                  children: [
                    _buildStatRow('Total Users', '12,456', Icons.people, AppTheme.primary),
                    AppTheme.gapVerticalMd,
                    _buildStatRow('Revenue', '\$45,678', Icons.attach_money, AppTheme.success),
                    AppTheme.gapVerticalMd,
                    _buildStatRow('Active Sessions', '1,234', Icons.computer, AppTheme.info),
                    AppTheme.gapVerticalMd,
                    _buildStatRow('Bounce Rate', '23.5%', Icons.trending_down, AppTheme.error),
                  ],
                ),
              ),
              footer: CardFooter(
                child: Button(
                  variant: ButtonVariant.ghost,
                  size: ButtonSize.sm,
                  fullWidth: true,
                  icon: const Icon(Icons.refresh),
                  onPressed: () => _showMessage(context, 'Refresh'),
                  child: const Text('Refresh Data'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStat(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: AppTheme.titleLarge.copyWith(
            color: AppTheme.textPrimary,
            fontWeight: AppTheme.fontWeightBold,
          ),
        ),
        AppTheme.gapVerticalXs,
        Text(
          label,
          style: AppTheme.bodySmall.copyWith(
            color: AppTheme.textTertiary,
          ),
        ),
      ],
    );
  }

  Widget _buildStatRow(String label, String value, IconData icon, Color color) {
    return Row(
      children: [
        Container(
          padding: AppTheme.paddingSm,
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            borderRadius: AppTheme.borderRadiusSm,
          ),
          child: Icon(icon, color: color, size: 20),
        ),
        AppTheme.gapHorizontalMd,
        Expanded(
          child: Text(
            label,
            style: AppTheme.bodyMedium.copyWith(
              color: AppTheme.textSecondary,
            ),
          ),
        ),
        Text(
          value,
          style: AppTheme.titleSmall.copyWith(
            color: AppTheme.textPrimary,
            fontWeight: AppTheme.fontWeightBold,
          ),
        ),
      ],
    );
  }

  void _showMessage(BuildContext context, String action) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$action action triggered'),
        duration: const Duration(seconds: 1),
      ),
    );
  }
}
