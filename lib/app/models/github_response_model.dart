import 'dart:convert';

import 'package:flutter/foundation.dart';

class GithubResponseModel {
  int? totalCount;
  bool? incompleteResults;
  List<ItemsModel>? items;

  GithubResponseModel({
    this.totalCount,
    this.incompleteResults,
    this.items,
  });

  GithubResponseModel copyWith({
    int? totalCount,
    bool? incompleteResults,
    List<ItemsModel>? items,
  }) {
    return GithubResponseModel(
      totalCount: totalCount ?? this.totalCount,
      incompleteResults: incompleteResults ?? this.incompleteResults,
      items: items ?? this.items,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'total_count': totalCount,
      'incomplete_results': incompleteResults,
      'items': items?.map((x) => x.toMap()).toList(),
    };
  }

  factory GithubResponseModel.fromMap(Map<String, dynamic> map) {
    return GithubResponseModel(
      totalCount: map['total_count'] as int?,
      incompleteResults: map['incomplete_results'] as bool?,
      items: map['items'] != null
          ? List<ItemsModel>.from(
              (map['items'] as List<dynamic>).map<ItemsModel>(
                (x) => ItemsModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory GithubResponseModel.fromJson(String source) =>
      GithubResponseModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'GithubResponseModel(totalCount: $totalCount, incompleteResults: $incompleteResults, items: $items)';
  }

  @override
  bool operator ==(covariant GithubResponseModel other) {
    if (identical(this, other)) return true;

    return other.totalCount == totalCount &&
        other.incompleteResults == incompleteResults &&
        other.items == items;
  }

  @override
  int get hashCode {
    return totalCount.hashCode ^ incompleteResults.hashCode ^ items.hashCode;
  }
}

class ItemsModel {
  int? id;
  String? nodeId;
  String? name;
  String? fullName;
  bool? private;
  OwnerModel? owner;
  String? htmlUrl;
  String? description;
  bool? fork;
  String? url;
  String? forksUrl;
  String? keysUrl;
  String? collaboratorsUrl;
  String? teamsUrl;
  String? hooksUrl;
  String? issueEventsUrl;
  String? eventsUrl;
  String? assigneesUrl;
  String? branchesUrl;
  String? tagsUrl;
  String? blobsUrl;
  String? gitTagsUrl;
  String? gitRefsUrl;
  String? treesUrl;
  String? statusesUrl;
  String? languagesUrl;
  String? stargazersUrl;
  String? contributorsUrl;
  String? subscribersUrl;
  String? subscriptionUrl;
  String? commitsUrl;
  String? gitCommitsUrl;
  String? commentsUrl;
  String? issueCommentUrl;
  String? contentsUrl;
  String? compareUrl;
  String? mergesUrl;
  String? archiveUrl;
  String? downloadsUrl;
  String? issuesUrl;
  String? pullsUrl;
  String? milestonesUrl;
  String? notificationsUrl;
  String? labelsUrl;
  String? releasesUrl;
  String? deploymentsUrl;
  String? createdAt;
  String? updatedAt;
  String? pushedAt;
  String? gitUrl;
  String? sshUrl;
  String? cloneUrl;
  String? svnUrl;
  String? homepage;
  int? size;
  int? stargazersCount;
  int? watchersCount;
  String? language;
  bool? hasIssues;
  bool? hasProjects;
  bool? hasDownloads;
  bool? hasWiki;
  bool? hasPages;
  bool? hasDiscussions;
  int? forksCount;
  String? mirrorUrl;
  bool? archived;
  bool? disabled;
  int? openIssuesCount;
  LicenseModel? license;
  bool? allowForking;
  bool? isTemplate;
  bool? webCommitSignoffRequired;
  List<String>? topics;
  String? visibility;
  int? forks;
  int? openIssues;
  int? watchers;
  String? defaultBranch;
  double? score;

  ItemsModel({
    this.id,
    this.nodeId,
    this.name,
    this.fullName,
    this.private,
    this.owner,
    this.htmlUrl,
    this.description,
    this.fork,
    this.url,
    this.forksUrl,
    this.keysUrl,
    this.collaboratorsUrl,
    this.teamsUrl,
    this.hooksUrl,
    this.issueEventsUrl,
    this.eventsUrl,
    this.assigneesUrl,
    this.branchesUrl,
    this.tagsUrl,
    this.blobsUrl,
    this.gitTagsUrl,
    this.gitRefsUrl,
    this.treesUrl,
    this.statusesUrl,
    this.languagesUrl,
    this.stargazersUrl,
    this.contributorsUrl,
    this.subscribersUrl,
    this.subscriptionUrl,
    this.commitsUrl,
    this.gitCommitsUrl,
    this.commentsUrl,
    this.issueCommentUrl,
    this.contentsUrl,
    this.compareUrl,
    this.mergesUrl,
    this.archiveUrl,
    this.downloadsUrl,
    this.issuesUrl,
    this.pullsUrl,
    this.milestonesUrl,
    this.notificationsUrl,
    this.labelsUrl,
    this.releasesUrl,
    this.deploymentsUrl,
    this.createdAt,
    this.updatedAt,
    this.pushedAt,
    this.gitUrl,
    this.sshUrl,
    this.cloneUrl,
    this.svnUrl,
    this.homepage,
    this.size,
    this.stargazersCount,
    this.watchersCount,
    this.language,
    this.hasIssues,
    this.hasProjects,
    this.hasDownloads,
    this.hasWiki,
    this.hasPages,
    this.hasDiscussions,
    this.forksCount,
    this.mirrorUrl,
    this.archived,
    this.disabled,
    this.openIssuesCount,
    this.license,
    this.allowForking,
    this.isTemplate,
    this.webCommitSignoffRequired,
    this.topics,
    this.visibility,
    this.forks,
    this.openIssues,
    this.watchers,
    this.defaultBranch,
    this.score,
  });

  ItemsModel copyWith({
    int? id,
    String? nodeId,
    String? name,
    String? fullName,
    bool? private,
    OwnerModel? owner,
    String? htmlUrl,
    String? description,
    bool? fork,
    String? url,
    String? forksUrl,
    String? keysUrl,
    String? collaboratorsUrl,
    String? teamsUrl,
    String? hooksUrl,
    String? issueEventsUrl,
    String? eventsUrl,
    String? assigneesUrl,
    String? branchesUrl,
    String? tagsUrl,
    String? blobsUrl,
    String? gitTagsUrl,
    String? gitRefsUrl,
    String? treesUrl,
    String? statusesUrl,
    String? languagesUrl,
    String? stargazersUrl,
    String? contributorsUrl,
    String? subscribersUrl,
    String? subscriptionUrl,
    String? commitsUrl,
    String? gitCommitsUrl,
    String? commentsUrl,
    String? issueCommentUrl,
    String? contentsUrl,
    String? compareUrl,
    String? mergesUrl,
    String? archiveUrl,
    String? downloadsUrl,
    String? issuesUrl,
    String? pullsUrl,
    String? milestonesUrl,
    String? notificationsUrl,
    String? labelsUrl,
    String? releasesUrl,
    String? deploymentsUrl,
    String? createdAt,
    String? updatedAt,
    String? pushedAt,
    String? gitUrl,
    String? sshUrl,
    String? cloneUrl,
    String? svnUrl,
    String? homepage,
    int? size,
    int? stargazersCount,
    int? watchersCount,
    String? language,
    bool? hasIssues,
    bool? hasProjects,
    bool? hasDownloads,
    bool? hasWiki,
    bool? hasPages,
    bool? hasDiscussions,
    int? forksCount,
    String? mirrorUrl,
    bool? archived,
    bool? disabled,
    int? openIssuesCount,
    LicenseModel? license,
    bool? allowForking,
    bool? isTemplate,
    bool? webCommitSignoffRequired,
    List<String>? topics,
    String? visibility,
    int? forks,
    int? openIssues,
    int? watchers,
    String? defaultBranch,
    double? score,
  }) {
    return ItemsModel(
      id: id ?? this.id,
      nodeId: nodeId ?? this.nodeId,
      name: name ?? this.name,
      fullName: fullName ?? this.fullName,
      private: private ?? this.private,
      owner: owner ?? this.owner,
      htmlUrl: htmlUrl ?? this.htmlUrl,
      description: description ?? this.description,
      fork: fork ?? this.fork,
      url: url ?? this.url,
      forksUrl: forksUrl ?? this.forksUrl,
      keysUrl: keysUrl ?? this.keysUrl,
      collaboratorsUrl: collaboratorsUrl ?? this.collaboratorsUrl,
      teamsUrl: teamsUrl ?? this.teamsUrl,
      hooksUrl: hooksUrl ?? this.hooksUrl,
      issueEventsUrl: issueEventsUrl ?? this.issueEventsUrl,
      eventsUrl: eventsUrl ?? this.eventsUrl,
      assigneesUrl: assigneesUrl ?? this.assigneesUrl,
      branchesUrl: branchesUrl ?? this.branchesUrl,
      tagsUrl: tagsUrl ?? this.tagsUrl,
      blobsUrl: blobsUrl ?? this.blobsUrl,
      gitTagsUrl: gitTagsUrl ?? this.gitTagsUrl,
      gitRefsUrl: gitRefsUrl ?? this.gitRefsUrl,
      treesUrl: treesUrl ?? this.treesUrl,
      statusesUrl: statusesUrl ?? this.statusesUrl,
      languagesUrl: languagesUrl ?? this.languagesUrl,
      stargazersUrl: stargazersUrl ?? this.stargazersUrl,
      contributorsUrl: contributorsUrl ?? this.contributorsUrl,
      subscribersUrl: subscribersUrl ?? this.subscribersUrl,
      subscriptionUrl: subscriptionUrl ?? this.subscriptionUrl,
      commitsUrl: commitsUrl ?? this.commitsUrl,
      gitCommitsUrl: gitCommitsUrl ?? this.gitCommitsUrl,
      commentsUrl: commentsUrl ?? this.commentsUrl,
      issueCommentUrl: issueCommentUrl ?? this.issueCommentUrl,
      contentsUrl: contentsUrl ?? this.contentsUrl,
      compareUrl: compareUrl ?? this.compareUrl,
      mergesUrl: mergesUrl ?? this.mergesUrl,
      archiveUrl: archiveUrl ?? this.archiveUrl,
      downloadsUrl: downloadsUrl ?? this.downloadsUrl,
      issuesUrl: issuesUrl ?? this.issuesUrl,
      pullsUrl: pullsUrl ?? this.pullsUrl,
      milestonesUrl: milestonesUrl ?? this.milestonesUrl,
      notificationsUrl: notificationsUrl ?? this.notificationsUrl,
      labelsUrl: labelsUrl ?? this.labelsUrl,
      releasesUrl: releasesUrl ?? this.releasesUrl,
      deploymentsUrl: deploymentsUrl ?? this.deploymentsUrl,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      pushedAt: pushedAt ?? this.pushedAt,
      gitUrl: gitUrl ?? this.gitUrl,
      sshUrl: sshUrl ?? this.sshUrl,
      cloneUrl: cloneUrl ?? this.cloneUrl,
      svnUrl: svnUrl ?? this.svnUrl,
      homepage: homepage ?? this.homepage,
      size: size ?? this.size,
      stargazersCount: stargazersCount ?? this.stargazersCount,
      watchersCount: watchersCount ?? this.watchersCount,
      language: language ?? this.language,
      hasIssues: hasIssues ?? this.hasIssues,
      hasProjects: hasProjects ?? this.hasProjects,
      hasDownloads: hasDownloads ?? this.hasDownloads,
      hasWiki: hasWiki ?? this.hasWiki,
      hasPages: hasPages ?? this.hasPages,
      hasDiscussions: hasDiscussions ?? this.hasDiscussions,
      forksCount: forksCount ?? this.forksCount,
      mirrorUrl: mirrorUrl ?? this.mirrorUrl,
      archived: archived ?? this.archived,
      disabled: disabled ?? this.disabled,
      openIssuesCount: openIssuesCount ?? this.openIssuesCount,
      license: license ?? this.license,
      allowForking: allowForking ?? this.allowForking,
      isTemplate: isTemplate ?? this.isTemplate,
      webCommitSignoffRequired:
          webCommitSignoffRequired ?? this.webCommitSignoffRequired,
      topics: topics ?? this.topics,
      visibility: visibility ?? this.visibility,
      forks: forks ?? this.forks,
      openIssues: openIssues ?? this.openIssues,
      watchers: watchers ?? this.watchers,
      defaultBranch: defaultBranch ?? this.defaultBranch,
      score: score ?? this.score,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'node_id': nodeId,
      'name': name,
      'full_name': fullName,
      'private': private,
      'owner': owner?.toMap(),
      'html_url': htmlUrl,
      'description': description,
      'fork': fork,
      'url': url,
      'forks_url': forksUrl,
      'keys_url': keysUrl,
      'collaborators_url': collaboratorsUrl,
      'teams_url': teamsUrl,
      'hooks_url': hooksUrl,
      'issue_events_url': issueEventsUrl,
      'events_url': eventsUrl,
      'assignees_url': assigneesUrl,
      'branches_url': branchesUrl,
      'tags_url': tagsUrl,
      'blobs_url': blobsUrl,
      'git_tags_url': gitTagsUrl,
      'git_refs_url': gitRefsUrl,
      'trees_url': treesUrl,
      'statuses_url': statusesUrl,
      'languages_url': languagesUrl,
      'stargazers_url': stargazersUrl,
      'contributors_url': contributorsUrl,
      'subscribers_url': subscribersUrl,
      'subscription_url': subscriptionUrl,
      'commits_url': commitsUrl,
      'git_commits_url': gitCommitsUrl,
      'comments_url': commentsUrl,
      'issue_comment_url': issueCommentUrl,
      'contents_url': contentsUrl,
      'compare_url': compareUrl,
      'merges_url': mergesUrl,
      'archive_url': archiveUrl,
      'downloads_url': downloadsUrl,
      'issues_url': issuesUrl,
      'pulls_url': pullsUrl,
      'milestones_url': milestonesUrl,
      'notifications_url': notificationsUrl,
      'labels_url': labelsUrl,
      'releases_url': releasesUrl,
      'deployments_url': deploymentsUrl,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'pushed_at': pushedAt,
      'git_url': gitUrl,
      'ssh_url': sshUrl,
      'clone_url': cloneUrl,
      'svn_url': svnUrl,
      'homepage': homepage,
      'size': size,
      'stargazers_count': stargazersCount,
      'watchers_count': watchersCount,
      'language': language,
      'has_issues': hasIssues,
      'has_projects': hasProjects,
      'has_downloads': hasDownloads,
      'has_wiki': hasWiki,
      'has_pages': hasPages,
      'has_discussions': hasDiscussions,
      'forks_count': forksCount,
      'mirror_url': mirrorUrl,
      'archived': archived,
      'disabled': disabled,
      'open_issues_count': openIssuesCount,
      'license': license?.toMap(),
      'allow_forking': allowForking,
      'is_template': isTemplate,
      'web_commit_signoff_required': webCommitSignoffRequired,
      'topics': topics,
      'visibility': visibility,
      'forks': forks,
      'open_issues': openIssues,
      'watchers': watchers,
      'default_branch': defaultBranch,
      'score': score,
    };
  }

  factory ItemsModel.fromMap(Map<String, dynamic> map) {
    return ItemsModel(
      id: map['id'] as int?,
      nodeId: map['node_id'] as String?,
      name: map['name'] as String?,
      fullName: map['full_name'] as String?,
      private: map['private'] as bool?,
      owner: map['owner'] != null
          ? OwnerModel.fromMap(map['owner'] as Map<String, dynamic>)
          : null,
      htmlUrl: map['html_url'] as String?,
      description: map['description'] as String?,
      fork: map['fork'] as bool?,
      url: map['url'] as String?,
      forksUrl: map['forks_url'] as String?,
      keysUrl: map['keys_url'] as String?,
      collaboratorsUrl: map['collaborators_url'] as String?,
      teamsUrl: map['teams_url'] as String?,
      hooksUrl: map['hooks_url'] as String?,
      issueEventsUrl: map['issue_events_url'] as String?,
      eventsUrl: map['events_url'] as String?,
      assigneesUrl: map['assignees_url'] as String?,
      branchesUrl: map['branches_url'] as String?,
      tagsUrl: map['tags_url'] as String?,
      blobsUrl: map['blobs_url'] as String?,
      gitTagsUrl: map['git_tags_url'] as String?,
      gitRefsUrl: map['git_refs_url'] as String?,
      treesUrl: map['trees_url'] as String?,
      statusesUrl: map['statuses_url'] as String?,
      languagesUrl: map['languages_url'] as String?,
      stargazersUrl: map['stargazers_url'] as String?,
      contributorsUrl: map['contributors_url'] as String?,
      subscribersUrl: map['subscribers_url'] as String?,
      subscriptionUrl: map['subscription_url'] as String?,
      commitsUrl: map['commits_url'] as String?,
      gitCommitsUrl: map['git_commits_url'] as String?,
      commentsUrl: map['comments_url'] as String?,
      issueCommentUrl: map['issue_comment_url'] as String?,
      contentsUrl: map['contents_url'] as String?,
      compareUrl: map['compare_url'] as String?,
      mergesUrl: map['merges_url'] as String?,
      archiveUrl: map['archive_url'] as String?,
      downloadsUrl: map['downloads_url'] as String?,
      issuesUrl: map['issues_url'] as String?,
      pullsUrl: map['pulls_url'] as String?,
      milestonesUrl: map['milestones_url'] as String?,
      notificationsUrl: map['notifications_url'] as String?,
      labelsUrl: map['labels_url'] as String?,
      releasesUrl: map['releases_url'] as String?,
      deploymentsUrl: map['deployments_url'] as String?,
      createdAt: map['created_at'] as String?,
      updatedAt: map['updated_at'] as String?,
      pushedAt: map['pushed_at'] as String?,
      gitUrl: map['git_url'] as String?,
      sshUrl: map['ssh_url'] as String?,
      cloneUrl: map['clone_url'] as String?,
      svnUrl: map['svn_url'] as String?,
      homepage: map['homepage'] as String?,
      size: map['size'] as int?,
      stargazersCount: map['stargazers_count'] as int?,
      watchersCount: map['watchers_count'] as int?,
      language: map['language'] as String?,
      hasIssues: map['has_issues'] as bool?,
      hasProjects: map['has_projects'] as bool?,
      hasDownloads: map['has_downloads'] as bool?,
      hasWiki: map['has_wiki'] as bool?,
      hasPages: map['has_pages'] as bool?,
      hasDiscussions: map['has_discussions'] as bool?,
      forksCount: map['forks_count'] as int?,
      mirrorUrl: map['mirror_url'] as String?,
      archived: map['archived'] as bool?,
      disabled: map['disabled'] as bool?,
      openIssuesCount: map['open_issues_count'] as int?,
      license: map['license'] != null
          ? LicenseModel.fromMap(map['license'] as Map<String, dynamic>)
          : null,
      allowForking: map['allow_forking'] as bool?,
      isTemplate: map['is_template'] as bool?,
      webCommitSignoffRequired: map['web_commit_signoff_required'] as bool?,
      topics: map['topics'] != null
          ? List<String>.from(map['topics'] as List<dynamic>)
          : null,
      visibility: map['visibility'] as String?,
      forks: map['forks'] as int?,
      openIssues: map['open_issues'] as int?,
      watchers: map['watchers'] as int?,
      defaultBranch: map['default_branch'] as String?,
      score: map['score'] as double?,
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemsModel.fromJson(String source) =>
      ItemsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Items(id: $id, nodeId: $nodeId, name: $name, fullName: $fullName, private: $private, owner: $owner, htmlUrl: $htmlUrl, description: $description, fork: $fork, url: $url, forksUrl: $forksUrl, keysUrl: $keysUrl, collaboratorsUrl: $collaboratorsUrl, teamsUrl: $teamsUrl, hooksUrl: $hooksUrl, issueEventsUrl: $issueEventsUrl, eventsUrl: $eventsUrl, assigneesUrl: $assigneesUrl, branchesUrl: $branchesUrl, tagsUrl: $tagsUrl, blobsUrl: $blobsUrl, gitTagsUrl: $gitTagsUrl, gitRefsUrl: $gitRefsUrl, treesUrl: $treesUrl, statusesUrl: $statusesUrl, languagesUrl: $languagesUrl, stargazersUrl: $stargazersUrl, contributorsUrl: $contributorsUrl, subscribersUrl: $subscribersUrl, subscriptionUrl: $subscriptionUrl, commitsUrl: $commitsUrl, gitCommitsUrl: $gitCommitsUrl, commentsUrl: $commentsUrl, issueCommentUrl: $issueCommentUrl, contentsUrl: $contentsUrl, compareUrl: $compareUrl, mergesUrl: $mergesUrl, archiveUrl: $archiveUrl, downloadsUrl: $downloadsUrl, issuesUrl: $issuesUrl, pullsUrl: $pullsUrl, milestonesUrl: $milestonesUrl, notificationsUrl: $notificationsUrl, labelsUrl: $labelsUrl, releasesUrl: $releasesUrl, deploymentsUrl: $deploymentsUrl, createdAt: $createdAt, updatedAt: $updatedAt, pushedAt: $pushedAt, gitUrl: $gitUrl, sshUrl: $sshUrl, cloneUrl: $cloneUrl, svnUrl: $svnUrl, homepage: $homepage, size: $size, stargazersCount: $stargazersCount, watchersCount: $watchersCount, language: $language, hasIssues: $hasIssues, hasProjects: $hasProjects, hasDownloads: $hasDownloads, hasWiki: $hasWiki, hasPages: $hasPages, hasDiscussions: $hasDiscussions, forksCount: $forksCount, mirrorUrl: $mirrorUrl, archived: $archived, disabled: $disabled, openIssuesCount: $openIssuesCount, license: $license, allowForking: $allowForking, isTemplate: $isTemplate, webCommitSignoffRequired: $webCommitSignoffRequired, topics: $topics, visibility: $visibility, forks: $forks, openIssues: $openIssues, watchers: $watchers, defaultBranch: $defaultBranch, score: $score)';
  }

  @override
  bool operator ==(covariant ItemsModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.nodeId == nodeId &&
        other.name == name &&
        other.fullName == fullName &&
        other.private == private &&
        other.owner == owner &&
        other.htmlUrl == htmlUrl &&
        other.description == description &&
        other.fork == fork &&
        other.url == url &&
        other.forksUrl == forksUrl &&
        other.keysUrl == keysUrl &&
        other.collaboratorsUrl == collaboratorsUrl &&
        other.teamsUrl == teamsUrl &&
        other.hooksUrl == hooksUrl &&
        other.issueEventsUrl == issueEventsUrl &&
        other.eventsUrl == eventsUrl &&
        other.assigneesUrl == assigneesUrl &&
        other.branchesUrl == branchesUrl &&
        other.tagsUrl == tagsUrl &&
        other.blobsUrl == blobsUrl &&
        other.gitTagsUrl == gitTagsUrl &&
        other.gitRefsUrl == gitRefsUrl &&
        other.treesUrl == treesUrl &&
        other.statusesUrl == statusesUrl &&
        other.languagesUrl == languagesUrl &&
        other.stargazersUrl == stargazersUrl &&
        other.contributorsUrl == contributorsUrl &&
        other.subscribersUrl == subscribersUrl &&
        other.subscriptionUrl == subscriptionUrl &&
        other.commitsUrl == commitsUrl &&
        other.gitCommitsUrl == gitCommitsUrl &&
        other.commentsUrl == commentsUrl &&
        other.issueCommentUrl == issueCommentUrl &&
        other.contentsUrl == contentsUrl &&
        other.compareUrl == compareUrl &&
        other.mergesUrl == mergesUrl &&
        other.archiveUrl == archiveUrl &&
        other.downloadsUrl == downloadsUrl &&
        other.issuesUrl == issuesUrl &&
        other.pullsUrl == pullsUrl &&
        other.milestonesUrl == milestonesUrl &&
        other.notificationsUrl == notificationsUrl &&
        other.labelsUrl == labelsUrl &&
        other.releasesUrl == releasesUrl &&
        other.deploymentsUrl == deploymentsUrl &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.pushedAt == pushedAt &&
        other.gitUrl == gitUrl &&
        other.sshUrl == sshUrl &&
        other.cloneUrl == cloneUrl &&
        other.svnUrl == svnUrl &&
        other.homepage == homepage &&
        other.size == size &&
        other.stargazersCount == stargazersCount &&
        other.watchersCount == watchersCount &&
        other.language == language &&
        other.hasIssues == hasIssues &&
        other.hasProjects == hasProjects &&
        other.hasDownloads == hasDownloads &&
        other.hasWiki == hasWiki &&
        other.hasPages == hasPages &&
        other.hasDiscussions == hasDiscussions &&
        other.forksCount == forksCount &&
        other.mirrorUrl == mirrorUrl &&
        other.archived == archived &&
        other.disabled == disabled &&
        other.openIssuesCount == openIssuesCount &&
        other.license == license &&
        other.allowForking == allowForking &&
        other.isTemplate == isTemplate &&
        other.webCommitSignoffRequired == webCommitSignoffRequired &&
        listEquals(other.topics, topics) &&
        other.visibility == visibility &&
        other.forks == forks &&
        other.openIssues == openIssues &&
        other.watchers == watchers &&
        other.defaultBranch == defaultBranch &&
        other.score == score;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        nodeId.hashCode ^
        name.hashCode ^
        fullName.hashCode ^
        private.hashCode ^
        owner.hashCode ^
        htmlUrl.hashCode ^
        description.hashCode ^
        fork.hashCode ^
        url.hashCode ^
        forksUrl.hashCode ^
        keysUrl.hashCode ^
        collaboratorsUrl.hashCode ^
        teamsUrl.hashCode ^
        hooksUrl.hashCode ^
        issueEventsUrl.hashCode ^
        eventsUrl.hashCode ^
        assigneesUrl.hashCode ^
        branchesUrl.hashCode ^
        tagsUrl.hashCode ^
        blobsUrl.hashCode ^
        gitTagsUrl.hashCode ^
        gitRefsUrl.hashCode ^
        treesUrl.hashCode ^
        statusesUrl.hashCode ^
        languagesUrl.hashCode ^
        stargazersUrl.hashCode ^
        contributorsUrl.hashCode ^
        subscribersUrl.hashCode ^
        subscriptionUrl.hashCode ^
        commitsUrl.hashCode ^
        gitCommitsUrl.hashCode ^
        commentsUrl.hashCode ^
        issueCommentUrl.hashCode ^
        contentsUrl.hashCode ^
        compareUrl.hashCode ^
        mergesUrl.hashCode ^
        archiveUrl.hashCode ^
        downloadsUrl.hashCode ^
        issuesUrl.hashCode ^
        pullsUrl.hashCode ^
        milestonesUrl.hashCode ^
        notificationsUrl.hashCode ^
        labelsUrl.hashCode ^
        releasesUrl.hashCode ^
        deploymentsUrl.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        pushedAt.hashCode ^
        gitUrl.hashCode ^
        sshUrl.hashCode ^
        cloneUrl.hashCode ^
        svnUrl.hashCode ^
        homepage.hashCode ^
        size.hashCode ^
        stargazersCount.hashCode ^
        watchersCount.hashCode ^
        language.hashCode ^
        hasIssues.hashCode ^
        hasProjects.hashCode ^
        hasDownloads.hashCode ^
        hasWiki.hashCode ^
        hasPages.hashCode ^
        hasDiscussions.hashCode ^
        forksCount.hashCode ^
        mirrorUrl.hashCode ^
        archived.hashCode ^
        disabled.hashCode ^
        openIssuesCount.hashCode ^
        license.hashCode ^
        allowForking.hashCode ^
        isTemplate.hashCode ^
        webCommitSignoffRequired.hashCode ^
        topics.hashCode ^
        visibility.hashCode ^
        forks.hashCode ^
        openIssues.hashCode ^
        watchers.hashCode ^
        defaultBranch.hashCode ^
        score.hashCode;
  }
}

class LicenseModel {
  final String? key;
  final String? name;
  final String? spdxId;
  final String? url;
  final String? nodeId;

  const LicenseModel({
    this.key,
    this.name,
    this.spdxId,
    this.url,
    this.nodeId,
  });

  LicenseModel copyWith({
    String? key,
    String? name,
    String? spdxId,
    String? url,
    String? nodeId,
  }) {
    return LicenseModel(
      key: key ?? this.key,
      name: name ?? this.name,
      spdxId: spdxId ?? this.spdxId,
      url: url ?? this.url,
      nodeId: nodeId ?? this.nodeId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'key': key,
      'name': name,
      'spdx_id': spdxId,
      'url': url,
      'node_id': nodeId,
    };
  }

  factory LicenseModel.fromMap(Map<String, dynamic> map) {
    return LicenseModel(
      key: map['key'] as String?,
      name: map['name'] as String?,
      spdxId: map['spdx_id'] as String?,
      url: map['url'] as String?,
      nodeId: map['node_id'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory LicenseModel.fromJson(String source) =>
      LicenseModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'License(key: $key, name: $name, spdxId: $spdxId, url: $url, nodeId: $nodeId)';
  }

  @override
  bool operator ==(covariant LicenseModel other) {
    if (identical(this, other)) return true;

    return other.key == key &&
        other.name == name &&
        other.spdxId == spdxId &&
        other.url == url &&
        other.nodeId == nodeId;
  }

  @override
  int get hashCode {
    return key.hashCode ^
        name.hashCode ^
        spdxId.hashCode ^
        url.hashCode ^
        nodeId.hashCode;
  }
}

class OwnerModel {
  String? login;
  int? id;
  String? nodeId;
  String? avatarUrl;
  String? gravatarId;
  String? url;
  String? htmlUrl;
  String? followersUrl;
  String? followingUrl;
  String? gistsUrl;
  String? starredUrl;
  String? subscriptionsUrl;
  String? organizationsUrl;
  String? reposUrl;
  String? eventsUrl;
  String? receivedEventsUrl;
  String? type;
  bool? siteAdmin;

  OwnerModel({
    this.login,
    this.id,
    this.nodeId,
    this.avatarUrl,
    this.gravatarId,
    this.url,
    this.htmlUrl,
    this.followersUrl,
    this.followingUrl,
    this.gistsUrl,
    this.starredUrl,
    this.subscriptionsUrl,
    this.organizationsUrl,
    this.reposUrl,
    this.eventsUrl,
    this.receivedEventsUrl,
    this.type,
    this.siteAdmin,
  });

  OwnerModel copyWith({
    String? login,
    int? id,
    String? nodeId,
    String? avatarUrl,
    String? gravatarId,
    String? url,
    String? htmlUrl,
    String? followersUrl,
    String? followingUrl,
    String? gistsUrl,
    String? starredUrl,
    String? subscriptionsUrl,
    String? organizationsUrl,
    String? reposUrl,
    String? eventsUrl,
    String? receivedEventsUrl,
    String? type,
    bool? siteAdmin,
  }) {
    return OwnerModel(
      login: login ?? this.login,
      id: id ?? this.id,
      nodeId: nodeId ?? this.nodeId,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      gravatarId: gravatarId ?? this.gravatarId,
      url: url ?? this.url,
      htmlUrl: htmlUrl ?? this.htmlUrl,
      followersUrl: followersUrl ?? this.followersUrl,
      followingUrl: followingUrl ?? this.followingUrl,
      gistsUrl: gistsUrl ?? this.gistsUrl,
      starredUrl: starredUrl ?? this.starredUrl,
      subscriptionsUrl: subscriptionsUrl ?? this.subscriptionsUrl,
      organizationsUrl: organizationsUrl ?? this.organizationsUrl,
      reposUrl: reposUrl ?? this.reposUrl,
      eventsUrl: eventsUrl ?? this.eventsUrl,
      receivedEventsUrl: receivedEventsUrl ?? this.receivedEventsUrl,
      type: type ?? this.type,
      siteAdmin: siteAdmin ?? this.siteAdmin,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'login': login,
      'id': id,
      'node_id': nodeId,
      'avatar_url': avatarUrl,
      'gravatar_id': gravatarId,
      'url': url,
      'html_url': htmlUrl,
      'followers_url': followersUrl,
      'following_url': followingUrl,
      'gists_url': gistsUrl,
      'starred_url': starredUrl,
      'subscriptions_url': subscriptionsUrl,
      'organizations_url': organizationsUrl,
      'repos_url': reposUrl,
      'events_url': eventsUrl,
      'received_events_url': receivedEventsUrl,
      'type': type,
      'site_admin': siteAdmin,
    };
  }

  factory OwnerModel.fromMap(Map<String, dynamic> map) {
    return OwnerModel(
      login: map['login'],
      id: map['id'],
      nodeId: map['node_id'],
      avatarUrl: map['avatar_url'],
      gravatarId: map['gravatar_id'],
      url: map['url'],
      htmlUrl: map['html_url'],
      followersUrl: map['followers_url'],
      followingUrl: map['following_url'],
      gistsUrl: map['gists_url'],
      starredUrl: map['starred_url'],
      subscriptionsUrl: map['subscriptions_url'],
      organizationsUrl: map['organizations_url'],
      reposUrl: map['repos_url'],
      eventsUrl: map['events_url'],
      receivedEventsUrl: map['received_events_url'],
      type: map['type'],
      siteAdmin: map['site_admin'],
    );
  }

  String toJson() => json.encode(toMap());

  factory OwnerModel.fromJson(String source) =>
      OwnerModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Owner(login: $login, id: $id, nodeId: $nodeId, avatarUrl: $avatarUrl, gravatarId: $gravatarId, url: $url, htmlUrl: $htmlUrl, followersUrl: $followersUrl, followingUrl: $followingUrl, gistsUrl: $gistsUrl, starredUrl: $starredUrl, subscriptionsUrl: $subscriptionsUrl, organizationsUrl: $organizationsUrl, reposUrl: $reposUrl, eventsUrl: $eventsUrl, receivedEventsUrl: $receivedEventsUrl, type: $type, siteAdmin: $siteAdmin)';
  }

  @override
  bool operator ==(covariant OwnerModel other) {
    if (identical(this, other)) return true;

    return other.login == login &&
        other.id == id &&
        other.nodeId == nodeId &&
        other.avatarUrl == avatarUrl &&
        other.gravatarId == gravatarId &&
        other.url == url &&
        other.htmlUrl == htmlUrl &&
        other.followersUrl == followersUrl &&
        other.followingUrl == followingUrl &&
        other.gistsUrl == gistsUrl &&
        other.starredUrl == starredUrl &&
        other.subscriptionsUrl == subscriptionsUrl &&
        other.organizationsUrl == organizationsUrl &&
        other.reposUrl == reposUrl &&
        other.eventsUrl == eventsUrl &&
        other.receivedEventsUrl == receivedEventsUrl &&
        other.type == type &&
        other.siteAdmin == siteAdmin;
  }

  @override
  int get hashCode {
    return login.hashCode ^
        id.hashCode ^
        nodeId.hashCode ^
        avatarUrl.hashCode ^
        gravatarId.hashCode ^
        url.hashCode ^
        htmlUrl.hashCode ^
        followersUrl.hashCode ^
        followingUrl.hashCode ^
        gistsUrl.hashCode ^
        starredUrl.hashCode ^
        subscriptionsUrl.hashCode ^
        organizationsUrl.hashCode ^
        reposUrl.hashCode ^
        eventsUrl.hashCode ^
        receivedEventsUrl.hashCode ^
        type.hashCode ^
        siteAdmin.hashCode;
  }
}
