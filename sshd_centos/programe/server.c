#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<unistd.h>   //针对系统调用的封装    fork,pipe 各种i/o原语 read write 等

#include<sys/socket.h>
#include<netinet/in.h>    //互联网地址族   定义数据结构sockaddr_in
#include<arpa/inet.h>   //提供IP地址转换函数

#include<ctype.h>    //一批C语言字符分类函数 用    于 测试字符是否属于特定的字符类别  topper()在这里

#define MAXLINE 80
#define SER_PORT 8000

int main(int argc,char *argv[]){
struct sockaddr_in servaddr,cliaddr;
    socklen_t cliaddr_len;

    int listenfd,connfd;
    char buf[MAXLINE];
    char str[INET_ADDRSTRLEN];
    int i,n,port;
    char tt[] = "exit1";   //这里有字符数组和字符指针的区别的坑 具体百度查询
    char *bb;
    
    listenfd = socket(AF_INET,SOCK_STREAM,0);
    
    bzero(&servaddr,sizeof(servaddr));   //初始化赋值为0

    servaddr.sin_family = AF_INET;

    servaddr.sin_addr.s_addr = htonl(INADDR_ANY);  
    
    printf("argv0\n");
    printf(argv[0]);
    printf("\n");
    printf("argv1\n");
    printf(argv[1]);
    printf("\n");

    port = atoi(argv[1]);   

    servaddr.sin_port = htons(port);

    bind(listenfd,(struct sockaddr *)&servaddr,sizeof(servaddr)); 

    listen(listenfd,20);

    printf("Accepting connections ... \n ");
    while(1){
        
	cliaddr_len = sizeof(cliaddr);
	connfd = accept(listenfd,(struct sockaddr *)&cliaddr,&cliaddr_len);
	printf("connfd:%d------\n",connfd);
	printf("received from %s at PORT %d \n",inet_ntop(AF_INET,&cliaddr.sin_addr,str,sizeof(str)),ntohs(cliaddr.sin_port));

	while(1){
		n = read(connfd,buf,MAXLINE); 
		printf("%d,");
		for(i=0;i<5;i++){
                    tt[i] = buf[i];
                }


		printf("tt:%s-----%d\n",tt,strcmp(tt,"exit1"));
		if(strcmp(tt,"exit1") == 0){      //strcmp  对比的就是字符
                    close(connfd);
                    printf("close:-----\n");
                    break;
                }


		for(i=0; i < n; i++){
                    buf[i] = toupper(buf[i]);
                }
		write(connfd,buf,n);
	}
    }
    return 0;

}

