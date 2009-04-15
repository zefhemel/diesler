diesler.jar: src/*.pil src/builtin/*.pil java-support/diesler/*.java
	rm -f src/*.pil.h src/builtin/*.pil.h
	rm -rf out
	cd src && pilc -i diesler.pil --java -d ../out
	cp -r java-support/* out/
	cd out && javac application/Main.java
	cd out && jar cmf ../JavaManifest ../diesler.jar *

clean:
	rm -f src/*.pil.h src/builtin/*.pil.h
	rm -rf out
	rm -f diesler.jar
