import 'package:flutter/material.dart';

import '../../../widgets/button.dart';
import '../../../config/theme.dart';

class ButtonRealWorldShowcase extends StatelessWidget {
  const ButtonRealWorldShowcase({super.key});

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
              'Common button use cases in applications',
              style: AppTheme.bodyLarge.copyWith(
                color: AppTheme.textTertiary,
              ),
            ),
            AppTheme.gapVertical4xl,
            _buildExample(
              'Login Form',
              Container(
                padding: AppTheme.paddingXl,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Sign in to your account',
                      style: AppTheme.headlineSmall.copyWith(
                        color: AppTheme.textPrimary,
                        fontWeight: AppTheme.fontWeightBold,
                      ),
                    ),
                    AppTheme.gapVertical2xl,
                    Button(
                      fullWidth: true,
                      icon: const Icon(Icons.mail),
                      onPressed: () => _showMessage(context, 'Email login'),
                      child: const Text('Continue with Email'),
                    ),
                    AppTheme.gapVerticalMd,
                    Button(
                      variant: ButtonVariant.outline,
                      fullWidth: true,
                      icon: const Icon(Icons.g_mobiledata),
                      onPressed: () => _showMessage(context, 'Google login'),
                      child: const Text('Continue with Google'),
                    ),
                    AppTheme.gapVerticalMd,
                    Button(
                      variant: ButtonVariant.ghost,
                      fullWidth: true,
                      onPressed: () => _showMessage(context, 'Forgot password'),
                      child: const Text('Forgot password?'),
                    ),
                  ],
                ),
              ),
            ),
            AppTheme.gapVertical3xl,
            _buildExample(
              'Confirmation Dialog',
              Container(
                padding: AppTheme.paddingXl,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Delete Account',
                      style: AppTheme.headlineSmall.copyWith(
                        color: AppTheme.textPrimary,
                        fontWeight: AppTheme.fontWeightBold,
                      ),
                    ),
                    AppTheme.gapVerticalMd,
                    Text(
                      'Are you sure you want to delete your account? This action cannot be undone.',
                      style: AppTheme.bodyMedium.copyWith(
                        color: AppTheme.textSecondary,
                      ),
                    ),
                    AppTheme.gapVertical2xl,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Button(
                          variant: ButtonVariant.ghost,
                          onPressed: () => _showMessage(context, 'Cancelled'),
                          child: const Text('Cancel'),
                        ),
                        AppTheme.gapHorizontalMd,
                        Button(
                          variant: ButtonVariant.destructive,
                          onPressed: () => _showMessage(context, 'Account deleted'),
                          child: const Text('Delete Account'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            AppTheme.gapVertical3xl,
            _buildExample(
              'Product Card',
              Container(
                padding: AppTheme.paddingXl,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 120,
                      decoration: BoxDecoration(
                        color: AppTheme.surfaceVariant,
                        borderRadius: AppTheme.borderRadiusMd,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.image,
                          size: 48,
                          color: AppTheme.textTertiary,
                        ),
                      ),
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
                      '\$299.99',
                      style: AppTheme.headlineSmall.copyWith(
                        color: AppTheme.primary,
                        fontWeight: AppTheme.fontWeightBold,
                      ),
                    ),
                    AppTheme.gapVerticalLg,
                    Row(
                      children: [
                        Expanded(
                          child: Button(
                            variant: ButtonVariant.outline,
                            icon: const Icon(Icons.favorite_border),
                            onPressed: () => _showMessage(context, 'Added to wishlist'),
                            child: const Text('Wishlist'),
                          ),
                        ),
                        AppTheme.gapHorizontalMd,
                        Expanded(
                          flex: 2,
                          child: Button(
                            icon: const Icon(Icons.shopping_cart),
                            onPressed: () => _showMessage(context, 'Added to cart'),
                            child: const Text('Add to Cart'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            AppTheme.gapVertical3xl,
            _buildExample(
              'Settings Panel',
              Container(
                padding: AppTheme.paddingXl,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Preferences',
                      style: AppTheme.titleLarge.copyWith(
                        color: AppTheme.textPrimary,
                        fontWeight: AppTheme.fontWeightSemiBold,
                      ),
                    ),
                    AppTheme.gapVerticalLg,
                    _buildSettingsRow('Notifications', Icons.notifications),
                    AppTheme.gapVerticalMd,
                    _buildSettingsRow('Privacy', Icons.lock),
                    AppTheme.gapVerticalMd,
                    _buildSettingsRow('Appearance', Icons.palette),
                    AppTheme.gapVerticalMd,
                    _buildSettingsRow('Language', Icons.language),
                    AppTheme.gapVertical2xl,
                    Button(
                      variant: ButtonVariant.destructive,
                      fullWidth: true,
                      icon: const Icon(Icons.logout),
                      onPressed: () => _showMessage(context, 'Logged out'),
                      child: const Text('Sign Out'),
                    ),
                  ],
                ),
              ),
            ),
            AppTheme.gapVertical3xl,
            _buildExample(
              'Action Bar',
              Container(
                padding: AppTheme.paddingLg,
                child: Row(
                  children: [
                    Button(
                      size: ButtonSize.icon,
                      variant: ButtonVariant.ghost,
                      onPressed: () => _showMessage(context, 'Edit'),
                      child: const Icon(Icons.edit),
                    ),
                    Button(
                      size: ButtonSize.icon,
                      variant: ButtonVariant.ghost,
                      onPressed: () => _showMessage(context, 'Share'),
                      child: const Icon(Icons.share),
                    ),
                    Button(
                      size: ButtonSize.icon,
                      variant: ButtonVariant.ghost,
                      onPressed: () => _showMessage(context, 'Bookmark'),
                      child: const Icon(Icons.bookmark_border),
                    ),
                    const Spacer(),
                    Button(
                      size: ButtonSize.icon,
                      variant: ButtonVariant.ghost,
                      onPressed: () => _showMessage(context, 'More options'),
                      child: const Icon(Icons.more_vert),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExample(String title, Widget content) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppTheme.surface,
        border: Border.all(color: AppTheme.border),
        borderRadius: AppTheme.borderRadiusLg,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: AppTheme.paddingLg,
            child: Text(
              title,
              style: AppTheme.labelMedium.copyWith(
                color: AppTheme.textTertiary,
                fontWeight: AppTheme.fontWeightMedium,
              ),
            ),
          ),
          content,
        ],
      ),
    );
  }

  Widget _buildSettingsRow(String title, IconData icon) {
    return Row(
      children: [
        Icon(icon, color: AppTheme.textSecondary, size: 20),
        AppTheme.gapHorizontalMd,
        Expanded(
          child: Text(
            title,
            style: AppTheme.bodyMedium.copyWith(
              color: AppTheme.textPrimary,
            ),
          ),
        ),
        Button(
          size: ButtonSize.icon,
          variant: ButtonVariant.ghost,
          onPressed: () => _showMessage(null, title),
          child: const Icon(Icons.chevron_right),
        ),
      ],
    );
  }

  void _showMessage(BuildContext? context, String action) {
    if (context == null) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$action action triggered'),
        duration: const Duration(seconds: 1),
      ),
    );
  }
}
