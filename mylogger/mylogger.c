#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <unistd.h>
#include <arpa/inet.h>
#include <log/log.h>

#define LOG_TAG "mylogger"

int main() {
    char token_file[] = "/system/allente_fallback_token";
    ALOGI("Preparing to open file %s", token_file);
    int fd=open(token_file, O_RDONLY);
    char buffer[101];
    int sz;
    if (fd > 0) {
        ALOGI("token file: %s opened successfully", token_file);
    } else {
        ALOGI("token file: %s opened failed", token_file);
        return 0;
    }

    sz = read(fd, buffer, 100);
    buffer[sz] = '\0';

    ALOGI("Successfully read %d bytes, token =%s", sz, buffer);


    close(fd);
    return 0;
}

