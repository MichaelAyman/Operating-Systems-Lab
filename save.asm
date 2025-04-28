
_save:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "user.h"
#include "fcntl.h"

	int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	53                   	push   %ebx
  10:	51                   	push   %ecx
  11:	83 ec 18             	sub    $0x18,%esp
  14:	8b 19                	mov    (%ecx),%ebx
  16:	8b 71 04             	mov    0x4(%ecx),%esi
  19:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
	int i = 1;
	printf(2,"%d",gettid());
  1c:	e8 55 04 00 00       	call   476 <gettid>
  21:	83 ec 04             	sub    $0x4,%esp
  24:	50                   	push   %eax
  25:	68 e8 08 00 00       	push   $0x8e8
  2a:	6a 02                	push   $0x2
  2c:	e8 4f 05 00 00       	call   580 <printf>
	if(argc < 2){
  31:	83 c4 10             	add    $0x10,%esp
  34:	83 fb 01             	cmp    $0x1,%ebx
  37:	7e 73                	jle    ac <main+0xac>
		printf(2, "Usage: enter filename followed by string to be written to file\n");
		printf(2, "For Example: save /foo.txt bar\n");
		exit();
	}
	//create the open and or create the file
	int fo = open(argv[1], O_CREATE | O_WRONLY);
  39:	52                   	push   %edx
  3a:	52                   	push   %edx
  3b:	68 01 02 00 00       	push   $0x201
  40:	ff 76 04             	push   0x4(%esi)
  43:	e8 ce 03 00 00       	call   416 <open>
	if(fo < 0) {
  48:	83 c4 10             	add    $0x10,%esp
	int fo = open(argv[1], O_CREATE | O_WRONLY);
  4b:	89 c3                	mov    %eax,%ebx
	if(fo < 0) {
  4d:	85 c0                	test   %eax,%eax
  4f:	78 7c                	js     cd <main+0xcd>
		printf(2,"Failed to create");
		exit();
	}

	//Writes the String to the file
	for(i = 2; i < argc; i++){
  51:	83 7d e4 02          	cmpl   $0x2,-0x1c(%ebp)
  55:	bf 02 00 00 00       	mov    $0x2,%edi
  5a:	74 42                	je     9e <main+0x9e>
  5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
		write(fo, argv[i], strlen(argv[i]));
  60:	83 ec 0c             	sub    $0xc,%esp
  63:	ff 34 be             	push   (%esi,%edi,4)
  66:	e8 15 01 00 00       	call   180 <strlen>
  6b:	83 c4 0c             	add    $0xc,%esp
  6e:	50                   	push   %eax
  6f:	ff 34 be             	push   (%esi,%edi,4)
	for(i = 2; i < argc; i++){
  72:	83 c7 01             	add    $0x1,%edi
		write(fo, argv[i], strlen(argv[i]));
  75:	53                   	push   %ebx
  76:	e8 7b 03 00 00       	call   3f6 <write>
		write(fo, " ", strlen(" "));
  7b:	c7 04 24 fc 08 00 00 	movl   $0x8fc,(%esp)
  82:	e8 f9 00 00 00       	call   180 <strlen>
  87:	83 c4 0c             	add    $0xc,%esp
  8a:	50                   	push   %eax
  8b:	68 fc 08 00 00       	push   $0x8fc
  90:	53                   	push   %ebx
  91:	e8 60 03 00 00       	call   3f6 <write>
	for(i = 2; i < argc; i++){
  96:	83 c4 10             	add    $0x10,%esp
  99:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
  9c:	75 c2                	jne    60 <main+0x60>
	}
	close(fo);
  9e:	83 ec 0c             	sub    $0xc,%esp
  a1:	53                   	push   %ebx
  a2:	e8 57 03 00 00       	call   3fe <close>

	exit();
  a7:	e8 2a 03 00 00       	call   3d6 <exit>
		printf(2, "Usage: enter filename followed by string to be written to file\n");
  ac:	51                   	push   %ecx
  ad:	51                   	push   %ecx
  ae:	68 08 09 00 00       	push   $0x908
  b3:	6a 02                	push   $0x2
  b5:	e8 c6 04 00 00       	call   580 <printf>
		printf(2, "For Example: save /foo.txt bar\n");
  ba:	5b                   	pop    %ebx
  bb:	5e                   	pop    %esi
  bc:	68 48 09 00 00       	push   $0x948
  c1:	6a 02                	push   $0x2
  c3:	e8 b8 04 00 00       	call   580 <printf>
		exit();
  c8:	e8 09 03 00 00       	call   3d6 <exit>
		printf(2,"Failed to create");
  cd:	50                   	push   %eax
  ce:	50                   	push   %eax
  cf:	68 eb 08 00 00       	push   $0x8eb
  d4:	6a 02                	push   $0x2
  d6:	e8 a5 04 00 00       	call   580 <printf>
		exit();
  db:	e8 f6 02 00 00       	call   3d6 <exit>

000000e0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  e0:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  e1:	31 c0                	xor    %eax,%eax
{
  e3:	89 e5                	mov    %esp,%ebp
  e5:	53                   	push   %ebx
  e6:	8b 4d 08             	mov    0x8(%ebp),%ecx
  e9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
  f0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  f4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  f7:	83 c0 01             	add    $0x1,%eax
  fa:	84 d2                	test   %dl,%dl
  fc:	75 f2                	jne    f0 <strcpy+0x10>
    ;
  return os;
}
  fe:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 101:	89 c8                	mov    %ecx,%eax
 103:	c9                   	leave
 104:	c3                   	ret
 105:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 10c:	00 
 10d:	8d 76 00             	lea    0x0(%esi),%esi

00000110 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 110:	55                   	push   %ebp
 111:	89 e5                	mov    %esp,%ebp
 113:	53                   	push   %ebx
 114:	8b 55 08             	mov    0x8(%ebp),%edx
 117:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 11a:	0f b6 02             	movzbl (%edx),%eax
 11d:	84 c0                	test   %al,%al
 11f:	75 2f                	jne    150 <strcmp+0x40>
 121:	eb 4a                	jmp    16d <strcmp+0x5d>
 123:	eb 1b                	jmp    140 <strcmp+0x30>
 125:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 12c:	00 
 12d:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 134:	00 
 135:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 13c:	00 
 13d:	8d 76 00             	lea    0x0(%esi),%esi
 140:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 144:	83 c2 01             	add    $0x1,%edx
 147:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 14a:	84 c0                	test   %al,%al
 14c:	74 12                	je     160 <strcmp+0x50>
 14e:	89 d9                	mov    %ebx,%ecx
 150:	0f b6 19             	movzbl (%ecx),%ebx
 153:	38 c3                	cmp    %al,%bl
 155:	74 e9                	je     140 <strcmp+0x30>
  return (uchar)*p - (uchar)*q;
 157:	29 d8                	sub    %ebx,%eax
}
 159:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 15c:	c9                   	leave
 15d:	c3                   	ret
 15e:	66 90                	xchg   %ax,%ax
  return (uchar)*p - (uchar)*q;
 160:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 164:	31 c0                	xor    %eax,%eax
 166:	29 d8                	sub    %ebx,%eax
}
 168:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 16b:	c9                   	leave
 16c:	c3                   	ret
  return (uchar)*p - (uchar)*q;
 16d:	0f b6 19             	movzbl (%ecx),%ebx
 170:	31 c0                	xor    %eax,%eax
 172:	eb e3                	jmp    157 <strcmp+0x47>
 174:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 17b:	00 
 17c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000180 <strlen>:

uint
strlen(const char *s)
{
 180:	55                   	push   %ebp
 181:	89 e5                	mov    %esp,%ebp
 183:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 186:	80 3a 00             	cmpb   $0x0,(%edx)
 189:	74 15                	je     1a0 <strlen+0x20>
 18b:	31 c0                	xor    %eax,%eax
 18d:	8d 76 00             	lea    0x0(%esi),%esi
 190:	83 c0 01             	add    $0x1,%eax
 193:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 197:	89 c1                	mov    %eax,%ecx
 199:	75 f5                	jne    190 <strlen+0x10>
    ;
  return n;
}
 19b:	89 c8                	mov    %ecx,%eax
 19d:	5d                   	pop    %ebp
 19e:	c3                   	ret
 19f:	90                   	nop
  for(n = 0; s[n]; n++)
 1a0:	31 c9                	xor    %ecx,%ecx
}
 1a2:	5d                   	pop    %ebp
 1a3:	89 c8                	mov    %ecx,%eax
 1a5:	c3                   	ret
 1a6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 1ad:	00 
 1ae:	66 90                	xchg   %ax,%ax

000001b0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	57                   	push   %edi
 1b4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1b7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1ba:	8b 45 0c             	mov    0xc(%ebp),%eax
 1bd:	89 d7                	mov    %edx,%edi
 1bf:	fc                   	cld
 1c0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1c2:	8b 7d fc             	mov    -0x4(%ebp),%edi
 1c5:	89 d0                	mov    %edx,%eax
 1c7:	c9                   	leave
 1c8:	c3                   	ret
 1c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000001d0 <strchr>:

char*
strchr(const char *s, char c)
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	8b 45 08             	mov    0x8(%ebp),%eax
 1d6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 1da:	0f b6 10             	movzbl (%eax),%edx
 1dd:	84 d2                	test   %dl,%dl
 1df:	75 1a                	jne    1fb <strchr+0x2b>
 1e1:	eb 25                	jmp    208 <strchr+0x38>
 1e3:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 1ea:	00 
 1eb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 1f0:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 1f4:	83 c0 01             	add    $0x1,%eax
 1f7:	84 d2                	test   %dl,%dl
 1f9:	74 0d                	je     208 <strchr+0x38>
    if(*s == c)
 1fb:	38 d1                	cmp    %dl,%cl
 1fd:	75 f1                	jne    1f0 <strchr+0x20>
      return (char*)s;
  return 0;
}
 1ff:	5d                   	pop    %ebp
 200:	c3                   	ret
 201:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 208:	31 c0                	xor    %eax,%eax
}
 20a:	5d                   	pop    %ebp
 20b:	c3                   	ret
 20c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000210 <gets>:

char*
gets(char *buf, int max)
{
 210:	55                   	push   %ebp
 211:	89 e5                	mov    %esp,%ebp
 213:	57                   	push   %edi
 214:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 215:	8d 75 e7             	lea    -0x19(%ebp),%esi
{
 218:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 219:	31 db                	xor    %ebx,%ebx
{
 21b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 21e:	eb 27                	jmp    247 <gets+0x37>
    cc = read(0, &c, 1);
 220:	83 ec 04             	sub    $0x4,%esp
 223:	6a 01                	push   $0x1
 225:	56                   	push   %esi
 226:	6a 00                	push   $0x0
 228:	e8 c1 01 00 00       	call   3ee <read>
    if(cc < 1)
 22d:	83 c4 10             	add    $0x10,%esp
 230:	85 c0                	test   %eax,%eax
 232:	7e 1d                	jle    251 <gets+0x41>
      break;
    buf[i++] = c;
 234:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 238:	8b 55 08             	mov    0x8(%ebp),%edx
 23b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 23f:	3c 0a                	cmp    $0xa,%al
 241:	74 10                	je     253 <gets+0x43>
 243:	3c 0d                	cmp    $0xd,%al
 245:	74 0c                	je     253 <gets+0x43>
  for(i=0; i+1 < max; ){
 247:	89 df                	mov    %ebx,%edi
 249:	83 c3 01             	add    $0x1,%ebx
 24c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 24f:	7c cf                	jl     220 <gets+0x10>
 251:	89 fb                	mov    %edi,%ebx
      break;
  }
  buf[i] = '\0';
 253:	8b 45 08             	mov    0x8(%ebp),%eax
 256:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
 25a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 25d:	5b                   	pop    %ebx
 25e:	5e                   	pop    %esi
 25f:	5f                   	pop    %edi
 260:	5d                   	pop    %ebp
 261:	c3                   	ret
 262:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 269:	00 
 26a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000270 <stat>:

int
stat(const char *n, struct stat *st)
{
 270:	55                   	push   %ebp
 271:	89 e5                	mov    %esp,%ebp
 273:	56                   	push   %esi
 274:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 275:	83 ec 08             	sub    $0x8,%esp
 278:	6a 00                	push   $0x0
 27a:	ff 75 08             	push   0x8(%ebp)
 27d:	e8 94 01 00 00       	call   416 <open>
  if(fd < 0)
 282:	83 c4 10             	add    $0x10,%esp
 285:	85 c0                	test   %eax,%eax
 287:	78 27                	js     2b0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 289:	83 ec 08             	sub    $0x8,%esp
 28c:	ff 75 0c             	push   0xc(%ebp)
 28f:	89 c3                	mov    %eax,%ebx
 291:	50                   	push   %eax
 292:	e8 97 01 00 00       	call   42e <fstat>
  close(fd);
 297:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 29a:	89 c6                	mov    %eax,%esi
  close(fd);
 29c:	e8 5d 01 00 00       	call   3fe <close>
  return r;
 2a1:	83 c4 10             	add    $0x10,%esp
}
 2a4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2a7:	89 f0                	mov    %esi,%eax
 2a9:	5b                   	pop    %ebx
 2aa:	5e                   	pop    %esi
 2ab:	5d                   	pop    %ebp
 2ac:	c3                   	ret
 2ad:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 2b0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 2b5:	eb ed                	jmp    2a4 <stat+0x34>
 2b7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 2be:	00 
 2bf:	90                   	nop

000002c0 <atoi>:

int
atoi(const char *s)
{
 2c0:	55                   	push   %ebp
 2c1:	89 e5                	mov    %esp,%ebp
 2c3:	53                   	push   %ebx
 2c4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2c7:	0f be 02             	movsbl (%edx),%eax
 2ca:	8d 48 d0             	lea    -0x30(%eax),%ecx
 2cd:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 2d0:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 2d5:	77 1e                	ja     2f5 <atoi+0x35>
 2d7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 2de:	00 
 2df:	90                   	nop
    n = n*10 + *s++ - '0';
 2e0:	83 c2 01             	add    $0x1,%edx
 2e3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 2e6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 2ea:	0f be 02             	movsbl (%edx),%eax
 2ed:	8d 58 d0             	lea    -0x30(%eax),%ebx
 2f0:	80 fb 09             	cmp    $0x9,%bl
 2f3:	76 eb                	jbe    2e0 <atoi+0x20>
  return n;
}
 2f5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2f8:	89 c8                	mov    %ecx,%eax
 2fa:	c9                   	leave
 2fb:	c3                   	ret
 2fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000300 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 300:	55                   	push   %ebp
 301:	89 e5                	mov    %esp,%ebp
 303:	57                   	push   %edi
 304:	8b 45 10             	mov    0x10(%ebp),%eax
 307:	8b 55 08             	mov    0x8(%ebp),%edx
 30a:	56                   	push   %esi
 30b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 30e:	85 c0                	test   %eax,%eax
 310:	7e 13                	jle    325 <memmove+0x25>
 312:	01 d0                	add    %edx,%eax
  dst = vdst;
 314:	89 d7                	mov    %edx,%edi
 316:	66 90                	xchg   %ax,%ax
 318:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 31f:	00 
    *dst++ = *src++;
 320:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 321:	39 f8                	cmp    %edi,%eax
 323:	75 fb                	jne    320 <memmove+0x20>
  return vdst;
}
 325:	5e                   	pop    %esi
 326:	89 d0                	mov    %edx,%eax
 328:	5f                   	pop    %edi
 329:	5d                   	pop    %ebp
 32a:	c3                   	ret
 32b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00000330 <sqrt>:


// https://www.geeksforgeeks.org/c-program-to-find-square-root-of-a-given-number/
float sqrt(int num) {
 330:	55                   	push   %ebp
 331:	89 e5                	mov    %esp,%ebp
 333:	56                   	push   %esi
 334:	53                   	push   %ebx
 335:	83 ec 04             	sub    $0x4,%esp
 338:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int end = num;
  int middle;

  float solution = 0.0;

  while (start <= end) {
 33b:	85 db                	test   %ebx,%ebx
 33d:	0f 88 87 00 00 00    	js     3ca <sqrt+0x9a>
  int end = num;
 343:	89 d9                	mov    %ebx,%ecx
  float solution = 0.0;
 345:	d9 ee                	fldz
  int start = 0;
 347:	31 d2                	xor    %edx,%edx
 349:	eb 14                	jmp    35f <sqrt+0x2f>
 34b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 350:	dd d8                	fstp   %st(0)
    if (middle * middle == num) {
      solution = middle;
      break;
    }
    if (middle * middle < num) {
      solution = start;
 352:	89 55 f4             	mov    %edx,-0xc(%ebp)
      start = middle + 1;
 355:	8d 50 01             	lea    0x1(%eax),%edx
      solution = start;
 358:	db 45 f4             	fildl  -0xc(%ebp)
  while (start <= end) {
 35b:	39 ca                	cmp    %ecx,%edx
 35d:	7f 1e                	jg     37d <sqrt+0x4d>
    middle = (start + end) / 2;
 35f:	8d 34 0a             	lea    (%edx,%ecx,1),%esi
 362:	89 f0                	mov    %esi,%eax
 364:	c1 e8 1f             	shr    $0x1f,%eax
 367:	01 f0                	add    %esi,%eax
 369:	d1 f8                	sar    $1,%eax
    if (middle * middle == num) {
 36b:	89 c6                	mov    %eax,%esi
 36d:	0f af f0             	imul   %eax,%esi
 370:	39 de                	cmp    %ebx,%esi
 372:	74 4c                	je     3c0 <sqrt+0x90>
    if (middle * middle < num) {
 374:	7c da                	jl     350 <sqrt+0x20>
    }
    else {
      end = middle - 1;
 376:	8d 48 ff             	lea    -0x1(%eax),%ecx
  while (start <= end) {
 379:	39 ca                	cmp    %ecx,%edx
 37b:	7e e2                	jle    35f <sqrt+0x2f>

  float eps = 0.1;
  int i;

  for (i = 0; i < 5; i++) {
    while (solution * solution <= num) {
 37d:	89 5d f4             	mov    %ebx,-0xc(%ebp)
 380:	b8 05 00 00 00       	mov    $0x5,%eax
 385:	db 45 f4             	fildl  -0xc(%ebp)
 388:	d9 05 68 09 00 00    	flds   0x968
 38e:	eb 02                	jmp    392 <sqrt+0x62>
      solution += eps;
 390:	dc c2                	fadd   %st,%st(2)
    while (solution * solution <= num) {
 392:	d9 c2                	fld    %st(2)
 394:	d8 cb                	fmul   %st(3),%st
 396:	d9 ca                	fxch   %st(2)
 398:	db f2                	fcomi  %st(2),%st
 39a:	dd da                	fstp   %st(2)
 39c:	73 f2                	jae    390 <sqrt+0x60>
    }
    solution = solution - eps;
 39e:	dc ea                	fsubr  %st,%st(2)
    eps = eps / 10;
 3a0:	d8 35 6c 09 00 00    	fdivs  0x96c
  for (i = 0; i < 5; i++) {
 3a6:	83 e8 01             	sub    $0x1,%eax
 3a9:	75 e7                	jne    392 <sqrt+0x62>
 3ab:	dd d8                	fstp   %st(0)
 3ad:	dd d8                	fstp   %st(0)
  }
  return solution;

}
 3af:	83 c4 04             	add    $0x4,%esp
 3b2:	5b                   	pop    %ebx
 3b3:	5e                   	pop    %esi
 3b4:	5d                   	pop    %ebp
 3b5:	c3                   	ret
 3b6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 3bd:	00 
 3be:	66 90                	xchg   %ax,%ax
 3c0:	dd d8                	fstp   %st(0)
      solution = middle;
 3c2:	89 45 f4             	mov    %eax,-0xc(%ebp)
 3c5:	db 45 f4             	fildl  -0xc(%ebp)
      break;
 3c8:	eb b3                	jmp    37d <sqrt+0x4d>
  float solution = 0.0;
 3ca:	d9 ee                	fldz
 3cc:	eb af                	jmp    37d <sqrt+0x4d>

000003ce <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3ce:	b8 01 00 00 00       	mov    $0x1,%eax
 3d3:	cd 40                	int    $0x40
 3d5:	c3                   	ret

000003d6 <exit>:
SYSCALL(exit)
 3d6:	b8 02 00 00 00       	mov    $0x2,%eax
 3db:	cd 40                	int    $0x40
 3dd:	c3                   	ret

000003de <wait>:
SYSCALL(wait)
 3de:	b8 03 00 00 00       	mov    $0x3,%eax
 3e3:	cd 40                	int    $0x40
 3e5:	c3                   	ret

000003e6 <pipe>:
SYSCALL(pipe)
 3e6:	b8 04 00 00 00       	mov    $0x4,%eax
 3eb:	cd 40                	int    $0x40
 3ed:	c3                   	ret

000003ee <read>:
SYSCALL(read)
 3ee:	b8 05 00 00 00       	mov    $0x5,%eax
 3f3:	cd 40                	int    $0x40
 3f5:	c3                   	ret

000003f6 <write>:
SYSCALL(write)
 3f6:	b8 10 00 00 00       	mov    $0x10,%eax
 3fb:	cd 40                	int    $0x40
 3fd:	c3                   	ret

000003fe <close>:
SYSCALL(close)
 3fe:	b8 15 00 00 00       	mov    $0x15,%eax
 403:	cd 40                	int    $0x40
 405:	c3                   	ret

00000406 <kill>:
SYSCALL(kill)
 406:	b8 06 00 00 00       	mov    $0x6,%eax
 40b:	cd 40                	int    $0x40
 40d:	c3                   	ret

0000040e <exec>:
SYSCALL(exec)
 40e:	b8 07 00 00 00       	mov    $0x7,%eax
 413:	cd 40                	int    $0x40
 415:	c3                   	ret

00000416 <open>:
SYSCALL(open)
 416:	b8 0f 00 00 00       	mov    $0xf,%eax
 41b:	cd 40                	int    $0x40
 41d:	c3                   	ret

0000041e <mknod>:
SYSCALL(mknod)
 41e:	b8 11 00 00 00       	mov    $0x11,%eax
 423:	cd 40                	int    $0x40
 425:	c3                   	ret

00000426 <unlink>:
SYSCALL(unlink)
 426:	b8 12 00 00 00       	mov    $0x12,%eax
 42b:	cd 40                	int    $0x40
 42d:	c3                   	ret

0000042e <fstat>:
SYSCALL(fstat)
 42e:	b8 08 00 00 00       	mov    $0x8,%eax
 433:	cd 40                	int    $0x40
 435:	c3                   	ret

00000436 <link>:
SYSCALL(link)
 436:	b8 13 00 00 00       	mov    $0x13,%eax
 43b:	cd 40                	int    $0x40
 43d:	c3                   	ret

0000043e <mkdir>:
SYSCALL(mkdir)
 43e:	b8 14 00 00 00       	mov    $0x14,%eax
 443:	cd 40                	int    $0x40
 445:	c3                   	ret

00000446 <chdir>:
SYSCALL(chdir)
 446:	b8 09 00 00 00       	mov    $0x9,%eax
 44b:	cd 40                	int    $0x40
 44d:	c3                   	ret

0000044e <dup>:
SYSCALL(dup)
 44e:	b8 0a 00 00 00       	mov    $0xa,%eax
 453:	cd 40                	int    $0x40
 455:	c3                   	ret

00000456 <getpid>:
SYSCALL(getpid)
 456:	b8 0b 00 00 00       	mov    $0xb,%eax
 45b:	cd 40                	int    $0x40
 45d:	c3                   	ret

0000045e <sbrk>:
SYSCALL(sbrk)
 45e:	b8 0c 00 00 00       	mov    $0xc,%eax
 463:	cd 40                	int    $0x40
 465:	c3                   	ret

00000466 <sleep>:
SYSCALL(sleep)
 466:	b8 0d 00 00 00       	mov    $0xd,%eax
 46b:	cd 40                	int    $0x40
 46d:	c3                   	ret

0000046e <uptime>:
SYSCALL(uptime)
 46e:	b8 0e 00 00 00       	mov    $0xe,%eax
 473:	cd 40                	int    $0x40
 475:	c3                   	ret

00000476 <gettid>:
SYSCALL(gettid)
 476:	b8 16 00 00 00       	mov    $0x16,%eax
 47b:	cd 40                	int    $0x40
 47d:	c3                   	ret

0000047e <getpgid>:
SYSCALL(getpgid)
 47e:	b8 17 00 00 00       	mov    $0x17,%eax
 483:	cd 40                	int    $0x40
 485:	c3                   	ret

00000486 <setpgid>:
SYSCALL(setpgid)
 486:	b8 18 00 00 00       	mov    $0x18,%eax
 48b:	cd 40                	int    $0x40
 48d:	c3                   	ret

0000048e <getppid>:
SYSCALL(getppid)
 48e:	b8 19 00 00 00       	mov    $0x19,%eax
 493:	cd 40                	int    $0x40
 495:	c3                   	ret

00000496 <uptime_ms>:
SYSCALL(uptime_ms)
 496:	b8 1a 00 00 00       	mov    $0x1a,%eax
 49b:	cd 40                	int    $0x40
 49d:	c3                   	ret

0000049e <setpriority>:
 49e:	b8 1b 00 00 00       	mov    $0x1b,%eax
 4a3:	cd 40                	int    $0x40
 4a5:	c3                   	ret
 4a6:	66 90                	xchg   %ax,%ax
 4a8:	66 90                	xchg   %ax,%ax
 4aa:	66 90                	xchg   %ax,%ax
 4ac:	66 90                	xchg   %ax,%ax
 4ae:	66 90                	xchg   %ax,%ax
 4b0:	66 90                	xchg   %ax,%ax
 4b2:	66 90                	xchg   %ax,%ax
 4b4:	66 90                	xchg   %ax,%ax
 4b6:	66 90                	xchg   %ax,%ax
 4b8:	66 90                	xchg   %ax,%ax
 4ba:	66 90                	xchg   %ax,%ax
 4bc:	66 90                	xchg   %ax,%ax
 4be:	66 90                	xchg   %ax,%ax

000004c0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 4c0:	55                   	push   %ebp
 4c1:	89 e5                	mov    %esp,%ebp
 4c3:	57                   	push   %edi
 4c4:	56                   	push   %esi
 4c5:	53                   	push   %ebx
 4c6:	89 cb                	mov    %ecx,%ebx
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 4c8:	89 d1                	mov    %edx,%ecx
{
 4ca:	83 ec 3c             	sub    $0x3c,%esp
 4cd:	89 45 c4             	mov    %eax,-0x3c(%ebp)
  if(sgn && xx < 0){
 4d0:	85 d2                	test   %edx,%edx
 4d2:	0f 89 98 00 00 00    	jns    570 <printint+0xb0>
 4d8:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 4dc:	0f 84 8e 00 00 00    	je     570 <printint+0xb0>
    x = -xx;
 4e2:	f7 d9                	neg    %ecx
    neg = 1;
 4e4:	b8 01 00 00 00       	mov    $0x1,%eax
  } else {
    x = xx;
  }

  i = 0;
 4e9:	89 45 c0             	mov    %eax,-0x40(%ebp)
 4ec:	31 f6                	xor    %esi,%esi
 4ee:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 4f5:	00 
 4f6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 4fd:	00 
 4fe:	66 90                	xchg   %ax,%ax
  do{
    buf[i++] = digits[x % base];
 500:	89 c8                	mov    %ecx,%eax
 502:	31 d2                	xor    %edx,%edx
 504:	89 f7                	mov    %esi,%edi
 506:	f7 f3                	div    %ebx
 508:	8d 76 01             	lea    0x1(%esi),%esi
 50b:	0f b6 92 c8 09 00 00 	movzbl 0x9c8(%edx),%edx
 512:	88 54 35 d7          	mov    %dl,-0x29(%ebp,%esi,1)
  }while((x /= base) != 0);
 516:	89 ca                	mov    %ecx,%edx
 518:	89 c1                	mov    %eax,%ecx
 51a:	39 da                	cmp    %ebx,%edx
 51c:	73 e2                	jae    500 <printint+0x40>
  if(neg)
 51e:	8b 45 c0             	mov    -0x40(%ebp),%eax
 521:	85 c0                	test   %eax,%eax
 523:	74 07                	je     52c <printint+0x6c>
    buf[i++] = '-';
 525:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)
 52a:	89 f7                	mov    %esi,%edi

  while(--i >= 0)
 52c:	8d 5d d8             	lea    -0x28(%ebp),%ebx
 52f:	8b 75 c4             	mov    -0x3c(%ebp),%esi
 532:	01 df                	add    %ebx,%edi
 534:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 53b:	00 
 53c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    putc(fd, buf[i]);
 540:	0f b6 07             	movzbl (%edi),%eax
  write(fd, &c, 1);
 543:	83 ec 04             	sub    $0x4,%esp
 546:	88 45 d7             	mov    %al,-0x29(%ebp)
 549:	8d 45 d7             	lea    -0x29(%ebp),%eax
 54c:	6a 01                	push   $0x1
 54e:	50                   	push   %eax
 54f:	56                   	push   %esi
 550:	e8 a1 fe ff ff       	call   3f6 <write>
  while(--i >= 0)
 555:	89 f8                	mov    %edi,%eax
 557:	83 c4 10             	add    $0x10,%esp
 55a:	83 ef 01             	sub    $0x1,%edi
 55d:	39 d8                	cmp    %ebx,%eax
 55f:	75 df                	jne    540 <printint+0x80>
}
 561:	8d 65 f4             	lea    -0xc(%ebp),%esp
 564:	5b                   	pop    %ebx
 565:	5e                   	pop    %esi
 566:	5f                   	pop    %edi
 567:	5d                   	pop    %ebp
 568:	c3                   	ret
 569:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 570:	31 c0                	xor    %eax,%eax
 572:	e9 72 ff ff ff       	jmp    4e9 <printint+0x29>
 577:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 57e:	00 
 57f:	90                   	nop

00000580 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 580:	55                   	push   %ebp
 581:	89 e5                	mov    %esp,%ebp
 583:	57                   	push   %edi
 584:	56                   	push   %esi
 585:	53                   	push   %ebx
 586:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 589:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 58c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 58f:	0f b6 13             	movzbl (%ebx),%edx
 592:	83 c3 01             	add    $0x1,%ebx
 595:	84 d2                	test   %dl,%dl
 597:	0f 84 a0 00 00 00    	je     63d <printf+0xbd>
 59d:	8d 45 10             	lea    0x10(%ebp),%eax
 5a0:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    c = fmt[i] & 0xff;
 5a3:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 5a6:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 5a9:	eb 28                	jmp    5d3 <printf+0x53>
 5ab:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 5b0:	83 ec 04             	sub    $0x4,%esp
 5b3:	8d 45 e7             	lea    -0x19(%ebp),%eax
 5b6:	88 55 e7             	mov    %dl,-0x19(%ebp)
  for(i = 0; fmt[i]; i++){
 5b9:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 5bc:	6a 01                	push   $0x1
 5be:	50                   	push   %eax
 5bf:	56                   	push   %esi
 5c0:	e8 31 fe ff ff       	call   3f6 <write>
  for(i = 0; fmt[i]; i++){
 5c5:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 5c9:	83 c4 10             	add    $0x10,%esp
 5cc:	84 d2                	test   %dl,%dl
 5ce:	74 6d                	je     63d <printf+0xbd>
    c = fmt[i] & 0xff;
 5d0:	0f b6 c2             	movzbl %dl,%eax
      if(c == '%'){
 5d3:	83 f8 25             	cmp    $0x25,%eax
 5d6:	75 d8                	jne    5b0 <printf+0x30>
  for(i = 0; fmt[i]; i++){
 5d8:	0f b6 13             	movzbl (%ebx),%edx
 5db:	84 d2                	test   %dl,%dl
 5dd:	74 5e                	je     63d <printf+0xbd>
    c = fmt[i] & 0xff;
 5df:	0f b6 c2             	movzbl %dl,%eax
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
 5e2:	80 fa 25             	cmp    $0x25,%dl
 5e5:	0f 84 1d 01 00 00    	je     708 <printf+0x188>
 5eb:	83 e8 63             	sub    $0x63,%eax
 5ee:	83 f8 15             	cmp    $0x15,%eax
 5f1:	77 0d                	ja     600 <printf+0x80>
 5f3:	ff 24 85 70 09 00 00 	jmp    *0x970(,%eax,4)
 5fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 600:	83 ec 04             	sub    $0x4,%esp
 603:	8d 4d e7             	lea    -0x19(%ebp),%ecx
 606:	88 55 d0             	mov    %dl,-0x30(%ebp)
        ap++;
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 609:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
  write(fd, &c, 1);
 60d:	6a 01                	push   $0x1
 60f:	51                   	push   %ecx
 610:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
 613:	56                   	push   %esi
 614:	e8 dd fd ff ff       	call   3f6 <write>
        putc(fd, c);
 619:	0f b6 55 d0          	movzbl -0x30(%ebp),%edx
  write(fd, &c, 1);
 61d:	83 c4 0c             	add    $0xc,%esp
 620:	88 55 e7             	mov    %dl,-0x19(%ebp)
 623:	6a 01                	push   $0x1
 625:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
 628:	51                   	push   %ecx
 629:	56                   	push   %esi
 62a:	e8 c7 fd ff ff       	call   3f6 <write>
  for(i = 0; fmt[i]; i++){
 62f:	0f b6 53 01          	movzbl 0x1(%ebx),%edx
 633:	83 c3 02             	add    $0x2,%ebx
 636:	83 c4 10             	add    $0x10,%esp
 639:	84 d2                	test   %dl,%dl
 63b:	75 93                	jne    5d0 <printf+0x50>
      }
      state = 0;
    }
  }
}
 63d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 640:	5b                   	pop    %ebx
 641:	5e                   	pop    %esi
 642:	5f                   	pop    %edi
 643:	5d                   	pop    %ebp
 644:	c3                   	ret
 645:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 648:	83 ec 0c             	sub    $0xc,%esp
 64b:	8b 17                	mov    (%edi),%edx
 64d:	b9 10 00 00 00       	mov    $0x10,%ecx
 652:	89 f0                	mov    %esi,%eax
 654:	6a 00                	push   $0x0
        ap++;
 656:	83 c7 04             	add    $0x4,%edi
        printint(fd, *ap, 16, 0);
 659:	e8 62 fe ff ff       	call   4c0 <printint>
  for(i = 0; fmt[i]; i++){
 65e:	eb cf                	jmp    62f <printf+0xaf>
        s = (char*)*ap;
 660:	8b 07                	mov    (%edi),%eax
        ap++;
 662:	83 c7 04             	add    $0x4,%edi
        if(s == 0)
 665:	85 c0                	test   %eax,%eax
 667:	0f 84 b3 00 00 00    	je     720 <printf+0x1a0>
        while(*s != 0){
 66d:	0f b6 10             	movzbl (%eax),%edx
 670:	84 d2                	test   %dl,%dl
 672:	0f 84 ba 00 00 00    	je     732 <printf+0x1b2>
 678:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 67b:	89 c7                	mov    %eax,%edi
 67d:	89 d0                	mov    %edx,%eax
 67f:	8d 4d e7             	lea    -0x19(%ebp),%ecx
 682:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 685:	89 fb                	mov    %edi,%ebx
 687:	89 cf                	mov    %ecx,%edi
 689:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 690:	83 ec 04             	sub    $0x4,%esp
 693:	88 45 e7             	mov    %al,-0x19(%ebp)
          s++;
 696:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 699:	6a 01                	push   $0x1
 69b:	57                   	push   %edi
 69c:	56                   	push   %esi
 69d:	e8 54 fd ff ff       	call   3f6 <write>
        while(*s != 0){
 6a2:	0f b6 03             	movzbl (%ebx),%eax
 6a5:	83 c4 10             	add    $0x10,%esp
 6a8:	84 c0                	test   %al,%al
 6aa:	75 e4                	jne    690 <printf+0x110>
 6ac:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  for(i = 0; fmt[i]; i++){
 6af:	0f b6 53 01          	movzbl 0x1(%ebx),%edx
 6b3:	83 c3 02             	add    $0x2,%ebx
 6b6:	84 d2                	test   %dl,%dl
 6b8:	0f 85 e5 fe ff ff    	jne    5a3 <printf+0x23>
 6be:	e9 7a ff ff ff       	jmp    63d <printf+0xbd>
 6c3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 6c8:	83 ec 0c             	sub    $0xc,%esp
 6cb:	8b 17                	mov    (%edi),%edx
 6cd:	b9 0a 00 00 00       	mov    $0xa,%ecx
 6d2:	89 f0                	mov    %esi,%eax
 6d4:	6a 01                	push   $0x1
        ap++;
 6d6:	83 c7 04             	add    $0x4,%edi
        printint(fd, *ap, 10, 1);
 6d9:	e8 e2 fd ff ff       	call   4c0 <printint>
  for(i = 0; fmt[i]; i++){
 6de:	e9 4c ff ff ff       	jmp    62f <printf+0xaf>
 6e3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 6e8:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
 6ea:	83 ec 04             	sub    $0x4,%esp
 6ed:	8d 4d e7             	lea    -0x19(%ebp),%ecx
        ap++;
 6f0:	83 c7 04             	add    $0x4,%edi
        putc(fd, *ap);
 6f3:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 6f6:	6a 01                	push   $0x1
 6f8:	51                   	push   %ecx
 6f9:	56                   	push   %esi
 6fa:	e8 f7 fc ff ff       	call   3f6 <write>
  for(i = 0; fmt[i]; i++){
 6ff:	e9 2b ff ff ff       	jmp    62f <printf+0xaf>
 704:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 708:	83 ec 04             	sub    $0x4,%esp
 70b:	88 55 e7             	mov    %dl,-0x19(%ebp)
 70e:	8d 4d e7             	lea    -0x19(%ebp),%ecx
 711:	6a 01                	push   $0x1
 713:	e9 10 ff ff ff       	jmp    628 <printf+0xa8>
 718:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 71f:	00 
          s = "(null)";
 720:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 723:	b8 28 00 00 00       	mov    $0x28,%eax
 728:	bf fe 08 00 00       	mov    $0x8fe,%edi
 72d:	e9 4d ff ff ff       	jmp    67f <printf+0xff>
  for(i = 0; fmt[i]; i++){
 732:	0f b6 53 01          	movzbl 0x1(%ebx),%edx
 736:	83 c3 02             	add    $0x2,%ebx
 739:	84 d2                	test   %dl,%dl
 73b:	0f 85 8f fe ff ff    	jne    5d0 <printf+0x50>
 741:	e9 f7 fe ff ff       	jmp    63d <printf+0xbd>
 746:	66 90                	xchg   %ax,%ax
 748:	66 90                	xchg   %ax,%ax
 74a:	66 90                	xchg   %ax,%ax
 74c:	66 90                	xchg   %ax,%ax
 74e:	66 90                	xchg   %ax,%ax
 750:	66 90                	xchg   %ax,%ax
 752:	66 90                	xchg   %ax,%ax
 754:	66 90                	xchg   %ax,%ax
 756:	66 90                	xchg   %ax,%ax
 758:	66 90                	xchg   %ax,%ax
 75a:	66 90                	xchg   %ax,%ax
 75c:	66 90                	xchg   %ax,%ax
 75e:	66 90                	xchg   %ax,%ax

00000760 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 760:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 761:	a1 dc 09 00 00       	mov    0x9dc,%eax
{
 766:	89 e5                	mov    %esp,%ebp
 768:	57                   	push   %edi
 769:	56                   	push   %esi
 76a:	53                   	push   %ebx
 76b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 76e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 771:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 778:	00 
 779:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 780:	89 c2                	mov    %eax,%edx
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 782:	8b 00                	mov    (%eax),%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 784:	39 ca                	cmp    %ecx,%edx
 786:	73 30                	jae    7b8 <free+0x58>
 788:	39 c1                	cmp    %eax,%ecx
 78a:	72 04                	jb     790 <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 78c:	39 c2                	cmp    %eax,%edx
 78e:	72 f0                	jb     780 <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
 790:	8b 73 fc             	mov    -0x4(%ebx),%esi
 793:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 796:	39 f8                	cmp    %edi,%eax
 798:	74 36                	je     7d0 <free+0x70>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 79a:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 79d:	8b 42 04             	mov    0x4(%edx),%eax
 7a0:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 7a3:	39 f1                	cmp    %esi,%ecx
 7a5:	74 40                	je     7e7 <free+0x87>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 7a7:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 7a9:	5b                   	pop    %ebx
  freep = p;
 7aa:	89 15 dc 09 00 00    	mov    %edx,0x9dc
}
 7b0:	5e                   	pop    %esi
 7b1:	5f                   	pop    %edi
 7b2:	5d                   	pop    %ebp
 7b3:	c3                   	ret
 7b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7b8:	39 c2                	cmp    %eax,%edx
 7ba:	72 c4                	jb     780 <free+0x20>
 7bc:	39 c1                	cmp    %eax,%ecx
 7be:	73 c0                	jae    780 <free+0x20>
  if(bp + bp->s.size == p->s.ptr){
 7c0:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7c3:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7c6:	39 f8                	cmp    %edi,%eax
 7c8:	75 d0                	jne    79a <free+0x3a>
 7ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    bp->s.size += p->s.ptr->s.size;
 7d0:	03 70 04             	add    0x4(%eax),%esi
 7d3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 7d6:	8b 02                	mov    (%edx),%eax
 7d8:	8b 00                	mov    (%eax),%eax
 7da:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 7dd:	8b 42 04             	mov    0x4(%edx),%eax
 7e0:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 7e3:	39 f1                	cmp    %esi,%ecx
 7e5:	75 c0                	jne    7a7 <free+0x47>
    p->s.size += bp->s.size;
 7e7:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 7ea:	89 15 dc 09 00 00    	mov    %edx,0x9dc
    p->s.size += bp->s.size;
 7f0:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 7f3:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 7f6:	89 0a                	mov    %ecx,(%edx)
}
 7f8:	5b                   	pop    %ebx
 7f9:	5e                   	pop    %esi
 7fa:	5f                   	pop    %edi
 7fb:	5d                   	pop    %ebp
 7fc:	c3                   	ret
 7fd:	8d 76 00             	lea    0x0(%esi),%esi

00000800 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 800:	55                   	push   %ebp
 801:	89 e5                	mov    %esp,%ebp
 803:	57                   	push   %edi
 804:	56                   	push   %esi
 805:	53                   	push   %ebx
 806:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 809:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 80c:	8b 15 dc 09 00 00    	mov    0x9dc,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 812:	8d 78 07             	lea    0x7(%eax),%edi
 815:	c1 ef 03             	shr    $0x3,%edi
 818:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 81b:	85 d2                	test   %edx,%edx
 81d:	0f 84 8d 00 00 00    	je     8b0 <malloc+0xb0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 823:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 825:	8b 48 04             	mov    0x4(%eax),%ecx
 828:	39 f9                	cmp    %edi,%ecx
 82a:	73 64                	jae    890 <malloc+0x90>
  if(nu < 4096)
 82c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 831:	39 df                	cmp    %ebx,%edi
 833:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 836:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 83d:	eb 0a                	jmp    849 <malloc+0x49>
 83f:	90                   	nop
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 840:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 842:	8b 48 04             	mov    0x4(%eax),%ecx
 845:	39 f9                	cmp    %edi,%ecx
 847:	73 47                	jae    890 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 849:	89 c2                	mov    %eax,%edx
 84b:	39 05 dc 09 00 00    	cmp    %eax,0x9dc
 851:	75 ed                	jne    840 <malloc+0x40>
  p = sbrk(nu * sizeof(Header));
 853:	83 ec 0c             	sub    $0xc,%esp
 856:	56                   	push   %esi
 857:	e8 02 fc ff ff       	call   45e <sbrk>
  if(p == (char*)-1)
 85c:	83 c4 10             	add    $0x10,%esp
 85f:	83 f8 ff             	cmp    $0xffffffff,%eax
 862:	74 1c                	je     880 <malloc+0x80>
  hp->s.size = nu;
 864:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 867:	83 ec 0c             	sub    $0xc,%esp
 86a:	83 c0 08             	add    $0x8,%eax
 86d:	50                   	push   %eax
 86e:	e8 ed fe ff ff       	call   760 <free>
  return freep;
 873:	8b 15 dc 09 00 00    	mov    0x9dc,%edx
      if((p = morecore(nunits)) == 0)
 879:	83 c4 10             	add    $0x10,%esp
 87c:	85 d2                	test   %edx,%edx
 87e:	75 c0                	jne    840 <malloc+0x40>
        return 0;
  }
}
 880:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 883:	31 c0                	xor    %eax,%eax
}
 885:	5b                   	pop    %ebx
 886:	5e                   	pop    %esi
 887:	5f                   	pop    %edi
 888:	5d                   	pop    %ebp
 889:	c3                   	ret
 88a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 890:	39 cf                	cmp    %ecx,%edi
 892:	74 4c                	je     8e0 <malloc+0xe0>
        p->s.size -= nunits;
 894:	29 f9                	sub    %edi,%ecx
 896:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 899:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 89c:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 89f:	89 15 dc 09 00 00    	mov    %edx,0x9dc
}
 8a5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 8a8:	83 c0 08             	add    $0x8,%eax
}
 8ab:	5b                   	pop    %ebx
 8ac:	5e                   	pop    %esi
 8ad:	5f                   	pop    %edi
 8ae:	5d                   	pop    %ebp
 8af:	c3                   	ret
    base.s.ptr = freep = prevp = &base;
 8b0:	c7 05 dc 09 00 00 e0 	movl   $0x9e0,0x9dc
 8b7:	09 00 00 
    base.s.size = 0;
 8ba:	b8 e0 09 00 00       	mov    $0x9e0,%eax
    base.s.ptr = freep = prevp = &base;
 8bf:	c7 05 e0 09 00 00 e0 	movl   $0x9e0,0x9e0
 8c6:	09 00 00 
    base.s.size = 0;
 8c9:	c7 05 e4 09 00 00 00 	movl   $0x0,0x9e4
 8d0:	00 00 00 
    if(p->s.size >= nunits){
 8d3:	e9 54 ff ff ff       	jmp    82c <malloc+0x2c>
 8d8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 8df:	00 
        prevp->s.ptr = p->s.ptr;
 8e0:	8b 08                	mov    (%eax),%ecx
 8e2:	89 0a                	mov    %ecx,(%edx)
 8e4:	eb b9                	jmp    89f <malloc+0x9f>
