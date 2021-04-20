build: ; mkdir dist && dart compile exe bin/bake.dart && mv bin/bake.exe dist && mv dist/bake.exe dist/bake
test: ;  dart pub get && dart analyze . \ && make build && cp -f exampleFile/Bakefile dist && cd dist && chmod a+x bake && ./bake --version && ./bake --help && ./bake && ./bake greet && ./bake build && ./bake rofl && rm -rf Bakefile && ./bake && ./bake I am a clown! && ./bake init && ./bake build && ./bake test && cd .. && cp -f exampleFile/Bakefile example && cd example && dart run lib/main.dart --version && dart run lib/main.dart --help && dart run lib/main.dart && dart run lib/main.dart greet && dart run lib/main.dart build && dart run lib/main.dart rofl && rm -rf Bakefile && dart run lib/main.dart I am a clown! && dart run lib/main.dart init && dart run lib/main.dart build && dart run lib/main.dart test
clean: ; rm -rf dist
