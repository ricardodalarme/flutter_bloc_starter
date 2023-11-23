import 'package:auto_route/auto_route.dart';
import 'package:common/di/app_injector.dart';
import 'package:common_ui/styling/app_spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:quickstart_flutter_bloc/features/post/domain/models/post_model.dart';
import 'package:quickstart_flutter_bloc/features/post/presentation/bloc/post_bloc.dart';
import 'package:quickstart_flutter_bloc/features/post/presentation/widgets/post_card.dart';
import 'package:quickstart_flutter_bloc/l10n/translations.g.dart';

@RoutePage()
class PostView extends StatelessWidget implements AutoRouteWrapper {
  const PostView({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider.value(
      value: AppInjector.instance.get<PostBloc>()..add(const PostFetched()),
      child: const PostView(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.post.title),
      ),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) => switch (state.status) {
          PostStatus.success => _PostSuccess(posts: state.posts),
          PostStatus.failure => const _PostError(),
          PostStatus.loading =>
            const Center(child: CircularProgressIndicator()),
        },
      ),
    );
  }
}

class _PostSuccess extends StatelessWidget {
  const _PostSuccess({required this.posts});

  final List<PostModel> posts;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(AppSpacing.medium),
      itemCount: posts.length,
      itemBuilder: (context, index) => PostCard(
        key: ValueKey(posts[index].id),
        post: posts[index],
      ),
    );
  }
}

class _PostError extends StatelessWidget {
  const _PostError();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            context.l10n.post.textFailure,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const Gap(AppSpacing.medium),
          ElevatedButton(
            onPressed: () => context.read<PostBloc>().add(const PostFetched()),
            child: Text(context.l10n.post.buttonRetry),
          ),
        ],
      ),
    );
  }
}
