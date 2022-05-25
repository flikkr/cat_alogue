import 'package:cat_alogue/models/cat/cat.dart';
import 'package:cat_alogue/screens/home/cat_list_provider.dart';
import 'package:cat_alogue/services/routes/route_generator.dart';
import 'package:cat_alogue/services/utils/surround.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stilo/stilo.dart';

class CatItem extends HookConsumerWidget with Surround {
  final Cat cat;

  const CatItem({
    Key? key,
    required this.cat,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Slidable(
        key: ValueKey(cat.id),
        endActionPane: ActionPane(
          dragDismissible: false,
          motion: const ScrollMotion(),
          extentRatio: 0.3,
          dismissible: DismissiblePane(
            confirmDismiss: () => showDeleteDialog(context),
            onDismissed: () =>
                ref.read(catListProvider.notifier).removeCatFromList(cat.id!),
          ),
          children: [
            SlidableAction(
              onPressed: (context) => showDeleteDialog(context),
              backgroundColor: const Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        child: InkWell(
          onTap: () => Navigator.of(context)
              .pushNamed(Routes.cat_detail, arguments: cat),
          child: Padding(
            padding: StiloEdge.all2,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                cat.profileImg?.display(height: 70, width: 70) ?? Container(),
                StiloSpacing.all2,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cat.name,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      cat.description ?? '',
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Returns `true` if the user has clicked on the delete button, `false` or `null` if they cancel
  Future<bool> showDeleteDialog(BuildContext context) async {
    final shouldDelete = await showDeleteConfirmationDialog(context);

    return shouldDelete != null && shouldDelete;
  }
}
