#include <stdio.h>
#include <fcntl.h>
#include <libzbd/zbd.h>

int main(int argc, char **argv){
    int ret;
    struct zbd_info info;
    struct zbd_zone *zone_rep;
    unsigned int reported_zones;
    printf("device name is %s \n", argv[1]);
    int fd = zbd_open(argv[1], O_RDONLY, &info);
    if(fd < 0){
        printf("opening failed \n");
        return -1;
    }
    ret = zbd_list_zones(fd, 0, info.nr_zones * info.zone_size, ZBD_RO_ALL, &zone_rep,
                         &reported_zones);
    if(ret < 0){
        printf("zbd_list_zones failed \n");
        return -1;
    }
    for(long unsigned int i = 0; i < reported_zones; i++){
        struct zbd_zone *z = zone_rep + i;
        printf("\t [all] i = %lu , addr 0x%llu and wp 0x%llu capacity is 0x%llu len is 0x%llu \n", i, z->start, z->wp, z->capacity, z->len);
    }
    return 0;
}
