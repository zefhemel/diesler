diesler.jar: *.pil builtin/*.pil java-support/diesler/*.java
	rm -f *.pil.h builtin/*.pil.h
	rm -rf .pil
	pilc -i diesler.pil --java -d .pil
	cp -r java-support/* .pil/
	cd .pil && javac application/Main.java
	cd .pil && jar cmf ../Manifest ../diesler.jar *

clean:
	rm -f *.pil.h builtin/*.pil.h
	rm -rf .pil
	rm -f diesler.jar
