# sphinxcontrib-eval

[![pre-commit.ci status](https://results.pre-commit.ci/badge/github/sphinx-contrib/eval/main.svg)](https://results.pre-commit.ci/latest/github/sphinx-contrib/eval/main)
[![github/workflow](https://github.com/sphinx-contrib/eval/actions/workflows/main.yml/badge.svg)](https://github.com/sphinx-contrib/eval/actions)
[![codecov](https://codecov.io/gh/sphinx-contrib/eval/branch/main/graph/badge.svg)](https://codecov.io/gh/sphinx-contrib/eval)
[![readthedocs](https://shields.io/readthedocs/sphinxcontrib-eval)](https://sphinxcontrib-eval.readthedocs.io)

[![github/downloads](https://shields.io/github/downloads/sphinx-contrib/eval/total)](https://github.com/sphinx-contrib/eval/releases)
[![github/downloads/latest](https://shields.io/github/downloads/sphinx-contrib/eval/latest/total)](https://github.com/sphinx-contrib/eval/releases/latest)
[![github/issues](https://shields.io/github/issues/sphinx-contrib/eval)](https://github.com/sphinx-contrib/eval/issues)
[![github/issues-closed](https://shields.io/github/issues-closed/sphinx-contrib/eval)](https://github.com/sphinx-contrib/eval/issues?q=is%3Aissue+is%3Aclosed)
[![github/issues-pr](https://shields.io/github/issues-pr/sphinx-contrib/eval)](https://github.com/sphinx-contrib/eval/pulls)
[![github/issues-pr-closed](https://shields.io/github/issues-pr-closed/sphinx-contrib/eval)](https://github.com/sphinx-contrib/eval/pulls?q=is%3Apr+is%3Aclosed)
[![github/discussions](https://shields.io/github/discussions/sphinx-contrib/eval)](https://github.com/sphinx-contrib/eval/discussions)
[![github/milestones](https://shields.io/github/milestones/all/sphinx-contrib/eval)](https://github.com/sphinx-contrib/eval/milestones)
[![github/forks](https://shields.io/github/forks/sphinx-contrib/eval)](https://github.com/sphinx-contrib/eval/network/members)
[![github/stars](https://shields.io/github/stars/sphinx-contrib/eval)](https://github.com/sphinx-contrib/eval/stargazers)
[![github/watchers](https://shields.io/github/watchers/sphinx-contrib/eval)](https://github.com/sphinx-contrib/eval/watchers)
[![github/contributors](https://shields.io/github/contributors/sphinx-contrib/eval)](https://github.com/sphinx-contrib/eval/graphs/contributors)
[![github/commit-activity](https://shields.io/github/commit-activity/w/sphinx-contrib/eval)](https://github.com/sphinx-contrib/eval/graphs/commit-activity)
[![github/last-commit](https://shields.io/github/last-commit/sphinx-contrib/eval)](https://github.com/sphinx-contrib/eval/commits)
[![github/release-date](https://shields.io/github/release-date/sphinx-contrib/eval)](https://github.com/sphinx-contrib/eval/releases/latest)

[![github/license](https://shields.io/github/license/sphinx-contrib/eval)](https://github.com/sphinx-contrib/eval/blob/main/LICENSE)
[![github/languages](https://shields.io/github/languages/count/sphinx-contrib/eval)](https://github.com/sphinx-contrib/eval)
[![github/languages/top](https://shields.io/github/languages/top/sphinx-contrib/eval)](https://github.com/sphinx-contrib/eval)
[![github/directory-file-count](https://shields.io/github/directory-file-count/sphinx-contrib/eval)](https://github.com/sphinx-contrib/eval)
[![github/code-size](https://shields.io/github/languages/code-size/sphinx-contrib/eval)](https://github.com/sphinx-contrib/eval)
[![github/repo-size](https://shields.io/github/repo-size/sphinx-contrib/eval)](https://github.com/sphinx-contrib/eval)
[![github/v](https://shields.io/github/v/release/sphinx-contrib/eval)](https://github.com/sphinx-contrib/eval)

[![pypi/status](https://shields.io/pypi/status/sphinxcontrib-eval)](https://pypi.org/project/sphinxcontrib-eval/#description)
[![pypi/v](https://shields.io/pypi/v/sphinxcontrib-eval)](https://pypi.org/project/sphinxcontrib-eval/#history)
[![pypi/downloads](https://shields.io/pypi/dd/sphinxcontrib-eval)](https://pypi.org/project/sphinxcontrib-eval/#files)
[![pypi/format](https://shields.io/pypi/format/sphinxcontrib-eval)](https://pypi.org/project/sphinxcontrib-eval/#files)
[![pypi/implementation](https://shields.io/pypi/implementation/sphinxcontrib-eval)](https://pypi.org/project/sphinxcontrib-eval/#files)
[![pypi/pyversions](https://shields.io/pypi/pyversions/sphinxcontrib-eval)](https://pypi.org/project/sphinxcontrib-eval/#files)

Evaluate shell command or python code in sphinx and myst.

## Usage

### Enable

`docs/conf.py`

```python
extensions = [
    "sphinxcontrib.eval",
]
```

Or

```python
extensions = [
    "myst_parser",
    "sphinxcontrib.eval",  # must be after myst_parser
]
```

### Demonstration

For myst:

````markdown
```{eval-sh}
echo My OS is $OSTYPE.
```
````

For rst:

```rst
.. eval-sh::
    echo My OS is $OSTYPE.

```

Then build:

```sh
sphinx-build docs docs/_build/html
```

Result:

```text
My OS is linux-gnu.
```

**NOTE:** the current working directory depends on you. That is, if you run
`cd docs && sphinx-build . _build/html && cd -`, CWD will be `docs`, which is
the default setting of <https://readthedocs.org>. So if your code structure is
like

```console
$ tree --level 1
 .
├──  docs
├──  scripts
├──  src
└──  tests
```

And you want to run `scripts/*.sh`, you need `cd ..` firstly from `docs` to
`.` else you have to run `../scripts/*.sh`.

### Advanced Usages

All of the following examples are myst. The corresponding examples of rst are
similar. Click the hyperlinks of the titles and scripts to see the actual
examples.

#### [Generate API Document](https://github.com/Freed-Wu/translate-shell/tree/main/docs/api/translate_shell.md)

Before:

````markdown
# API of Translate Shell

```{eval-rst}
.. automodule:: translate_shell
    :members:
.. automodule:: translate_shell.__main__
    :members:
... (More)
```
````

Now

`````markdown
# API of Translate Shell

````{eval-rst}
```{eval-sh}
cd ..
scripts/generate-api.md.pl src/*/*.py
```
````
`````

Where
[`scripts/generate-api.md.pl`](https://github.com/Freed-Wu/translate-shell/blob/main/scripts/generate-api.md.pl)
replaces all `src/translate_shell/XXX.py`s to

```rst
.. automodule:: translate_shell.XXX
    :members:
```

#### [Generate TODO Document](https://github.com/Freed-Wu/translate-shell/tree/main/docs/misc/todo.md)

Before:

```markdown
# TODO

- <https://github.com/Freed-Wu/tranlate-shell/tree/main/src/translate_shell/translators/stardict/__init__.py#L4>
  more stardicts.
- <https://github.com/Freed-Wu/tranlate-shell/tree/main/src/translate_shell/translators/stardict/__init__.py#L5>
  Create different subclasses for different dict to get phonetic, explains
- <https://github.com/Freed-Wu/tranlate-shell/tree/main/src/translate_shell/ui/repl.py#L33>
  make the last line gray like ptpython
- ...
```

Now: (notice `eval-bash` because readthedocs uses dash as their default `$SHELL`)

````markdown
# TODO

```{eval-bash}
cd ..
shopt -s globstar
scripts/generate-todo.md.pl src/**/*.py
```
````

Where
[`scripts/generate-todo.md.pl`](https://github.com/Freed-Wu/translate-shell/blob/main/scripts/generate-todo.md.pl)
searches all `TODO`s in code then convert them to correct hyperlinks.

#### [Generate Requirements Document](https://github.com/Freed-Wu/translate-shell/tree/main/docs/resources/requirements.md)

Before:

```markdown
# Requirements

## completion

Generate shell completion scripts.

- [shtab](https://pypi.org/project/shtab)

...
```

Now

````markdown
# Requirements

```{eval-sh}
cd ..
generate-requirements.md.pl
```
````

Where
[`scripts/generate-requirements.md.pl`](https://github.com/Freed-Wu/translate-shell/blob/main/scripts/generate-requirements.md.pl)
searches all `requirements/*.txt`s and `requirements/completion.txt` is:

```unixconfig
#!/usr/bin/env -S pip install -r
# Generate shell completion scripts.

shtab
```

See [document](https://sphinxcontrib-eval.readthedocs.io) to know more.
