build: ; mkdir dist && dart compile exe bin/bake.dart && mv bin/bake.exe dist && mv dist/bake.exe dist/bake
clean: ; rm -rf dist
