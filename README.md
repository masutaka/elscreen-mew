# elscreen-mew.el

## Introduction

ElScreenはEmacs上で複数の仮想フレームを取り扱うことが出来るソフトウェアです。

詳しくはElScreenのWeb siteをどうぞ。

http://www.morishima.net/~naoto/elscreen-ja/

## Summary

ElScreen-Mewを使うとMew-5.2以降との組み合わせで発生する、ウィンドウの分割状態が崩れる現象を回避することが出来ます。

再現手順は以下のとおりです。

1. Emacs を起動し、M-x mew する。
2. サマリが表示されるので、"p" で +inbox の最新のメールの本文を表示する。
3. C-z C-c で window-1 の作成と移動をする。
4. C-x b(switch-to-buffer) で +inbox バッファを選択する。
5. "g" で任意のフォルダ (例: +ml/hoge) に移動する。
6. サマリが表示されるので、"p" で +ml/hoge の最新のメールの本文を表示させる。
7. "v" を 2 回打つ。
8. C-z C-n で window-0 に移動する。
9. "." で再表示させると、Emacs のウィンドウが 3 つになる。

## TODO

- ElScreen-WL相等のことも出来るようにします。
- elscreen-mew-mode-to-nickname-alistでmew-draft-mode以外もサポートします。
- ドキュメントを整備します。
