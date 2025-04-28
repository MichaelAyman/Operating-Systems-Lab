
_cat:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  }
}

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
   f:	be 01 00 00 00       	mov    $0x1,%esi
  14:	53                   	push   %ebx
  15:	51                   	push   %ecx
  16:	83 ec 18             	sub    $0x18,%esp
  19:	8b 01                	mov    (%ecx),%eax
  1b:	8b 59 04             	mov    0x4(%ecx),%ebx
  1e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  21:	83 c3 04             	add    $0x4,%ebx
  int fd, i;

  if(argc <= 1){
  24:	83 f8 01             	cmp    $0x1,%eax
  27:	7e 54                	jle    7d <main+0x7d>
  29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    cat(0);
    exit();
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
  30:	83 ec 08             	sub    $0x8,%esp
  33:	6a 00                	push   $0x0
  35:	ff 33                	push   (%ebx)
  37:	e8 1a 04 00 00       	call   456 <open>
  3c:	83 c4 10             	add    $0x10,%esp
  3f:	89 c7                	mov    %eax,%edi
  41:	85 c0                	test   %eax,%eax
  43:	78 24                	js     69 <main+0x69>
      printf(1, "cat: cannot open %s\n", argv[i]);
      exit();
    }
    cat(fd);
  45:	83 ec 0c             	sub    $0xc,%esp
  for(i = 1; i < argc; i++){
  48:	83 c6 01             	add    $0x1,%esi
  4b:	83 c3 04             	add    $0x4,%ebx
    cat(fd);
  4e:	50                   	push   %eax
  4f:	e8 3c 00 00 00       	call   90 <cat>
    close(fd);
  54:	89 3c 24             	mov    %edi,(%esp)
  57:	e8 e2 03 00 00       	call   43e <close>
  for(i = 1; i < argc; i++){
  5c:	83 c4 10             	add    $0x10,%esp
  5f:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
  62:	75 cc                	jne    30 <main+0x30>
  }
  exit();
  64:	e8 ad 03 00 00       	call   416 <exit>
      printf(1, "cat: cannot open %s\n", argv[i]);
  69:	50                   	push   %eax
  6a:	ff 33                	push   (%ebx)
  6c:	68 4b 09 00 00       	push   $0x94b
  71:	6a 01                	push   $0x1
  73:	e8 48 05 00 00       	call   5c0 <printf>
      exit();
  78:	e8 99 03 00 00       	call   416 <exit>
    cat(0);
  7d:	83 ec 0c             	sub    $0xc,%esp
  80:	6a 00                	push   $0x0
  82:	e8 09 00 00 00       	call   90 <cat>
    exit();
  87:	e8 8a 03 00 00       	call   416 <exit>
  8c:	66 90                	xchg   %ax,%ax
  8e:	66 90                	xchg   %ax,%ax

00000090 <cat>:
{
  90:	55                   	push   %ebp
  91:	89 e5                	mov    %esp,%ebp
  93:	56                   	push   %esi
  94:	53                   	push   %ebx
  95:	8b 75 08             	mov    0x8(%ebp),%esi
  while((n = read(fd, buf, sizeof(buf))) > 0) {
  98:	eb 1d                	jmp    b7 <cat+0x27>
  9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if (write(1, buf, n) != n) {
  a0:	83 ec 04             	sub    $0x4,%esp
  a3:	53                   	push   %ebx
  a4:	68 e0 09 00 00       	push   $0x9e0
  a9:	6a 01                	push   $0x1
  ab:	e8 86 03 00 00       	call   436 <write>
  b0:	83 c4 10             	add    $0x10,%esp
  b3:	39 d8                	cmp    %ebx,%eax
  b5:	75 25                	jne    dc <cat+0x4c>
  while((n = read(fd, buf, sizeof(buf))) > 0) {
  b7:	83 ec 04             	sub    $0x4,%esp
  ba:	68 00 02 00 00       	push   $0x200
  bf:	68 e0 09 00 00       	push   $0x9e0
  c4:	56                   	push   %esi
  c5:	e8 64 03 00 00       	call   42e <read>
  ca:	83 c4 10             	add    $0x10,%esp
  cd:	89 c3                	mov    %eax,%ebx
  cf:	85 c0                	test   %eax,%eax
  d1:	7f cd                	jg     a0 <cat+0x10>
  if(n < 0){
  d3:	75 1b                	jne    f0 <cat+0x60>
}
  d5:	8d 65 f8             	lea    -0x8(%ebp),%esp
  d8:	5b                   	pop    %ebx
  d9:	5e                   	pop    %esi
  da:	5d                   	pop    %ebp
  db:	c3                   	ret
      printf(1, "cat: write error\n");
  dc:	83 ec 08             	sub    $0x8,%esp
  df:	68 28 09 00 00       	push   $0x928
  e4:	6a 01                	push   $0x1
  e6:	e8 d5 04 00 00       	call   5c0 <printf>
      exit();
  eb:	e8 26 03 00 00       	call   416 <exit>
    printf(1, "cat: read error\n");
  f0:	50                   	push   %eax
  f1:	50                   	push   %eax
  f2:	68 3a 09 00 00       	push   $0x93a
  f7:	6a 01                	push   $0x1
  f9:	e8 c2 04 00 00       	call   5c0 <printf>
    exit();
  fe:	e8 13 03 00 00       	call   416 <exit>
 103:	66 90                	xchg   %ax,%ax
 105:	66 90                	xchg   %ax,%ax
 107:	66 90                	xchg   %ax,%ax
 109:	66 90                	xchg   %ax,%ax
 10b:	66 90                	xchg   %ax,%ax
 10d:	66 90                	xchg   %ax,%ax
 10f:	66 90                	xchg   %ax,%ax
 111:	66 90                	xchg   %ax,%ax
 113:	66 90                	xchg   %ax,%ax
 115:	66 90                	xchg   %ax,%ax
 117:	66 90                	xchg   %ax,%ax
 119:	66 90                	xchg   %ax,%ax
 11b:	66 90                	xchg   %ax,%ax
 11d:	66 90                	xchg   %ax,%ax
 11f:	90                   	nop

00000120 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 120:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 121:	31 c0                	xor    %eax,%eax
{
 123:	89 e5                	mov    %esp,%ebp
 125:	53                   	push   %ebx
 126:	8b 4d 08             	mov    0x8(%ebp),%ecx
 129:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 12c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 130:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 134:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 137:	83 c0 01             	add    $0x1,%eax
 13a:	84 d2                	test   %dl,%dl
 13c:	75 f2                	jne    130 <strcpy+0x10>
    ;
  return os;
}
 13e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 141:	89 c8                	mov    %ecx,%eax
 143:	c9                   	leave
 144:	c3                   	ret
 145:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 14c:	00 
 14d:	8d 76 00             	lea    0x0(%esi),%esi

00000150 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 150:	55                   	push   %ebp
 151:	89 e5                	mov    %esp,%ebp
 153:	53                   	push   %ebx
 154:	8b 55 08             	mov    0x8(%ebp),%edx
 157:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 15a:	0f b6 02             	movzbl (%edx),%eax
 15d:	84 c0                	test   %al,%al
 15f:	75 2f                	jne    190 <strcmp+0x40>
 161:	eb 4a                	jmp    1ad <strcmp+0x5d>
 163:	eb 1b                	jmp    180 <strcmp+0x30>
 165:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 16c:	00 
 16d:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 174:	00 
 175:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 17c:	00 
 17d:	8d 76 00             	lea    0x0(%esi),%esi
 180:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 184:	83 c2 01             	add    $0x1,%edx
 187:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 18a:	84 c0                	test   %al,%al
 18c:	74 12                	je     1a0 <strcmp+0x50>
 18e:	89 d9                	mov    %ebx,%ecx
 190:	0f b6 19             	movzbl (%ecx),%ebx
 193:	38 c3                	cmp    %al,%bl
 195:	74 e9                	je     180 <strcmp+0x30>
  return (uchar)*p - (uchar)*q;
 197:	29 d8                	sub    %ebx,%eax
}
 199:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 19c:	c9                   	leave
 19d:	c3                   	ret
 19e:	66 90                	xchg   %ax,%ax
  return (uchar)*p - (uchar)*q;
 1a0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 1a4:	31 c0                	xor    %eax,%eax
 1a6:	29 d8                	sub    %ebx,%eax
}
 1a8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1ab:	c9                   	leave
 1ac:	c3                   	ret
  return (uchar)*p - (uchar)*q;
 1ad:	0f b6 19             	movzbl (%ecx),%ebx
 1b0:	31 c0                	xor    %eax,%eax
 1b2:	eb e3                	jmp    197 <strcmp+0x47>
 1b4:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 1bb:	00 
 1bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000001c0 <strlen>:

uint
strlen(const char *s)
{
 1c0:	55                   	push   %ebp
 1c1:	89 e5                	mov    %esp,%ebp
 1c3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 1c6:	80 3a 00             	cmpb   $0x0,(%edx)
 1c9:	74 15                	je     1e0 <strlen+0x20>
 1cb:	31 c0                	xor    %eax,%eax
 1cd:	8d 76 00             	lea    0x0(%esi),%esi
 1d0:	83 c0 01             	add    $0x1,%eax
 1d3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 1d7:	89 c1                	mov    %eax,%ecx
 1d9:	75 f5                	jne    1d0 <strlen+0x10>
    ;
  return n;
}
 1db:	89 c8                	mov    %ecx,%eax
 1dd:	5d                   	pop    %ebp
 1de:	c3                   	ret
 1df:	90                   	nop
  for(n = 0; s[n]; n++)
 1e0:	31 c9                	xor    %ecx,%ecx
}
 1e2:	5d                   	pop    %ebp
 1e3:	89 c8                	mov    %ecx,%eax
 1e5:	c3                   	ret
 1e6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 1ed:	00 
 1ee:	66 90                	xchg   %ax,%ax

000001f0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1f0:	55                   	push   %ebp
 1f1:	89 e5                	mov    %esp,%ebp
 1f3:	57                   	push   %edi
 1f4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1f7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1fa:	8b 45 0c             	mov    0xc(%ebp),%eax
 1fd:	89 d7                	mov    %edx,%edi
 1ff:	fc                   	cld
 200:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 202:	8b 7d fc             	mov    -0x4(%ebp),%edi
 205:	89 d0                	mov    %edx,%eax
 207:	c9                   	leave
 208:	c3                   	ret
 209:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000210 <strchr>:

char*
strchr(const char *s, char c)
{
 210:	55                   	push   %ebp
 211:	89 e5                	mov    %esp,%ebp
 213:	8b 45 08             	mov    0x8(%ebp),%eax
 216:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 21a:	0f b6 10             	movzbl (%eax),%edx
 21d:	84 d2                	test   %dl,%dl
 21f:	75 1a                	jne    23b <strchr+0x2b>
 221:	eb 25                	jmp    248 <strchr+0x38>
 223:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 22a:	00 
 22b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 230:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 234:	83 c0 01             	add    $0x1,%eax
 237:	84 d2                	test   %dl,%dl
 239:	74 0d                	je     248 <strchr+0x38>
    if(*s == c)
 23b:	38 d1                	cmp    %dl,%cl
 23d:	75 f1                	jne    230 <strchr+0x20>
      return (char*)s;
  return 0;
}
 23f:	5d                   	pop    %ebp
 240:	c3                   	ret
 241:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 248:	31 c0                	xor    %eax,%eax
}
 24a:	5d                   	pop    %ebp
 24b:	c3                   	ret
 24c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000250 <gets>:

char*
gets(char *buf, int max)
{
 250:	55                   	push   %ebp
 251:	89 e5                	mov    %esp,%ebp
 253:	57                   	push   %edi
 254:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 255:	8d 75 e7             	lea    -0x19(%ebp),%esi
{
 258:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 259:	31 db                	xor    %ebx,%ebx
{
 25b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 25e:	eb 27                	jmp    287 <gets+0x37>
    cc = read(0, &c, 1);
 260:	83 ec 04             	sub    $0x4,%esp
 263:	6a 01                	push   $0x1
 265:	56                   	push   %esi
 266:	6a 00                	push   $0x0
 268:	e8 c1 01 00 00       	call   42e <read>
    if(cc < 1)
 26d:	83 c4 10             	add    $0x10,%esp
 270:	85 c0                	test   %eax,%eax
 272:	7e 1d                	jle    291 <gets+0x41>
      break;
    buf[i++] = c;
 274:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 278:	8b 55 08             	mov    0x8(%ebp),%edx
 27b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 27f:	3c 0a                	cmp    $0xa,%al
 281:	74 10                	je     293 <gets+0x43>
 283:	3c 0d                	cmp    $0xd,%al
 285:	74 0c                	je     293 <gets+0x43>
  for(i=0; i+1 < max; ){
 287:	89 df                	mov    %ebx,%edi
 289:	83 c3 01             	add    $0x1,%ebx
 28c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 28f:	7c cf                	jl     260 <gets+0x10>
 291:	89 fb                	mov    %edi,%ebx
      break;
  }
  buf[i] = '\0';
 293:	8b 45 08             	mov    0x8(%ebp),%eax
 296:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
 29a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 29d:	5b                   	pop    %ebx
 29e:	5e                   	pop    %esi
 29f:	5f                   	pop    %edi
 2a0:	5d                   	pop    %ebp
 2a1:	c3                   	ret
 2a2:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 2a9:	00 
 2aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000002b0 <stat>:

int
stat(const char *n, struct stat *st)
{
 2b0:	55                   	push   %ebp
 2b1:	89 e5                	mov    %esp,%ebp
 2b3:	56                   	push   %esi
 2b4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2b5:	83 ec 08             	sub    $0x8,%esp
 2b8:	6a 00                	push   $0x0
 2ba:	ff 75 08             	push   0x8(%ebp)
 2bd:	e8 94 01 00 00       	call   456 <open>
  if(fd < 0)
 2c2:	83 c4 10             	add    $0x10,%esp
 2c5:	85 c0                	test   %eax,%eax
 2c7:	78 27                	js     2f0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 2c9:	83 ec 08             	sub    $0x8,%esp
 2cc:	ff 75 0c             	push   0xc(%ebp)
 2cf:	89 c3                	mov    %eax,%ebx
 2d1:	50                   	push   %eax
 2d2:	e8 97 01 00 00       	call   46e <fstat>
  close(fd);
 2d7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 2da:	89 c6                	mov    %eax,%esi
  close(fd);
 2dc:	e8 5d 01 00 00       	call   43e <close>
  return r;
 2e1:	83 c4 10             	add    $0x10,%esp
}
 2e4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2e7:	89 f0                	mov    %esi,%eax
 2e9:	5b                   	pop    %ebx
 2ea:	5e                   	pop    %esi
 2eb:	5d                   	pop    %ebp
 2ec:	c3                   	ret
 2ed:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 2f0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 2f5:	eb ed                	jmp    2e4 <stat+0x34>
 2f7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 2fe:	00 
 2ff:	90                   	nop

00000300 <atoi>:

int
atoi(const char *s)
{
 300:	55                   	push   %ebp
 301:	89 e5                	mov    %esp,%ebp
 303:	53                   	push   %ebx
 304:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 307:	0f be 02             	movsbl (%edx),%eax
 30a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 30d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 310:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 315:	77 1e                	ja     335 <atoi+0x35>
 317:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 31e:	00 
 31f:	90                   	nop
    n = n*10 + *s++ - '0';
 320:	83 c2 01             	add    $0x1,%edx
 323:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 326:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 32a:	0f be 02             	movsbl (%edx),%eax
 32d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 330:	80 fb 09             	cmp    $0x9,%bl
 333:	76 eb                	jbe    320 <atoi+0x20>
  return n;
}
 335:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 338:	89 c8                	mov    %ecx,%eax
 33a:	c9                   	leave
 33b:	c3                   	ret
 33c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000340 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 340:	55                   	push   %ebp
 341:	89 e5                	mov    %esp,%ebp
 343:	57                   	push   %edi
 344:	8b 45 10             	mov    0x10(%ebp),%eax
 347:	8b 55 08             	mov    0x8(%ebp),%edx
 34a:	56                   	push   %esi
 34b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 34e:	85 c0                	test   %eax,%eax
 350:	7e 13                	jle    365 <memmove+0x25>
 352:	01 d0                	add    %edx,%eax
  dst = vdst;
 354:	89 d7                	mov    %edx,%edi
 356:	66 90                	xchg   %ax,%ax
 358:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 35f:	00 
    *dst++ = *src++;
 360:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 361:	39 f8                	cmp    %edi,%eax
 363:	75 fb                	jne    360 <memmove+0x20>
  return vdst;
}
 365:	5e                   	pop    %esi
 366:	89 d0                	mov    %edx,%eax
 368:	5f                   	pop    %edi
 369:	5d                   	pop    %ebp
 36a:	c3                   	ret
 36b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00000370 <sqrt>:


// https://www.geeksforgeeks.org/c-program-to-find-square-root-of-a-given-number/
float sqrt(int num) {
 370:	55                   	push   %ebp
 371:	89 e5                	mov    %esp,%ebp
 373:	56                   	push   %esi
 374:	53                   	push   %ebx
 375:	83 ec 04             	sub    $0x4,%esp
 378:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int end = num;
  int middle;

  float solution = 0.0;

  while (start <= end) {
 37b:	85 db                	test   %ebx,%ebx
 37d:	0f 88 87 00 00 00    	js     40a <sqrt+0x9a>
  int end = num;
 383:	89 d9                	mov    %ebx,%ecx
  float solution = 0.0;
 385:	d9 ee                	fldz
  int start = 0;
 387:	31 d2                	xor    %edx,%edx
 389:	eb 14                	jmp    39f <sqrt+0x2f>
 38b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 390:	dd d8                	fstp   %st(0)
    if (middle * middle == num) {
      solution = middle;
      break;
    }
    if (middle * middle < num) {
      solution = start;
 392:	89 55 f4             	mov    %edx,-0xc(%ebp)
      start = middle + 1;
 395:	8d 50 01             	lea    0x1(%eax),%edx
      solution = start;
 398:	db 45 f4             	fildl  -0xc(%ebp)
  while (start <= end) {
 39b:	39 ca                	cmp    %ecx,%edx
 39d:	7f 1e                	jg     3bd <sqrt+0x4d>
    middle = (start + end) / 2;
 39f:	8d 34 0a             	lea    (%edx,%ecx,1),%esi
 3a2:	89 f0                	mov    %esi,%eax
 3a4:	c1 e8 1f             	shr    $0x1f,%eax
 3a7:	01 f0                	add    %esi,%eax
 3a9:	d1 f8                	sar    $1,%eax
    if (middle * middle == num) {
 3ab:	89 c6                	mov    %eax,%esi
 3ad:	0f af f0             	imul   %eax,%esi
 3b0:	39 de                	cmp    %ebx,%esi
 3b2:	74 4c                	je     400 <sqrt+0x90>
    if (middle * middle < num) {
 3b4:	7c da                	jl     390 <sqrt+0x20>
    }
    else {
      end = middle - 1;
 3b6:	8d 48 ff             	lea    -0x1(%eax),%ecx
  while (start <= end) {
 3b9:	39 ca                	cmp    %ecx,%edx
 3bb:	7e e2                	jle    39f <sqrt+0x2f>

  float eps = 0.1;
  int i;

  for (i = 0; i < 5; i++) {
    while (solution * solution <= num) {
 3bd:	89 5d f4             	mov    %ebx,-0xc(%ebp)
 3c0:	b8 05 00 00 00       	mov    $0x5,%eax
 3c5:	db 45 f4             	fildl  -0xc(%ebp)
 3c8:	d9 05 68 09 00 00    	flds   0x968
 3ce:	eb 02                	jmp    3d2 <sqrt+0x62>
      solution += eps;
 3d0:	dc c2                	fadd   %st,%st(2)
    while (solution * solution <= num) {
 3d2:	d9 c2                	fld    %st(2)
 3d4:	d8 cb                	fmul   %st(3),%st
 3d6:	d9 ca                	fxch   %st(2)
 3d8:	db f2                	fcomi  %st(2),%st
 3da:	dd da                	fstp   %st(2)
 3dc:	73 f2                	jae    3d0 <sqrt+0x60>
    }
    solution = solution - eps;
 3de:	dc ea                	fsubr  %st,%st(2)
    eps = eps / 10;
 3e0:	d8 35 6c 09 00 00    	fdivs  0x96c
  for (i = 0; i < 5; i++) {
 3e6:	83 e8 01             	sub    $0x1,%eax
 3e9:	75 e7                	jne    3d2 <sqrt+0x62>
 3eb:	dd d8                	fstp   %st(0)
 3ed:	dd d8                	fstp   %st(0)
  }
  return solution;

}
 3ef:	83 c4 04             	add    $0x4,%esp
 3f2:	5b                   	pop    %ebx
 3f3:	5e                   	pop    %esi
 3f4:	5d                   	pop    %ebp
 3f5:	c3                   	ret
 3f6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 3fd:	00 
 3fe:	66 90                	xchg   %ax,%ax
 400:	dd d8                	fstp   %st(0)
      solution = middle;
 402:	89 45 f4             	mov    %eax,-0xc(%ebp)
 405:	db 45 f4             	fildl  -0xc(%ebp)
      break;
 408:	eb b3                	jmp    3bd <sqrt+0x4d>
  float solution = 0.0;
 40a:	d9 ee                	fldz
 40c:	eb af                	jmp    3bd <sqrt+0x4d>

0000040e <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 40e:	b8 01 00 00 00       	mov    $0x1,%eax
 413:	cd 40                	int    $0x40
 415:	c3                   	ret

00000416 <exit>:
SYSCALL(exit)
 416:	b8 02 00 00 00       	mov    $0x2,%eax
 41b:	cd 40                	int    $0x40
 41d:	c3                   	ret

0000041e <wait>:
SYSCALL(wait)
 41e:	b8 03 00 00 00       	mov    $0x3,%eax
 423:	cd 40                	int    $0x40
 425:	c3                   	ret

00000426 <pipe>:
SYSCALL(pipe)
 426:	b8 04 00 00 00       	mov    $0x4,%eax
 42b:	cd 40                	int    $0x40
 42d:	c3                   	ret

0000042e <read>:
SYSCALL(read)
 42e:	b8 05 00 00 00       	mov    $0x5,%eax
 433:	cd 40                	int    $0x40
 435:	c3                   	ret

00000436 <write>:
SYSCALL(write)
 436:	b8 10 00 00 00       	mov    $0x10,%eax
 43b:	cd 40                	int    $0x40
 43d:	c3                   	ret

0000043e <close>:
SYSCALL(close)
 43e:	b8 15 00 00 00       	mov    $0x15,%eax
 443:	cd 40                	int    $0x40
 445:	c3                   	ret

00000446 <kill>:
SYSCALL(kill)
 446:	b8 06 00 00 00       	mov    $0x6,%eax
 44b:	cd 40                	int    $0x40
 44d:	c3                   	ret

0000044e <exec>:
SYSCALL(exec)
 44e:	b8 07 00 00 00       	mov    $0x7,%eax
 453:	cd 40                	int    $0x40
 455:	c3                   	ret

00000456 <open>:
SYSCALL(open)
 456:	b8 0f 00 00 00       	mov    $0xf,%eax
 45b:	cd 40                	int    $0x40
 45d:	c3                   	ret

0000045e <mknod>:
SYSCALL(mknod)
 45e:	b8 11 00 00 00       	mov    $0x11,%eax
 463:	cd 40                	int    $0x40
 465:	c3                   	ret

00000466 <unlink>:
SYSCALL(unlink)
 466:	b8 12 00 00 00       	mov    $0x12,%eax
 46b:	cd 40                	int    $0x40
 46d:	c3                   	ret

0000046e <fstat>:
SYSCALL(fstat)
 46e:	b8 08 00 00 00       	mov    $0x8,%eax
 473:	cd 40                	int    $0x40
 475:	c3                   	ret

00000476 <link>:
SYSCALL(link)
 476:	b8 13 00 00 00       	mov    $0x13,%eax
 47b:	cd 40                	int    $0x40
 47d:	c3                   	ret

0000047e <mkdir>:
SYSCALL(mkdir)
 47e:	b8 14 00 00 00       	mov    $0x14,%eax
 483:	cd 40                	int    $0x40
 485:	c3                   	ret

00000486 <chdir>:
SYSCALL(chdir)
 486:	b8 09 00 00 00       	mov    $0x9,%eax
 48b:	cd 40                	int    $0x40
 48d:	c3                   	ret

0000048e <dup>:
SYSCALL(dup)
 48e:	b8 0a 00 00 00       	mov    $0xa,%eax
 493:	cd 40                	int    $0x40
 495:	c3                   	ret

00000496 <getpid>:
SYSCALL(getpid)
 496:	b8 0b 00 00 00       	mov    $0xb,%eax
 49b:	cd 40                	int    $0x40
 49d:	c3                   	ret

0000049e <sbrk>:
SYSCALL(sbrk)
 49e:	b8 0c 00 00 00       	mov    $0xc,%eax
 4a3:	cd 40                	int    $0x40
 4a5:	c3                   	ret

000004a6 <sleep>:
SYSCALL(sleep)
 4a6:	b8 0d 00 00 00       	mov    $0xd,%eax
 4ab:	cd 40                	int    $0x40
 4ad:	c3                   	ret

000004ae <uptime>:
SYSCALL(uptime)
 4ae:	b8 0e 00 00 00       	mov    $0xe,%eax
 4b3:	cd 40                	int    $0x40
 4b5:	c3                   	ret

000004b6 <gettid>:
SYSCALL(gettid)
 4b6:	b8 16 00 00 00       	mov    $0x16,%eax
 4bb:	cd 40                	int    $0x40
 4bd:	c3                   	ret

000004be <getpgid>:
SYSCALL(getpgid)
 4be:	b8 17 00 00 00       	mov    $0x17,%eax
 4c3:	cd 40                	int    $0x40
 4c5:	c3                   	ret

000004c6 <setpgid>:
SYSCALL(setpgid)
 4c6:	b8 18 00 00 00       	mov    $0x18,%eax
 4cb:	cd 40                	int    $0x40
 4cd:	c3                   	ret

000004ce <getppid>:
SYSCALL(getppid)
 4ce:	b8 19 00 00 00       	mov    $0x19,%eax
 4d3:	cd 40                	int    $0x40
 4d5:	c3                   	ret

000004d6 <uptime_ms>:
SYSCALL(uptime_ms)
 4d6:	b8 1a 00 00 00       	mov    $0x1a,%eax
 4db:	cd 40                	int    $0x40
 4dd:	c3                   	ret

000004de <setpriority>:
 4de:	b8 1b 00 00 00       	mov    $0x1b,%eax
 4e3:	cd 40                	int    $0x40
 4e5:	c3                   	ret
 4e6:	66 90                	xchg   %ax,%ax
 4e8:	66 90                	xchg   %ax,%ax
 4ea:	66 90                	xchg   %ax,%ax
 4ec:	66 90                	xchg   %ax,%ax
 4ee:	66 90                	xchg   %ax,%ax
 4f0:	66 90                	xchg   %ax,%ax
 4f2:	66 90                	xchg   %ax,%ax
 4f4:	66 90                	xchg   %ax,%ax
 4f6:	66 90                	xchg   %ax,%ax
 4f8:	66 90                	xchg   %ax,%ax
 4fa:	66 90                	xchg   %ax,%ax
 4fc:	66 90                	xchg   %ax,%ax
 4fe:	66 90                	xchg   %ax,%ax

00000500 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 500:	55                   	push   %ebp
 501:	89 e5                	mov    %esp,%ebp
 503:	57                   	push   %edi
 504:	56                   	push   %esi
 505:	53                   	push   %ebx
 506:	89 cb                	mov    %ecx,%ebx
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 508:	89 d1                	mov    %edx,%ecx
{
 50a:	83 ec 3c             	sub    $0x3c,%esp
 50d:	89 45 c4             	mov    %eax,-0x3c(%ebp)
  if(sgn && xx < 0){
 510:	85 d2                	test   %edx,%edx
 512:	0f 89 98 00 00 00    	jns    5b0 <printint+0xb0>
 518:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 51c:	0f 84 8e 00 00 00    	je     5b0 <printint+0xb0>
    x = -xx;
 522:	f7 d9                	neg    %ecx
    neg = 1;
 524:	b8 01 00 00 00       	mov    $0x1,%eax
  } else {
    x = xx;
  }

  i = 0;
 529:	89 45 c0             	mov    %eax,-0x40(%ebp)
 52c:	31 f6                	xor    %esi,%esi
 52e:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 535:	00 
 536:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 53d:	00 
 53e:	66 90                	xchg   %ax,%ax
  do{
    buf[i++] = digits[x % base];
 540:	89 c8                	mov    %ecx,%eax
 542:	31 d2                	xor    %edx,%edx
 544:	89 f7                	mov    %esi,%edi
 546:	f7 f3                	div    %ebx
 548:	8d 76 01             	lea    0x1(%esi),%esi
 54b:	0f b6 92 c8 09 00 00 	movzbl 0x9c8(%edx),%edx
 552:	88 54 35 d7          	mov    %dl,-0x29(%ebp,%esi,1)
  }while((x /= base) != 0);
 556:	89 ca                	mov    %ecx,%edx
 558:	89 c1                	mov    %eax,%ecx
 55a:	39 da                	cmp    %ebx,%edx
 55c:	73 e2                	jae    540 <printint+0x40>
  if(neg)
 55e:	8b 45 c0             	mov    -0x40(%ebp),%eax
 561:	85 c0                	test   %eax,%eax
 563:	74 07                	je     56c <printint+0x6c>
    buf[i++] = '-';
 565:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)
 56a:	89 f7                	mov    %esi,%edi

  while(--i >= 0)
 56c:	8d 5d d8             	lea    -0x28(%ebp),%ebx
 56f:	8b 75 c4             	mov    -0x3c(%ebp),%esi
 572:	01 df                	add    %ebx,%edi
 574:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 57b:	00 
 57c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    putc(fd, buf[i]);
 580:	0f b6 07             	movzbl (%edi),%eax
  write(fd, &c, 1);
 583:	83 ec 04             	sub    $0x4,%esp
 586:	88 45 d7             	mov    %al,-0x29(%ebp)
 589:	8d 45 d7             	lea    -0x29(%ebp),%eax
 58c:	6a 01                	push   $0x1
 58e:	50                   	push   %eax
 58f:	56                   	push   %esi
 590:	e8 a1 fe ff ff       	call   436 <write>
  while(--i >= 0)
 595:	89 f8                	mov    %edi,%eax
 597:	83 c4 10             	add    $0x10,%esp
 59a:	83 ef 01             	sub    $0x1,%edi
 59d:	39 d8                	cmp    %ebx,%eax
 59f:	75 df                	jne    580 <printint+0x80>
}
 5a1:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5a4:	5b                   	pop    %ebx
 5a5:	5e                   	pop    %esi
 5a6:	5f                   	pop    %edi
 5a7:	5d                   	pop    %ebp
 5a8:	c3                   	ret
 5a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 5b0:	31 c0                	xor    %eax,%eax
 5b2:	e9 72 ff ff ff       	jmp    529 <printint+0x29>
 5b7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 5be:	00 
 5bf:	90                   	nop

000005c0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 5c0:	55                   	push   %ebp
 5c1:	89 e5                	mov    %esp,%ebp
 5c3:	57                   	push   %edi
 5c4:	56                   	push   %esi
 5c5:	53                   	push   %ebx
 5c6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5c9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 5cc:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 5cf:	0f b6 13             	movzbl (%ebx),%edx
 5d2:	83 c3 01             	add    $0x1,%ebx
 5d5:	84 d2                	test   %dl,%dl
 5d7:	0f 84 a0 00 00 00    	je     67d <printf+0xbd>
 5dd:	8d 45 10             	lea    0x10(%ebp),%eax
 5e0:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    c = fmt[i] & 0xff;
 5e3:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 5e6:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 5e9:	eb 28                	jmp    613 <printf+0x53>
 5eb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 5f0:	83 ec 04             	sub    $0x4,%esp
 5f3:	8d 45 e7             	lea    -0x19(%ebp),%eax
 5f6:	88 55 e7             	mov    %dl,-0x19(%ebp)
  for(i = 0; fmt[i]; i++){
 5f9:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 5fc:	6a 01                	push   $0x1
 5fe:	50                   	push   %eax
 5ff:	56                   	push   %esi
 600:	e8 31 fe ff ff       	call   436 <write>
  for(i = 0; fmt[i]; i++){
 605:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 609:	83 c4 10             	add    $0x10,%esp
 60c:	84 d2                	test   %dl,%dl
 60e:	74 6d                	je     67d <printf+0xbd>
    c = fmt[i] & 0xff;
 610:	0f b6 c2             	movzbl %dl,%eax
      if(c == '%'){
 613:	83 f8 25             	cmp    $0x25,%eax
 616:	75 d8                	jne    5f0 <printf+0x30>
  for(i = 0; fmt[i]; i++){
 618:	0f b6 13             	movzbl (%ebx),%edx
 61b:	84 d2                	test   %dl,%dl
 61d:	74 5e                	je     67d <printf+0xbd>
    c = fmt[i] & 0xff;
 61f:	0f b6 c2             	movzbl %dl,%eax
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
 622:	80 fa 25             	cmp    $0x25,%dl
 625:	0f 84 1d 01 00 00    	je     748 <printf+0x188>
 62b:	83 e8 63             	sub    $0x63,%eax
 62e:	83 f8 15             	cmp    $0x15,%eax
 631:	77 0d                	ja     640 <printf+0x80>
 633:	ff 24 85 70 09 00 00 	jmp    *0x970(,%eax,4)
 63a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 640:	83 ec 04             	sub    $0x4,%esp
 643:	8d 4d e7             	lea    -0x19(%ebp),%ecx
 646:	88 55 d0             	mov    %dl,-0x30(%ebp)
        ap++;
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 649:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
  write(fd, &c, 1);
 64d:	6a 01                	push   $0x1
 64f:	51                   	push   %ecx
 650:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
 653:	56                   	push   %esi
 654:	e8 dd fd ff ff       	call   436 <write>
        putc(fd, c);
 659:	0f b6 55 d0          	movzbl -0x30(%ebp),%edx
  write(fd, &c, 1);
 65d:	83 c4 0c             	add    $0xc,%esp
 660:	88 55 e7             	mov    %dl,-0x19(%ebp)
 663:	6a 01                	push   $0x1
 665:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
 668:	51                   	push   %ecx
 669:	56                   	push   %esi
 66a:	e8 c7 fd ff ff       	call   436 <write>
  for(i = 0; fmt[i]; i++){
 66f:	0f b6 53 01          	movzbl 0x1(%ebx),%edx
 673:	83 c3 02             	add    $0x2,%ebx
 676:	83 c4 10             	add    $0x10,%esp
 679:	84 d2                	test   %dl,%dl
 67b:	75 93                	jne    610 <printf+0x50>
      }
      state = 0;
    }
  }
}
 67d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 680:	5b                   	pop    %ebx
 681:	5e                   	pop    %esi
 682:	5f                   	pop    %edi
 683:	5d                   	pop    %ebp
 684:	c3                   	ret
 685:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 688:	83 ec 0c             	sub    $0xc,%esp
 68b:	8b 17                	mov    (%edi),%edx
 68d:	b9 10 00 00 00       	mov    $0x10,%ecx
 692:	89 f0                	mov    %esi,%eax
 694:	6a 00                	push   $0x0
        ap++;
 696:	83 c7 04             	add    $0x4,%edi
        printint(fd, *ap, 16, 0);
 699:	e8 62 fe ff ff       	call   500 <printint>
  for(i = 0; fmt[i]; i++){
 69e:	eb cf                	jmp    66f <printf+0xaf>
        s = (char*)*ap;
 6a0:	8b 07                	mov    (%edi),%eax
        ap++;
 6a2:	83 c7 04             	add    $0x4,%edi
        if(s == 0)
 6a5:	85 c0                	test   %eax,%eax
 6a7:	0f 84 b3 00 00 00    	je     760 <printf+0x1a0>
        while(*s != 0){
 6ad:	0f b6 10             	movzbl (%eax),%edx
 6b0:	84 d2                	test   %dl,%dl
 6b2:	0f 84 ba 00 00 00    	je     772 <printf+0x1b2>
 6b8:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 6bb:	89 c7                	mov    %eax,%edi
 6bd:	89 d0                	mov    %edx,%eax
 6bf:	8d 4d e7             	lea    -0x19(%ebp),%ecx
 6c2:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 6c5:	89 fb                	mov    %edi,%ebx
 6c7:	89 cf                	mov    %ecx,%edi
 6c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 6d0:	83 ec 04             	sub    $0x4,%esp
 6d3:	88 45 e7             	mov    %al,-0x19(%ebp)
          s++;
 6d6:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 6d9:	6a 01                	push   $0x1
 6db:	57                   	push   %edi
 6dc:	56                   	push   %esi
 6dd:	e8 54 fd ff ff       	call   436 <write>
        while(*s != 0){
 6e2:	0f b6 03             	movzbl (%ebx),%eax
 6e5:	83 c4 10             	add    $0x10,%esp
 6e8:	84 c0                	test   %al,%al
 6ea:	75 e4                	jne    6d0 <printf+0x110>
 6ec:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  for(i = 0; fmt[i]; i++){
 6ef:	0f b6 53 01          	movzbl 0x1(%ebx),%edx
 6f3:	83 c3 02             	add    $0x2,%ebx
 6f6:	84 d2                	test   %dl,%dl
 6f8:	0f 85 e5 fe ff ff    	jne    5e3 <printf+0x23>
 6fe:	e9 7a ff ff ff       	jmp    67d <printf+0xbd>
 703:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 708:	83 ec 0c             	sub    $0xc,%esp
 70b:	8b 17                	mov    (%edi),%edx
 70d:	b9 0a 00 00 00       	mov    $0xa,%ecx
 712:	89 f0                	mov    %esi,%eax
 714:	6a 01                	push   $0x1
        ap++;
 716:	83 c7 04             	add    $0x4,%edi
        printint(fd, *ap, 10, 1);
 719:	e8 e2 fd ff ff       	call   500 <printint>
  for(i = 0; fmt[i]; i++){
 71e:	e9 4c ff ff ff       	jmp    66f <printf+0xaf>
 723:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 728:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
 72a:	83 ec 04             	sub    $0x4,%esp
 72d:	8d 4d e7             	lea    -0x19(%ebp),%ecx
        ap++;
 730:	83 c7 04             	add    $0x4,%edi
        putc(fd, *ap);
 733:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 736:	6a 01                	push   $0x1
 738:	51                   	push   %ecx
 739:	56                   	push   %esi
 73a:	e8 f7 fc ff ff       	call   436 <write>
  for(i = 0; fmt[i]; i++){
 73f:	e9 2b ff ff ff       	jmp    66f <printf+0xaf>
 744:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 748:	83 ec 04             	sub    $0x4,%esp
 74b:	88 55 e7             	mov    %dl,-0x19(%ebp)
 74e:	8d 4d e7             	lea    -0x19(%ebp),%ecx
 751:	6a 01                	push   $0x1
 753:	e9 10 ff ff ff       	jmp    668 <printf+0xa8>
 758:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 75f:	00 
          s = "(null)";
 760:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 763:	b8 28 00 00 00       	mov    $0x28,%eax
 768:	bf 60 09 00 00       	mov    $0x960,%edi
 76d:	e9 4d ff ff ff       	jmp    6bf <printf+0xff>
  for(i = 0; fmt[i]; i++){
 772:	0f b6 53 01          	movzbl 0x1(%ebx),%edx
 776:	83 c3 02             	add    $0x2,%ebx
 779:	84 d2                	test   %dl,%dl
 77b:	0f 85 8f fe ff ff    	jne    610 <printf+0x50>
 781:	e9 f7 fe ff ff       	jmp    67d <printf+0xbd>
 786:	66 90                	xchg   %ax,%ax
 788:	66 90                	xchg   %ax,%ax
 78a:	66 90                	xchg   %ax,%ax
 78c:	66 90                	xchg   %ax,%ax
 78e:	66 90                	xchg   %ax,%ax
 790:	66 90                	xchg   %ax,%ax
 792:	66 90                	xchg   %ax,%ax
 794:	66 90                	xchg   %ax,%ax
 796:	66 90                	xchg   %ax,%ax
 798:	66 90                	xchg   %ax,%ax
 79a:	66 90                	xchg   %ax,%ax
 79c:	66 90                	xchg   %ax,%ax
 79e:	66 90                	xchg   %ax,%ax

000007a0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7a0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7a1:	a1 e0 0b 00 00       	mov    0xbe0,%eax
{
 7a6:	89 e5                	mov    %esp,%ebp
 7a8:	57                   	push   %edi
 7a9:	56                   	push   %esi
 7aa:	53                   	push   %ebx
 7ab:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 7ae:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7b1:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 7b8:	00 
 7b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7c0:	89 c2                	mov    %eax,%edx
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7c2:	8b 00                	mov    (%eax),%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7c4:	39 ca                	cmp    %ecx,%edx
 7c6:	73 30                	jae    7f8 <free+0x58>
 7c8:	39 c1                	cmp    %eax,%ecx
 7ca:	72 04                	jb     7d0 <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7cc:	39 c2                	cmp    %eax,%edx
 7ce:	72 f0                	jb     7c0 <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
 7d0:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7d3:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7d6:	39 f8                	cmp    %edi,%eax
 7d8:	74 36                	je     810 <free+0x70>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 7da:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 7dd:	8b 42 04             	mov    0x4(%edx),%eax
 7e0:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 7e3:	39 f1                	cmp    %esi,%ecx
 7e5:	74 40                	je     827 <free+0x87>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 7e7:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 7e9:	5b                   	pop    %ebx
  freep = p;
 7ea:	89 15 e0 0b 00 00    	mov    %edx,0xbe0
}
 7f0:	5e                   	pop    %esi
 7f1:	5f                   	pop    %edi
 7f2:	5d                   	pop    %ebp
 7f3:	c3                   	ret
 7f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7f8:	39 c2                	cmp    %eax,%edx
 7fa:	72 c4                	jb     7c0 <free+0x20>
 7fc:	39 c1                	cmp    %eax,%ecx
 7fe:	73 c0                	jae    7c0 <free+0x20>
  if(bp + bp->s.size == p->s.ptr){
 800:	8b 73 fc             	mov    -0x4(%ebx),%esi
 803:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 806:	39 f8                	cmp    %edi,%eax
 808:	75 d0                	jne    7da <free+0x3a>
 80a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    bp->s.size += p->s.ptr->s.size;
 810:	03 70 04             	add    0x4(%eax),%esi
 813:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 816:	8b 02                	mov    (%edx),%eax
 818:	8b 00                	mov    (%eax),%eax
 81a:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 81d:	8b 42 04             	mov    0x4(%edx),%eax
 820:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 823:	39 f1                	cmp    %esi,%ecx
 825:	75 c0                	jne    7e7 <free+0x47>
    p->s.size += bp->s.size;
 827:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 82a:	89 15 e0 0b 00 00    	mov    %edx,0xbe0
    p->s.size += bp->s.size;
 830:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 833:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 836:	89 0a                	mov    %ecx,(%edx)
}
 838:	5b                   	pop    %ebx
 839:	5e                   	pop    %esi
 83a:	5f                   	pop    %edi
 83b:	5d                   	pop    %ebp
 83c:	c3                   	ret
 83d:	8d 76 00             	lea    0x0(%esi),%esi

00000840 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 840:	55                   	push   %ebp
 841:	89 e5                	mov    %esp,%ebp
 843:	57                   	push   %edi
 844:	56                   	push   %esi
 845:	53                   	push   %ebx
 846:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 849:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 84c:	8b 15 e0 0b 00 00    	mov    0xbe0,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 852:	8d 78 07             	lea    0x7(%eax),%edi
 855:	c1 ef 03             	shr    $0x3,%edi
 858:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 85b:	85 d2                	test   %edx,%edx
 85d:	0f 84 8d 00 00 00    	je     8f0 <malloc+0xb0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 863:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 865:	8b 48 04             	mov    0x4(%eax),%ecx
 868:	39 f9                	cmp    %edi,%ecx
 86a:	73 64                	jae    8d0 <malloc+0x90>
  if(nu < 4096)
 86c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 871:	39 df                	cmp    %ebx,%edi
 873:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 876:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 87d:	eb 0a                	jmp    889 <malloc+0x49>
 87f:	90                   	nop
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 880:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 882:	8b 48 04             	mov    0x4(%eax),%ecx
 885:	39 f9                	cmp    %edi,%ecx
 887:	73 47                	jae    8d0 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 889:	89 c2                	mov    %eax,%edx
 88b:	39 05 e0 0b 00 00    	cmp    %eax,0xbe0
 891:	75 ed                	jne    880 <malloc+0x40>
  p = sbrk(nu * sizeof(Header));
 893:	83 ec 0c             	sub    $0xc,%esp
 896:	56                   	push   %esi
 897:	e8 02 fc ff ff       	call   49e <sbrk>
  if(p == (char*)-1)
 89c:	83 c4 10             	add    $0x10,%esp
 89f:	83 f8 ff             	cmp    $0xffffffff,%eax
 8a2:	74 1c                	je     8c0 <malloc+0x80>
  hp->s.size = nu;
 8a4:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 8a7:	83 ec 0c             	sub    $0xc,%esp
 8aa:	83 c0 08             	add    $0x8,%eax
 8ad:	50                   	push   %eax
 8ae:	e8 ed fe ff ff       	call   7a0 <free>
  return freep;
 8b3:	8b 15 e0 0b 00 00    	mov    0xbe0,%edx
      if((p = morecore(nunits)) == 0)
 8b9:	83 c4 10             	add    $0x10,%esp
 8bc:	85 d2                	test   %edx,%edx
 8be:	75 c0                	jne    880 <malloc+0x40>
        return 0;
  }
}
 8c0:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 8c3:	31 c0                	xor    %eax,%eax
}
 8c5:	5b                   	pop    %ebx
 8c6:	5e                   	pop    %esi
 8c7:	5f                   	pop    %edi
 8c8:	5d                   	pop    %ebp
 8c9:	c3                   	ret
 8ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 8d0:	39 cf                	cmp    %ecx,%edi
 8d2:	74 4c                	je     920 <malloc+0xe0>
        p->s.size -= nunits;
 8d4:	29 f9                	sub    %edi,%ecx
 8d6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 8d9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 8dc:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 8df:	89 15 e0 0b 00 00    	mov    %edx,0xbe0
}
 8e5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 8e8:	83 c0 08             	add    $0x8,%eax
}
 8eb:	5b                   	pop    %ebx
 8ec:	5e                   	pop    %esi
 8ed:	5f                   	pop    %edi
 8ee:	5d                   	pop    %ebp
 8ef:	c3                   	ret
    base.s.ptr = freep = prevp = &base;
 8f0:	c7 05 e0 0b 00 00 e4 	movl   $0xbe4,0xbe0
 8f7:	0b 00 00 
    base.s.size = 0;
 8fa:	b8 e4 0b 00 00       	mov    $0xbe4,%eax
    base.s.ptr = freep = prevp = &base;
 8ff:	c7 05 e4 0b 00 00 e4 	movl   $0xbe4,0xbe4
 906:	0b 00 00 
    base.s.size = 0;
 909:	c7 05 e8 0b 00 00 00 	movl   $0x0,0xbe8
 910:	00 00 00 
    if(p->s.size >= nunits){
 913:	e9 54 ff ff ff       	jmp    86c <malloc+0x2c>
 918:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 91f:	00 
        prevp->s.ptr = p->s.ptr;
 920:	8b 08                	mov    (%eax),%ecx
 922:	89 0a                	mov    %ecx,(%edx)
 924:	eb b9                	jmp    8df <malloc+0x9f>
