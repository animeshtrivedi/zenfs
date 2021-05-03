# ZenFS utility makefile

TARGET = zenfs

CC=g++
CPPFLAGS = $(shell pkg-config --cflags rocksdb)
LIBS = $(shell pkg-config --static --libs rocksdb)

all: $(TARGET)

$(TARGET): $(TARGET).cc
	$(CC) $(CPPFLAGS) -L/home/atr/local/lib/ -L/home/atr/local/usr/local/lib/ -Wl,-rpath=/home/atr/local/lib -o $(TARGET) $< $(LIBS)

clean:
	$(RM) $(TARGET)

