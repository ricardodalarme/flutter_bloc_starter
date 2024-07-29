import 'package:auto_route/auto_route.dart';
import 'package:common/common.dart';
import 'package:common_ui/common_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/post/domain/models/post_model.dart';
import 'package:flutter_bloc_starter/features/post/presentation/bloc/post_bloc.dart';
import 'package:flutter_bloc_starter/features/post/presentation/widgets/post_card.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

@RoutePage()
class PostPage extends StatelessWidget implements AutoRouteWrapper {
  const PostPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider.value(
      value: AppInjector.instance.get<PostBloc>()..add(const PostFetched()),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      title: context.l10n.post.title,
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) => switch (state.posts) {
          Success(:final value) => _PostSuccess(posts: value),
          Loading() => const LoadingIndicator(),
          Failure() => ErrorIndicator(
              title: context.l10n.common.genericError,
              buttonText: context.l10n.common.retry,
              message: context.l10n.post.textFailure,
              onButtonPressed: () =>
                  context.read<PostBloc>().add(const PostFetched()),
            ),
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
    return PullToRefresh(
      onRefresh: () => context.read<PostBloc>().add(const PostFetched()),
      child: ListView.builder(
        padding: const EdgeInsets.all(Spacings.large),
        itemCount: posts.length,
        itemBuilder: (context, index) => PostCard(
          key: ValueKey(posts[index].id),
          post: posts[index],
        ),
      ),
    );
  }
}
