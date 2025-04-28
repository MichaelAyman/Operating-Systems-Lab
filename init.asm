
_init:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:

char *argv[] = { "sh", 0 };

int
main(void)
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	53                   	push   %ebx
   e:	51                   	push   %ecx
  int pid, wpid;

  if(open("console", O_RDWR) < 0){
   f:	83 ec 08             	sub    $0x8,%esp
  12:	6a 02                	push   $0x2
  14:	68 08 09 00 00       	push   $0x908
  19:	e8 18 04 00 00       	call   436 <open>
  1e:	83 c4 10             	add    $0x10,%esp
  21:	85 c0                	test   %eax,%eax
  23:	0f 88 9f 00 00 00    	js     c8 <main+0xc8>
    mknod("console", 1, 1);
    open("console", O_RDWR);
  }
  dup(0);  // stdout
  29:	83 ec 0c             	sub    $0xc,%esp
  2c:	6a 00                	push   $0x0
  2e:	e8 3b 04 00 00       	call   46e <dup>
  dup(0);  // stderr
  33:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  3a:	e8 2f 04 00 00       	call   46e <dup>
  3f:	83 c4 10             	add    $0x10,%esp
  42:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  49:	00 
  4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  for(;;){
    printf(1, "init: starting sh\n");
  50:	83 ec 08             	sub    $0x8,%esp
  53:	68 10 09 00 00       	push   $0x910
  58:	6a 01                	push   $0x1
  5a:	e8 41 05 00 00       	call   5a0 <printf>
    pid = fork();
  5f:	e8 8a 03 00 00       	call   3ee <fork>
    if(pid < 0){
  64:	83 c4 10             	add    $0x10,%esp
    pid = fork();
  67:	89 c3                	mov    %eax,%ebx
    if(pid < 0){
  69:	85 c0                	test   %eax,%eax
  6b:	78 24                	js     91 <main+0x91>
      printf(1, "init: fork failed\n");
      exit();
    }
    if(pid == 0){
  6d:	74 35                	je     a4 <main+0xa4>
  6f:	90                   	nop
      exec("sh", argv);
      printf(1, "init: exec sh failed\n");
      exit();
    }
    while((wpid=wait()) >= 0 && wpid != pid)
  70:	e8 89 03 00 00       	call   3fe <wait>
  75:	85 c0                	test   %eax,%eax
  77:	78 d7                	js     50 <main+0x50>
  79:	39 c3                	cmp    %eax,%ebx
  7b:	74 d3                	je     50 <main+0x50>
      printf(1, "zombie!\n");
  7d:	83 ec 08             	sub    $0x8,%esp
  80:	68 4f 09 00 00       	push   $0x94f
  85:	6a 01                	push   $0x1
  87:	e8 14 05 00 00       	call   5a0 <printf>
  8c:	83 c4 10             	add    $0x10,%esp
  8f:	eb df                	jmp    70 <main+0x70>
      printf(1, "init: fork failed\n");
  91:	53                   	push   %ebx
  92:	53                   	push   %ebx
  93:	68 23 09 00 00       	push   $0x923
  98:	6a 01                	push   $0x1
  9a:	e8 01 05 00 00       	call   5a0 <printf>
      exit();
  9f:	e8 52 03 00 00       	call   3f6 <exit>
      exec("sh", argv);
  a4:	50                   	push   %eax
  a5:	50                   	push   %eax
  a6:	68 d4 09 00 00       	push   $0x9d4
  ab:	68 36 09 00 00       	push   $0x936
  b0:	e8 79 03 00 00       	call   42e <exec>
      printf(1, "init: exec sh failed\n");
  b5:	5a                   	pop    %edx
  b6:	59                   	pop    %ecx
  b7:	68 39 09 00 00       	push   $0x939
  bc:	6a 01                	push   $0x1
  be:	e8 dd 04 00 00       	call   5a0 <printf>
      exit();
  c3:	e8 2e 03 00 00       	call   3f6 <exit>
    mknod("console", 1, 1);
  c8:	50                   	push   %eax
  c9:	6a 01                	push   $0x1
  cb:	6a 01                	push   $0x1
  cd:	68 08 09 00 00       	push   $0x908
  d2:	e8 67 03 00 00       	call   43e <mknod>
    open("console", O_RDWR);
  d7:	58                   	pop    %eax
  d8:	5a                   	pop    %edx
  d9:	6a 02                	push   $0x2
  db:	68 08 09 00 00       	push   $0x908
  e0:	e8 51 03 00 00       	call   436 <open>
  e5:	83 c4 10             	add    $0x10,%esp
  e8:	e9 3c ff ff ff       	jmp    29 <main+0x29>
  ed:	66 90                	xchg   %ax,%ax
  ef:	66 90                	xchg   %ax,%ax
  f1:	66 90                	xchg   %ax,%ax
  f3:	66 90                	xchg   %ax,%ax
  f5:	66 90                	xchg   %ax,%ax
  f7:	66 90                	xchg   %ax,%ax
  f9:	66 90                	xchg   %ax,%ax
  fb:	66 90                	xchg   %ax,%ax
  fd:	66 90                	xchg   %ax,%ax
  ff:	90                   	nop

00000100 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 100:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 101:	31 c0                	xor    %eax,%eax
{
 103:	89 e5                	mov    %esp,%ebp
 105:	53                   	push   %ebx
 106:	8b 4d 08             	mov    0x8(%ebp),%ecx
 109:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 10c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 110:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 114:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 117:	83 c0 01             	add    $0x1,%eax
 11a:	84 d2                	test   %dl,%dl
 11c:	75 f2                	jne    110 <strcpy+0x10>
    ;
  return os;
}
 11e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 121:	89 c8                	mov    %ecx,%eax
 123:	c9                   	leave
 124:	c3                   	ret
 125:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 12c:	00 
 12d:	8d 76 00             	lea    0x0(%esi),%esi

00000130 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 130:	55                   	push   %ebp
 131:	89 e5                	mov    %esp,%ebp
 133:	53                   	push   %ebx
 134:	8b 55 08             	mov    0x8(%ebp),%edx
 137:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 13a:	0f b6 02             	movzbl (%edx),%eax
 13d:	84 c0                	test   %al,%al
 13f:	75 2f                	jne    170 <strcmp+0x40>
 141:	eb 4a                	jmp    18d <strcmp+0x5d>
 143:	eb 1b                	jmp    160 <strcmp+0x30>
 145:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 14c:	00 
 14d:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 154:	00 
 155:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 15c:	00 
 15d:	8d 76 00             	lea    0x0(%esi),%esi
 160:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 164:	83 c2 01             	add    $0x1,%edx
 167:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 16a:	84 c0                	test   %al,%al
 16c:	74 12                	je     180 <strcmp+0x50>
 16e:	89 d9                	mov    %ebx,%ecx
 170:	0f b6 19             	movzbl (%ecx),%ebx
 173:	38 c3                	cmp    %al,%bl
 175:	74 e9                	je     160 <strcmp+0x30>
  return (uchar)*p - (uchar)*q;
 177:	29 d8                	sub    %ebx,%eax
}
 179:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 17c:	c9                   	leave
 17d:	c3                   	ret
 17e:	66 90                	xchg   %ax,%ax
  return (uchar)*p - (uchar)*q;
 180:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 184:	31 c0                	xor    %eax,%eax
 186:	29 d8                	sub    %ebx,%eax
}
 188:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 18b:	c9                   	leave
 18c:	c3                   	ret
  return (uchar)*p - (uchar)*q;
 18d:	0f b6 19             	movzbl (%ecx),%ebx
 190:	31 c0                	xor    %eax,%eax
 192:	eb e3                	jmp    177 <strcmp+0x47>
 194:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 19b:	00 
 19c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000001a0 <strlen>:

uint
strlen(const char *s)
{
 1a0:	55                   	push   %ebp
 1a1:	89 e5                	mov    %esp,%ebp
 1a3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 1a6:	80 3a 00             	cmpb   $0x0,(%edx)
 1a9:	74 15                	je     1c0 <strlen+0x20>
 1ab:	31 c0                	xor    %eax,%eax
 1ad:	8d 76 00             	lea    0x0(%esi),%esi
 1b0:	83 c0 01             	add    $0x1,%eax
 1b3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 1b7:	89 c1                	mov    %eax,%ecx
 1b9:	75 f5                	jne    1b0 <strlen+0x10>
    ;
  return n;
}
 1bb:	89 c8                	mov    %ecx,%eax
 1bd:	5d                   	pop    %ebp
 1be:	c3                   	ret
 1bf:	90                   	nop
  for(n = 0; s[n]; n++)
 1c0:	31 c9                	xor    %ecx,%ecx
}
 1c2:	5d                   	pop    %ebp
 1c3:	89 c8                	mov    %ecx,%eax
 1c5:	c3                   	ret
 1c6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 1cd:	00 
 1ce:	66 90                	xchg   %ax,%ax

000001d0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	57                   	push   %edi
 1d4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1d7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1da:	8b 45 0c             	mov    0xc(%ebp),%eax
 1dd:	89 d7                	mov    %edx,%edi
 1df:	fc                   	cld
 1e0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1e2:	8b 7d fc             	mov    -0x4(%ebp),%edi
 1e5:	89 d0                	mov    %edx,%eax
 1e7:	c9                   	leave
 1e8:	c3                   	ret
 1e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000001f0 <strchr>:

char*
strchr(const char *s, char c)
{
 1f0:	55                   	push   %ebp
 1f1:	89 e5                	mov    %esp,%ebp
 1f3:	8b 45 08             	mov    0x8(%ebp),%eax
 1f6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 1fa:	0f b6 10             	movzbl (%eax),%edx
 1fd:	84 d2                	test   %dl,%dl
 1ff:	75 1a                	jne    21b <strchr+0x2b>
 201:	eb 25                	jmp    228 <strchr+0x38>
 203:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 20a:	00 
 20b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 210:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 214:	83 c0 01             	add    $0x1,%eax
 217:	84 d2                	test   %dl,%dl
 219:	74 0d                	je     228 <strchr+0x38>
    if(*s == c)
 21b:	38 d1                	cmp    %dl,%cl
 21d:	75 f1                	jne    210 <strchr+0x20>
      return (char*)s;
  return 0;
}
 21f:	5d                   	pop    %ebp
 220:	c3                   	ret
 221:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 228:	31 c0                	xor    %eax,%eax
}
 22a:	5d                   	pop    %ebp
 22b:	c3                   	ret
 22c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000230 <gets>:

char*
gets(char *buf, int max)
{
 230:	55                   	push   %ebp
 231:	89 e5                	mov    %esp,%ebp
 233:	57                   	push   %edi
 234:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 235:	8d 75 e7             	lea    -0x19(%ebp),%esi
{
 238:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 239:	31 db                	xor    %ebx,%ebx
{
 23b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 23e:	eb 27                	jmp    267 <gets+0x37>
    cc = read(0, &c, 1);
 240:	83 ec 04             	sub    $0x4,%esp
 243:	6a 01                	push   $0x1
 245:	56                   	push   %esi
 246:	6a 00                	push   $0x0
 248:	e8 c1 01 00 00       	call   40e <read>
    if(cc < 1)
 24d:	83 c4 10             	add    $0x10,%esp
 250:	85 c0                	test   %eax,%eax
 252:	7e 1d                	jle    271 <gets+0x41>
      break;
    buf[i++] = c;
 254:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 258:	8b 55 08             	mov    0x8(%ebp),%edx
 25b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 25f:	3c 0a                	cmp    $0xa,%al
 261:	74 10                	je     273 <gets+0x43>
 263:	3c 0d                	cmp    $0xd,%al
 265:	74 0c                	je     273 <gets+0x43>
  for(i=0; i+1 < max; ){
 267:	89 df                	mov    %ebx,%edi
 269:	83 c3 01             	add    $0x1,%ebx
 26c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 26f:	7c cf                	jl     240 <gets+0x10>
 271:	89 fb                	mov    %edi,%ebx
      break;
  }
  buf[i] = '\0';
 273:	8b 45 08             	mov    0x8(%ebp),%eax
 276:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
 27a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 27d:	5b                   	pop    %ebx
 27e:	5e                   	pop    %esi
 27f:	5f                   	pop    %edi
 280:	5d                   	pop    %ebp
 281:	c3                   	ret
 282:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 289:	00 
 28a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000290 <stat>:

int
stat(const char *n, struct stat *st)
{
 290:	55                   	push   %ebp
 291:	89 e5                	mov    %esp,%ebp
 293:	56                   	push   %esi
 294:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 295:	83 ec 08             	sub    $0x8,%esp
 298:	6a 00                	push   $0x0
 29a:	ff 75 08             	push   0x8(%ebp)
 29d:	e8 94 01 00 00       	call   436 <open>
  if(fd < 0)
 2a2:	83 c4 10             	add    $0x10,%esp
 2a5:	85 c0                	test   %eax,%eax
 2a7:	78 27                	js     2d0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 2a9:	83 ec 08             	sub    $0x8,%esp
 2ac:	ff 75 0c             	push   0xc(%ebp)
 2af:	89 c3                	mov    %eax,%ebx
 2b1:	50                   	push   %eax
 2b2:	e8 97 01 00 00       	call   44e <fstat>
  close(fd);
 2b7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 2ba:	89 c6                	mov    %eax,%esi
  close(fd);
 2bc:	e8 5d 01 00 00       	call   41e <close>
  return r;
 2c1:	83 c4 10             	add    $0x10,%esp
}
 2c4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2c7:	89 f0                	mov    %esi,%eax
 2c9:	5b                   	pop    %ebx
 2ca:	5e                   	pop    %esi
 2cb:	5d                   	pop    %ebp
 2cc:	c3                   	ret
 2cd:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 2d0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 2d5:	eb ed                	jmp    2c4 <stat+0x34>
 2d7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 2de:	00 
 2df:	90                   	nop

000002e0 <atoi>:

int
atoi(const char *s)
{
 2e0:	55                   	push   %ebp
 2e1:	89 e5                	mov    %esp,%ebp
 2e3:	53                   	push   %ebx
 2e4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2e7:	0f be 02             	movsbl (%edx),%eax
 2ea:	8d 48 d0             	lea    -0x30(%eax),%ecx
 2ed:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 2f0:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 2f5:	77 1e                	ja     315 <atoi+0x35>
 2f7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 2fe:	00 
 2ff:	90                   	nop
    n = n*10 + *s++ - '0';
 300:	83 c2 01             	add    $0x1,%edx
 303:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 306:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 30a:	0f be 02             	movsbl (%edx),%eax
 30d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 310:	80 fb 09             	cmp    $0x9,%bl
 313:	76 eb                	jbe    300 <atoi+0x20>
  return n;
}
 315:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 318:	89 c8                	mov    %ecx,%eax
 31a:	c9                   	leave
 31b:	c3                   	ret
 31c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000320 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 320:	55                   	push   %ebp
 321:	89 e5                	mov    %esp,%ebp
 323:	57                   	push   %edi
 324:	8b 45 10             	mov    0x10(%ebp),%eax
 327:	8b 55 08             	mov    0x8(%ebp),%edx
 32a:	56                   	push   %esi
 32b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 32e:	85 c0                	test   %eax,%eax
 330:	7e 13                	jle    345 <memmove+0x25>
 332:	01 d0                	add    %edx,%eax
  dst = vdst;
 334:	89 d7                	mov    %edx,%edi
 336:	66 90                	xchg   %ax,%ax
 338:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 33f:	00 
    *dst++ = *src++;
 340:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 341:	39 f8                	cmp    %edi,%eax
 343:	75 fb                	jne    340 <memmove+0x20>
  return vdst;
}
 345:	5e                   	pop    %esi
 346:	89 d0                	mov    %edx,%eax
 348:	5f                   	pop    %edi
 349:	5d                   	pop    %ebp
 34a:	c3                   	ret
 34b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00000350 <sqrt>:


// https://www.geeksforgeeks.org/c-program-to-find-square-root-of-a-given-number/
float sqrt(int num) {
 350:	55                   	push   %ebp
 351:	89 e5                	mov    %esp,%ebp
 353:	56                   	push   %esi
 354:	53                   	push   %ebx
 355:	83 ec 04             	sub    $0x4,%esp
 358:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int end = num;
  int middle;

  float solution = 0.0;

  while (start <= end) {
 35b:	85 db                	test   %ebx,%ebx
 35d:	0f 88 87 00 00 00    	js     3ea <sqrt+0x9a>
  int end = num;
 363:	89 d9                	mov    %ebx,%ecx
  float solution = 0.0;
 365:	d9 ee                	fldz
  int start = 0;
 367:	31 d2                	xor    %edx,%edx
 369:	eb 14                	jmp    37f <sqrt+0x2f>
 36b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 370:	dd d8                	fstp   %st(0)
    if (middle * middle == num) {
      solution = middle;
      break;
    }
    if (middle * middle < num) {
      solution = start;
 372:	89 55 f4             	mov    %edx,-0xc(%ebp)
      start = middle + 1;
 375:	8d 50 01             	lea    0x1(%eax),%edx
      solution = start;
 378:	db 45 f4             	fildl  -0xc(%ebp)
  while (start <= end) {
 37b:	39 ca                	cmp    %ecx,%edx
 37d:	7f 1e                	jg     39d <sqrt+0x4d>
    middle = (start + end) / 2;
 37f:	8d 34 0a             	lea    (%edx,%ecx,1),%esi
 382:	89 f0                	mov    %esi,%eax
 384:	c1 e8 1f             	shr    $0x1f,%eax
 387:	01 f0                	add    %esi,%eax
 389:	d1 f8                	sar    $1,%eax
    if (middle * middle == num) {
 38b:	89 c6                	mov    %eax,%esi
 38d:	0f af f0             	imul   %eax,%esi
 390:	39 de                	cmp    %ebx,%esi
 392:	74 4c                	je     3e0 <sqrt+0x90>
    if (middle * middle < num) {
 394:	7c da                	jl     370 <sqrt+0x20>
    }
    else {
      end = middle - 1;
 396:	8d 48 ff             	lea    -0x1(%eax),%ecx
  while (start <= end) {
 399:	39 ca                	cmp    %ecx,%edx
 39b:	7e e2                	jle    37f <sqrt+0x2f>

  float eps = 0.1;
  int i;

  for (i = 0; i < 5; i++) {
    while (solution * solution <= num) {
 39d:	89 5d f4             	mov    %ebx,-0xc(%ebp)
 3a0:	b8 05 00 00 00       	mov    $0x5,%eax
 3a5:	db 45 f4             	fildl  -0xc(%ebp)
 3a8:	d9 05 60 09 00 00    	flds   0x960
 3ae:	eb 02                	jmp    3b2 <sqrt+0x62>
      solution += eps;
 3b0:	dc c2                	fadd   %st,%st(2)
    while (solution * solution <= num) {
 3b2:	d9 c2                	fld    %st(2)
 3b4:	d8 cb                	fmul   %st(3),%st
 3b6:	d9 ca                	fxch   %st(2)
 3b8:	db f2                	fcomi  %st(2),%st
 3ba:	dd da                	fstp   %st(2)
 3bc:	73 f2                	jae    3b0 <sqrt+0x60>
    }
    solution = solution - eps;
 3be:	dc ea                	fsubr  %st,%st(2)
    eps = eps / 10;
 3c0:	d8 35 64 09 00 00    	fdivs  0x964
  for (i = 0; i < 5; i++) {
 3c6:	83 e8 01             	sub    $0x1,%eax
 3c9:	75 e7                	jne    3b2 <sqrt+0x62>
 3cb:	dd d8                	fstp   %st(0)
 3cd:	dd d8                	fstp   %st(0)
  }
  return solution;

}
 3cf:	83 c4 04             	add    $0x4,%esp
 3d2:	5b                   	pop    %ebx
 3d3:	5e                   	pop    %esi
 3d4:	5d                   	pop    %ebp
 3d5:	c3                   	ret
 3d6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 3dd:	00 
 3de:	66 90                	xchg   %ax,%ax
 3e0:	dd d8                	fstp   %st(0)
      solution = middle;
 3e2:	89 45 f4             	mov    %eax,-0xc(%ebp)
 3e5:	db 45 f4             	fildl  -0xc(%ebp)
      break;
 3e8:	eb b3                	jmp    39d <sqrt+0x4d>
  float solution = 0.0;
 3ea:	d9 ee                	fldz
 3ec:	eb af                	jmp    39d <sqrt+0x4d>

000003ee <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3ee:	b8 01 00 00 00       	mov    $0x1,%eax
 3f3:	cd 40                	int    $0x40
 3f5:	c3                   	ret

000003f6 <exit>:
SYSCALL(exit)
 3f6:	b8 02 00 00 00       	mov    $0x2,%eax
 3fb:	cd 40                	int    $0x40
 3fd:	c3                   	ret

000003fe <wait>:
SYSCALL(wait)
 3fe:	b8 03 00 00 00       	mov    $0x3,%eax
 403:	cd 40                	int    $0x40
 405:	c3                   	ret

00000406 <pipe>:
SYSCALL(pipe)
 406:	b8 04 00 00 00       	mov    $0x4,%eax
 40b:	cd 40                	int    $0x40
 40d:	c3                   	ret

0000040e <read>:
SYSCALL(read)
 40e:	b8 05 00 00 00       	mov    $0x5,%eax
 413:	cd 40                	int    $0x40
 415:	c3                   	ret

00000416 <write>:
SYSCALL(write)
 416:	b8 10 00 00 00       	mov    $0x10,%eax
 41b:	cd 40                	int    $0x40
 41d:	c3                   	ret

0000041e <close>:
SYSCALL(close)
 41e:	b8 15 00 00 00       	mov    $0x15,%eax
 423:	cd 40                	int    $0x40
 425:	c3                   	ret

00000426 <kill>:
SYSCALL(kill)
 426:	b8 06 00 00 00       	mov    $0x6,%eax
 42b:	cd 40                	int    $0x40
 42d:	c3                   	ret

0000042e <exec>:
SYSCALL(exec)
 42e:	b8 07 00 00 00       	mov    $0x7,%eax
 433:	cd 40                	int    $0x40
 435:	c3                   	ret

00000436 <open>:
SYSCALL(open)
 436:	b8 0f 00 00 00       	mov    $0xf,%eax
 43b:	cd 40                	int    $0x40
 43d:	c3                   	ret

0000043e <mknod>:
SYSCALL(mknod)
 43e:	b8 11 00 00 00       	mov    $0x11,%eax
 443:	cd 40                	int    $0x40
 445:	c3                   	ret

00000446 <unlink>:
SYSCALL(unlink)
 446:	b8 12 00 00 00       	mov    $0x12,%eax
 44b:	cd 40                	int    $0x40
 44d:	c3                   	ret

0000044e <fstat>:
SYSCALL(fstat)
 44e:	b8 08 00 00 00       	mov    $0x8,%eax
 453:	cd 40                	int    $0x40
 455:	c3                   	ret

00000456 <link>:
SYSCALL(link)
 456:	b8 13 00 00 00       	mov    $0x13,%eax
 45b:	cd 40                	int    $0x40
 45d:	c3                   	ret

0000045e <mkdir>:
SYSCALL(mkdir)
 45e:	b8 14 00 00 00       	mov    $0x14,%eax
 463:	cd 40                	int    $0x40
 465:	c3                   	ret

00000466 <chdir>:
SYSCALL(chdir)
 466:	b8 09 00 00 00       	mov    $0x9,%eax
 46b:	cd 40                	int    $0x40
 46d:	c3                   	ret

0000046e <dup>:
SYSCALL(dup)
 46e:	b8 0a 00 00 00       	mov    $0xa,%eax
 473:	cd 40                	int    $0x40
 475:	c3                   	ret

00000476 <getpid>:
SYSCALL(getpid)
 476:	b8 0b 00 00 00       	mov    $0xb,%eax
 47b:	cd 40                	int    $0x40
 47d:	c3                   	ret

0000047e <sbrk>:
SYSCALL(sbrk)
 47e:	b8 0c 00 00 00       	mov    $0xc,%eax
 483:	cd 40                	int    $0x40
 485:	c3                   	ret

00000486 <sleep>:
SYSCALL(sleep)
 486:	b8 0d 00 00 00       	mov    $0xd,%eax
 48b:	cd 40                	int    $0x40
 48d:	c3                   	ret

0000048e <uptime>:
SYSCALL(uptime)
 48e:	b8 0e 00 00 00       	mov    $0xe,%eax
 493:	cd 40                	int    $0x40
 495:	c3                   	ret

00000496 <gettid>:
SYSCALL(gettid)
 496:	b8 16 00 00 00       	mov    $0x16,%eax
 49b:	cd 40                	int    $0x40
 49d:	c3                   	ret

0000049e <getpgid>:
SYSCALL(getpgid)
 49e:	b8 17 00 00 00       	mov    $0x17,%eax
 4a3:	cd 40                	int    $0x40
 4a5:	c3                   	ret

000004a6 <setpgid>:
SYSCALL(setpgid)
 4a6:	b8 18 00 00 00       	mov    $0x18,%eax
 4ab:	cd 40                	int    $0x40
 4ad:	c3                   	ret

000004ae <getppid>:
SYSCALL(getppid)
 4ae:	b8 19 00 00 00       	mov    $0x19,%eax
 4b3:	cd 40                	int    $0x40
 4b5:	c3                   	ret

000004b6 <uptime_ms>:
SYSCALL(uptime_ms)
 4b6:	b8 1a 00 00 00       	mov    $0x1a,%eax
 4bb:	cd 40                	int    $0x40
 4bd:	c3                   	ret

000004be <setpriority>:
 4be:	b8 1b 00 00 00       	mov    $0x1b,%eax
 4c3:	cd 40                	int    $0x40
 4c5:	c3                   	ret
 4c6:	66 90                	xchg   %ax,%ax
 4c8:	66 90                	xchg   %ax,%ax
 4ca:	66 90                	xchg   %ax,%ax
 4cc:	66 90                	xchg   %ax,%ax
 4ce:	66 90                	xchg   %ax,%ax
 4d0:	66 90                	xchg   %ax,%ax
 4d2:	66 90                	xchg   %ax,%ax
 4d4:	66 90                	xchg   %ax,%ax
 4d6:	66 90                	xchg   %ax,%ax
 4d8:	66 90                	xchg   %ax,%ax
 4da:	66 90                	xchg   %ax,%ax
 4dc:	66 90                	xchg   %ax,%ax
 4de:	66 90                	xchg   %ax,%ax

000004e0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 4e0:	55                   	push   %ebp
 4e1:	89 e5                	mov    %esp,%ebp
 4e3:	57                   	push   %edi
 4e4:	56                   	push   %esi
 4e5:	53                   	push   %ebx
 4e6:	89 cb                	mov    %ecx,%ebx
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 4e8:	89 d1                	mov    %edx,%ecx
{
 4ea:	83 ec 3c             	sub    $0x3c,%esp
 4ed:	89 45 c4             	mov    %eax,-0x3c(%ebp)
  if(sgn && xx < 0){
 4f0:	85 d2                	test   %edx,%edx
 4f2:	0f 89 98 00 00 00    	jns    590 <printint+0xb0>
 4f8:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 4fc:	0f 84 8e 00 00 00    	je     590 <printint+0xb0>
    x = -xx;
 502:	f7 d9                	neg    %ecx
    neg = 1;
 504:	b8 01 00 00 00       	mov    $0x1,%eax
  } else {
    x = xx;
  }

  i = 0;
 509:	89 45 c0             	mov    %eax,-0x40(%ebp)
 50c:	31 f6                	xor    %esi,%esi
 50e:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 515:	00 
 516:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 51d:	00 
 51e:	66 90                	xchg   %ax,%ax
  do{
    buf[i++] = digits[x % base];
 520:	89 c8                	mov    %ecx,%eax
 522:	31 d2                	xor    %edx,%edx
 524:	89 f7                	mov    %esi,%edi
 526:	f7 f3                	div    %ebx
 528:	8d 76 01             	lea    0x1(%esi),%esi
 52b:	0f b6 92 c0 09 00 00 	movzbl 0x9c0(%edx),%edx
 532:	88 54 35 d7          	mov    %dl,-0x29(%ebp,%esi,1)
  }while((x /= base) != 0);
 536:	89 ca                	mov    %ecx,%edx
 538:	89 c1                	mov    %eax,%ecx
 53a:	39 da                	cmp    %ebx,%edx
 53c:	73 e2                	jae    520 <printint+0x40>
  if(neg)
 53e:	8b 45 c0             	mov    -0x40(%ebp),%eax
 541:	85 c0                	test   %eax,%eax
 543:	74 07                	je     54c <printint+0x6c>
    buf[i++] = '-';
 545:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)
 54a:	89 f7                	mov    %esi,%edi

  while(--i >= 0)
 54c:	8d 5d d8             	lea    -0x28(%ebp),%ebx
 54f:	8b 75 c4             	mov    -0x3c(%ebp),%esi
 552:	01 df                	add    %ebx,%edi
 554:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 55b:	00 
 55c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    putc(fd, buf[i]);
 560:	0f b6 07             	movzbl (%edi),%eax
  write(fd, &c, 1);
 563:	83 ec 04             	sub    $0x4,%esp
 566:	88 45 d7             	mov    %al,-0x29(%ebp)
 569:	8d 45 d7             	lea    -0x29(%ebp),%eax
 56c:	6a 01                	push   $0x1
 56e:	50                   	push   %eax
 56f:	56                   	push   %esi
 570:	e8 a1 fe ff ff       	call   416 <write>
  while(--i >= 0)
 575:	89 f8                	mov    %edi,%eax
 577:	83 c4 10             	add    $0x10,%esp
 57a:	83 ef 01             	sub    $0x1,%edi
 57d:	39 d8                	cmp    %ebx,%eax
 57f:	75 df                	jne    560 <printint+0x80>
}
 581:	8d 65 f4             	lea    -0xc(%ebp),%esp
 584:	5b                   	pop    %ebx
 585:	5e                   	pop    %esi
 586:	5f                   	pop    %edi
 587:	5d                   	pop    %ebp
 588:	c3                   	ret
 589:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 590:	31 c0                	xor    %eax,%eax
 592:	e9 72 ff ff ff       	jmp    509 <printint+0x29>
 597:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 59e:	00 
 59f:	90                   	nop

000005a0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 5a0:	55                   	push   %ebp
 5a1:	89 e5                	mov    %esp,%ebp
 5a3:	57                   	push   %edi
 5a4:	56                   	push   %esi
 5a5:	53                   	push   %ebx
 5a6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5a9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 5ac:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 5af:	0f b6 13             	movzbl (%ebx),%edx
 5b2:	83 c3 01             	add    $0x1,%ebx
 5b5:	84 d2                	test   %dl,%dl
 5b7:	0f 84 a0 00 00 00    	je     65d <printf+0xbd>
 5bd:	8d 45 10             	lea    0x10(%ebp),%eax
 5c0:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    c = fmt[i] & 0xff;
 5c3:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 5c6:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 5c9:	eb 28                	jmp    5f3 <printf+0x53>
 5cb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 5d0:	83 ec 04             	sub    $0x4,%esp
 5d3:	8d 45 e7             	lea    -0x19(%ebp),%eax
 5d6:	88 55 e7             	mov    %dl,-0x19(%ebp)
  for(i = 0; fmt[i]; i++){
 5d9:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 5dc:	6a 01                	push   $0x1
 5de:	50                   	push   %eax
 5df:	56                   	push   %esi
 5e0:	e8 31 fe ff ff       	call   416 <write>
  for(i = 0; fmt[i]; i++){
 5e5:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 5e9:	83 c4 10             	add    $0x10,%esp
 5ec:	84 d2                	test   %dl,%dl
 5ee:	74 6d                	je     65d <printf+0xbd>
    c = fmt[i] & 0xff;
 5f0:	0f b6 c2             	movzbl %dl,%eax
      if(c == '%'){
 5f3:	83 f8 25             	cmp    $0x25,%eax
 5f6:	75 d8                	jne    5d0 <printf+0x30>
  for(i = 0; fmt[i]; i++){
 5f8:	0f b6 13             	movzbl (%ebx),%edx
 5fb:	84 d2                	test   %dl,%dl
 5fd:	74 5e                	je     65d <printf+0xbd>
    c = fmt[i] & 0xff;
 5ff:	0f b6 c2             	movzbl %dl,%eax
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
 602:	80 fa 25             	cmp    $0x25,%dl
 605:	0f 84 1d 01 00 00    	je     728 <printf+0x188>
 60b:	83 e8 63             	sub    $0x63,%eax
 60e:	83 f8 15             	cmp    $0x15,%eax
 611:	77 0d                	ja     620 <printf+0x80>
 613:	ff 24 85 68 09 00 00 	jmp    *0x968(,%eax,4)
 61a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 620:	83 ec 04             	sub    $0x4,%esp
 623:	8d 4d e7             	lea    -0x19(%ebp),%ecx
 626:	88 55 d0             	mov    %dl,-0x30(%ebp)
        ap++;
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 629:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
  write(fd, &c, 1);
 62d:	6a 01                	push   $0x1
 62f:	51                   	push   %ecx
 630:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
 633:	56                   	push   %esi
 634:	e8 dd fd ff ff       	call   416 <write>
        putc(fd, c);
 639:	0f b6 55 d0          	movzbl -0x30(%ebp),%edx
  write(fd, &c, 1);
 63d:	83 c4 0c             	add    $0xc,%esp
 640:	88 55 e7             	mov    %dl,-0x19(%ebp)
 643:	6a 01                	push   $0x1
 645:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
 648:	51                   	push   %ecx
 649:	56                   	push   %esi
 64a:	e8 c7 fd ff ff       	call   416 <write>
  for(i = 0; fmt[i]; i++){
 64f:	0f b6 53 01          	movzbl 0x1(%ebx),%edx
 653:	83 c3 02             	add    $0x2,%ebx
 656:	83 c4 10             	add    $0x10,%esp
 659:	84 d2                	test   %dl,%dl
 65b:	75 93                	jne    5f0 <printf+0x50>
      }
      state = 0;
    }
  }
}
 65d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 660:	5b                   	pop    %ebx
 661:	5e                   	pop    %esi
 662:	5f                   	pop    %edi
 663:	5d                   	pop    %ebp
 664:	c3                   	ret
 665:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 668:	83 ec 0c             	sub    $0xc,%esp
 66b:	8b 17                	mov    (%edi),%edx
 66d:	b9 10 00 00 00       	mov    $0x10,%ecx
 672:	89 f0                	mov    %esi,%eax
 674:	6a 00                	push   $0x0
        ap++;
 676:	83 c7 04             	add    $0x4,%edi
        printint(fd, *ap, 16, 0);
 679:	e8 62 fe ff ff       	call   4e0 <printint>
  for(i = 0; fmt[i]; i++){
 67e:	eb cf                	jmp    64f <printf+0xaf>
        s = (char*)*ap;
 680:	8b 07                	mov    (%edi),%eax
        ap++;
 682:	83 c7 04             	add    $0x4,%edi
        if(s == 0)
 685:	85 c0                	test   %eax,%eax
 687:	0f 84 b3 00 00 00    	je     740 <printf+0x1a0>
        while(*s != 0){
 68d:	0f b6 10             	movzbl (%eax),%edx
 690:	84 d2                	test   %dl,%dl
 692:	0f 84 ba 00 00 00    	je     752 <printf+0x1b2>
 698:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 69b:	89 c7                	mov    %eax,%edi
 69d:	89 d0                	mov    %edx,%eax
 69f:	8d 4d e7             	lea    -0x19(%ebp),%ecx
 6a2:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 6a5:	89 fb                	mov    %edi,%ebx
 6a7:	89 cf                	mov    %ecx,%edi
 6a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 6b0:	83 ec 04             	sub    $0x4,%esp
 6b3:	88 45 e7             	mov    %al,-0x19(%ebp)
          s++;
 6b6:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 6b9:	6a 01                	push   $0x1
 6bb:	57                   	push   %edi
 6bc:	56                   	push   %esi
 6bd:	e8 54 fd ff ff       	call   416 <write>
        while(*s != 0){
 6c2:	0f b6 03             	movzbl (%ebx),%eax
 6c5:	83 c4 10             	add    $0x10,%esp
 6c8:	84 c0                	test   %al,%al
 6ca:	75 e4                	jne    6b0 <printf+0x110>
 6cc:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  for(i = 0; fmt[i]; i++){
 6cf:	0f b6 53 01          	movzbl 0x1(%ebx),%edx
 6d3:	83 c3 02             	add    $0x2,%ebx
 6d6:	84 d2                	test   %dl,%dl
 6d8:	0f 85 e5 fe ff ff    	jne    5c3 <printf+0x23>
 6de:	e9 7a ff ff ff       	jmp    65d <printf+0xbd>
 6e3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 6e8:	83 ec 0c             	sub    $0xc,%esp
 6eb:	8b 17                	mov    (%edi),%edx
 6ed:	b9 0a 00 00 00       	mov    $0xa,%ecx
 6f2:	89 f0                	mov    %esi,%eax
 6f4:	6a 01                	push   $0x1
        ap++;
 6f6:	83 c7 04             	add    $0x4,%edi
        printint(fd, *ap, 10, 1);
 6f9:	e8 e2 fd ff ff       	call   4e0 <printint>
  for(i = 0; fmt[i]; i++){
 6fe:	e9 4c ff ff ff       	jmp    64f <printf+0xaf>
 703:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 708:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
 70a:	83 ec 04             	sub    $0x4,%esp
 70d:	8d 4d e7             	lea    -0x19(%ebp),%ecx
        ap++;
 710:	83 c7 04             	add    $0x4,%edi
        putc(fd, *ap);
 713:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 716:	6a 01                	push   $0x1
 718:	51                   	push   %ecx
 719:	56                   	push   %esi
 71a:	e8 f7 fc ff ff       	call   416 <write>
  for(i = 0; fmt[i]; i++){
 71f:	e9 2b ff ff ff       	jmp    64f <printf+0xaf>
 724:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 728:	83 ec 04             	sub    $0x4,%esp
 72b:	88 55 e7             	mov    %dl,-0x19(%ebp)
 72e:	8d 4d e7             	lea    -0x19(%ebp),%ecx
 731:	6a 01                	push   $0x1
 733:	e9 10 ff ff ff       	jmp    648 <printf+0xa8>
 738:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 73f:	00 
          s = "(null)";
 740:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 743:	b8 28 00 00 00       	mov    $0x28,%eax
 748:	bf 58 09 00 00       	mov    $0x958,%edi
 74d:	e9 4d ff ff ff       	jmp    69f <printf+0xff>
  for(i = 0; fmt[i]; i++){
 752:	0f b6 53 01          	movzbl 0x1(%ebx),%edx
 756:	83 c3 02             	add    $0x2,%ebx
 759:	84 d2                	test   %dl,%dl
 75b:	0f 85 8f fe ff ff    	jne    5f0 <printf+0x50>
 761:	e9 f7 fe ff ff       	jmp    65d <printf+0xbd>
 766:	66 90                	xchg   %ax,%ax
 768:	66 90                	xchg   %ax,%ax
 76a:	66 90                	xchg   %ax,%ax
 76c:	66 90                	xchg   %ax,%ax
 76e:	66 90                	xchg   %ax,%ax
 770:	66 90                	xchg   %ax,%ax
 772:	66 90                	xchg   %ax,%ax
 774:	66 90                	xchg   %ax,%ax
 776:	66 90                	xchg   %ax,%ax
 778:	66 90                	xchg   %ax,%ax
 77a:	66 90                	xchg   %ax,%ax
 77c:	66 90                	xchg   %ax,%ax
 77e:	66 90                	xchg   %ax,%ax

00000780 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 780:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 781:	a1 dc 09 00 00       	mov    0x9dc,%eax
{
 786:	89 e5                	mov    %esp,%ebp
 788:	57                   	push   %edi
 789:	56                   	push   %esi
 78a:	53                   	push   %ebx
 78b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 78e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 791:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 798:	00 
 799:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7a0:	89 c2                	mov    %eax,%edx
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7a2:	8b 00                	mov    (%eax),%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7a4:	39 ca                	cmp    %ecx,%edx
 7a6:	73 30                	jae    7d8 <free+0x58>
 7a8:	39 c1                	cmp    %eax,%ecx
 7aa:	72 04                	jb     7b0 <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7ac:	39 c2                	cmp    %eax,%edx
 7ae:	72 f0                	jb     7a0 <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
 7b0:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7b3:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7b6:	39 f8                	cmp    %edi,%eax
 7b8:	74 36                	je     7f0 <free+0x70>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 7ba:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 7bd:	8b 42 04             	mov    0x4(%edx),%eax
 7c0:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 7c3:	39 f1                	cmp    %esi,%ecx
 7c5:	74 40                	je     807 <free+0x87>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 7c7:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 7c9:	5b                   	pop    %ebx
  freep = p;
 7ca:	89 15 dc 09 00 00    	mov    %edx,0x9dc
}
 7d0:	5e                   	pop    %esi
 7d1:	5f                   	pop    %edi
 7d2:	5d                   	pop    %ebp
 7d3:	c3                   	ret
 7d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7d8:	39 c2                	cmp    %eax,%edx
 7da:	72 c4                	jb     7a0 <free+0x20>
 7dc:	39 c1                	cmp    %eax,%ecx
 7de:	73 c0                	jae    7a0 <free+0x20>
  if(bp + bp->s.size == p->s.ptr){
 7e0:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7e3:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7e6:	39 f8                	cmp    %edi,%eax
 7e8:	75 d0                	jne    7ba <free+0x3a>
 7ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    bp->s.size += p->s.ptr->s.size;
 7f0:	03 70 04             	add    0x4(%eax),%esi
 7f3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 7f6:	8b 02                	mov    (%edx),%eax
 7f8:	8b 00                	mov    (%eax),%eax
 7fa:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 7fd:	8b 42 04             	mov    0x4(%edx),%eax
 800:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 803:	39 f1                	cmp    %esi,%ecx
 805:	75 c0                	jne    7c7 <free+0x47>
    p->s.size += bp->s.size;
 807:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 80a:	89 15 dc 09 00 00    	mov    %edx,0x9dc
    p->s.size += bp->s.size;
 810:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 813:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 816:	89 0a                	mov    %ecx,(%edx)
}
 818:	5b                   	pop    %ebx
 819:	5e                   	pop    %esi
 81a:	5f                   	pop    %edi
 81b:	5d                   	pop    %ebp
 81c:	c3                   	ret
 81d:	8d 76 00             	lea    0x0(%esi),%esi

00000820 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 820:	55                   	push   %ebp
 821:	89 e5                	mov    %esp,%ebp
 823:	57                   	push   %edi
 824:	56                   	push   %esi
 825:	53                   	push   %ebx
 826:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 829:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 82c:	8b 15 dc 09 00 00    	mov    0x9dc,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 832:	8d 78 07             	lea    0x7(%eax),%edi
 835:	c1 ef 03             	shr    $0x3,%edi
 838:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 83b:	85 d2                	test   %edx,%edx
 83d:	0f 84 8d 00 00 00    	je     8d0 <malloc+0xb0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 843:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 845:	8b 48 04             	mov    0x4(%eax),%ecx
 848:	39 f9                	cmp    %edi,%ecx
 84a:	73 64                	jae    8b0 <malloc+0x90>
  if(nu < 4096)
 84c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 851:	39 df                	cmp    %ebx,%edi
 853:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 856:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 85d:	eb 0a                	jmp    869 <malloc+0x49>
 85f:	90                   	nop
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 860:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 862:	8b 48 04             	mov    0x4(%eax),%ecx
 865:	39 f9                	cmp    %edi,%ecx
 867:	73 47                	jae    8b0 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 869:	89 c2                	mov    %eax,%edx
 86b:	39 05 dc 09 00 00    	cmp    %eax,0x9dc
 871:	75 ed                	jne    860 <malloc+0x40>
  p = sbrk(nu * sizeof(Header));
 873:	83 ec 0c             	sub    $0xc,%esp
 876:	56                   	push   %esi
 877:	e8 02 fc ff ff       	call   47e <sbrk>
  if(p == (char*)-1)
 87c:	83 c4 10             	add    $0x10,%esp
 87f:	83 f8 ff             	cmp    $0xffffffff,%eax
 882:	74 1c                	je     8a0 <malloc+0x80>
  hp->s.size = nu;
 884:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 887:	83 ec 0c             	sub    $0xc,%esp
 88a:	83 c0 08             	add    $0x8,%eax
 88d:	50                   	push   %eax
 88e:	e8 ed fe ff ff       	call   780 <free>
  return freep;
 893:	8b 15 dc 09 00 00    	mov    0x9dc,%edx
      if((p = morecore(nunits)) == 0)
 899:	83 c4 10             	add    $0x10,%esp
 89c:	85 d2                	test   %edx,%edx
 89e:	75 c0                	jne    860 <malloc+0x40>
        return 0;
  }
}
 8a0:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 8a3:	31 c0                	xor    %eax,%eax
}
 8a5:	5b                   	pop    %ebx
 8a6:	5e                   	pop    %esi
 8a7:	5f                   	pop    %edi
 8a8:	5d                   	pop    %ebp
 8a9:	c3                   	ret
 8aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 8b0:	39 cf                	cmp    %ecx,%edi
 8b2:	74 4c                	je     900 <malloc+0xe0>
        p->s.size -= nunits;
 8b4:	29 f9                	sub    %edi,%ecx
 8b6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 8b9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 8bc:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 8bf:	89 15 dc 09 00 00    	mov    %edx,0x9dc
}
 8c5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 8c8:	83 c0 08             	add    $0x8,%eax
}
 8cb:	5b                   	pop    %ebx
 8cc:	5e                   	pop    %esi
 8cd:	5f                   	pop    %edi
 8ce:	5d                   	pop    %ebp
 8cf:	c3                   	ret
    base.s.ptr = freep = prevp = &base;
 8d0:	c7 05 dc 09 00 00 e0 	movl   $0x9e0,0x9dc
 8d7:	09 00 00 
    base.s.size = 0;
 8da:	b8 e0 09 00 00       	mov    $0x9e0,%eax
    base.s.ptr = freep = prevp = &base;
 8df:	c7 05 e0 09 00 00 e0 	movl   $0x9e0,0x9e0
 8e6:	09 00 00 
    base.s.size = 0;
 8e9:	c7 05 e4 09 00 00 00 	movl   $0x0,0x9e4
 8f0:	00 00 00 
    if(p->s.size >= nunits){
 8f3:	e9 54 ff ff ff       	jmp    84c <malloc+0x2c>
 8f8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 8ff:	00 
        prevp->s.ptr = p->s.ptr;
 900:	8b 08                	mov    (%eax),%ecx
 902:	89 0a                	mov    %ecx,(%edx)
 904:	eb b9                	jmp    8bf <malloc+0x9f>
