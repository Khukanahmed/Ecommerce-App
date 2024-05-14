import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../Utility/assets_image.dart';

class CompleteProfile extends StatefulWidget {
  const CompleteProfile({super.key});

  @override
  State<CompleteProfile> createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 100),
          child: Column(
            children: [
              Center(
                  child: SvgPicture.asset(
                Imageasset.craftylogoSVG,
                width: 100,
              )),
              const SizedBox(height: 10),
              Text(
                'Complete Profile',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text('Get started with us with your Details ',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: Colors.grey)),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(hintText: 'FirstName'),
              ),
              const SizedBox(height: 12),
              TextFormField(
                decoration: const InputDecoration(hintText: 'LastName'),
              ),
              const SizedBox(height: 12),
              TextFormField(
                decoration: const InputDecoration(hintText: 'Mobile'),
              ),
              const SizedBox(height: 12),
              TextFormField(
                decoration: const InputDecoration(hintText: 'City'),
              ),
              const SizedBox(height: 12),
              TextFormField(
                maxLines: 4,
                decoration: const InputDecoration(hintText: 'Shipping Address'),
              ),
              const SizedBox(height: 20),
              SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {

                      },
                      child: const Text(
                        'Complete',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            letterSpacing: 0.5),
                      ))),
              const SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
