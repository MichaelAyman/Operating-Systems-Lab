
_sh:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  return 0;
}

int
main(void)
{
       0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
       4:	83 e4 f0             	and    $0xfffffff0,%esp
       7:	ff 71 fc             	push   -0x4(%ecx)
       a:	55                   	push   %ebp
       b:	89 e5                	mov    %esp,%ebp
       d:	51                   	push   %ecx
       e:	83 ec 04             	sub    $0x4,%esp
  static char buf[100];
  int fd;

  // Ensure that three file descriptors are open.
  while((fd = open("console", O_RDWR)) >= 0){
      11:	eb 0e                	jmp    21 <main+0x21>
      13:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    if(fd >= 3){
      18:	83 f8 02             	cmp    $0x2,%eax
      1b:	0f 8f 96 00 00 00    	jg     b7 <main+0xb7>
  while((fd = open("console", O_RDWR)) >= 0){
      21:	83 ec 08             	sub    $0x8,%esp
      24:	6a 02                	push   $0x2
      26:	68 89 14 00 00       	push   $0x1489
      2b:	e8 e6 0e 00 00       	call   f16 <open>
      30:	83 c4 10             	add    $0x10,%esp
      33:	85 c0                	test   %eax,%eax
      35:	79 e1                	jns    18 <main+0x18>
      37:	eb 2e                	jmp    67 <main+0x67>
      39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    }
  }

  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      40:	80 3d 62 15 00 00 20 	cmpb   $0x20,0x1562
      47:	0f 84 8d 00 00 00    	je     da <main+0xda>
      4d:	8d 76 00             	lea    0x0(%esi),%esi
int
fork1(void)
{
  int pid;

  pid = fork();
      50:	e8 79 0e 00 00       	call   ece <fork>
  if(pid == -1)
      55:	83 f8 ff             	cmp    $0xffffffff,%eax
      58:	0f 84 c1 00 00 00    	je     11f <main+0x11f>
    if(fork1() == 0)
      5e:	85 c0                	test   %eax,%eax
      60:	74 63                	je     c5 <main+0xc5>
    wait();
      62:	e8 77 0e 00 00       	call   ede <wait>
  printf(2, "$ ");
      67:	83 ec 08             	sub    $0x8,%esp
      6a:	68 e8 13 00 00       	push   $0x13e8
      6f:	6a 02                	push   $0x2
      71:	e8 0a 10 00 00       	call   1080 <printf>
  memset(buf, 0, nbuf);
      76:	83 c4 0c             	add    $0xc,%esp
      79:	6a 64                	push   $0x64
      7b:	6a 00                	push   $0x0
      7d:	68 60 15 00 00       	push   $0x1560
      82:	e8 29 0c 00 00       	call   cb0 <memset>
  gets(buf, nbuf);
      87:	58                   	pop    %eax
      88:	5a                   	pop    %edx
      89:	6a 64                	push   $0x64
      8b:	68 60 15 00 00       	push   $0x1560
      90:	e8 7b 0c 00 00       	call   d10 <gets>
  if(buf[0] == 0) // EOF
      95:	0f b6 05 60 15 00 00 	movzbl 0x1560,%eax
      9c:	83 c4 10             	add    $0x10,%esp
      9f:	84 c0                	test   %al,%al
      a1:	74 0f                	je     b2 <main+0xb2>
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      a3:	3c 63                	cmp    $0x63,%al
      a5:	75 a9                	jne    50 <main+0x50>
      a7:	80 3d 61 15 00 00 64 	cmpb   $0x64,0x1561
      ae:	75 a0                	jne    50 <main+0x50>
      b0:	eb 8e                	jmp    40 <main+0x40>
  exit();
      b2:	e8 1f 0e 00 00       	call   ed6 <exit>
      close(fd);
      b7:	83 ec 0c             	sub    $0xc,%esp
      ba:	50                   	push   %eax
      bb:	e8 3e 0e 00 00       	call   efe <close>
      break;
      c0:	83 c4 10             	add    $0x10,%esp
      c3:	eb a2                	jmp    67 <main+0x67>
      runcmd(parsecmd(buf));
      c5:	83 ec 0c             	sub    $0xc,%esp
      c8:	68 60 15 00 00       	push   $0x1560
      cd:	e8 8e 0a 00 00       	call   b60 <parsecmd>
      d2:	89 04 24             	mov    %eax,(%esp)
      d5:	e8 d6 00 00 00       	call   1b0 <runcmd>
      buf[strlen(buf)-1] = 0;  // chop \n
      da:	83 ec 0c             	sub    $0xc,%esp
      dd:	68 60 15 00 00       	push   $0x1560
      e2:	e8 99 0b 00 00       	call   c80 <strlen>
      e7:	c6 80 5f 15 00 00 00 	movb   $0x0,0x155f(%eax)
      if(chdir(buf+3) < 0)
      ee:	c7 04 24 63 15 00 00 	movl   $0x1563,(%esp)
      f5:	e8 4c 0e 00 00       	call   f46 <chdir>
      fa:	83 c4 10             	add    $0x10,%esp
      fd:	85 c0                	test   %eax,%eax
      ff:	0f 89 62 ff ff ff    	jns    67 <main+0x67>
        printf(2, "cannot cd %s\n", buf+3);
     105:	51                   	push   %ecx
     106:	68 63 15 00 00       	push   $0x1563
     10b:	68 91 14 00 00       	push   $0x1491
     110:	6a 02                	push   $0x2
     112:	e8 69 0f 00 00       	call   1080 <printf>
     117:	83 c4 10             	add    $0x10,%esp
     11a:	e9 48 ff ff ff       	jmp    67 <main+0x67>
    panic("fork");
     11f:	83 ec 0c             	sub    $0xc,%esp
     122:	68 eb 13 00 00       	push   $0x13eb
     127:	e8 44 00 00 00       	call   170 <panic>
     12c:	66 90                	xchg   %ax,%ax
     12e:	66 90                	xchg   %ax,%ax

00000130 <getcmd>:
{
     130:	55                   	push   %ebp
     131:	89 e5                	mov    %esp,%ebp
     133:	56                   	push   %esi
     134:	53                   	push   %ebx
     135:	8b 5d 08             	mov    0x8(%ebp),%ebx
     138:	8b 75 0c             	mov    0xc(%ebp),%esi
  printf(2, "$ ");
     13b:	83 ec 08             	sub    $0x8,%esp
     13e:	68 e8 13 00 00       	push   $0x13e8
     143:	6a 02                	push   $0x2
     145:	e8 36 0f 00 00       	call   1080 <printf>
  memset(buf, 0, nbuf);
     14a:	83 c4 0c             	add    $0xc,%esp
     14d:	56                   	push   %esi
     14e:	6a 00                	push   $0x0
     150:	53                   	push   %ebx
     151:	e8 5a 0b 00 00       	call   cb0 <memset>
  gets(buf, nbuf);
     156:	58                   	pop    %eax
     157:	5a                   	pop    %edx
     158:	56                   	push   %esi
     159:	53                   	push   %ebx
     15a:	e8 b1 0b 00 00       	call   d10 <gets>
  if(buf[0] == 0) // EOF
     15f:	83 c4 10             	add    $0x10,%esp
     162:	80 3b 01             	cmpb   $0x1,(%ebx)
     165:	19 c0                	sbb    %eax,%eax
}
     167:	8d 65 f8             	lea    -0x8(%ebp),%esp
     16a:	5b                   	pop    %ebx
     16b:	5e                   	pop    %esi
     16c:	5d                   	pop    %ebp
     16d:	c3                   	ret
     16e:	66 90                	xchg   %ax,%ax

00000170 <panic>:
{
     170:	55                   	push   %ebp
     171:	89 e5                	mov    %esp,%ebp
     173:	83 ec 0c             	sub    $0xc,%esp
  printf(2, "%s\n", s);
     176:	ff 75 08             	push   0x8(%ebp)
     179:	68 85 14 00 00       	push   $0x1485
     17e:	6a 02                	push   $0x2
     180:	e8 fb 0e 00 00       	call   1080 <printf>
  exit();
     185:	e8 4c 0d 00 00       	call   ed6 <exit>
     18a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000190 <fork1>:
{
     190:	55                   	push   %ebp
     191:	89 e5                	mov    %esp,%ebp
     193:	83 ec 08             	sub    $0x8,%esp
  pid = fork();
     196:	e8 33 0d 00 00       	call   ece <fork>
  if(pid == -1)
     19b:	83 f8 ff             	cmp    $0xffffffff,%eax
     19e:	74 02                	je     1a2 <fork1+0x12>
  return pid;
}
     1a0:	c9                   	leave
     1a1:	c3                   	ret
    panic("fork");
     1a2:	83 ec 0c             	sub    $0xc,%esp
     1a5:	68 eb 13 00 00       	push   $0x13eb
     1aa:	e8 c1 ff ff ff       	call   170 <panic>
     1af:	90                   	nop

000001b0 <runcmd>:
{
     1b0:	55                   	push   %ebp
     1b1:	89 e5                	mov    %esp,%ebp
     1b3:	53                   	push   %ebx
     1b4:	83 ec 14             	sub    $0x14,%esp
     1b7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(cmd == 0)
     1ba:	85 db                	test   %ebx,%ebx
     1bc:	74 3a                	je     1f8 <runcmd+0x48>
  switch(cmd->type){
     1be:	83 3b 05             	cmpl   $0x5,(%ebx)
     1c1:	0f 87 db 00 00 00    	ja     2a2 <runcmd+0xf2>
     1c7:	8b 03                	mov    (%ebx),%eax
     1c9:	ff 24 85 a8 14 00 00 	jmp    *0x14a8(,%eax,4)
    if(ecmd->argv[0] == 0)
     1d0:	8b 43 04             	mov    0x4(%ebx),%eax
     1d3:	85 c0                	test   %eax,%eax
     1d5:	74 21                	je     1f8 <runcmd+0x48>
    exec(ecmd->argv[0], ecmd->argv);
     1d7:	8d 53 04             	lea    0x4(%ebx),%edx
     1da:	51                   	push   %ecx
     1db:	51                   	push   %ecx
     1dc:	52                   	push   %edx
     1dd:	50                   	push   %eax
     1de:	e8 2b 0d 00 00       	call   f0e <exec>
    printf(2, "exec %s failed\n", ecmd->argv[0]);
     1e3:	83 c4 0c             	add    $0xc,%esp
     1e6:	ff 73 04             	push   0x4(%ebx)
     1e9:	68 f7 13 00 00       	push   $0x13f7
     1ee:	6a 02                	push   $0x2
     1f0:	e8 8b 0e 00 00       	call   1080 <printf>
    break;
     1f5:	83 c4 10             	add    $0x10,%esp
    exit();
     1f8:	e8 d9 0c 00 00       	call   ed6 <exit>
    if(fork1() == 0)
     1fd:	e8 8e ff ff ff       	call   190 <fork1>
     202:	85 c0                	test   %eax,%eax
     204:	75 f2                	jne    1f8 <runcmd+0x48>
     206:	e9 8c 00 00 00       	jmp    297 <runcmd+0xe7>
    if(pipe(p) < 0)
     20b:	83 ec 0c             	sub    $0xc,%esp
     20e:	8d 45 f0             	lea    -0x10(%ebp),%eax
     211:	50                   	push   %eax
     212:	e8 cf 0c 00 00       	call   ee6 <pipe>
     217:	83 c4 10             	add    $0x10,%esp
     21a:	85 c0                	test   %eax,%eax
     21c:	0f 88 a2 00 00 00    	js     2c4 <runcmd+0x114>
    if(fork1() == 0){
     222:	e8 69 ff ff ff       	call   190 <fork1>
     227:	85 c0                	test   %eax,%eax
     229:	0f 84 d0 00 00 00    	je     2ff <runcmd+0x14f>
    if(fork1() == 0){
     22f:	e8 5c ff ff ff       	call   190 <fork1>
     234:	85 c0                	test   %eax,%eax
     236:	0f 84 95 00 00 00    	je     2d1 <runcmd+0x121>
    close(p[0]);
     23c:	83 ec 0c             	sub    $0xc,%esp
     23f:	ff 75 f0             	push   -0x10(%ebp)
     242:	e8 b7 0c 00 00       	call   efe <close>
    close(p[1]);
     247:	58                   	pop    %eax
     248:	ff 75 f4             	push   -0xc(%ebp)
     24b:	e8 ae 0c 00 00       	call   efe <close>
    wait();
     250:	e8 89 0c 00 00       	call   ede <wait>
    wait();
     255:	e8 84 0c 00 00       	call   ede <wait>
    break;
     25a:	83 c4 10             	add    $0x10,%esp
     25d:	eb 99                	jmp    1f8 <runcmd+0x48>
    if(fork1() == 0)
     25f:	e8 2c ff ff ff       	call   190 <fork1>
     264:	85 c0                	test   %eax,%eax
     266:	74 2f                	je     297 <runcmd+0xe7>
    wait();
     268:	e8 71 0c 00 00       	call   ede <wait>
    runcmd(lcmd->right);
     26d:	83 ec 0c             	sub    $0xc,%esp
     270:	ff 73 08             	push   0x8(%ebx)
     273:	e8 38 ff ff ff       	call   1b0 <runcmd>
    close(rcmd->fd);
     278:	83 ec 0c             	sub    $0xc,%esp
     27b:	ff 73 14             	push   0x14(%ebx)
     27e:	e8 7b 0c 00 00       	call   efe <close>
    if(open(rcmd->file, rcmd->mode) < 0){
     283:	58                   	pop    %eax
     284:	5a                   	pop    %edx
     285:	ff 73 10             	push   0x10(%ebx)
     288:	ff 73 08             	push   0x8(%ebx)
     28b:	e8 86 0c 00 00       	call   f16 <open>
     290:	83 c4 10             	add    $0x10,%esp
     293:	85 c0                	test   %eax,%eax
     295:	78 18                	js     2af <runcmd+0xff>
      runcmd(bcmd->cmd);
     297:	83 ec 0c             	sub    $0xc,%esp
     29a:	ff 73 04             	push   0x4(%ebx)
     29d:	e8 0e ff ff ff       	call   1b0 <runcmd>
    panic("runcmd");
     2a2:	83 ec 0c             	sub    $0xc,%esp
     2a5:	68 f0 13 00 00       	push   $0x13f0
     2aa:	e8 c1 fe ff ff       	call   170 <panic>
      printf(2, "open %s failed\n", rcmd->file);
     2af:	51                   	push   %ecx
     2b0:	ff 73 08             	push   0x8(%ebx)
     2b3:	68 07 14 00 00       	push   $0x1407
     2b8:	6a 02                	push   $0x2
     2ba:	e8 c1 0d 00 00       	call   1080 <printf>
      exit();
     2bf:	e8 12 0c 00 00       	call   ed6 <exit>
      panic("pipe");
     2c4:	83 ec 0c             	sub    $0xc,%esp
     2c7:	68 17 14 00 00       	push   $0x1417
     2cc:	e8 9f fe ff ff       	call   170 <panic>
      close(0);
     2d1:	83 ec 0c             	sub    $0xc,%esp
     2d4:	6a 00                	push   $0x0
     2d6:	e8 23 0c 00 00       	call   efe <close>
      dup(p[0]);
     2db:	5a                   	pop    %edx
     2dc:	ff 75 f0             	push   -0x10(%ebp)
     2df:	e8 6a 0c 00 00       	call   f4e <dup>
      close(p[0]);
     2e4:	59                   	pop    %ecx
     2e5:	ff 75 f0             	push   -0x10(%ebp)
     2e8:	e8 11 0c 00 00       	call   efe <close>
      close(p[1]);
     2ed:	58                   	pop    %eax
     2ee:	ff 75 f4             	push   -0xc(%ebp)
     2f1:	e8 08 0c 00 00       	call   efe <close>
      runcmd(pcmd->right);
     2f6:	58                   	pop    %eax
     2f7:	ff 73 08             	push   0x8(%ebx)
     2fa:	e8 b1 fe ff ff       	call   1b0 <runcmd>
      close(1);
     2ff:	83 ec 0c             	sub    $0xc,%esp
     302:	6a 01                	push   $0x1
     304:	e8 f5 0b 00 00       	call   efe <close>
      dup(p[1]);
     309:	58                   	pop    %eax
     30a:	ff 75 f4             	push   -0xc(%ebp)
     30d:	e8 3c 0c 00 00       	call   f4e <dup>
      close(p[0]);
     312:	58                   	pop    %eax
     313:	ff 75 f0             	push   -0x10(%ebp)
     316:	e8 e3 0b 00 00       	call   efe <close>
      close(p[1]);
     31b:	58                   	pop    %eax
     31c:	ff 75 f4             	push   -0xc(%ebp)
     31f:	e8 da 0b 00 00       	call   efe <close>
      runcmd(pcmd->left);
     324:	5a                   	pop    %edx
     325:	ff 73 04             	push   0x4(%ebx)
     328:	e8 83 fe ff ff       	call   1b0 <runcmd>
     32d:	8d 76 00             	lea    0x0(%esi),%esi

00000330 <execcmd>:
//PAGEBREAK!
// Constructors

struct cmd*
execcmd(void)
{
     330:	55                   	push   %ebp
     331:	89 e5                	mov    %esp,%ebp
     333:	53                   	push   %ebx
     334:	83 ec 10             	sub    $0x10,%esp
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     337:	6a 54                	push   $0x54
     339:	e8 c2 0f 00 00       	call   1300 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     33e:	83 c4 0c             	add    $0xc,%esp
     341:	6a 54                	push   $0x54
  cmd = malloc(sizeof(*cmd));
     343:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     345:	6a 00                	push   $0x0
     347:	50                   	push   %eax
     348:	e8 63 09 00 00       	call   cb0 <memset>
  cmd->type = EXEC;
     34d:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
  return (struct cmd*)cmd;
}
     353:	89 d8                	mov    %ebx,%eax
     355:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     358:	c9                   	leave
     359:	c3                   	ret
     35a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000360 <redircmd>:

struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
     360:	55                   	push   %ebp
     361:	89 e5                	mov    %esp,%ebp
     363:	53                   	push   %ebx
     364:	83 ec 10             	sub    $0x10,%esp
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     367:	6a 18                	push   $0x18
     369:	e8 92 0f 00 00       	call   1300 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     36e:	83 c4 0c             	add    $0xc,%esp
     371:	6a 18                	push   $0x18
  cmd = malloc(sizeof(*cmd));
     373:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     375:	6a 00                	push   $0x0
     377:	50                   	push   %eax
     378:	e8 33 09 00 00       	call   cb0 <memset>
  cmd->type = REDIR;
  cmd->cmd = subcmd;
     37d:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = REDIR;
     380:	c7 03 02 00 00 00    	movl   $0x2,(%ebx)
  cmd->cmd = subcmd;
     386:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->file = file;
     389:	8b 45 0c             	mov    0xc(%ebp),%eax
     38c:	89 43 08             	mov    %eax,0x8(%ebx)
  cmd->efile = efile;
     38f:	8b 45 10             	mov    0x10(%ebp),%eax
     392:	89 43 0c             	mov    %eax,0xc(%ebx)
  cmd->mode = mode;
     395:	8b 45 14             	mov    0x14(%ebp),%eax
     398:	89 43 10             	mov    %eax,0x10(%ebx)
  cmd->fd = fd;
     39b:	8b 45 18             	mov    0x18(%ebp),%eax
     39e:	89 43 14             	mov    %eax,0x14(%ebx)
  return (struct cmd*)cmd;
}
     3a1:	89 d8                	mov    %ebx,%eax
     3a3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     3a6:	c9                   	leave
     3a7:	c3                   	ret
     3a8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     3af:	00 

000003b0 <pipecmd>:

struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
     3b0:	55                   	push   %ebp
     3b1:	89 e5                	mov    %esp,%ebp
     3b3:	53                   	push   %ebx
     3b4:	83 ec 10             	sub    $0x10,%esp
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     3b7:	6a 0c                	push   $0xc
     3b9:	e8 42 0f 00 00       	call   1300 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     3be:	83 c4 0c             	add    $0xc,%esp
     3c1:	6a 0c                	push   $0xc
  cmd = malloc(sizeof(*cmd));
     3c3:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     3c5:	6a 00                	push   $0x0
     3c7:	50                   	push   %eax
     3c8:	e8 e3 08 00 00       	call   cb0 <memset>
  cmd->type = PIPE;
  cmd->left = left;
     3cd:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = PIPE;
     3d0:	c7 03 03 00 00 00    	movl   $0x3,(%ebx)
  cmd->left = left;
     3d6:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     3d9:	8b 45 0c             	mov    0xc(%ebp),%eax
     3dc:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     3df:	89 d8                	mov    %ebx,%eax
     3e1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     3e4:	c9                   	leave
     3e5:	c3                   	ret
     3e6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     3ed:	00 
     3ee:	66 90                	xchg   %ax,%ax

000003f0 <listcmd>:

struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
     3f0:	55                   	push   %ebp
     3f1:	89 e5                	mov    %esp,%ebp
     3f3:	53                   	push   %ebx
     3f4:	83 ec 10             	sub    $0x10,%esp
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     3f7:	6a 0c                	push   $0xc
     3f9:	e8 02 0f 00 00       	call   1300 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     3fe:	83 c4 0c             	add    $0xc,%esp
     401:	6a 0c                	push   $0xc
  cmd = malloc(sizeof(*cmd));
     403:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     405:	6a 00                	push   $0x0
     407:	50                   	push   %eax
     408:	e8 a3 08 00 00       	call   cb0 <memset>
  cmd->type = LIST;
  cmd->left = left;
     40d:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = LIST;
     410:	c7 03 04 00 00 00    	movl   $0x4,(%ebx)
  cmd->left = left;
     416:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     419:	8b 45 0c             	mov    0xc(%ebp),%eax
     41c:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     41f:	89 d8                	mov    %ebx,%eax
     421:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     424:	c9                   	leave
     425:	c3                   	ret
     426:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     42d:	00 
     42e:	66 90                	xchg   %ax,%ax

00000430 <backcmd>:

struct cmd*
backcmd(struct cmd *subcmd)
{
     430:	55                   	push   %ebp
     431:	89 e5                	mov    %esp,%ebp
     433:	53                   	push   %ebx
     434:	83 ec 10             	sub    $0x10,%esp
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     437:	6a 08                	push   $0x8
     439:	e8 c2 0e 00 00       	call   1300 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     43e:	83 c4 0c             	add    $0xc,%esp
     441:	6a 08                	push   $0x8
  cmd = malloc(sizeof(*cmd));
     443:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     445:	6a 00                	push   $0x0
     447:	50                   	push   %eax
     448:	e8 63 08 00 00       	call   cb0 <memset>
  cmd->type = BACK;
  cmd->cmd = subcmd;
     44d:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = BACK;
     450:	c7 03 05 00 00 00    	movl   $0x5,(%ebx)
  cmd->cmd = subcmd;
     456:	89 43 04             	mov    %eax,0x4(%ebx)
  return (struct cmd*)cmd;
}
     459:	89 d8                	mov    %ebx,%eax
     45b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     45e:	c9                   	leave
     45f:	c3                   	ret

00000460 <gettoken>:
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
     460:	55                   	push   %ebp
     461:	89 e5                	mov    %esp,%ebp
     463:	57                   	push   %edi
     464:	56                   	push   %esi
     465:	53                   	push   %ebx
     466:	83 ec 0c             	sub    $0xc,%esp
  char *s;
  int ret;

  s = *ps;
     469:	8b 45 08             	mov    0x8(%ebp),%eax
{
     46c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     46f:	8b 75 10             	mov    0x10(%ebp),%esi
  s = *ps;
     472:	8b 38                	mov    (%eax),%edi
  while(s < es && strchr(whitespace, *s))
     474:	39 df                	cmp    %ebx,%edi
     476:	72 0f                	jb     487 <gettoken+0x27>
     478:	eb 25                	jmp    49f <gettoken+0x3f>
     47a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    s++;
     480:	83 c7 01             	add    $0x1,%edi
  while(s < es && strchr(whitespace, *s))
     483:	39 fb                	cmp    %edi,%ebx
     485:	74 18                	je     49f <gettoken+0x3f>
     487:	0f be 07             	movsbl (%edi),%eax
     48a:	83 ec 08             	sub    $0x8,%esp
     48d:	50                   	push   %eax
     48e:	68 54 15 00 00       	push   $0x1554
     493:	e8 38 08 00 00       	call   cd0 <strchr>
     498:	83 c4 10             	add    $0x10,%esp
     49b:	85 c0                	test   %eax,%eax
     49d:	75 e1                	jne    480 <gettoken+0x20>
  if(q)
     49f:	85 f6                	test   %esi,%esi
     4a1:	74 02                	je     4a5 <gettoken+0x45>
    *q = s;
     4a3:	89 3e                	mov    %edi,(%esi)
  ret = *s;
     4a5:	0f b6 07             	movzbl (%edi),%eax
  switch(*s){
     4a8:	3c 3c                	cmp    $0x3c,%al
     4aa:	0f 8f c8 00 00 00    	jg     578 <gettoken+0x118>
     4b0:	3c 3a                	cmp    $0x3a,%al
     4b2:	7f 5a                	jg     50e <gettoken+0xae>
     4b4:	84 c0                	test   %al,%al
     4b6:	75 48                	jne    500 <gettoken+0xa0>
     4b8:	31 f6                	xor    %esi,%esi
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
  }
  if(eq)
     4ba:	8b 4d 14             	mov    0x14(%ebp),%ecx
     4bd:	85 c9                	test   %ecx,%ecx
     4bf:	74 05                	je     4c6 <gettoken+0x66>
    *eq = s;
     4c1:	8b 45 14             	mov    0x14(%ebp),%eax
     4c4:	89 38                	mov    %edi,(%eax)

  while(s < es && strchr(whitespace, *s))
     4c6:	39 df                	cmp    %ebx,%edi
     4c8:	72 0d                	jb     4d7 <gettoken+0x77>
     4ca:	eb 23                	jmp    4ef <gettoken+0x8f>
     4cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    s++;
     4d0:	83 c7 01             	add    $0x1,%edi
  while(s < es && strchr(whitespace, *s))
     4d3:	39 fb                	cmp    %edi,%ebx
     4d5:	74 18                	je     4ef <gettoken+0x8f>
     4d7:	0f be 07             	movsbl (%edi),%eax
     4da:	83 ec 08             	sub    $0x8,%esp
     4dd:	50                   	push   %eax
     4de:	68 54 15 00 00       	push   $0x1554
     4e3:	e8 e8 07 00 00       	call   cd0 <strchr>
     4e8:	83 c4 10             	add    $0x10,%esp
     4eb:	85 c0                	test   %eax,%eax
     4ed:	75 e1                	jne    4d0 <gettoken+0x70>
  *ps = s;
     4ef:	8b 45 08             	mov    0x8(%ebp),%eax
     4f2:	89 38                	mov    %edi,(%eax)
  return ret;
}
     4f4:	8d 65 f4             	lea    -0xc(%ebp),%esp
     4f7:	89 f0                	mov    %esi,%eax
     4f9:	5b                   	pop    %ebx
     4fa:	5e                   	pop    %esi
     4fb:	5f                   	pop    %edi
     4fc:	5d                   	pop    %ebp
     4fd:	c3                   	ret
     4fe:	66 90                	xchg   %ax,%ax
  switch(*s){
     500:	78 22                	js     524 <gettoken+0xc4>
     502:	3c 26                	cmp    $0x26,%al
     504:	74 08                	je     50e <gettoken+0xae>
     506:	8d 48 d8             	lea    -0x28(%eax),%ecx
     509:	80 f9 01             	cmp    $0x1,%cl
     50c:	77 16                	ja     524 <gettoken+0xc4>
  ret = *s;
     50e:	0f be f0             	movsbl %al,%esi
    s++;
     511:	83 c7 01             	add    $0x1,%edi
    break;
     514:	eb a4                	jmp    4ba <gettoken+0x5a>
     516:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     51d:	00 
     51e:	66 90                	xchg   %ax,%ax
  switch(*s){
     520:	3c 7c                	cmp    $0x7c,%al
     522:	74 ea                	je     50e <gettoken+0xae>
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     524:	39 df                	cmp    %ebx,%edi
     526:	72 27                	jb     54f <gettoken+0xef>
     528:	e9 87 00 00 00       	jmp    5b4 <gettoken+0x154>
     52d:	8d 76 00             	lea    0x0(%esi),%esi
     530:	0f be 07             	movsbl (%edi),%eax
     533:	83 ec 08             	sub    $0x8,%esp
     536:	50                   	push   %eax
     537:	68 4c 15 00 00       	push   $0x154c
     53c:	e8 8f 07 00 00       	call   cd0 <strchr>
     541:	83 c4 10             	add    $0x10,%esp
     544:	85 c0                	test   %eax,%eax
     546:	75 1f                	jne    567 <gettoken+0x107>
      s++;
     548:	83 c7 01             	add    $0x1,%edi
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     54b:	39 fb                	cmp    %edi,%ebx
     54d:	74 4d                	je     59c <gettoken+0x13c>
     54f:	0f be 07             	movsbl (%edi),%eax
     552:	83 ec 08             	sub    $0x8,%esp
     555:	50                   	push   %eax
     556:	68 54 15 00 00       	push   $0x1554
     55b:	e8 70 07 00 00       	call   cd0 <strchr>
     560:	83 c4 10             	add    $0x10,%esp
     563:	85 c0                	test   %eax,%eax
     565:	74 c9                	je     530 <gettoken+0xd0>
    ret = 'a';
     567:	be 61 00 00 00       	mov    $0x61,%esi
     56c:	e9 49 ff ff ff       	jmp    4ba <gettoken+0x5a>
     571:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  switch(*s){
     578:	3c 3e                	cmp    $0x3e,%al
     57a:	75 a4                	jne    520 <gettoken+0xc0>
    if(*s == '>'){
     57c:	80 7f 01 3e          	cmpb   $0x3e,0x1(%edi)
     580:	74 0d                	je     58f <gettoken+0x12f>
    s++;
     582:	83 c7 01             	add    $0x1,%edi
  ret = *s;
     585:	be 3e 00 00 00       	mov    $0x3e,%esi
     58a:	e9 2b ff ff ff       	jmp    4ba <gettoken+0x5a>
      s++;
     58f:	83 c7 02             	add    $0x2,%edi
      ret = '+';
     592:	be 2b 00 00 00       	mov    $0x2b,%esi
     597:	e9 1e ff ff ff       	jmp    4ba <gettoken+0x5a>
  if(eq)
     59c:	8b 45 14             	mov    0x14(%ebp),%eax
     59f:	85 c0                	test   %eax,%eax
     5a1:	74 05                	je     5a8 <gettoken+0x148>
    *eq = s;
     5a3:	8b 45 14             	mov    0x14(%ebp),%eax
     5a6:	89 18                	mov    %ebx,(%eax)
  while(s < es && strchr(whitespace, *s))
     5a8:	89 df                	mov    %ebx,%edi
    ret = 'a';
     5aa:	be 61 00 00 00       	mov    $0x61,%esi
     5af:	e9 3b ff ff ff       	jmp    4ef <gettoken+0x8f>
  if(eq)
     5b4:	8b 55 14             	mov    0x14(%ebp),%edx
     5b7:	85 d2                	test   %edx,%edx
     5b9:	74 ef                	je     5aa <gettoken+0x14a>
    *eq = s;
     5bb:	8b 45 14             	mov    0x14(%ebp),%eax
     5be:	89 38                	mov    %edi,(%eax)
  while(s < es && strchr(whitespace, *s))
     5c0:	eb e8                	jmp    5aa <gettoken+0x14a>
     5c2:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     5c9:	00 
     5ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000005d0 <peek>:

int
peek(char **ps, char *es, char *toks)
{
     5d0:	55                   	push   %ebp
     5d1:	89 e5                	mov    %esp,%ebp
     5d3:	57                   	push   %edi
     5d4:	56                   	push   %esi
     5d5:	53                   	push   %ebx
     5d6:	83 ec 0c             	sub    $0xc,%esp
     5d9:	8b 7d 08             	mov    0x8(%ebp),%edi
     5dc:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *s;

  s = *ps;
     5df:	8b 1f                	mov    (%edi),%ebx
  while(s < es && strchr(whitespace, *s))
     5e1:	39 f3                	cmp    %esi,%ebx
     5e3:	72 12                	jb     5f7 <peek+0x27>
     5e5:	eb 28                	jmp    60f <peek+0x3f>
     5e7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     5ee:	00 
     5ef:	90                   	nop
    s++;
     5f0:	83 c3 01             	add    $0x1,%ebx
  while(s < es && strchr(whitespace, *s))
     5f3:	39 de                	cmp    %ebx,%esi
     5f5:	74 18                	je     60f <peek+0x3f>
     5f7:	0f be 03             	movsbl (%ebx),%eax
     5fa:	83 ec 08             	sub    $0x8,%esp
     5fd:	50                   	push   %eax
     5fe:	68 54 15 00 00       	push   $0x1554
     603:	e8 c8 06 00 00       	call   cd0 <strchr>
     608:	83 c4 10             	add    $0x10,%esp
     60b:	85 c0                	test   %eax,%eax
     60d:	75 e1                	jne    5f0 <peek+0x20>
  *ps = s;
     60f:	89 1f                	mov    %ebx,(%edi)
  return *s && strchr(toks, *s);
     611:	0f be 03             	movsbl (%ebx),%eax
     614:	31 d2                	xor    %edx,%edx
     616:	84 c0                	test   %al,%al
     618:	75 0e                	jne    628 <peek+0x58>
}
     61a:	8d 65 f4             	lea    -0xc(%ebp),%esp
     61d:	89 d0                	mov    %edx,%eax
     61f:	5b                   	pop    %ebx
     620:	5e                   	pop    %esi
     621:	5f                   	pop    %edi
     622:	5d                   	pop    %ebp
     623:	c3                   	ret
     624:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  return *s && strchr(toks, *s);
     628:	83 ec 08             	sub    $0x8,%esp
     62b:	50                   	push   %eax
     62c:	ff 75 10             	push   0x10(%ebp)
     62f:	e8 9c 06 00 00       	call   cd0 <strchr>
     634:	83 c4 10             	add    $0x10,%esp
     637:	31 d2                	xor    %edx,%edx
     639:	85 c0                	test   %eax,%eax
     63b:	0f 95 c2             	setne  %dl
}
     63e:	8d 65 f4             	lea    -0xc(%ebp),%esp
     641:	5b                   	pop    %ebx
     642:	89 d0                	mov    %edx,%eax
     644:	5e                   	pop    %esi
     645:	5f                   	pop    %edi
     646:	5d                   	pop    %ebp
     647:	c3                   	ret
     648:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     64f:	00 

00000650 <parseredirs>:
  return cmd;
}

struct cmd*
parseredirs(struct cmd *cmd, char **ps, char *es)
{
     650:	55                   	push   %ebp
     651:	89 e5                	mov    %esp,%ebp
     653:	57                   	push   %edi
     654:	56                   	push   %esi
     655:	53                   	push   %ebx
     656:	83 ec 2c             	sub    $0x2c,%esp
     659:	8b 75 0c             	mov    0xc(%ebp),%esi
     65c:	8b 5d 10             	mov    0x10(%ebp),%ebx
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
     65f:	90                   	nop
     660:	83 ec 04             	sub    $0x4,%esp
     663:	68 39 14 00 00       	push   $0x1439
     668:	53                   	push   %ebx
     669:	56                   	push   %esi
     66a:	e8 61 ff ff ff       	call   5d0 <peek>
     66f:	83 c4 10             	add    $0x10,%esp
     672:	85 c0                	test   %eax,%eax
     674:	0f 84 f6 00 00 00    	je     770 <parseredirs+0x120>
    tok = gettoken(ps, es, 0, 0);
     67a:	6a 00                	push   $0x0
     67c:	6a 00                	push   $0x0
     67e:	53                   	push   %ebx
     67f:	56                   	push   %esi
     680:	e8 db fd ff ff       	call   460 <gettoken>
     685:	89 c7                	mov    %eax,%edi
    if(gettoken(ps, es, &q, &eq) != 'a')
     687:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     68a:	50                   	push   %eax
     68b:	8d 45 e0             	lea    -0x20(%ebp),%eax
     68e:	50                   	push   %eax
     68f:	53                   	push   %ebx
     690:	56                   	push   %esi
     691:	e8 ca fd ff ff       	call   460 <gettoken>
     696:	83 c4 20             	add    $0x20,%esp
     699:	83 f8 61             	cmp    $0x61,%eax
     69c:	0f 85 d9 00 00 00    	jne    77b <parseredirs+0x12b>
      panic("missing file for redirection");
    switch(tok){
     6a2:	83 ff 3c             	cmp    $0x3c,%edi
     6a5:	74 69                	je     710 <parseredirs+0xc0>
     6a7:	83 ff 3e             	cmp    $0x3e,%edi
     6aa:	74 05                	je     6b1 <parseredirs+0x61>
     6ac:	83 ff 2b             	cmp    $0x2b,%edi
     6af:	75 af                	jne    660 <parseredirs+0x10>
      break;
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     6b1:	8b 55 e4             	mov    -0x1c(%ebp),%edx
     6b4:	8b 4d e0             	mov    -0x20(%ebp),%ecx
  cmd = malloc(sizeof(*cmd));
     6b7:	83 ec 0c             	sub    $0xc,%esp
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     6ba:	89 55 d0             	mov    %edx,-0x30(%ebp)
     6bd:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
  cmd = malloc(sizeof(*cmd));
     6c0:	6a 18                	push   $0x18
     6c2:	e8 39 0c 00 00       	call   1300 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     6c7:	83 c4 0c             	add    $0xc,%esp
     6ca:	6a 18                	push   $0x18
  cmd = malloc(sizeof(*cmd));
     6cc:	89 c7                	mov    %eax,%edi
  memset(cmd, 0, sizeof(*cmd));
     6ce:	6a 00                	push   $0x0
     6d0:	50                   	push   %eax
     6d1:	e8 da 05 00 00       	call   cb0 <memset>
  cmd->type = REDIR;
     6d6:	c7 07 02 00 00 00    	movl   $0x2,(%edi)
  cmd->cmd = subcmd;
     6dc:	8b 45 08             	mov    0x8(%ebp),%eax
      break;
     6df:	83 c4 10             	add    $0x10,%esp
  cmd->cmd = subcmd;
     6e2:	89 47 04             	mov    %eax,0x4(%edi)
  cmd->file = file;
     6e5:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
     6e8:	89 4f 08             	mov    %ecx,0x8(%edi)
  cmd->efile = efile;
     6eb:	8b 55 d0             	mov    -0x30(%ebp),%edx
  cmd->mode = mode;
     6ee:	c7 47 10 01 02 00 00 	movl   $0x201,0x10(%edi)
  cmd->efile = efile;
     6f5:	89 57 0c             	mov    %edx,0xc(%edi)
  cmd->fd = fd;
     6f8:	c7 47 14 01 00 00 00 	movl   $0x1,0x14(%edi)
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     6ff:	89 7d 08             	mov    %edi,0x8(%ebp)
      break;
     702:	e9 59 ff ff ff       	jmp    660 <parseredirs+0x10>
     707:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     70e:	00 
     70f:	90                   	nop
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     710:	8b 55 e4             	mov    -0x1c(%ebp),%edx
     713:	8b 4d e0             	mov    -0x20(%ebp),%ecx
  cmd = malloc(sizeof(*cmd));
     716:	83 ec 0c             	sub    $0xc,%esp
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     719:	89 55 d0             	mov    %edx,-0x30(%ebp)
     71c:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
  cmd = malloc(sizeof(*cmd));
     71f:	6a 18                	push   $0x18
     721:	e8 da 0b 00 00       	call   1300 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     726:	83 c4 0c             	add    $0xc,%esp
     729:	6a 18                	push   $0x18
  cmd = malloc(sizeof(*cmd));
     72b:	89 c7                	mov    %eax,%edi
  memset(cmd, 0, sizeof(*cmd));
     72d:	6a 00                	push   $0x0
     72f:	50                   	push   %eax
     730:	e8 7b 05 00 00       	call   cb0 <memset>
  cmd->cmd = subcmd;
     735:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->file = file;
     738:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      break;
     73b:	83 c4 10             	add    $0x10,%esp
  cmd->efile = efile;
     73e:	8b 55 d0             	mov    -0x30(%ebp),%edx
  cmd->type = REDIR;
     741:	c7 07 02 00 00 00    	movl   $0x2,(%edi)
  cmd->cmd = subcmd;
     747:	89 47 04             	mov    %eax,0x4(%edi)
  cmd->file = file;
     74a:	89 4f 08             	mov    %ecx,0x8(%edi)
  cmd->efile = efile;
     74d:	89 57 0c             	mov    %edx,0xc(%edi)
  cmd->mode = mode;
     750:	c7 47 10 00 00 00 00 	movl   $0x0,0x10(%edi)
  cmd->fd = fd;
     757:	c7 47 14 00 00 00 00 	movl   $0x0,0x14(%edi)
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     75e:	89 7d 08             	mov    %edi,0x8(%ebp)
      break;
     761:	e9 fa fe ff ff       	jmp    660 <parseredirs+0x10>
     766:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     76d:	00 
     76e:	66 90                	xchg   %ax,%ax
    }
  }
  return cmd;
}
     770:	8b 45 08             	mov    0x8(%ebp),%eax
     773:	8d 65 f4             	lea    -0xc(%ebp),%esp
     776:	5b                   	pop    %ebx
     777:	5e                   	pop    %esi
     778:	5f                   	pop    %edi
     779:	5d                   	pop    %ebp
     77a:	c3                   	ret
      panic("missing file for redirection");
     77b:	83 ec 0c             	sub    $0xc,%esp
     77e:	68 1c 14 00 00       	push   $0x141c
     783:	e8 e8 f9 ff ff       	call   170 <panic>
     788:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     78f:	00 

00000790 <parseexec>:
  return cmd;
}

struct cmd*
parseexec(char **ps, char *es)
{
     790:	55                   	push   %ebp
     791:	89 e5                	mov    %esp,%ebp
     793:	57                   	push   %edi
     794:	56                   	push   %esi
     795:	53                   	push   %ebx
     796:	83 ec 30             	sub    $0x30,%esp
     799:	8b 5d 08             	mov    0x8(%ebp),%ebx
     79c:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;

  if(peek(ps, es, "("))
     79f:	68 3c 14 00 00       	push   $0x143c
     7a4:	56                   	push   %esi
     7a5:	53                   	push   %ebx
     7a6:	e8 25 fe ff ff       	call   5d0 <peek>
     7ab:	83 c4 10             	add    $0x10,%esp
     7ae:	85 c0                	test   %eax,%eax
     7b0:	0f 85 aa 00 00 00    	jne    860 <parseexec+0xd0>
  cmd = malloc(sizeof(*cmd));
     7b6:	83 ec 0c             	sub    $0xc,%esp
     7b9:	89 c7                	mov    %eax,%edi
     7bb:	6a 54                	push   $0x54
     7bd:	e8 3e 0b 00 00       	call   1300 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     7c2:	83 c4 0c             	add    $0xc,%esp
     7c5:	6a 54                	push   $0x54
     7c7:	6a 00                	push   $0x0
     7c9:	89 45 d0             	mov    %eax,-0x30(%ebp)
     7cc:	50                   	push   %eax
     7cd:	e8 de 04 00 00       	call   cb0 <memset>
  cmd->type = EXEC;
     7d2:	8b 45 d0             	mov    -0x30(%ebp),%eax

  ret = execcmd();
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
     7d5:	83 c4 0c             	add    $0xc,%esp
  cmd->type = EXEC;
     7d8:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  ret = parseredirs(ret, ps, es);
     7de:	56                   	push   %esi
     7df:	53                   	push   %ebx
     7e0:	50                   	push   %eax
     7e1:	e8 6a fe ff ff       	call   650 <parseredirs>
  while(!peek(ps, es, "|)&;")){
     7e6:	83 c4 10             	add    $0x10,%esp
  ret = parseredirs(ret, ps, es);
     7e9:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  while(!peek(ps, es, "|)&;")){
     7ec:	eb 15                	jmp    803 <parseexec+0x73>
     7ee:	66 90                	xchg   %ax,%ax
    cmd->argv[argc] = q;
    cmd->eargv[argc] = eq;
    argc++;
    if(argc >= MAXARGS)
      panic("too many args");
    ret = parseredirs(ret, ps, es);
     7f0:	83 ec 04             	sub    $0x4,%esp
     7f3:	56                   	push   %esi
     7f4:	53                   	push   %ebx
     7f5:	ff 75 d4             	push   -0x2c(%ebp)
     7f8:	e8 53 fe ff ff       	call   650 <parseredirs>
     7fd:	83 c4 10             	add    $0x10,%esp
     800:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  while(!peek(ps, es, "|)&;")){
     803:	83 ec 04             	sub    $0x4,%esp
     806:	68 53 14 00 00       	push   $0x1453
     80b:	56                   	push   %esi
     80c:	53                   	push   %ebx
     80d:	e8 be fd ff ff       	call   5d0 <peek>
     812:	83 c4 10             	add    $0x10,%esp
     815:	85 c0                	test   %eax,%eax
     817:	75 5f                	jne    878 <parseexec+0xe8>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
     819:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     81c:	50                   	push   %eax
     81d:	8d 45 e0             	lea    -0x20(%ebp),%eax
     820:	50                   	push   %eax
     821:	56                   	push   %esi
     822:	53                   	push   %ebx
     823:	e8 38 fc ff ff       	call   460 <gettoken>
     828:	83 c4 10             	add    $0x10,%esp
     82b:	85 c0                	test   %eax,%eax
     82d:	74 49                	je     878 <parseexec+0xe8>
    if(tok != 'a')
     82f:	83 f8 61             	cmp    $0x61,%eax
     832:	75 62                	jne    896 <parseexec+0x106>
    cmd->argv[argc] = q;
     834:	8b 45 e0             	mov    -0x20(%ebp),%eax
     837:	8b 55 d0             	mov    -0x30(%ebp),%edx
     83a:	89 44 ba 04          	mov    %eax,0x4(%edx,%edi,4)
    cmd->eargv[argc] = eq;
     83e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     841:	89 44 ba 2c          	mov    %eax,0x2c(%edx,%edi,4)
    argc++;
     845:	83 c7 01             	add    $0x1,%edi
    if(argc >= MAXARGS)
     848:	83 ff 0a             	cmp    $0xa,%edi
     84b:	75 a3                	jne    7f0 <parseexec+0x60>
      panic("too many args");
     84d:	83 ec 0c             	sub    $0xc,%esp
     850:	68 45 14 00 00       	push   $0x1445
     855:	e8 16 f9 ff ff       	call   170 <panic>
     85a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return parseblock(ps, es);
     860:	89 75 0c             	mov    %esi,0xc(%ebp)
     863:	89 5d 08             	mov    %ebx,0x8(%ebp)
  }
  cmd->argv[argc] = 0;
  cmd->eargv[argc] = 0;
  return ret;
}
     866:	8d 65 f4             	lea    -0xc(%ebp),%esp
     869:	5b                   	pop    %ebx
     86a:	5e                   	pop    %esi
     86b:	5f                   	pop    %edi
     86c:	5d                   	pop    %ebp
    return parseblock(ps, es);
     86d:	e9 ae 01 00 00       	jmp    a20 <parseblock>
     872:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  cmd->argv[argc] = 0;
     878:	8b 45 d0             	mov    -0x30(%ebp),%eax
     87b:	c7 44 b8 04 00 00 00 	movl   $0x0,0x4(%eax,%edi,4)
     882:	00 
  cmd->eargv[argc] = 0;
     883:	c7 44 b8 2c 00 00 00 	movl   $0x0,0x2c(%eax,%edi,4)
     88a:	00 
}
     88b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     88e:	8d 65 f4             	lea    -0xc(%ebp),%esp
     891:	5b                   	pop    %ebx
     892:	5e                   	pop    %esi
     893:	5f                   	pop    %edi
     894:	5d                   	pop    %ebp
     895:	c3                   	ret
      panic("syntax");
     896:	83 ec 0c             	sub    $0xc,%esp
     899:	68 3e 14 00 00       	push   $0x143e
     89e:	e8 cd f8 ff ff       	call   170 <panic>
     8a3:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     8aa:	00 
     8ab:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

000008b0 <parsepipe>:
{
     8b0:	55                   	push   %ebp
     8b1:	89 e5                	mov    %esp,%ebp
     8b3:	57                   	push   %edi
     8b4:	56                   	push   %esi
     8b5:	53                   	push   %ebx
     8b6:	83 ec 14             	sub    $0x14,%esp
     8b9:	8b 75 08             	mov    0x8(%ebp),%esi
     8bc:	8b 7d 0c             	mov    0xc(%ebp),%edi
  cmd = parseexec(ps, es);
     8bf:	57                   	push   %edi
     8c0:	56                   	push   %esi
     8c1:	e8 ca fe ff ff       	call   790 <parseexec>
  if(peek(ps, es, "|")){
     8c6:	83 c4 0c             	add    $0xc,%esp
     8c9:	68 58 14 00 00       	push   $0x1458
  cmd = parseexec(ps, es);
     8ce:	89 c3                	mov    %eax,%ebx
  if(peek(ps, es, "|")){
     8d0:	57                   	push   %edi
     8d1:	56                   	push   %esi
     8d2:	e8 f9 fc ff ff       	call   5d0 <peek>
     8d7:	83 c4 10             	add    $0x10,%esp
     8da:	85 c0                	test   %eax,%eax
     8dc:	75 12                	jne    8f0 <parsepipe+0x40>
}
     8de:	8d 65 f4             	lea    -0xc(%ebp),%esp
     8e1:	89 d8                	mov    %ebx,%eax
     8e3:	5b                   	pop    %ebx
     8e4:	5e                   	pop    %esi
     8e5:	5f                   	pop    %edi
     8e6:	5d                   	pop    %ebp
     8e7:	c3                   	ret
     8e8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     8ef:	00 
    gettoken(ps, es, 0, 0);
     8f0:	6a 00                	push   $0x0
     8f2:	6a 00                	push   $0x0
     8f4:	57                   	push   %edi
     8f5:	56                   	push   %esi
     8f6:	e8 65 fb ff ff       	call   460 <gettoken>
    cmd = pipecmd(cmd, parsepipe(ps, es));
     8fb:	58                   	pop    %eax
     8fc:	5a                   	pop    %edx
     8fd:	57                   	push   %edi
     8fe:	56                   	push   %esi
     8ff:	e8 ac ff ff ff       	call   8b0 <parsepipe>
  cmd = malloc(sizeof(*cmd));
     904:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
    cmd = pipecmd(cmd, parsepipe(ps, es));
     90b:	89 c7                	mov    %eax,%edi
  cmd = malloc(sizeof(*cmd));
     90d:	e8 ee 09 00 00       	call   1300 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     912:	83 c4 0c             	add    $0xc,%esp
     915:	6a 0c                	push   $0xc
  cmd = malloc(sizeof(*cmd));
     917:	89 c6                	mov    %eax,%esi
  memset(cmd, 0, sizeof(*cmd));
     919:	6a 00                	push   $0x0
     91b:	50                   	push   %eax
     91c:	e8 8f 03 00 00       	call   cb0 <memset>
  cmd->left = left;
     921:	89 5e 04             	mov    %ebx,0x4(%esi)
  cmd->right = right;
     924:	83 c4 10             	add    $0x10,%esp
    cmd = pipecmd(cmd, parsepipe(ps, es));
     927:	89 f3                	mov    %esi,%ebx
  cmd->type = PIPE;
     929:	c7 06 03 00 00 00    	movl   $0x3,(%esi)
}
     92f:	89 d8                	mov    %ebx,%eax
  cmd->right = right;
     931:	89 7e 08             	mov    %edi,0x8(%esi)
}
     934:	8d 65 f4             	lea    -0xc(%ebp),%esp
     937:	5b                   	pop    %ebx
     938:	5e                   	pop    %esi
     939:	5f                   	pop    %edi
     93a:	5d                   	pop    %ebp
     93b:	c3                   	ret
     93c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000940 <parseline>:
{
     940:	55                   	push   %ebp
     941:	89 e5                	mov    %esp,%ebp
     943:	57                   	push   %edi
     944:	56                   	push   %esi
     945:	53                   	push   %ebx
     946:	83 ec 24             	sub    $0x24,%esp
     949:	8b 75 08             	mov    0x8(%ebp),%esi
     94c:	8b 7d 0c             	mov    0xc(%ebp),%edi
  cmd = parsepipe(ps, es);
     94f:	57                   	push   %edi
     950:	56                   	push   %esi
     951:	e8 5a ff ff ff       	call   8b0 <parsepipe>
  while(peek(ps, es, "&")){
     956:	83 c4 10             	add    $0x10,%esp
  cmd = parsepipe(ps, es);
     959:	89 c3                	mov    %eax,%ebx
  while(peek(ps, es, "&")){
     95b:	eb 3b                	jmp    998 <parseline+0x58>
     95d:	8d 76 00             	lea    0x0(%esi),%esi
    gettoken(ps, es, 0, 0);
     960:	6a 00                	push   $0x0
     962:	6a 00                	push   $0x0
     964:	57                   	push   %edi
     965:	56                   	push   %esi
     966:	e8 f5 fa ff ff       	call   460 <gettoken>
  cmd = malloc(sizeof(*cmd));
     96b:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
     972:	e8 89 09 00 00       	call   1300 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     977:	83 c4 0c             	add    $0xc,%esp
     97a:	6a 08                	push   $0x8
     97c:	6a 00                	push   $0x0
     97e:	50                   	push   %eax
     97f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     982:	e8 29 03 00 00       	call   cb0 <memset>
  cmd->type = BACK;
     987:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  cmd->cmd = subcmd;
     98a:	83 c4 10             	add    $0x10,%esp
  cmd->type = BACK;
     98d:	c7 02 05 00 00 00    	movl   $0x5,(%edx)
  cmd->cmd = subcmd;
     993:	89 5a 04             	mov    %ebx,0x4(%edx)
    cmd = backcmd(cmd);
     996:	89 d3                	mov    %edx,%ebx
  while(peek(ps, es, "&")){
     998:	83 ec 04             	sub    $0x4,%esp
     99b:	68 5a 14 00 00       	push   $0x145a
     9a0:	57                   	push   %edi
     9a1:	56                   	push   %esi
     9a2:	e8 29 fc ff ff       	call   5d0 <peek>
     9a7:	83 c4 10             	add    $0x10,%esp
     9aa:	85 c0                	test   %eax,%eax
     9ac:	75 b2                	jne    960 <parseline+0x20>
  if(peek(ps, es, ";")){
     9ae:	83 ec 04             	sub    $0x4,%esp
     9b1:	68 56 14 00 00       	push   $0x1456
     9b6:	57                   	push   %edi
     9b7:	56                   	push   %esi
     9b8:	e8 13 fc ff ff       	call   5d0 <peek>
     9bd:	83 c4 10             	add    $0x10,%esp
     9c0:	85 c0                	test   %eax,%eax
     9c2:	75 0c                	jne    9d0 <parseline+0x90>
}
     9c4:	8d 65 f4             	lea    -0xc(%ebp),%esp
     9c7:	89 d8                	mov    %ebx,%eax
     9c9:	5b                   	pop    %ebx
     9ca:	5e                   	pop    %esi
     9cb:	5f                   	pop    %edi
     9cc:	5d                   	pop    %ebp
     9cd:	c3                   	ret
     9ce:	66 90                	xchg   %ax,%ax
    gettoken(ps, es, 0, 0);
     9d0:	6a 00                	push   $0x0
     9d2:	6a 00                	push   $0x0
     9d4:	57                   	push   %edi
     9d5:	56                   	push   %esi
     9d6:	e8 85 fa ff ff       	call   460 <gettoken>
    cmd = listcmd(cmd, parseline(ps, es));
     9db:	58                   	pop    %eax
     9dc:	5a                   	pop    %edx
     9dd:	57                   	push   %edi
     9de:	56                   	push   %esi
     9df:	e8 5c ff ff ff       	call   940 <parseline>
  cmd = malloc(sizeof(*cmd));
     9e4:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
    cmd = listcmd(cmd, parseline(ps, es));
     9eb:	89 c7                	mov    %eax,%edi
  cmd = malloc(sizeof(*cmd));
     9ed:	e8 0e 09 00 00       	call   1300 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     9f2:	83 c4 0c             	add    $0xc,%esp
     9f5:	6a 0c                	push   $0xc
  cmd = malloc(sizeof(*cmd));
     9f7:	89 c6                	mov    %eax,%esi
  memset(cmd, 0, sizeof(*cmd));
     9f9:	6a 00                	push   $0x0
     9fb:	50                   	push   %eax
     9fc:	e8 af 02 00 00       	call   cb0 <memset>
  cmd->left = left;
     a01:	89 5e 04             	mov    %ebx,0x4(%esi)
  cmd->right = right;
     a04:	83 c4 10             	add    $0x10,%esp
    cmd = listcmd(cmd, parseline(ps, es));
     a07:	89 f3                	mov    %esi,%ebx
  cmd->type = LIST;
     a09:	c7 06 04 00 00 00    	movl   $0x4,(%esi)
}
     a0f:	89 d8                	mov    %ebx,%eax
  cmd->right = right;
     a11:	89 7e 08             	mov    %edi,0x8(%esi)
}
     a14:	8d 65 f4             	lea    -0xc(%ebp),%esp
     a17:	5b                   	pop    %ebx
     a18:	5e                   	pop    %esi
     a19:	5f                   	pop    %edi
     a1a:	5d                   	pop    %ebp
     a1b:	c3                   	ret
     a1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000a20 <parseblock>:
{
     a20:	55                   	push   %ebp
     a21:	89 e5                	mov    %esp,%ebp
     a23:	57                   	push   %edi
     a24:	56                   	push   %esi
     a25:	53                   	push   %ebx
     a26:	83 ec 10             	sub    $0x10,%esp
     a29:	8b 5d 08             	mov    0x8(%ebp),%ebx
     a2c:	8b 75 0c             	mov    0xc(%ebp),%esi
  if(!peek(ps, es, "("))
     a2f:	68 3c 14 00 00       	push   $0x143c
     a34:	56                   	push   %esi
     a35:	53                   	push   %ebx
     a36:	e8 95 fb ff ff       	call   5d0 <peek>
     a3b:	83 c4 10             	add    $0x10,%esp
     a3e:	85 c0                	test   %eax,%eax
     a40:	74 4a                	je     a8c <parseblock+0x6c>
  gettoken(ps, es, 0, 0);
     a42:	6a 00                	push   $0x0
     a44:	6a 00                	push   $0x0
     a46:	56                   	push   %esi
     a47:	53                   	push   %ebx
     a48:	e8 13 fa ff ff       	call   460 <gettoken>
  cmd = parseline(ps, es);
     a4d:	58                   	pop    %eax
     a4e:	5a                   	pop    %edx
     a4f:	56                   	push   %esi
     a50:	53                   	push   %ebx
     a51:	e8 ea fe ff ff       	call   940 <parseline>
  if(!peek(ps, es, ")"))
     a56:	83 c4 0c             	add    $0xc,%esp
     a59:	68 78 14 00 00       	push   $0x1478
  cmd = parseline(ps, es);
     a5e:	89 c7                	mov    %eax,%edi
  if(!peek(ps, es, ")"))
     a60:	56                   	push   %esi
     a61:	53                   	push   %ebx
     a62:	e8 69 fb ff ff       	call   5d0 <peek>
     a67:	83 c4 10             	add    $0x10,%esp
     a6a:	85 c0                	test   %eax,%eax
     a6c:	74 2b                	je     a99 <parseblock+0x79>
  gettoken(ps, es, 0, 0);
     a6e:	6a 00                	push   $0x0
     a70:	6a 00                	push   $0x0
     a72:	56                   	push   %esi
     a73:	53                   	push   %ebx
     a74:	e8 e7 f9 ff ff       	call   460 <gettoken>
  cmd = parseredirs(cmd, ps, es);
     a79:	83 c4 0c             	add    $0xc,%esp
     a7c:	56                   	push   %esi
     a7d:	53                   	push   %ebx
     a7e:	57                   	push   %edi
     a7f:	e8 cc fb ff ff       	call   650 <parseredirs>
}
     a84:	8d 65 f4             	lea    -0xc(%ebp),%esp
     a87:	5b                   	pop    %ebx
     a88:	5e                   	pop    %esi
     a89:	5f                   	pop    %edi
     a8a:	5d                   	pop    %ebp
     a8b:	c3                   	ret
    panic("parseblock");
     a8c:	83 ec 0c             	sub    $0xc,%esp
     a8f:	68 5c 14 00 00       	push   $0x145c
     a94:	e8 d7 f6 ff ff       	call   170 <panic>
    panic("syntax - missing )");
     a99:	83 ec 0c             	sub    $0xc,%esp
     a9c:	68 67 14 00 00       	push   $0x1467
     aa1:	e8 ca f6 ff ff       	call   170 <panic>
     aa6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     aad:	00 
     aae:	66 90                	xchg   %ax,%ax

00000ab0 <nulterminate>:

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
     ab0:	55                   	push   %ebp
     ab1:	89 e5                	mov    %esp,%ebp
     ab3:	53                   	push   %ebx
     ab4:	83 ec 04             	sub    $0x4,%esp
     ab7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
     aba:	85 db                	test   %ebx,%ebx
     abc:	74 29                	je     ae7 <nulterminate+0x37>
    return 0;

  switch(cmd->type){
     abe:	83 3b 05             	cmpl   $0x5,(%ebx)
     ac1:	77 24                	ja     ae7 <nulterminate+0x37>
     ac3:	8b 03                	mov    (%ebx),%eax
     ac5:	ff 24 85 c0 14 00 00 	jmp    *0x14c0(,%eax,4)
     acc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    nulterminate(pcmd->right);
    break;

  case LIST:
    lcmd = (struct listcmd*)cmd;
    nulterminate(lcmd->left);
     ad0:	83 ec 0c             	sub    $0xc,%esp
     ad3:	ff 73 04             	push   0x4(%ebx)
     ad6:	e8 d5 ff ff ff       	call   ab0 <nulterminate>
    nulterminate(lcmd->right);
     adb:	58                   	pop    %eax
     adc:	ff 73 08             	push   0x8(%ebx)
     adf:	e8 cc ff ff ff       	call   ab0 <nulterminate>
    break;
     ae4:	83 c4 10             	add    $0x10,%esp
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
     ae7:	89 d8                	mov    %ebx,%eax
     ae9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     aec:	c9                   	leave
     aed:	c3                   	ret
     aee:	66 90                	xchg   %ax,%ax
    nulterminate(bcmd->cmd);
     af0:	83 ec 0c             	sub    $0xc,%esp
     af3:	ff 73 04             	push   0x4(%ebx)
     af6:	e8 b5 ff ff ff       	call   ab0 <nulterminate>
}
     afb:	89 d8                	mov    %ebx,%eax
    break;
     afd:	83 c4 10             	add    $0x10,%esp
}
     b00:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     b03:	c9                   	leave
     b04:	c3                   	ret
     b05:	8d 76 00             	lea    0x0(%esi),%esi
    for(i=0; ecmd->argv[i]; i++)
     b08:	8b 4b 04             	mov    0x4(%ebx),%ecx
     b0b:	85 c9                	test   %ecx,%ecx
     b0d:	74 d8                	je     ae7 <nulterminate+0x37>
     b0f:	8d 43 08             	lea    0x8(%ebx),%eax
     b12:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     b19:	00 
     b1a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      *ecmd->eargv[i] = 0;
     b20:	8b 50 24             	mov    0x24(%eax),%edx
    for(i=0; ecmd->argv[i]; i++)
     b23:	83 c0 04             	add    $0x4,%eax
      *ecmd->eargv[i] = 0;
     b26:	c6 02 00             	movb   $0x0,(%edx)
    for(i=0; ecmd->argv[i]; i++)
     b29:	8b 50 fc             	mov    -0x4(%eax),%edx
     b2c:	85 d2                	test   %edx,%edx
     b2e:	75 f0                	jne    b20 <nulterminate+0x70>
}
     b30:	89 d8                	mov    %ebx,%eax
     b32:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     b35:	c9                   	leave
     b36:	c3                   	ret
     b37:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     b3e:	00 
     b3f:	90                   	nop
    nulterminate(rcmd->cmd);
     b40:	83 ec 0c             	sub    $0xc,%esp
     b43:	ff 73 04             	push   0x4(%ebx)
     b46:	e8 65 ff ff ff       	call   ab0 <nulterminate>
    *rcmd->efile = 0;
     b4b:	8b 43 0c             	mov    0xc(%ebx),%eax
    break;
     b4e:	83 c4 10             	add    $0x10,%esp
    *rcmd->efile = 0;
     b51:	c6 00 00             	movb   $0x0,(%eax)
}
     b54:	89 d8                	mov    %ebx,%eax
     b56:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     b59:	c9                   	leave
     b5a:	c3                   	ret
     b5b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00000b60 <parsecmd>:
{
     b60:	55                   	push   %ebp
     b61:	89 e5                	mov    %esp,%ebp
     b63:	57                   	push   %edi
     b64:	56                   	push   %esi
  cmd = parseline(&s, es);
     b65:	8d 7d 08             	lea    0x8(%ebp),%edi
{
     b68:	53                   	push   %ebx
     b69:	83 ec 18             	sub    $0x18,%esp
  es = s + strlen(s);
     b6c:	8b 5d 08             	mov    0x8(%ebp),%ebx
     b6f:	53                   	push   %ebx
     b70:	e8 0b 01 00 00       	call   c80 <strlen>
  cmd = parseline(&s, es);
     b75:	59                   	pop    %ecx
     b76:	5e                   	pop    %esi
  es = s + strlen(s);
     b77:	01 c3                	add    %eax,%ebx
  cmd = parseline(&s, es);
     b79:	53                   	push   %ebx
     b7a:	57                   	push   %edi
     b7b:	e8 c0 fd ff ff       	call   940 <parseline>
  peek(&s, es, "");
     b80:	83 c4 0c             	add    $0xc,%esp
     b83:	68 06 14 00 00       	push   $0x1406
  cmd = parseline(&s, es);
     b88:	89 c6                	mov    %eax,%esi
  peek(&s, es, "");
     b8a:	53                   	push   %ebx
     b8b:	57                   	push   %edi
     b8c:	e8 3f fa ff ff       	call   5d0 <peek>
  if(s != es){
     b91:	8b 45 08             	mov    0x8(%ebp),%eax
     b94:	83 c4 10             	add    $0x10,%esp
     b97:	39 d8                	cmp    %ebx,%eax
     b99:	75 13                	jne    bae <parsecmd+0x4e>
  nulterminate(cmd);
     b9b:	83 ec 0c             	sub    $0xc,%esp
     b9e:	56                   	push   %esi
     b9f:	e8 0c ff ff ff       	call   ab0 <nulterminate>
}
     ba4:	8d 65 f4             	lea    -0xc(%ebp),%esp
     ba7:	89 f0                	mov    %esi,%eax
     ba9:	5b                   	pop    %ebx
     baa:	5e                   	pop    %esi
     bab:	5f                   	pop    %edi
     bac:	5d                   	pop    %ebp
     bad:	c3                   	ret
    printf(2, "leftovers: %s\n", s);
     bae:	52                   	push   %edx
     baf:	50                   	push   %eax
     bb0:	68 7a 14 00 00       	push   $0x147a
     bb5:	6a 02                	push   $0x2
     bb7:	e8 c4 04 00 00       	call   1080 <printf>
    panic("syntax");
     bbc:	c7 04 24 3e 14 00 00 	movl   $0x143e,(%esp)
     bc3:	e8 a8 f5 ff ff       	call   170 <panic>
     bc8:	66 90                	xchg   %ax,%ax
     bca:	66 90                	xchg   %ax,%ax
     bcc:	66 90                	xchg   %ax,%ax
     bce:	66 90                	xchg   %ax,%ax
     bd0:	66 90                	xchg   %ax,%ax
     bd2:	66 90                	xchg   %ax,%ax
     bd4:	66 90                	xchg   %ax,%ax
     bd6:	66 90                	xchg   %ax,%ax
     bd8:	66 90                	xchg   %ax,%ax
     bda:	66 90                	xchg   %ax,%ax
     bdc:	66 90                	xchg   %ax,%ax
     bde:	66 90                	xchg   %ax,%ax

00000be0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
     be0:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
     be1:	31 c0                	xor    %eax,%eax
{
     be3:	89 e5                	mov    %esp,%ebp
     be5:	53                   	push   %ebx
     be6:	8b 4d 08             	mov    0x8(%ebp),%ecx
     be9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     bec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
     bf0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
     bf4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
     bf7:	83 c0 01             	add    $0x1,%eax
     bfa:	84 d2                	test   %dl,%dl
     bfc:	75 f2                	jne    bf0 <strcpy+0x10>
    ;
  return os;
}
     bfe:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     c01:	89 c8                	mov    %ecx,%eax
     c03:	c9                   	leave
     c04:	c3                   	ret
     c05:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     c0c:	00 
     c0d:	8d 76 00             	lea    0x0(%esi),%esi

00000c10 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     c10:	55                   	push   %ebp
     c11:	89 e5                	mov    %esp,%ebp
     c13:	53                   	push   %ebx
     c14:	8b 55 08             	mov    0x8(%ebp),%edx
     c17:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
     c1a:	0f b6 02             	movzbl (%edx),%eax
     c1d:	84 c0                	test   %al,%al
     c1f:	75 2f                	jne    c50 <strcmp+0x40>
     c21:	eb 4a                	jmp    c6d <strcmp+0x5d>
     c23:	eb 1b                	jmp    c40 <strcmp+0x30>
     c25:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     c2c:	00 
     c2d:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     c34:	00 
     c35:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     c3c:	00 
     c3d:	8d 76 00             	lea    0x0(%esi),%esi
     c40:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
     c44:	83 c2 01             	add    $0x1,%edx
     c47:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
     c4a:	84 c0                	test   %al,%al
     c4c:	74 12                	je     c60 <strcmp+0x50>
     c4e:	89 d9                	mov    %ebx,%ecx
     c50:	0f b6 19             	movzbl (%ecx),%ebx
     c53:	38 c3                	cmp    %al,%bl
     c55:	74 e9                	je     c40 <strcmp+0x30>
  return (uchar)*p - (uchar)*q;
     c57:	29 d8                	sub    %ebx,%eax
}
     c59:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     c5c:	c9                   	leave
     c5d:	c3                   	ret
     c5e:	66 90                	xchg   %ax,%ax
  return (uchar)*p - (uchar)*q;
     c60:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
     c64:	31 c0                	xor    %eax,%eax
     c66:	29 d8                	sub    %ebx,%eax
}
     c68:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     c6b:	c9                   	leave
     c6c:	c3                   	ret
  return (uchar)*p - (uchar)*q;
     c6d:	0f b6 19             	movzbl (%ecx),%ebx
     c70:	31 c0                	xor    %eax,%eax
     c72:	eb e3                	jmp    c57 <strcmp+0x47>
     c74:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     c7b:	00 
     c7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000c80 <strlen>:

uint
strlen(const char *s)
{
     c80:	55                   	push   %ebp
     c81:	89 e5                	mov    %esp,%ebp
     c83:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
     c86:	80 3a 00             	cmpb   $0x0,(%edx)
     c89:	74 15                	je     ca0 <strlen+0x20>
     c8b:	31 c0                	xor    %eax,%eax
     c8d:	8d 76 00             	lea    0x0(%esi),%esi
     c90:	83 c0 01             	add    $0x1,%eax
     c93:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
     c97:	89 c1                	mov    %eax,%ecx
     c99:	75 f5                	jne    c90 <strlen+0x10>
    ;
  return n;
}
     c9b:	89 c8                	mov    %ecx,%eax
     c9d:	5d                   	pop    %ebp
     c9e:	c3                   	ret
     c9f:	90                   	nop
  for(n = 0; s[n]; n++)
     ca0:	31 c9                	xor    %ecx,%ecx
}
     ca2:	5d                   	pop    %ebp
     ca3:	89 c8                	mov    %ecx,%eax
     ca5:	c3                   	ret
     ca6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     cad:	00 
     cae:	66 90                	xchg   %ax,%ax

00000cb0 <memset>:

void*
memset(void *dst, int c, uint n)
{
     cb0:	55                   	push   %ebp
     cb1:	89 e5                	mov    %esp,%ebp
     cb3:	57                   	push   %edi
     cb4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
     cb7:	8b 4d 10             	mov    0x10(%ebp),%ecx
     cba:	8b 45 0c             	mov    0xc(%ebp),%eax
     cbd:	89 d7                	mov    %edx,%edi
     cbf:	fc                   	cld
     cc0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
     cc2:	8b 7d fc             	mov    -0x4(%ebp),%edi
     cc5:	89 d0                	mov    %edx,%eax
     cc7:	c9                   	leave
     cc8:	c3                   	ret
     cc9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000cd0 <strchr>:

char*
strchr(const char *s, char c)
{
     cd0:	55                   	push   %ebp
     cd1:	89 e5                	mov    %esp,%ebp
     cd3:	8b 45 08             	mov    0x8(%ebp),%eax
     cd6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
     cda:	0f b6 10             	movzbl (%eax),%edx
     cdd:	84 d2                	test   %dl,%dl
     cdf:	75 1a                	jne    cfb <strchr+0x2b>
     ce1:	eb 25                	jmp    d08 <strchr+0x38>
     ce3:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     cea:	00 
     ceb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
     cf0:	0f b6 50 01          	movzbl 0x1(%eax),%edx
     cf4:	83 c0 01             	add    $0x1,%eax
     cf7:	84 d2                	test   %dl,%dl
     cf9:	74 0d                	je     d08 <strchr+0x38>
    if(*s == c)
     cfb:	38 d1                	cmp    %dl,%cl
     cfd:	75 f1                	jne    cf0 <strchr+0x20>
      return (char*)s;
  return 0;
}
     cff:	5d                   	pop    %ebp
     d00:	c3                   	ret
     d01:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
     d08:	31 c0                	xor    %eax,%eax
}
     d0a:	5d                   	pop    %ebp
     d0b:	c3                   	ret
     d0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000d10 <gets>:

char*
gets(char *buf, int max)
{
     d10:	55                   	push   %ebp
     d11:	89 e5                	mov    %esp,%ebp
     d13:	57                   	push   %edi
     d14:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
     d15:	8d 75 e7             	lea    -0x19(%ebp),%esi
{
     d18:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
     d19:	31 db                	xor    %ebx,%ebx
{
     d1b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
     d1e:	eb 27                	jmp    d47 <gets+0x37>
    cc = read(0, &c, 1);
     d20:	83 ec 04             	sub    $0x4,%esp
     d23:	6a 01                	push   $0x1
     d25:	56                   	push   %esi
     d26:	6a 00                	push   $0x0
     d28:	e8 c1 01 00 00       	call   eee <read>
    if(cc < 1)
     d2d:	83 c4 10             	add    $0x10,%esp
     d30:	85 c0                	test   %eax,%eax
     d32:	7e 1d                	jle    d51 <gets+0x41>
      break;
    buf[i++] = c;
     d34:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
     d38:	8b 55 08             	mov    0x8(%ebp),%edx
     d3b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
     d3f:	3c 0a                	cmp    $0xa,%al
     d41:	74 10                	je     d53 <gets+0x43>
     d43:	3c 0d                	cmp    $0xd,%al
     d45:	74 0c                	je     d53 <gets+0x43>
  for(i=0; i+1 < max; ){
     d47:	89 df                	mov    %ebx,%edi
     d49:	83 c3 01             	add    $0x1,%ebx
     d4c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
     d4f:	7c cf                	jl     d20 <gets+0x10>
     d51:	89 fb                	mov    %edi,%ebx
      break;
  }
  buf[i] = '\0';
     d53:	8b 45 08             	mov    0x8(%ebp),%eax
     d56:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
     d5a:	8d 65 f4             	lea    -0xc(%ebp),%esp
     d5d:	5b                   	pop    %ebx
     d5e:	5e                   	pop    %esi
     d5f:	5f                   	pop    %edi
     d60:	5d                   	pop    %ebp
     d61:	c3                   	ret
     d62:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     d69:	00 
     d6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000d70 <stat>:

int
stat(const char *n, struct stat *st)
{
     d70:	55                   	push   %ebp
     d71:	89 e5                	mov    %esp,%ebp
     d73:	56                   	push   %esi
     d74:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     d75:	83 ec 08             	sub    $0x8,%esp
     d78:	6a 00                	push   $0x0
     d7a:	ff 75 08             	push   0x8(%ebp)
     d7d:	e8 94 01 00 00       	call   f16 <open>
  if(fd < 0)
     d82:	83 c4 10             	add    $0x10,%esp
     d85:	85 c0                	test   %eax,%eax
     d87:	78 27                	js     db0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
     d89:	83 ec 08             	sub    $0x8,%esp
     d8c:	ff 75 0c             	push   0xc(%ebp)
     d8f:	89 c3                	mov    %eax,%ebx
     d91:	50                   	push   %eax
     d92:	e8 97 01 00 00       	call   f2e <fstat>
  close(fd);
     d97:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
     d9a:	89 c6                	mov    %eax,%esi
  close(fd);
     d9c:	e8 5d 01 00 00       	call   efe <close>
  return r;
     da1:	83 c4 10             	add    $0x10,%esp
}
     da4:	8d 65 f8             	lea    -0x8(%ebp),%esp
     da7:	89 f0                	mov    %esi,%eax
     da9:	5b                   	pop    %ebx
     daa:	5e                   	pop    %esi
     dab:	5d                   	pop    %ebp
     dac:	c3                   	ret
     dad:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
     db0:	be ff ff ff ff       	mov    $0xffffffff,%esi
     db5:	eb ed                	jmp    da4 <stat+0x34>
     db7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     dbe:	00 
     dbf:	90                   	nop

00000dc0 <atoi>:

int
atoi(const char *s)
{
     dc0:	55                   	push   %ebp
     dc1:	89 e5                	mov    %esp,%ebp
     dc3:	53                   	push   %ebx
     dc4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     dc7:	0f be 02             	movsbl (%edx),%eax
     dca:	8d 48 d0             	lea    -0x30(%eax),%ecx
     dcd:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
     dd0:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
     dd5:	77 1e                	ja     df5 <atoi+0x35>
     dd7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     dde:	00 
     ddf:	90                   	nop
    n = n*10 + *s++ - '0';
     de0:	83 c2 01             	add    $0x1,%edx
     de3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
     de6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
     dea:	0f be 02             	movsbl (%edx),%eax
     ded:	8d 58 d0             	lea    -0x30(%eax),%ebx
     df0:	80 fb 09             	cmp    $0x9,%bl
     df3:	76 eb                	jbe    de0 <atoi+0x20>
  return n;
}
     df5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     df8:	89 c8                	mov    %ecx,%eax
     dfa:	c9                   	leave
     dfb:	c3                   	ret
     dfc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000e00 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
     e00:	55                   	push   %ebp
     e01:	89 e5                	mov    %esp,%ebp
     e03:	57                   	push   %edi
     e04:	8b 45 10             	mov    0x10(%ebp),%eax
     e07:	8b 55 08             	mov    0x8(%ebp),%edx
     e0a:	56                   	push   %esi
     e0b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     e0e:	85 c0                	test   %eax,%eax
     e10:	7e 13                	jle    e25 <memmove+0x25>
     e12:	01 d0                	add    %edx,%eax
  dst = vdst;
     e14:	89 d7                	mov    %edx,%edi
     e16:	66 90                	xchg   %ax,%ax
     e18:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     e1f:	00 
    *dst++ = *src++;
     e20:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
     e21:	39 f8                	cmp    %edi,%eax
     e23:	75 fb                	jne    e20 <memmove+0x20>
  return vdst;
}
     e25:	5e                   	pop    %esi
     e26:	89 d0                	mov    %edx,%eax
     e28:	5f                   	pop    %edi
     e29:	5d                   	pop    %ebp
     e2a:	c3                   	ret
     e2b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00000e30 <sqrt>:


// https://www.geeksforgeeks.org/c-program-to-find-square-root-of-a-given-number/
float sqrt(int num) {
     e30:	55                   	push   %ebp
     e31:	89 e5                	mov    %esp,%ebp
     e33:	56                   	push   %esi
     e34:	53                   	push   %ebx
     e35:	83 ec 04             	sub    $0x4,%esp
     e38:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int end = num;
  int middle;

  float solution = 0.0;

  while (start <= end) {
     e3b:	85 db                	test   %ebx,%ebx
     e3d:	0f 88 87 00 00 00    	js     eca <sqrt+0x9a>
  int end = num;
     e43:	89 d9                	mov    %ebx,%ecx
  float solution = 0.0;
     e45:	d9 ee                	fldz
  int start = 0;
     e47:	31 d2                	xor    %edx,%edx
     e49:	eb 14                	jmp    e5f <sqrt+0x2f>
     e4b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
     e50:	dd d8                	fstp   %st(0)
    if (middle * middle == num) {
      solution = middle;
      break;
    }
    if (middle * middle < num) {
      solution = start;
     e52:	89 55 f4             	mov    %edx,-0xc(%ebp)
      start = middle + 1;
     e55:	8d 50 01             	lea    0x1(%eax),%edx
      solution = start;
     e58:	db 45 f4             	fildl  -0xc(%ebp)
  while (start <= end) {
     e5b:	39 ca                	cmp    %ecx,%edx
     e5d:	7f 1e                	jg     e7d <sqrt+0x4d>
    middle = (start + end) / 2;
     e5f:	8d 34 0a             	lea    (%edx,%ecx,1),%esi
     e62:	89 f0                	mov    %esi,%eax
     e64:	c1 e8 1f             	shr    $0x1f,%eax
     e67:	01 f0                	add    %esi,%eax
     e69:	d1 f8                	sar    $1,%eax
    if (middle * middle == num) {
     e6b:	89 c6                	mov    %eax,%esi
     e6d:	0f af f0             	imul   %eax,%esi
     e70:	39 de                	cmp    %ebx,%esi
     e72:	74 4c                	je     ec0 <sqrt+0x90>
    if (middle * middle < num) {
     e74:	7c da                	jl     e50 <sqrt+0x20>
    }
    else {
      end = middle - 1;
     e76:	8d 48 ff             	lea    -0x1(%eax),%ecx
  while (start <= end) {
     e79:	39 ca                	cmp    %ecx,%edx
     e7b:	7e e2                	jle    e5f <sqrt+0x2f>

  float eps = 0.1;
  int i;

  for (i = 0; i < 5; i++) {
    while (solution * solution <= num) {
     e7d:	89 5d f4             	mov    %ebx,-0xc(%ebp)
     e80:	b8 05 00 00 00       	mov    $0x5,%eax
     e85:	db 45 f4             	fildl  -0xc(%ebp)
     e88:	d9 05 d8 14 00 00    	flds   0x14d8
     e8e:	eb 02                	jmp    e92 <sqrt+0x62>
      solution += eps;
     e90:	dc c2                	fadd   %st,%st(2)
    while (solution * solution <= num) {
     e92:	d9 c2                	fld    %st(2)
     e94:	d8 cb                	fmul   %st(3),%st
     e96:	d9 ca                	fxch   %st(2)
     e98:	db f2                	fcomi  %st(2),%st
     e9a:	dd da                	fstp   %st(2)
     e9c:	73 f2                	jae    e90 <sqrt+0x60>
    }
    solution = solution - eps;
     e9e:	dc ea                	fsubr  %st,%st(2)
    eps = eps / 10;
     ea0:	d8 35 dc 14 00 00    	fdivs  0x14dc
  for (i = 0; i < 5; i++) {
     ea6:	83 e8 01             	sub    $0x1,%eax
     ea9:	75 e7                	jne    e92 <sqrt+0x62>
     eab:	dd d8                	fstp   %st(0)
     ead:	dd d8                	fstp   %st(0)
  }
  return solution;

}
     eaf:	83 c4 04             	add    $0x4,%esp
     eb2:	5b                   	pop    %ebx
     eb3:	5e                   	pop    %esi
     eb4:	5d                   	pop    %ebp
     eb5:	c3                   	ret
     eb6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     ebd:	00 
     ebe:	66 90                	xchg   %ax,%ax
     ec0:	dd d8                	fstp   %st(0)
      solution = middle;
     ec2:	89 45 f4             	mov    %eax,-0xc(%ebp)
     ec5:	db 45 f4             	fildl  -0xc(%ebp)
      break;
     ec8:	eb b3                	jmp    e7d <sqrt+0x4d>
  float solution = 0.0;
     eca:	d9 ee                	fldz
     ecc:	eb af                	jmp    e7d <sqrt+0x4d>

00000ece <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
     ece:	b8 01 00 00 00       	mov    $0x1,%eax
     ed3:	cd 40                	int    $0x40
     ed5:	c3                   	ret

00000ed6 <exit>:
SYSCALL(exit)
     ed6:	b8 02 00 00 00       	mov    $0x2,%eax
     edb:	cd 40                	int    $0x40
     edd:	c3                   	ret

00000ede <wait>:
SYSCALL(wait)
     ede:	b8 03 00 00 00       	mov    $0x3,%eax
     ee3:	cd 40                	int    $0x40
     ee5:	c3                   	ret

00000ee6 <pipe>:
SYSCALL(pipe)
     ee6:	b8 04 00 00 00       	mov    $0x4,%eax
     eeb:	cd 40                	int    $0x40
     eed:	c3                   	ret

00000eee <read>:
SYSCALL(read)
     eee:	b8 05 00 00 00       	mov    $0x5,%eax
     ef3:	cd 40                	int    $0x40
     ef5:	c3                   	ret

00000ef6 <write>:
SYSCALL(write)
     ef6:	b8 10 00 00 00       	mov    $0x10,%eax
     efb:	cd 40                	int    $0x40
     efd:	c3                   	ret

00000efe <close>:
SYSCALL(close)
     efe:	b8 15 00 00 00       	mov    $0x15,%eax
     f03:	cd 40                	int    $0x40
     f05:	c3                   	ret

00000f06 <kill>:
SYSCALL(kill)
     f06:	b8 06 00 00 00       	mov    $0x6,%eax
     f0b:	cd 40                	int    $0x40
     f0d:	c3                   	ret

00000f0e <exec>:
SYSCALL(exec)
     f0e:	b8 07 00 00 00       	mov    $0x7,%eax
     f13:	cd 40                	int    $0x40
     f15:	c3                   	ret

00000f16 <open>:
SYSCALL(open)
     f16:	b8 0f 00 00 00       	mov    $0xf,%eax
     f1b:	cd 40                	int    $0x40
     f1d:	c3                   	ret

00000f1e <mknod>:
SYSCALL(mknod)
     f1e:	b8 11 00 00 00       	mov    $0x11,%eax
     f23:	cd 40                	int    $0x40
     f25:	c3                   	ret

00000f26 <unlink>:
SYSCALL(unlink)
     f26:	b8 12 00 00 00       	mov    $0x12,%eax
     f2b:	cd 40                	int    $0x40
     f2d:	c3                   	ret

00000f2e <fstat>:
SYSCALL(fstat)
     f2e:	b8 08 00 00 00       	mov    $0x8,%eax
     f33:	cd 40                	int    $0x40
     f35:	c3                   	ret

00000f36 <link>:
SYSCALL(link)
     f36:	b8 13 00 00 00       	mov    $0x13,%eax
     f3b:	cd 40                	int    $0x40
     f3d:	c3                   	ret

00000f3e <mkdir>:
SYSCALL(mkdir)
     f3e:	b8 14 00 00 00       	mov    $0x14,%eax
     f43:	cd 40                	int    $0x40
     f45:	c3                   	ret

00000f46 <chdir>:
SYSCALL(chdir)
     f46:	b8 09 00 00 00       	mov    $0x9,%eax
     f4b:	cd 40                	int    $0x40
     f4d:	c3                   	ret

00000f4e <dup>:
SYSCALL(dup)
     f4e:	b8 0a 00 00 00       	mov    $0xa,%eax
     f53:	cd 40                	int    $0x40
     f55:	c3                   	ret

00000f56 <getpid>:
SYSCALL(getpid)
     f56:	b8 0b 00 00 00       	mov    $0xb,%eax
     f5b:	cd 40                	int    $0x40
     f5d:	c3                   	ret

00000f5e <sbrk>:
SYSCALL(sbrk)
     f5e:	b8 0c 00 00 00       	mov    $0xc,%eax
     f63:	cd 40                	int    $0x40
     f65:	c3                   	ret

00000f66 <sleep>:
SYSCALL(sleep)
     f66:	b8 0d 00 00 00       	mov    $0xd,%eax
     f6b:	cd 40                	int    $0x40
     f6d:	c3                   	ret

00000f6e <uptime>:
SYSCALL(uptime)
     f6e:	b8 0e 00 00 00       	mov    $0xe,%eax
     f73:	cd 40                	int    $0x40
     f75:	c3                   	ret

00000f76 <gettid>:
SYSCALL(gettid)
     f76:	b8 16 00 00 00       	mov    $0x16,%eax
     f7b:	cd 40                	int    $0x40
     f7d:	c3                   	ret

00000f7e <getpgid>:
SYSCALL(getpgid)
     f7e:	b8 17 00 00 00       	mov    $0x17,%eax
     f83:	cd 40                	int    $0x40
     f85:	c3                   	ret

00000f86 <setpgid>:
SYSCALL(setpgid)
     f86:	b8 18 00 00 00       	mov    $0x18,%eax
     f8b:	cd 40                	int    $0x40
     f8d:	c3                   	ret

00000f8e <getppid>:
SYSCALL(getppid)
     f8e:	b8 19 00 00 00       	mov    $0x19,%eax
     f93:	cd 40                	int    $0x40
     f95:	c3                   	ret

00000f96 <uptime_ms>:
SYSCALL(uptime_ms)
     f96:	b8 1a 00 00 00       	mov    $0x1a,%eax
     f9b:	cd 40                	int    $0x40
     f9d:	c3                   	ret

00000f9e <setpriority>:
     f9e:	b8 1b 00 00 00       	mov    $0x1b,%eax
     fa3:	cd 40                	int    $0x40
     fa5:	c3                   	ret
     fa6:	66 90                	xchg   %ax,%ax
     fa8:	66 90                	xchg   %ax,%ax
     faa:	66 90                	xchg   %ax,%ax
     fac:	66 90                	xchg   %ax,%ax
     fae:	66 90                	xchg   %ax,%ax
     fb0:	66 90                	xchg   %ax,%ax
     fb2:	66 90                	xchg   %ax,%ax
     fb4:	66 90                	xchg   %ax,%ax
     fb6:	66 90                	xchg   %ax,%ax
     fb8:	66 90                	xchg   %ax,%ax
     fba:	66 90                	xchg   %ax,%ax
     fbc:	66 90                	xchg   %ax,%ax
     fbe:	66 90                	xchg   %ax,%ax

00000fc0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
     fc0:	55                   	push   %ebp
     fc1:	89 e5                	mov    %esp,%ebp
     fc3:	57                   	push   %edi
     fc4:	56                   	push   %esi
     fc5:	53                   	push   %ebx
     fc6:	89 cb                	mov    %ecx,%ebx
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
     fc8:	89 d1                	mov    %edx,%ecx
{
     fca:	83 ec 3c             	sub    $0x3c,%esp
     fcd:	89 45 c4             	mov    %eax,-0x3c(%ebp)
  if(sgn && xx < 0){
     fd0:	85 d2                	test   %edx,%edx
     fd2:	0f 89 98 00 00 00    	jns    1070 <printint+0xb0>
     fd8:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
     fdc:	0f 84 8e 00 00 00    	je     1070 <printint+0xb0>
    x = -xx;
     fe2:	f7 d9                	neg    %ecx
    neg = 1;
     fe4:	b8 01 00 00 00       	mov    $0x1,%eax
  } else {
    x = xx;
  }

  i = 0;
     fe9:	89 45 c0             	mov    %eax,-0x40(%ebp)
     fec:	31 f6                	xor    %esi,%esi
     fee:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     ff5:	00 
     ff6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     ffd:	00 
     ffe:	66 90                	xchg   %ax,%ax
  do{
    buf[i++] = digits[x % base];
    1000:	89 c8                	mov    %ecx,%eax
    1002:	31 d2                	xor    %edx,%edx
    1004:	89 f7                	mov    %esi,%edi
    1006:	f7 f3                	div    %ebx
    1008:	8d 76 01             	lea    0x1(%esi),%esi
    100b:	0f b6 92 38 15 00 00 	movzbl 0x1538(%edx),%edx
    1012:	88 54 35 d7          	mov    %dl,-0x29(%ebp,%esi,1)
  }while((x /= base) != 0);
    1016:	89 ca                	mov    %ecx,%edx
    1018:	89 c1                	mov    %eax,%ecx
    101a:	39 da                	cmp    %ebx,%edx
    101c:	73 e2                	jae    1000 <printint+0x40>
  if(neg)
    101e:	8b 45 c0             	mov    -0x40(%ebp),%eax
    1021:	85 c0                	test   %eax,%eax
    1023:	74 07                	je     102c <printint+0x6c>
    buf[i++] = '-';
    1025:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)
    102a:	89 f7                	mov    %esi,%edi

  while(--i >= 0)
    102c:	8d 5d d8             	lea    -0x28(%ebp),%ebx
    102f:	8b 75 c4             	mov    -0x3c(%ebp),%esi
    1032:	01 df                	add    %ebx,%edi
    1034:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    103b:	00 
    103c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    putc(fd, buf[i]);
    1040:	0f b6 07             	movzbl (%edi),%eax
  write(fd, &c, 1);
    1043:	83 ec 04             	sub    $0x4,%esp
    1046:	88 45 d7             	mov    %al,-0x29(%ebp)
    1049:	8d 45 d7             	lea    -0x29(%ebp),%eax
    104c:	6a 01                	push   $0x1
    104e:	50                   	push   %eax
    104f:	56                   	push   %esi
    1050:	e8 a1 fe ff ff       	call   ef6 <write>
  while(--i >= 0)
    1055:	89 f8                	mov    %edi,%eax
    1057:	83 c4 10             	add    $0x10,%esp
    105a:	83 ef 01             	sub    $0x1,%edi
    105d:	39 d8                	cmp    %ebx,%eax
    105f:	75 df                	jne    1040 <printint+0x80>
}
    1061:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1064:	5b                   	pop    %ebx
    1065:	5e                   	pop    %esi
    1066:	5f                   	pop    %edi
    1067:	5d                   	pop    %ebp
    1068:	c3                   	ret
    1069:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    1070:	31 c0                	xor    %eax,%eax
    1072:	e9 72 ff ff ff       	jmp    fe9 <printint+0x29>
    1077:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    107e:	00 
    107f:	90                   	nop

00001080 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
    1080:	55                   	push   %ebp
    1081:	89 e5                	mov    %esp,%ebp
    1083:	57                   	push   %edi
    1084:	56                   	push   %esi
    1085:	53                   	push   %ebx
    1086:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1089:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
    108c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
    108f:	0f b6 13             	movzbl (%ebx),%edx
    1092:	83 c3 01             	add    $0x1,%ebx
    1095:	84 d2                	test   %dl,%dl
    1097:	0f 84 a0 00 00 00    	je     113d <printf+0xbd>
    109d:	8d 45 10             	lea    0x10(%ebp),%eax
    10a0:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    10a3:	8b 7d d4             	mov    -0x2c(%ebp),%edi
    10a6:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
    10a9:	eb 28                	jmp    10d3 <printf+0x53>
    10ab:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
    10b0:	83 ec 04             	sub    $0x4,%esp
    10b3:	8d 45 e7             	lea    -0x19(%ebp),%eax
    10b6:	88 55 e7             	mov    %dl,-0x19(%ebp)
  for(i = 0; fmt[i]; i++){
    10b9:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
    10bc:	6a 01                	push   $0x1
    10be:	50                   	push   %eax
    10bf:	56                   	push   %esi
    10c0:	e8 31 fe ff ff       	call   ef6 <write>
  for(i = 0; fmt[i]; i++){
    10c5:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
    10c9:	83 c4 10             	add    $0x10,%esp
    10cc:	84 d2                	test   %dl,%dl
    10ce:	74 6d                	je     113d <printf+0xbd>
    c = fmt[i] & 0xff;
    10d0:	0f b6 c2             	movzbl %dl,%eax
      if(c == '%'){
    10d3:	83 f8 25             	cmp    $0x25,%eax
    10d6:	75 d8                	jne    10b0 <printf+0x30>
  for(i = 0; fmt[i]; i++){
    10d8:	0f b6 13             	movzbl (%ebx),%edx
    10db:	84 d2                	test   %dl,%dl
    10dd:	74 5e                	je     113d <printf+0xbd>
    c = fmt[i] & 0xff;
    10df:	0f b6 c2             	movzbl %dl,%eax
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
    10e2:	80 fa 25             	cmp    $0x25,%dl
    10e5:	0f 84 1d 01 00 00    	je     1208 <printf+0x188>
    10eb:	83 e8 63             	sub    $0x63,%eax
    10ee:	83 f8 15             	cmp    $0x15,%eax
    10f1:	77 0d                	ja     1100 <printf+0x80>
    10f3:	ff 24 85 e0 14 00 00 	jmp    *0x14e0(,%eax,4)
    10fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  write(fd, &c, 1);
    1100:	83 ec 04             	sub    $0x4,%esp
    1103:	8d 4d e7             	lea    -0x19(%ebp),%ecx
    1106:	88 55 d0             	mov    %dl,-0x30(%ebp)
        ap++;
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    1109:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
  write(fd, &c, 1);
    110d:	6a 01                	push   $0x1
    110f:	51                   	push   %ecx
    1110:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    1113:	56                   	push   %esi
    1114:	e8 dd fd ff ff       	call   ef6 <write>
        putc(fd, c);
    1119:	0f b6 55 d0          	movzbl -0x30(%ebp),%edx
  write(fd, &c, 1);
    111d:	83 c4 0c             	add    $0xc,%esp
    1120:	88 55 e7             	mov    %dl,-0x19(%ebp)
    1123:	6a 01                	push   $0x1
    1125:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
    1128:	51                   	push   %ecx
    1129:	56                   	push   %esi
    112a:	e8 c7 fd ff ff       	call   ef6 <write>
  for(i = 0; fmt[i]; i++){
    112f:	0f b6 53 01          	movzbl 0x1(%ebx),%edx
    1133:	83 c3 02             	add    $0x2,%ebx
    1136:	83 c4 10             	add    $0x10,%esp
    1139:	84 d2                	test   %dl,%dl
    113b:	75 93                	jne    10d0 <printf+0x50>
      }
      state = 0;
    }
  }
}
    113d:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1140:	5b                   	pop    %ebx
    1141:	5e                   	pop    %esi
    1142:	5f                   	pop    %edi
    1143:	5d                   	pop    %ebp
    1144:	c3                   	ret
    1145:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
    1148:	83 ec 0c             	sub    $0xc,%esp
    114b:	8b 17                	mov    (%edi),%edx
    114d:	b9 10 00 00 00       	mov    $0x10,%ecx
    1152:	89 f0                	mov    %esi,%eax
    1154:	6a 00                	push   $0x0
        ap++;
    1156:	83 c7 04             	add    $0x4,%edi
        printint(fd, *ap, 16, 0);
    1159:	e8 62 fe ff ff       	call   fc0 <printint>
  for(i = 0; fmt[i]; i++){
    115e:	eb cf                	jmp    112f <printf+0xaf>
        s = (char*)*ap;
    1160:	8b 07                	mov    (%edi),%eax
        ap++;
    1162:	83 c7 04             	add    $0x4,%edi
        if(s == 0)
    1165:	85 c0                	test   %eax,%eax
    1167:	0f 84 b3 00 00 00    	je     1220 <printf+0x1a0>
        while(*s != 0){
    116d:	0f b6 10             	movzbl (%eax),%edx
    1170:	84 d2                	test   %dl,%dl
    1172:	0f 84 ba 00 00 00    	je     1232 <printf+0x1b2>
    1178:	89 7d d4             	mov    %edi,-0x2c(%ebp)
    117b:	89 c7                	mov    %eax,%edi
    117d:	89 d0                	mov    %edx,%eax
    117f:	8d 4d e7             	lea    -0x19(%ebp),%ecx
    1182:	89 5d d0             	mov    %ebx,-0x30(%ebp)
    1185:	89 fb                	mov    %edi,%ebx
    1187:	89 cf                	mov    %ecx,%edi
    1189:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
    1190:	83 ec 04             	sub    $0x4,%esp
    1193:	88 45 e7             	mov    %al,-0x19(%ebp)
          s++;
    1196:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
    1199:	6a 01                	push   $0x1
    119b:	57                   	push   %edi
    119c:	56                   	push   %esi
    119d:	e8 54 fd ff ff       	call   ef6 <write>
        while(*s != 0){
    11a2:	0f b6 03             	movzbl (%ebx),%eax
    11a5:	83 c4 10             	add    $0x10,%esp
    11a8:	84 c0                	test   %al,%al
    11aa:	75 e4                	jne    1190 <printf+0x110>
    11ac:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  for(i = 0; fmt[i]; i++){
    11af:	0f b6 53 01          	movzbl 0x1(%ebx),%edx
    11b3:	83 c3 02             	add    $0x2,%ebx
    11b6:	84 d2                	test   %dl,%dl
    11b8:	0f 85 e5 fe ff ff    	jne    10a3 <printf+0x23>
    11be:	e9 7a ff ff ff       	jmp    113d <printf+0xbd>
    11c3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
    11c8:	83 ec 0c             	sub    $0xc,%esp
    11cb:	8b 17                	mov    (%edi),%edx
    11cd:	b9 0a 00 00 00       	mov    $0xa,%ecx
    11d2:	89 f0                	mov    %esi,%eax
    11d4:	6a 01                	push   $0x1
        ap++;
    11d6:	83 c7 04             	add    $0x4,%edi
        printint(fd, *ap, 10, 1);
    11d9:	e8 e2 fd ff ff       	call   fc0 <printint>
  for(i = 0; fmt[i]; i++){
    11de:	e9 4c ff ff ff       	jmp    112f <printf+0xaf>
    11e3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
    11e8:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
    11ea:	83 ec 04             	sub    $0x4,%esp
    11ed:	8d 4d e7             	lea    -0x19(%ebp),%ecx
        ap++;
    11f0:	83 c7 04             	add    $0x4,%edi
        putc(fd, *ap);
    11f3:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    11f6:	6a 01                	push   $0x1
    11f8:	51                   	push   %ecx
    11f9:	56                   	push   %esi
    11fa:	e8 f7 fc ff ff       	call   ef6 <write>
  for(i = 0; fmt[i]; i++){
    11ff:	e9 2b ff ff ff       	jmp    112f <printf+0xaf>
    1204:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
    1208:	83 ec 04             	sub    $0x4,%esp
    120b:	88 55 e7             	mov    %dl,-0x19(%ebp)
    120e:	8d 4d e7             	lea    -0x19(%ebp),%ecx
    1211:	6a 01                	push   $0x1
    1213:	e9 10 ff ff ff       	jmp    1128 <printf+0xa8>
    1218:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    121f:	00 
          s = "(null)";
    1220:	89 7d d4             	mov    %edi,-0x2c(%ebp)
    1223:	b8 28 00 00 00       	mov    $0x28,%eax
    1228:	bf 9f 14 00 00       	mov    $0x149f,%edi
    122d:	e9 4d ff ff ff       	jmp    117f <printf+0xff>
  for(i = 0; fmt[i]; i++){
    1232:	0f b6 53 01          	movzbl 0x1(%ebx),%edx
    1236:	83 c3 02             	add    $0x2,%ebx
    1239:	84 d2                	test   %dl,%dl
    123b:	0f 85 8f fe ff ff    	jne    10d0 <printf+0x50>
    1241:	e9 f7 fe ff ff       	jmp    113d <printf+0xbd>
    1246:	66 90                	xchg   %ax,%ax
    1248:	66 90                	xchg   %ax,%ax
    124a:	66 90                	xchg   %ax,%ax
    124c:	66 90                	xchg   %ax,%ax
    124e:	66 90                	xchg   %ax,%ax
    1250:	66 90                	xchg   %ax,%ax
    1252:	66 90                	xchg   %ax,%ax
    1254:	66 90                	xchg   %ax,%ax
    1256:	66 90                	xchg   %ax,%ax
    1258:	66 90                	xchg   %ax,%ax
    125a:	66 90                	xchg   %ax,%ax
    125c:	66 90                	xchg   %ax,%ax
    125e:	66 90                	xchg   %ax,%ax

00001260 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1260:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1261:	a1 c4 15 00 00       	mov    0x15c4,%eax
{
    1266:	89 e5                	mov    %esp,%ebp
    1268:	57                   	push   %edi
    1269:	56                   	push   %esi
    126a:	53                   	push   %ebx
    126b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    126e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1271:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    1278:	00 
    1279:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1280:	89 c2                	mov    %eax,%edx
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1282:	8b 00                	mov    (%eax),%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1284:	39 ca                	cmp    %ecx,%edx
    1286:	73 30                	jae    12b8 <free+0x58>
    1288:	39 c1                	cmp    %eax,%ecx
    128a:	72 04                	jb     1290 <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    128c:	39 c2                	cmp    %eax,%edx
    128e:	72 f0                	jb     1280 <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
    1290:	8b 73 fc             	mov    -0x4(%ebx),%esi
    1293:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    1296:	39 f8                	cmp    %edi,%eax
    1298:	74 36                	je     12d0 <free+0x70>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
    129a:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    129d:	8b 42 04             	mov    0x4(%edx),%eax
    12a0:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    12a3:	39 f1                	cmp    %esi,%ecx
    12a5:	74 40                	je     12e7 <free+0x87>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
    12a7:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
    12a9:	5b                   	pop    %ebx
  freep = p;
    12aa:	89 15 c4 15 00 00    	mov    %edx,0x15c4
}
    12b0:	5e                   	pop    %esi
    12b1:	5f                   	pop    %edi
    12b2:	5d                   	pop    %ebp
    12b3:	c3                   	ret
    12b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    12b8:	39 c2                	cmp    %eax,%edx
    12ba:	72 c4                	jb     1280 <free+0x20>
    12bc:	39 c1                	cmp    %eax,%ecx
    12be:	73 c0                	jae    1280 <free+0x20>
  if(bp + bp->s.size == p->s.ptr){
    12c0:	8b 73 fc             	mov    -0x4(%ebx),%esi
    12c3:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    12c6:	39 f8                	cmp    %edi,%eax
    12c8:	75 d0                	jne    129a <free+0x3a>
    12ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    bp->s.size += p->s.ptr->s.size;
    12d0:	03 70 04             	add    0x4(%eax),%esi
    12d3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    12d6:	8b 02                	mov    (%edx),%eax
    12d8:	8b 00                	mov    (%eax),%eax
    12da:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
    12dd:	8b 42 04             	mov    0x4(%edx),%eax
    12e0:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    12e3:	39 f1                	cmp    %esi,%ecx
    12e5:	75 c0                	jne    12a7 <free+0x47>
    p->s.size += bp->s.size;
    12e7:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
    12ea:	89 15 c4 15 00 00    	mov    %edx,0x15c4
    p->s.size += bp->s.size;
    12f0:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
    12f3:	8b 4b f8             	mov    -0x8(%ebx),%ecx
    12f6:	89 0a                	mov    %ecx,(%edx)
}
    12f8:	5b                   	pop    %ebx
    12f9:	5e                   	pop    %esi
    12fa:	5f                   	pop    %edi
    12fb:	5d                   	pop    %ebp
    12fc:	c3                   	ret
    12fd:	8d 76 00             	lea    0x0(%esi),%esi

00001300 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1300:	55                   	push   %ebp
    1301:	89 e5                	mov    %esp,%ebp
    1303:	57                   	push   %edi
    1304:	56                   	push   %esi
    1305:	53                   	push   %ebx
    1306:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1309:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    130c:	8b 15 c4 15 00 00    	mov    0x15c4,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1312:	8d 78 07             	lea    0x7(%eax),%edi
    1315:	c1 ef 03             	shr    $0x3,%edi
    1318:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    131b:	85 d2                	test   %edx,%edx
    131d:	0f 84 8d 00 00 00    	je     13b0 <malloc+0xb0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1323:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    1325:	8b 48 04             	mov    0x4(%eax),%ecx
    1328:	39 f9                	cmp    %edi,%ecx
    132a:	73 64                	jae    1390 <malloc+0x90>
  if(nu < 4096)
    132c:	bb 00 10 00 00       	mov    $0x1000,%ebx
    1331:	39 df                	cmp    %ebx,%edi
    1333:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
    1336:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
    133d:	eb 0a                	jmp    1349 <malloc+0x49>
    133f:	90                   	nop
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1340:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    1342:	8b 48 04             	mov    0x4(%eax),%ecx
    1345:	39 f9                	cmp    %edi,%ecx
    1347:	73 47                	jae    1390 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    1349:	89 c2                	mov    %eax,%edx
    134b:	39 05 c4 15 00 00    	cmp    %eax,0x15c4
    1351:	75 ed                	jne    1340 <malloc+0x40>
  p = sbrk(nu * sizeof(Header));
    1353:	83 ec 0c             	sub    $0xc,%esp
    1356:	56                   	push   %esi
    1357:	e8 02 fc ff ff       	call   f5e <sbrk>
  if(p == (char*)-1)
    135c:	83 c4 10             	add    $0x10,%esp
    135f:	83 f8 ff             	cmp    $0xffffffff,%eax
    1362:	74 1c                	je     1380 <malloc+0x80>
  hp->s.size = nu;
    1364:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    1367:	83 ec 0c             	sub    $0xc,%esp
    136a:	83 c0 08             	add    $0x8,%eax
    136d:	50                   	push   %eax
    136e:	e8 ed fe ff ff       	call   1260 <free>
  return freep;
    1373:	8b 15 c4 15 00 00    	mov    0x15c4,%edx
      if((p = morecore(nunits)) == 0)
    1379:	83 c4 10             	add    $0x10,%esp
    137c:	85 d2                	test   %edx,%edx
    137e:	75 c0                	jne    1340 <malloc+0x40>
        return 0;
  }
}
    1380:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    1383:	31 c0                	xor    %eax,%eax
}
    1385:	5b                   	pop    %ebx
    1386:	5e                   	pop    %esi
    1387:	5f                   	pop    %edi
    1388:	5d                   	pop    %ebp
    1389:	c3                   	ret
    138a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    1390:	39 cf                	cmp    %ecx,%edi
    1392:	74 4c                	je     13e0 <malloc+0xe0>
        p->s.size -= nunits;
    1394:	29 f9                	sub    %edi,%ecx
    1396:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    1399:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    139c:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
    139f:	89 15 c4 15 00 00    	mov    %edx,0x15c4
}
    13a5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    13a8:	83 c0 08             	add    $0x8,%eax
}
    13ab:	5b                   	pop    %ebx
    13ac:	5e                   	pop    %esi
    13ad:	5f                   	pop    %edi
    13ae:	5d                   	pop    %ebp
    13af:	c3                   	ret
    base.s.ptr = freep = prevp = &base;
    13b0:	c7 05 c4 15 00 00 c8 	movl   $0x15c8,0x15c4
    13b7:	15 00 00 
    base.s.size = 0;
    13ba:	b8 c8 15 00 00       	mov    $0x15c8,%eax
    base.s.ptr = freep = prevp = &base;
    13bf:	c7 05 c8 15 00 00 c8 	movl   $0x15c8,0x15c8
    13c6:	15 00 00 
    base.s.size = 0;
    13c9:	c7 05 cc 15 00 00 00 	movl   $0x0,0x15cc
    13d0:	00 00 00 
    if(p->s.size >= nunits){
    13d3:	e9 54 ff ff ff       	jmp    132c <malloc+0x2c>
    13d8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    13df:	00 
        prevp->s.ptr = p->s.ptr;
    13e0:	8b 08                	mov    (%eax),%ecx
    13e2:	89 0a                	mov    %ecx,(%edx)
    13e4:	eb b9                	jmp    139f <malloc+0x9f>
