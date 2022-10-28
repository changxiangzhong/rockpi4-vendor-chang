#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <unistd.h>
#include <arpa/inet.h>
 
int main() {
    int fd=open("/data/data1",O_RDWR|O_CREAT,0660);
    char buffer[100];
    struct sockaddr_in addr = {0};
    size_t addrlen, n;
    int sockfd = socket(AF_INET, SOCK_DGRAM, 0);
    
    addr.sin_family = AF_INET;
    addr.sin_port = htons(2000);
    addr.sin_addr.s_addr = INADDR_ANY;
    bind(sockfd, (struct sockaddr*)&addr, sizeof(addr));
    
    addrlen = sizeof(addr);
    while(1)
    {
        n = recvfrom(sockfd, (void*)buffer, 100, 0,
		(struct sockaddr*)&addr, (unsigned int *) &addrlen);
        buffer[n] = '\n';
        write(fd,buffer,n+1);
    }
    close(fd);
    return 0;
}


/**
 * Use the following script to send a packet
 *  echo -n "My name is Chang" >/dev/udp/10.42.0.199/2000
 *
 * Further reading
 *  https://web.archive.org/web/20100513023326/http://www.androidenea.com/2009/08/init-process-and-initrc.html
 *  https://stackoverflow.com/questions/58703959/what-is-a-recent-way-of-running-a-daemon-service-in-android
 **/
