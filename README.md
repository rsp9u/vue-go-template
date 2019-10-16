# Getting started

1. change package name
  - `cmd/main.go`
  - `Makefile`

2. install vue
   ```
   $ ./vue-setup.sh
   ```

3. build
   ```
   $ make [dev|prod]
   ```

## example
```
$ git clone --depth 1 https://github.com/rsp9u/vue-go-template myapp
$ cd myapp
$ sed -i Makefile -e 's/your_app/myapp/'
$ sed -i cmd/main.go -e 's/vue-go-template/myapp/'
$ ./vue-setup.sh --default --packageManager yarn --no-git --skipGetStarted
$ make dev
```
