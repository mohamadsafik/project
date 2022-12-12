import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/post_bloc/bloc/post_bloc_bloc.dart';

class PostPages extends StatelessWidget {
  PostPages({super.key});
  TextEditingController nameC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<PostBlocBloc, PostBlocState>(
      bloc: context.read<PostBlocBloc>(),
      listener: (context, state) {
        // TODO: implement listener
        if (state is PostBlocLoaded) {
          print(state.message);
          const SnackBar(
            content: Text('BErhasil'),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Post Page'),
        ),
        body: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            TextField(
              controller: nameC,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Nama'),
            ),
            TextField(
              controller: emailC,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Email'),
            ),
            TextField(
              controller: passwordC,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Password'),
            ),
            ElevatedButton(
                onPressed: () {
                  context.read<PostBlocBloc>().add(
                        PostEvent(
                          email: emailC.text,
                          id: Random().nextInt(9999).toString(),
                          name: nameC.text,
                          password: passwordC.text,
                        ),
                      );
                },
                child: const Text('Submit'))
          ],
        ),
      ),
    );
  }
}
