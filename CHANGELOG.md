Changelog
========================================

v1.1.0 - 2024-06-20
----------------------------------------

- Add `-i` and `--info` as an alternative to `op ?` [`ca13b01`](https://github.com/DannyBen/opcode/commit/ca13b01)
- Add support for usage section comments (`##`) [`2f5f597`](https://github.com/DannyBen/opcode/commit/2f5f597)
- Add more color functions (can be used in op.conf) [`5b95d74`](https://github.com/DannyBen/opcode/commit/5b95d74)
- [BREAKING] Multiline commands are now joined with a newline + arguments (`$@`) are no longer attached automatically to the command [`fcfadca`](https://github.com/DannyBen/opcode/commit/fcfadca)
- Update example file [`fb89a44`](https://github.com/DannyBen/opcode/commit/fb89a44)
- Compare [`v1.0.0..v1.1.0`](https://github.com/dannyben/opcode/compare/v1.0.0..v1.1.0)


v1.0.0 - 2024-05-14
----------------------------------------

- Add support for clean multiline commands (auto-joined with &&) [`9a46eb5`](https://github.com/DannyBen/opcode/commit/9a46eb5)
- Fix completions setup for mac [`7ecdaba`](https://github.com/DannyBen/opcode/commit/7ecdaba)
- Compare [`v0.6.5..v1.0.0`](https://github.com/dannyben/opcode/compare/v0.6.5..v1.0.0)


v0.6.5 - 2024-03-08
----------------------------------------

- Add color functions for use in op.conf [`926708c`](https://github.com/DannyBen/opcode/commit/926708c)
- Compare [`v0.6.4..v0.6.5`](https://github.com/dannyben/opcode/compare/v0.6.4..v0.6.5)


v0.6.4 - 2023-03-12
----------------------------------------

- Fix inability to use a one character command [`07b777f`](https://github.com/DannyBen/opcode/commit/07b777f)
- Normalize with shfmt and shellcheck [`73bbd07`](https://github.com/DannyBen/opcode/commit/73bbd07)
- Compare [`v0.6.3..v0.6.4`](https://github.com/dannyben/opcode/compare/v0.6.3..v0.6.4)


v0.6.3 - 2022-11-10
----------------------------------------

- Add private commands [`bf40d7b`](https://github.com/DannyBen/opcode/commit/bf40d7b)
- Compare [`v0.6.2..v0.6.3`](https://github.com/dannyben/opcode/compare/v0.6.2..v0.6.3)


v0.6.2 - 2022-11-05
----------------------------------------

- Enable bash completions for 'op -w' as well [`16e0aac`](https://github.com/DannyBen/opcode/commit/16e0aac)
- Allow running 'op -w' without code to see all codes and commands [`0e6c3fd`](https://github.com/DannyBen/opcode/commit/0e6c3fd)
- Compare [`v0.6.1..v0.6.2`](https://github.com/dannyben/opcode/compare/v0.6.1..v0.6.2)


v0.6.1 - 2022-11-04
----------------------------------------

- Prefer exact match over partial match commands [`b04877d`](https://github.com/DannyBen/opcode/commit/b04877d)
- Compare [`v0.6.0..v0.6.1`](https://github.com/dannyben/opcode/compare/v0.6.0..v0.6.1)


v0.6.0 - 2021-05-04
----------------------------------------

- Remove bashcompinit from zsh autocompletion [`c478257`](https://github.com/DannyBen/opcode/commit/c478257)
- Change autocomplete installation [`f1a104d`](https://github.com/DannyBen/opcode/commit/f1a104d)
- Compare [`v0.5.2..v0.6.0`](https://github.com/dannyben/opcode/compare/v0.5.2..v0.6.0)


v0.5.2 - 2020-10-26
----------------------------------------

- Change setup script to be non-interactive (for CI) [`aa3b16f`](https://github.com/DannyBen/opcode/commit/aa3b16f)
- Update setup script to avoid installing autocomplete if there is no ~/.bashrc [`e395bbc`](https://github.com/DannyBen/opcode/commit/e395bbc)
- Compare [`v0.5.1..v0.5.2`](https://github.com/dannyben/opcode/compare/v0.5.1..v0.5.2)


