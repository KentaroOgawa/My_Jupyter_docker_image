# docker image for Jupyter

Windows11上のWSLでGPUが使えるようになったので、jupyter environmentをDockerで動かしてみよう・・・

## 使えるようにしたもの

* Python
* Julia
* R
* Gauche

## rootで走らせたくない向き

とりあえず、run-non-rootディレクトリに移動後、Dockerfileを作るためにMakefileを適当にいじって、make。そのあとbuildしてください。
(Dockerfile以外のファイルもいじる必要があったので、makeを使っています。)

## rootで走らせてもいいやと言う向き

run-non-rootディレクトリに移動後、そのままbuildしてください。

## 注意

えらくいっぱい読み込んでいるので時間だけかなりかかります。
