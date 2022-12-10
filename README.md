# sphinxcontrib-eval

[![pre-commit.ci status](https://results.pre-commit.ci/badge/github/Freed-Wu/sphinxcontrib-eval/main.svg)](https://results.pre-commit.ci/latest/github/Freed-Wu/sphinxcontrib-eval/main)
[![github/workflow](https://github.com/Freed-Wu/sphinxcontrib-eval/actions/workflows/main.yml/badge.svg)](https://github.com/Freed-Wu/sphinxcontrib-eval/actions)
[![codecov](https://codecov.io/gh/Freed-Wu/sphinxcontrib-eval/branch/main/graph/badge.svg)](https://codecov.io/gh/Freed-Wu/sphinxcontrib-eval)
[![readthedocs](https://shields.io/readthedocs/sphinxcontrib-eval)](https://sphinxcontrib-eval.readthedocs.io)

[![github/downloads](https://shields.io/github/downloads/Freed-Wu/sphinxcontrib-eval/total)](https://github.com/Freed-Wu/sphinxcontrib-eval/releases)
[![github/downloads/latest](https://shields.io/github/downloads/Freed-Wu/sphinxcontrib-eval/latest/total)](https://github.com/Freed-Wu/sphinxcontrib-eval/releases/latest)
[![github/issues](https://shields.io/github/issues/Freed-Wu/sphinxcontrib-eval)](https://github.com/Freed-Wu/sphinxcontrib-eval/issues)
[![github/issues-closed](https://shields.io/github/issues-closed/Freed-Wu/sphinxcontrib-eval)](https://github.com/Freed-Wu/sphinxcontrib-eval/issues?q=is%3Aissue+is%3Aclosed)
[![github/issues-pr](https://shields.io/github/issues-pr/Freed-Wu/sphinxcontrib-eval)](https://github.com/Freed-Wu/sphinxcontrib-eval/pulls)
[![github/issues-pr-closed](https://shields.io/github/issues-pr-closed/Freed-Wu/sphinxcontrib-eval)](https://github.com/Freed-Wu/sphinxcontrib-eval/pulls?q=is%3Apr+is%3Aclosed)
[![github/discussions](https://shields.io/github/discussions/Freed-Wu/sphinxcontrib-eval)](https://github.com/Freed-Wu/sphinxcontrib-eval/discussions)
[![github/milestones](https://shields.io/github/milestones/all/Freed-Wu/sphinxcontrib-eval)](https://github.com/Freed-Wu/sphinxcontrib-eval/milestones)
[![github/forks](https://shields.io/github/forks/Freed-Wu/sphinxcontrib-eval)](https://github.com/Freed-Wu/sphinxcontrib-eval/network/members)
[![github/stars](https://shields.io/github/stars/Freed-Wu/sphinxcontrib-eval)](https://github.com/Freed-Wu/sphinxcontrib-eval/stargazers)
[![github/watchers](https://shields.io/github/watchers/Freed-Wu/sphinxcontrib-eval)](https://github.com/Freed-Wu/sphinxcontrib-eval/watchers)
[![github/contributors](https://shields.io/github/contributors/Freed-Wu/sphinxcontrib-eval)](https://github.com/Freed-Wu/sphinxcontrib-eval/graphs/contributors)
[![github/commit-activity](https://shields.io/github/commit-activity/w/Freed-Wu/sphinxcontrib-eval)](https://github.com/Freed-Wu/sphinxcontrib-eval/graphs/commit-activity)
[![github/last-commit](https://shields.io/github/last-commit/Freed-Wu/sphinxcontrib-eval)](https://github.com/Freed-Wu/sphinxcontrib-eval/commits)
[![github/release-date](https://shields.io/github/release-date/Freed-Wu/sphinxcontrib-eval)](https://github.com/Freed-Wu/sphinxcontrib-eval/releases/latest)

[![github/license](https://shields.io/github/license/Freed-Wu/sphinxcontrib-eval)](https://github.com/Freed-Wu/sphinxcontrib-eval/blob/main/LICENSE)
[![github/languages](https://shields.io/github/languages/count/Freed-Wu/sphinxcontrib-eval)](https://github.com/Freed-Wu/sphinxcontrib-eval)
[![github/languages/top](https://shields.io/github/languages/top/Freed-Wu/sphinxcontrib-eval)](https://github.com/Freed-Wu/sphinxcontrib-eval)
[![github/directory-file-count](https://shields.io/github/directory-file-count/Freed-Wu/sphinxcontrib-eval)](https://github.com/Freed-Wu/sphinxcontrib-eval)
[![github/code-size](https://shields.io/github/languages/code-size/Freed-Wu/sphinxcontrib-eval)](https://github.com/Freed-Wu/sphinxcontrib-eval)
[![github/repo-size](https://shields.io/github/repo-size/Freed-Wu/sphinxcontrib-eval)](https://github.com/Freed-Wu/sphinxcontrib-eval)
[![github/v](https://shields.io/github/v/release/Freed-Wu/sphinxcontrib-eval)](https://github.com/Freed-Wu/sphinxcontrib-eval)

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

### Advanced Usages

All of the following examples are myst. The corresponding examples of rst are
similar. Remember to add `scripts` to your `$PATH` in `docs/conf.py`.
Click the hyperlink of title to see the actual example.

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
generate-api.md.sh '' -maxdepth 1
```
````
`````

Where `scripts/generate-api.md.sh` is a script which search all python file and
replace them from `src/translate_shell/XXX.py` to

```rst
.. automodule:: translate_shell.XXX
    :members:
```

```bash
#!/usr/bin/env bash
# shellcheck disable=SC2086
cd "$(dirname "$(dirname "$0")")" || exit 1
find src/translate_shell/$1 $2 $3 -name '*.py' |
perl -pe's=src/=.. automodule:: =g;
s=\.py$=\n    :members:=g;s=/__init__==g;s=/=.=g'
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

Now:

````markdown
# TODO

```{eval-sh}
generate-todo.md.sh
```
````

Where `scripts/generate-todo.md.sh` searches all `TODO`s in code then convert
them to correct hyperlinks.

```sh
#!/usr/bin/env bash
cd "$(dirname "$(dirname "$0")")" || exit 1
grep -RIn TODO: src | perl -pe's/:/#L/;s/:\s*#?\s*TODO:\s*/  /;
s=^=- https://github.com/Freed-Wu/tranlate-shell/tree/main/=g;
s=(https://\S+)=<\1>=g;s=^(- \S+)=\1\n=g'
```

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
generate-requirements.md.sh
```
````

Where `scripts/generate-requirements.md.sh` searches all `requirements/*.txt`s:

```bash
#!/usr/bin/env bash
cd "$(dirname "$(dirname "$0")")" || exit 1
for file in requirements/*.txt ; do
    filename="${file##*/}"
    perl -pe's=^([^#\n]\S*)=- [\1](https://pypi.org/project/\1)=g;
    s/^#\s*//g;s/^!.*/## '"${filename%%.txt}"'/g' < "$file"
done
```

And `requirements/completion.txt` is:

```unixconfig
#!/usr/bin/env -S pip install -r
# Generate shell completion scripts.

shtab
```

See [document](https://sphinxcontrib-eval.readthedocs.io) to know more.
