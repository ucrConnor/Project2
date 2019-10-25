# CROSS_COMPILE_x86=/home/dwang030/Lab_Android/android-ndk/my-android-toolchain/bin/x86_64-linux-android-
# INCLUDE_DIR=/home/dwang030/Lab_Android/android-ndk/my-android-toolchain
# CC=gcc

CC_ARM=arm-linux-androideabi-gcc

arm:
	$(CC_ARM) -g -D __ARM__ $(CFLAGS) -D _GNU_SOURCE -w -std=gnu99 --sysroot=$(ANDROID_SYSROOT) -march=armv7-a -fPIE -o uaf_exploit uaf_exploit.c
	$(CC_ARM) -g -D __ARM__ $(CFLAGS) -D _GNU_SOURCE -w -std=gnu99 --sysroot=$(ANDROID_SYSROOT) -march=armv7-a -fPIE -o list_exploit list_exploit.c

install:
	adb -e push uaf_exploit /data/local/tmp/uaf_exploit
	adb -e push list_exploit /data/local/tmp/list_exploit
	adb -e push list_exploit.c /data/local/tmp/list_exploit.c
	adb -e push uaf_exploit.c /data/local/tmp/uaf_exploit.c
	

clean:
	rm uaf_exploit list_exploit
