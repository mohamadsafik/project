import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/bloc/api_bloc_bloc.dart';
import 'package:project/post_bloc/bloc/post_bloc_bloc.dart';
import 'package:project/post_page.dart';
import 'package:project/product_model.dart';
import 'package:project/service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PostBlocBloc>(
      create: (context) => PostBlocBloc(
        ApiService(),
      ),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: PostPages(),
      ),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: BlocBuilder<ApiBlocBloc, ApiBlocState>(
//         // bloc: context.read<ApiBlocBloc>()..add(ProductEventButton()),
//         builder: (context, state) {
//           if (state is ApiBlocLoaded) {
//             return ListView.builder(
//                 itemCount: state.data.length,
//                 itemBuilder: (context, index) {
//                   var item = state.data[index];
//                   return ListTile(
//                       subtitle: Text(widget.title),
//                       title: Text(item.name.toString()));
//                 });
//           } else {
//             return CircularProgressIndicator();
//           }
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => PostPages(),
//           ),
//         ),
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
