# Contributing

 - [Issues and Bugs](#issue)
 - [Feature Requests](#feature)
 - [Submission Guidelines](#submit)
 - [Coding Rules](#rules)
 - [Commit Message Guidelines](#commit)

## <a name="issue"></a> Issues and Bugs
If you find a bug in the source code, you can help by submitting an Issue
to the Repository. Even better, you can submit a Pull Request with a fix.

## <a name="feature"></a> Feature Requests
You can *request* a new feature by submitting an Issue to the Repository.
If you would like to *implement* a new feature, please submit an Issue with
a proposal for your work first, to be sure that it can be used. Please
consider what kind of change it is:

* **Major Features** - First open an Issue and outline your proposal so that
  it can be discussed. This allows better coordination of effort, prevents
  duplication of work and helps you to implement the feature so that it is
  successfully accepted into the project.
* **Small Features** - Can be implemented immediately and then directly
  submitted as a Pull Request.

## <a name="submit"></a> Submission Guidelines
### <a name="submit-issue"></a> Submitting an Issue
Before you submit an Issue, please search the currently open Issues, as an
Issue for your problem may already exist.

Unfortunately it is currently not possible to investigate and fix bugs without
a minimal reproduction, so please ensure that you include detailed information
regarding the steps to reproduce the bug when submitting a new Issue.

You can submit a new Issue by completing the new Issue form.

### <a name="submit-pr"></a> Submitting a Pull Request
Before you submit your Pull Request (PR) consider the following guidelines:

* Search for a PR that relates to your submission.
* Make your changes in a new git branch:

     ```shell
     git checkout -b branch-name master
     ```

* Create your patch, following the [Coding Rules](#rules).
* Commit your changes using a descriptive commit message that follows the
  [commit message conventions](#commit).

     ```shell
     git commit -a
     ```

  Note: the optional commit `-a` command line option will automatically
  "add" and "rm" any edited files.
* Push your branch to GitHub:

    ```shell
    git push origin branch-name
    ```
* Send a PR to `dev`.
* If any changes are suggested then:
  * Make the required updates.
  * Rebase your branch and force push to your GitHub repository:

    ```shell
    git rebase dev -i
    git push -f
    ```

That's it! Thank you for your contribution! After your PR is merged, you can
safely delete your branch and pull the changes from the main repository:

* Delete the remote branch through the website, or locally as follows:

    ```shell
    git push origin --delete branch-name
    ```

* Checkout the dev branch:

    ```shell
    git checkout dev -f
    ```

* Delete the local branch:

    ```shell
    git branch -D branch-name
    ```

* Update your dev with the latest upstream version:

    ```shell
    git pull --ff upstream dev
    ```

## <a name="rules"></a> Coding Rules
To ensure consistency throughout the source code, keep these rules in mind:

* All features or bug fixes **must be tested**.
* Follow [Google's Dart Style Guide][dart-style-guide].

## <a name="commit"></a> Commit Message Guidelines
There are very precise rules over how git commit messages can be formatted.
This leads to **more readable messages** that are easy to follow when looking
through the **project history**.

### Commit Message Format
Each commit message consists of a **header**, a **body** and a **footer**.
The header contains a special format that includes a **type**, a **scope** and
a **subject**:

```
<type>(<scope>): <subject>
<BLANK LINE>
<body>
<BLANK LINE>
<footer>
```

The **header** is mandatory and the **scope** is optional.

Any line of the commit message cannot be longer 100 characters! This allows
the message to be easier to read on GitHub as well as in various tools.

The **footer** should contain a [closing reference to an issue](https://help.github.com/articles/closing-issues-via-commit-messages/) if any.

#### [Sample Commits](https://github.com/angular/angular/commits/master)

### Revert
If the commit reverts a previous commit, it should begin with `revert: `,
followed by the header of the reverted commit. In the body it should say:
`This reverts commit <hash>.`, where the hash is the SHA of the commit
that is being reverted.

### Type
Must be one of the following:

* **build**: A change that affects the build system or external dependencies
* **docs**: A change that only affects documentation
* **feat**: A new feature
* **fix**: A bug fix
* **perf**: A change that improves performance
* **refactor**: A change that neither fixes a bug nor adds a feature
* **revert**: A change that reverts to a previous commit
* **style**: A change that does not affect the meaning of the code
* **test**: A change that adds missing tests or corrects existing tests

### Subject
The subject contains a succinct description of the change:

* Use the imperative, present tense: "change" not "changed" nor "changes"
* Don't capitalize first letter
* No dot (.) at the end

### Body
Just as in the **subject**, use the imperative, present tense: "change" not
"changed" nor "changes". The body should include the motivation for the
change and contrast this with previous behavior.

### Footer
The footer should contain any information about the **Breaking Change** and/or
the **Issue Closed** if applicable. The format is as follows:

```
BREAKING CHANGE:
<BLANK LINE>
<breaking-change>
<BLANK LINE>
Closes <issue-number>
```

[dart-style-guide]: https://www.dartlang.org/guides/language/effective-dart/style
