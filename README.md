# text-emotionalize

It's a script that puts emotion at the end of a sentence

## Usage

```console
$ echo 'Good！' | ./emotion.sh
Good!👍

$ cat demo/sample.txt | ./emotion.sh
Good!🙌
OK!👍
Really?
Is it true?👀
I see😃
Cool
いいね！
すごい！💯
どうでしょう？
ですかね？
そうかもしれない〜
わかりました😃
やっておきます😃
```

or you can move `emotion.sh` to PATH location
```console
$ cp emotion.sh /usr/local/bin/emotion
$ cat demo/sample.txt | emotion
```
