import 'package:duckdo_todo/config/app_theme.dart';
import 'package:duckdo_todo/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = context.read<ThemeProvider>().isDark;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppTheme.complement(isDark),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppTheme.secondary(isDark),
              ),
              width: (size.width - 16) * .75,
              height: (size.height - 16) / 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text('Login'),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Username',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Password',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      width: size.width - 32,
                      child: FilledButton(
                          style: ButtonStyle(
                              shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8))),
                              backgroundColor: WidgetStatePropertyAll(
                                  AppTheme.primary(isDark))),
                          onPressed: () {},
                          child: Text('LOGIN')),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          child: FilledButton(
                              style: ButtonStyle(
                                  shape: WidgetStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8))),
                                  backgroundColor: WidgetStatePropertyAll(
                                      AppTheme.complement(isDark))),
                              onPressed: () {},
                              child: Icon(Icons.gradient_rounded,
                                  color: AppTheme.primary(isDark))),
                        ),
                        const SizedBox(width: 8),
                        SizedBox(
                          child: FilledButton(
                              style: ButtonStyle(
                                  shape: WidgetStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8))),
                                  backgroundColor: WidgetStatePropertyAll(
                                      AppTheme.complement(isDark))),
                              onPressed: () {},
                              child: Icon(Icons.gradient_rounded,
                                  color: AppTheme.primary(isDark))),
                        ),
                        const SizedBox(width: 8),
                        SizedBox(
                          child: FilledButton(
                              style: ButtonStyle(
                                  shape: WidgetStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8))),
                                  backgroundColor: WidgetStatePropertyAll(
                                      AppTheme.complement(isDark))),
                              onPressed: () {},
                              child: Icon(
                                Icons.gradient_rounded,
                                color: AppTheme.primary(isDark),
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
