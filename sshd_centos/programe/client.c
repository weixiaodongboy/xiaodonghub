#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<unistd.h>

#include<sys/socket.h>
#include<netinet/in.h>
#include<arpa/inet.h>

#include<errno.h>  //错误

#define MAXLINE 80
#define SER_PORT 8000
#define chartonumber(x) (x-'0')
int main(int argc,char *argv[]){

    
    struct sockaddr_in servaddr;
    char buf[MAXLINE];

    int sockfd,i,n,port;
    char *str;
    char tt[5];

    //if(argc != 2){
       // fputs("usage: ./client message \n ",stderr);
       // exit(1);
    //}
    
    printf("argv0\n");
    printf(argv[0]);
    printf("\n");
    printf("argv1\n");
    printf(argv[1]);
    printf("\n");    
    printf(argv[2]);
    printf("\n");

    
    sockfd = socket(AF_INET,SOCK_STREAM,0);

    bzero(&servaddr,sizeof(servaddr));
    servaddr.sin_family = AF_INET;
    inet_pton(AF_INET,argv[1],&servaddr.sin_addr);
    

    port = atoi(argv[2]);
    servaddr.sin_port = htons(port);

    if(connect(sockfd,(struct sockaddr *)&servaddr,sizeof(servaddr))<0){
            printf("connet error:%s\n",strerror(errno));
        }   //链接服务器

    while(1){
        
        memset(buf,0,MAXLINE);
        printf("client connet server ...\n");
        n = read(STDIN_FILENO,buf,MAXLINE);   //从标准输入  读取数据
        for(i=0;i<5;i++){
                tt[i] = buf[i];
            }
        if(strcmp(tt,"exit1") == 0){
            printf("exit server connect \n");
            close(sockfd);
            return 0;
        }

        write(sockfd,buf,n);   //把我们的输入，写到服务器

        if(strcmp(tt,"exit1") == 0){
            printf("exit server connect \n");
            close(sockfd);
            return 0;
        }

        n = read(sockfd,buf,MAXLINE);    //从服务器读取数据


        printf("Response from server:\n");
        write(STDOUT_FILENO,buf,n);   //写到标注输出上
        printf("\n");
    }
    
    close(sockfd);
    return 0;

}
