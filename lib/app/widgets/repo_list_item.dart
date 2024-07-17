import 'package:etiqa_github_repo/app/assets/constants.dart';
import 'package:etiqa_github_repo/app/models/github_response_model.dart';
import 'package:etiqa_github_repo/app/widgets/expandable_text_widget.dart';
import 'package:flutter/material.dart';

class RepoListItem extends StatelessWidget {
  const RepoListItem({
    super.key,
    required this.itemsModel,
  });

  final ItemsModel itemsModel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    String formatNumber(int number) {
      if (number < 1000) {
        return number.toString();
      } else if (number < 10000) {
        double num = number / 1000;
        return '${num.toStringAsFixed(1)}k';
      } else {
        double num = number / 1000;
        return '${num.floor()}k';
      }
    }

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(color: CustomColors.grey30, width: 0.5),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          itemsModel.name ?? '',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        ExpandableTextWidget(
                          text: itemsModel.description ??
                              'No description provided.',
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.network(
                                      itemsModel.owner!.avatarUrl!,
                                      width: 30,
                                      height: 30,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Flexible(
                                    child: Text(
                                      itemsModel.owner?.login ?? 'John Doe',
                                      style:
                                          theme.textTheme.bodySmall?.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const Icon(Icons.star, size: 18),
                                  const SizedBox(width: 5),
                                  Text(
                                    formatNumber(itemsModel.stargazersCount!),
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.end,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 5),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
