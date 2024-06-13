# Test build dir
BUILD_DIR = build


test_build: test_clean
	mkdir -p build
	cd xournal-src &&\
	./autogen.sh &&\
	./configure --prefix=$(PWD)/$(BUILD_DIR) &&\
	make && make install

test_run:
	$(BUILD_DIR)/bin/xournal

test_clean:
	rm -rf $(BUILD_DIR)


# Build and install to local machine
install:
	cd xournal-src &&\
	./autogen.sh &&\
	make &&\
	make install && make desktop-install &&\
	cp /usr/local/bin/xournal /Applications/Xournal.app/Contents/MacOS/


.PHONY: test_build test_run test_clean install
