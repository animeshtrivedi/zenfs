# ZenFS utility makefile

TARGET = main 

CC=g++
#CPPFLAGS = $(shell pkg-config --cflags rocksdb)
CPPFLAGS = -std=c++11 -faligned-new -DHAVE_ALIGNED_NEW -DROCKSDB_PLATFORM_POSIX -DROCKSDB_LIB_IO_POSIX -DOS_LINUX -fno-builtin-memcmp -DROCKSDB_FALLOCATE_PRESENT -DGFLAGS=1 -DZLIB -DNUMA -DROCKSDB_MALLOC_USABLE_SIZE -DROCKSDB_PTHREAD_ADAPTIVE_MUTEX -DROCKSDB_BACKTRACE -DROCKSDB_RANGESYNC_PRESENT -DROCKSDB_SCHED_GETCPU_PRESENT -DROCKSDB_AUXV_GETAUXVAL_PRESENT -march=native -DHAVE_SSE42 -DHAVE_PCLMUL -DHAVE_AVX2 -DHAVE_BMI -DHAVE_LZCNT -DHAVE_UINT128_EXTENSION -DROCKSDB_SUPPORT_THREAD_LOCAL -isystem third-party/gtest-1.8.1/fused-src -isystem ./third-party/folly -I/usr/local/include
CPPFLAGS += -I/home/atr/vu/github/storage/rocksdb/ -L/home/atr/local/lib/ -L/home/atr/local/usr/local/lib/ -Wl,-rpath=/home/atr/local/lib
#LIBS = $(shell pkg-config --static --libs rocksdb)
LIBS = -L/usr/local/lib -ldl -lrocksdb -lpthread -lrt -ldl -lgflags -lz -lnuma -lzbd -u zenfs_filesystem_reg

OBJFILES = ./fs/main.o ./fs/zbd_zenfs.o ./fs/io_zenfs.o ./fs/fs_zenfs.o

all: $(TARGET)

$(TARGET): $(OBJFILES)
	$(CC) $(CPPFLAGS)  -o $(TARGET) $< $(LIBS)

clean:
	$(RM) $(TARGET) ./fs/*.o 

