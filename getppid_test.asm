
_getppid_test:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "user.h"

int main() {
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	53                   	push   %ebx
   e:	51                   	push   %ecx
	int pid = fork();
   f:	e8 3a 03 00 00       	call   34e <fork>

		if(pid < 0) {
  14:	85 c0                	test   %eax,%eax
  16:	78 2b                	js     43 <main+0x43>
			printf(1, "Fork failed\n");
			exit();
		} else if(pid ==0) {
  18:	75 1f                	jne    39 <main+0x39>
			int ppid= getppid();
  1a:	e8 ef 03 00 00       	call   40e <getppid>
  1f:	89 c3                	mov    %eax,%ebx
			printf(1,"pid: %d. ppid: %d\n", getpid(),ppid);
  21:	e8 b0 03 00 00       	call   3d6 <getpid>
  26:	53                   	push   %ebx
  27:	50                   	push   %eax
  28:	68 75 08 00 00       	push   $0x875
  2d:	6a 01                	push   $0x1
  2f:	e8 cc 04 00 00       	call   500 <printf>
			exit();
  34:	e8 1d 03 00 00       	call   356 <exit>
		}
		else {
			wait();
  39:	e8 20 03 00 00       	call   35e <wait>
		}
	exit();
  3e:	e8 13 03 00 00       	call   356 <exit>
			printf(1, "Fork failed\n");
  43:	50                   	push   %eax
  44:	50                   	push   %eax
  45:	68 68 08 00 00       	push   $0x868
  4a:	6a 01                	push   $0x1
  4c:	e8 af 04 00 00       	call   500 <printf>
			exit();
  51:	e8 00 03 00 00       	call   356 <exit>
  56:	66 90                	xchg   %ax,%ax
  58:	66 90                	xchg   %ax,%ax
  5a:	66 90                	xchg   %ax,%ax
  5c:	66 90                	xchg   %ax,%ax
  5e:	66 90                	xchg   %ax,%ax

00000060 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  60:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  61:	31 c0                	xor    %eax,%eax
{
  63:	89 e5                	mov    %esp,%ebp
  65:	53                   	push   %ebx
  66:	8b 4d 08             	mov    0x8(%ebp),%ecx
  69:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
  70:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  74:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  77:	83 c0 01             	add    $0x1,%eax
  7a:	84 d2                	test   %dl,%dl
  7c:	75 f2                	jne    70 <strcpy+0x10>
    ;
  return os;
}
  7e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  81:	89 c8                	mov    %ecx,%eax
  83:	c9                   	leave
  84:	c3                   	ret
  85:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  8c:	00 
  8d:	8d 76 00             	lea    0x0(%esi),%esi

00000090 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  90:	55                   	push   %ebp
  91:	89 e5                	mov    %esp,%ebp
  93:	53                   	push   %ebx
  94:	8b 55 08             	mov    0x8(%ebp),%edx
  97:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
  9a:	0f b6 02             	movzbl (%edx),%eax
  9d:	84 c0                	test   %al,%al
  9f:	75 2f                	jne    d0 <strcmp+0x40>
  a1:	eb 4a                	jmp    ed <strcmp+0x5d>
  a3:	eb 1b                	jmp    c0 <strcmp+0x30>
  a5:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  ac:	00 
  ad:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  b4:	00 
  b5:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  bc:	00 
  bd:	8d 76 00             	lea    0x0(%esi),%esi
  c0:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
  c4:	83 c2 01             	add    $0x1,%edx
  c7:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
  ca:	84 c0                	test   %al,%al
  cc:	74 12                	je     e0 <strcmp+0x50>
  ce:	89 d9                	mov    %ebx,%ecx
  d0:	0f b6 19             	movzbl (%ecx),%ebx
  d3:	38 c3                	cmp    %al,%bl
  d5:	74 e9                	je     c0 <strcmp+0x30>
  return (uchar)*p - (uchar)*q;
  d7:	29 d8                	sub    %ebx,%eax
}
  d9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  dc:	c9                   	leave
  dd:	c3                   	ret
  de:	66 90                	xchg   %ax,%ax
  return (uchar)*p - (uchar)*q;
  e0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
  e4:	31 c0                	xor    %eax,%eax
  e6:	29 d8                	sub    %ebx,%eax
}
  e8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  eb:	c9                   	leave
  ec:	c3                   	ret
  return (uchar)*p - (uchar)*q;
  ed:	0f b6 19             	movzbl (%ecx),%ebx
  f0:	31 c0                	xor    %eax,%eax
  f2:	eb e3                	jmp    d7 <strcmp+0x47>
  f4:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  fb:	00 
  fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000100 <strlen>:

uint
strlen(const char *s)
{
 100:	55                   	push   %ebp
 101:	89 e5                	mov    %esp,%ebp
 103:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 106:	80 3a 00             	cmpb   $0x0,(%edx)
 109:	74 15                	je     120 <strlen+0x20>
 10b:	31 c0                	xor    %eax,%eax
 10d:	8d 76 00             	lea    0x0(%esi),%esi
 110:	83 c0 01             	add    $0x1,%eax
 113:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 117:	89 c1                	mov    %eax,%ecx
 119:	75 f5                	jne    110 <strlen+0x10>
    ;
  return n;
}
 11b:	89 c8                	mov    %ecx,%eax
 11d:	5d                   	pop    %ebp
 11e:	c3                   	ret
 11f:	90                   	nop
  for(n = 0; s[n]; n++)
 120:	31 c9                	xor    %ecx,%ecx
}
 122:	5d                   	pop    %ebp
 123:	89 c8                	mov    %ecx,%eax
 125:	c3                   	ret
 126:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 12d:	00 
 12e:	66 90                	xchg   %ax,%ax

00000130 <memset>:

void*
memset(void *dst, int c, uint n)
{
 130:	55                   	push   %ebp
 131:	89 e5                	mov    %esp,%ebp
 133:	57                   	push   %edi
 134:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 137:	8b 4d 10             	mov    0x10(%ebp),%ecx
 13a:	8b 45 0c             	mov    0xc(%ebp),%eax
 13d:	89 d7                	mov    %edx,%edi
 13f:	fc                   	cld
 140:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 142:	8b 7d fc             	mov    -0x4(%ebp),%edi
 145:	89 d0                	mov    %edx,%eax
 147:	c9                   	leave
 148:	c3                   	ret
 149:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000150 <strchr>:

char*
strchr(const char *s, char c)
{
 150:	55                   	push   %ebp
 151:	89 e5                	mov    %esp,%ebp
 153:	8b 45 08             	mov    0x8(%ebp),%eax
 156:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 15a:	0f b6 10             	movzbl (%eax),%edx
 15d:	84 d2                	test   %dl,%dl
 15f:	75 1a                	jne    17b <strchr+0x2b>
 161:	eb 25                	jmp    188 <strchr+0x38>
 163:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 16a:	00 
 16b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 170:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 174:	83 c0 01             	add    $0x1,%eax
 177:	84 d2                	test   %dl,%dl
 179:	74 0d                	je     188 <strchr+0x38>
    if(*s == c)
 17b:	38 d1                	cmp    %dl,%cl
 17d:	75 f1                	jne    170 <strchr+0x20>
      return (char*)s;
  return 0;
}
 17f:	5d                   	pop    %ebp
 180:	c3                   	ret
 181:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 188:	31 c0                	xor    %eax,%eax
}
 18a:	5d                   	pop    %ebp
 18b:	c3                   	ret
 18c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000190 <gets>:

char*
gets(char *buf, int max)
{
 190:	55                   	push   %ebp
 191:	89 e5                	mov    %esp,%ebp
 193:	57                   	push   %edi
 194:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 195:	8d 75 e7             	lea    -0x19(%ebp),%esi
{
 198:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 199:	31 db                	xor    %ebx,%ebx
{
 19b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 19e:	eb 27                	jmp    1c7 <gets+0x37>
    cc = read(0, &c, 1);
 1a0:	83 ec 04             	sub    $0x4,%esp
 1a3:	6a 01                	push   $0x1
 1a5:	56                   	push   %esi
 1a6:	6a 00                	push   $0x0
 1a8:	e8 c1 01 00 00       	call   36e <read>
    if(cc < 1)
 1ad:	83 c4 10             	add    $0x10,%esp
 1b0:	85 c0                	test   %eax,%eax
 1b2:	7e 1d                	jle    1d1 <gets+0x41>
      break;
    buf[i++] = c;
 1b4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1b8:	8b 55 08             	mov    0x8(%ebp),%edx
 1bb:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 1bf:	3c 0a                	cmp    $0xa,%al
 1c1:	74 10                	je     1d3 <gets+0x43>
 1c3:	3c 0d                	cmp    $0xd,%al
 1c5:	74 0c                	je     1d3 <gets+0x43>
  for(i=0; i+1 < max; ){
 1c7:	89 df                	mov    %ebx,%edi
 1c9:	83 c3 01             	add    $0x1,%ebx
 1cc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1cf:	7c cf                	jl     1a0 <gets+0x10>
 1d1:	89 fb                	mov    %edi,%ebx
      break;
  }
  buf[i] = '\0';
 1d3:	8b 45 08             	mov    0x8(%ebp),%eax
 1d6:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
 1da:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1dd:	5b                   	pop    %ebx
 1de:	5e                   	pop    %esi
 1df:	5f                   	pop    %edi
 1e0:	5d                   	pop    %ebp
 1e1:	c3                   	ret
 1e2:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 1e9:	00 
 1ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000001f0 <stat>:

int
stat(const char *n, struct stat *st)
{
 1f0:	55                   	push   %ebp
 1f1:	89 e5                	mov    %esp,%ebp
 1f3:	56                   	push   %esi
 1f4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1f5:	83 ec 08             	sub    $0x8,%esp
 1f8:	6a 00                	push   $0x0
 1fa:	ff 75 08             	push   0x8(%ebp)
 1fd:	e8 94 01 00 00       	call   396 <open>
  if(fd < 0)
 202:	83 c4 10             	add    $0x10,%esp
 205:	85 c0                	test   %eax,%eax
 207:	78 27                	js     230 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 209:	83 ec 08             	sub    $0x8,%esp
 20c:	ff 75 0c             	push   0xc(%ebp)
 20f:	89 c3                	mov    %eax,%ebx
 211:	50                   	push   %eax
 212:	e8 97 01 00 00       	call   3ae <fstat>
  close(fd);
 217:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 21a:	89 c6                	mov    %eax,%esi
  close(fd);
 21c:	e8 5d 01 00 00       	call   37e <close>
  return r;
 221:	83 c4 10             	add    $0x10,%esp
}
 224:	8d 65 f8             	lea    -0x8(%ebp),%esp
 227:	89 f0                	mov    %esi,%eax
 229:	5b                   	pop    %ebx
 22a:	5e                   	pop    %esi
 22b:	5d                   	pop    %ebp
 22c:	c3                   	ret
 22d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 230:	be ff ff ff ff       	mov    $0xffffffff,%esi
 235:	eb ed                	jmp    224 <stat+0x34>
 237:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 23e:	00 
 23f:	90                   	nop

00000240 <atoi>:

int
atoi(const char *s)
{
 240:	55                   	push   %ebp
 241:	89 e5                	mov    %esp,%ebp
 243:	53                   	push   %ebx
 244:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 247:	0f be 02             	movsbl (%edx),%eax
 24a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 24d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 250:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 255:	77 1e                	ja     275 <atoi+0x35>
 257:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 25e:	00 
 25f:	90                   	nop
    n = n*10 + *s++ - '0';
 260:	83 c2 01             	add    $0x1,%edx
 263:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 266:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 26a:	0f be 02             	movsbl (%edx),%eax
 26d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 270:	80 fb 09             	cmp    $0x9,%bl
 273:	76 eb                	jbe    260 <atoi+0x20>
  return n;
}
 275:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 278:	89 c8                	mov    %ecx,%eax
 27a:	c9                   	leave
 27b:	c3                   	ret
 27c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000280 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 280:	55                   	push   %ebp
 281:	89 e5                	mov    %esp,%ebp
 283:	57                   	push   %edi
 284:	8b 45 10             	mov    0x10(%ebp),%eax
 287:	8b 55 08             	mov    0x8(%ebp),%edx
 28a:	56                   	push   %esi
 28b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 28e:	85 c0                	test   %eax,%eax
 290:	7e 13                	jle    2a5 <memmove+0x25>
 292:	01 d0                	add    %edx,%eax
  dst = vdst;
 294:	89 d7                	mov    %edx,%edi
 296:	66 90                	xchg   %ax,%ax
 298:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 29f:	00 
    *dst++ = *src++;
 2a0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 2a1:	39 f8                	cmp    %edi,%eax
 2a3:	75 fb                	jne    2a0 <memmove+0x20>
  return vdst;
}
 2a5:	5e                   	pop    %esi
 2a6:	89 d0                	mov    %edx,%eax
 2a8:	5f                   	pop    %edi
 2a9:	5d                   	pop    %ebp
 2aa:	c3                   	ret
 2ab:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

000002b0 <sqrt>:


// https://www.geeksforgeeks.org/c-program-to-find-square-root-of-a-given-number/
float sqrt(int num) {
 2b0:	55                   	push   %ebp
 2b1:	89 e5                	mov    %esp,%ebp
 2b3:	56                   	push   %esi
 2b4:	53                   	push   %ebx
 2b5:	83 ec 04             	sub    $0x4,%esp
 2b8:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int end = num;
  int middle;

  float solution = 0.0;

  while (start <= end) {
 2bb:	85 db                	test   %ebx,%ebx
 2bd:	0f 88 87 00 00 00    	js     34a <sqrt+0x9a>
  int end = num;
 2c3:	89 d9                	mov    %ebx,%ecx
  float solution = 0.0;
 2c5:	d9 ee                	fldz
  int start = 0;
 2c7:	31 d2                	xor    %edx,%edx
 2c9:	eb 14                	jmp    2df <sqrt+0x2f>
 2cb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 2d0:	dd d8                	fstp   %st(0)
    if (middle * middle == num) {
      solution = middle;
      break;
    }
    if (middle * middle < num) {
      solution = start;
 2d2:	89 55 f4             	mov    %edx,-0xc(%ebp)
      start = middle + 1;
 2d5:	8d 50 01             	lea    0x1(%eax),%edx
      solution = start;
 2d8:	db 45 f4             	fildl  -0xc(%ebp)
  while (start <= end) {
 2db:	39 ca                	cmp    %ecx,%edx
 2dd:	7f 1e                	jg     2fd <sqrt+0x4d>
    middle = (start + end) / 2;
 2df:	8d 34 0a             	lea    (%edx,%ecx,1),%esi
 2e2:	89 f0                	mov    %esi,%eax
 2e4:	c1 e8 1f             	shr    $0x1f,%eax
 2e7:	01 f0                	add    %esi,%eax
 2e9:	d1 f8                	sar    $1,%eax
    if (middle * middle == num) {
 2eb:	89 c6                	mov    %eax,%esi
 2ed:	0f af f0             	imul   %eax,%esi
 2f0:	39 de                	cmp    %ebx,%esi
 2f2:	74 4c                	je     340 <sqrt+0x90>
    if (middle * middle < num) {
 2f4:	7c da                	jl     2d0 <sqrt+0x20>
    }
    else {
      end = middle - 1;
 2f6:	8d 48 ff             	lea    -0x1(%eax),%ecx
  while (start <= end) {
 2f9:	39 ca                	cmp    %ecx,%edx
 2fb:	7e e2                	jle    2df <sqrt+0x2f>

  float eps = 0.1;
  int i;

  for (i = 0; i < 5; i++) {
    while (solution * solution <= num) {
 2fd:	89 5d f4             	mov    %ebx,-0xc(%ebp)
 300:	b8 05 00 00 00       	mov    $0x5,%eax
 305:	db 45 f4             	fildl  -0xc(%ebp)
 308:	d9 05 90 08 00 00    	flds   0x890
 30e:	eb 02                	jmp    312 <sqrt+0x62>
      solution += eps;
 310:	dc c2                	fadd   %st,%st(2)
    while (solution * solution <= num) {
 312:	d9 c2                	fld    %st(2)
 314:	d8 cb                	fmul   %st(3),%st
 316:	d9 ca                	fxch   %st(2)
 318:	db f2                	fcomi  %st(2),%st
 31a:	dd da                	fstp   %st(2)
 31c:	73 f2                	jae    310 <sqrt+0x60>
    }
    solution = solution - eps;
 31e:	dc ea                	fsubr  %st,%st(2)
    eps = eps / 10;
 320:	d8 35 94 08 00 00    	fdivs  0x894
  for (i = 0; i < 5; i++) {
 326:	83 e8 01             	sub    $0x1,%eax
 329:	75 e7                	jne    312 <sqrt+0x62>
 32b:	dd d8                	fstp   %st(0)
 32d:	dd d8                	fstp   %st(0)
  }
  return solution;

}
 32f:	83 c4 04             	add    $0x4,%esp
 332:	5b                   	pop    %ebx
 333:	5e                   	pop    %esi
 334:	5d                   	pop    %ebp
 335:	c3                   	ret
 336:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 33d:	00 
 33e:	66 90                	xchg   %ax,%ax
 340:	dd d8                	fstp   %st(0)
      solution = middle;
 342:	89 45 f4             	mov    %eax,-0xc(%ebp)
 345:	db 45 f4             	fildl  -0xc(%ebp)
      break;
 348:	eb b3                	jmp    2fd <sqrt+0x4d>
  float solution = 0.0;
 34a:	d9 ee                	fldz
 34c:	eb af                	jmp    2fd <sqrt+0x4d>

0000034e <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 34e:	b8 01 00 00 00       	mov    $0x1,%eax
 353:	cd 40                	int    $0x40
 355:	c3                   	ret

00000356 <exit>:
SYSCALL(exit)
 356:	b8 02 00 00 00       	mov    $0x2,%eax
 35b:	cd 40                	int    $0x40
 35d:	c3                   	ret

0000035e <wait>:
SYSCALL(wait)
 35e:	b8 03 00 00 00       	mov    $0x3,%eax
 363:	cd 40                	int    $0x40
 365:	c3                   	ret

00000366 <pipe>:
SYSCALL(pipe)
 366:	b8 04 00 00 00       	mov    $0x4,%eax
 36b:	cd 40                	int    $0x40
 36d:	c3                   	ret

0000036e <read>:
SYSCALL(read)
 36e:	b8 05 00 00 00       	mov    $0x5,%eax
 373:	cd 40                	int    $0x40
 375:	c3                   	ret

00000376 <write>:
SYSCALL(write)
 376:	b8 10 00 00 00       	mov    $0x10,%eax
 37b:	cd 40                	int    $0x40
 37d:	c3                   	ret

0000037e <close>:
SYSCALL(close)
 37e:	b8 15 00 00 00       	mov    $0x15,%eax
 383:	cd 40                	int    $0x40
 385:	c3                   	ret

00000386 <kill>:
SYSCALL(kill)
 386:	b8 06 00 00 00       	mov    $0x6,%eax
 38b:	cd 40                	int    $0x40
 38d:	c3                   	ret

0000038e <exec>:
SYSCALL(exec)
 38e:	b8 07 00 00 00       	mov    $0x7,%eax
 393:	cd 40                	int    $0x40
 395:	c3                   	ret

00000396 <open>:
SYSCALL(open)
 396:	b8 0f 00 00 00       	mov    $0xf,%eax
 39b:	cd 40                	int    $0x40
 39d:	c3                   	ret

0000039e <mknod>:
SYSCALL(mknod)
 39e:	b8 11 00 00 00       	mov    $0x11,%eax
 3a3:	cd 40                	int    $0x40
 3a5:	c3                   	ret

000003a6 <unlink>:
SYSCALL(unlink)
 3a6:	b8 12 00 00 00       	mov    $0x12,%eax
 3ab:	cd 40                	int    $0x40
 3ad:	c3                   	ret

000003ae <fstat>:
SYSCALL(fstat)
 3ae:	b8 08 00 00 00       	mov    $0x8,%eax
 3b3:	cd 40                	int    $0x40
 3b5:	c3                   	ret

000003b6 <link>:
SYSCALL(link)
 3b6:	b8 13 00 00 00       	mov    $0x13,%eax
 3bb:	cd 40                	int    $0x40
 3bd:	c3                   	ret

000003be <mkdir>:
SYSCALL(mkdir)
 3be:	b8 14 00 00 00       	mov    $0x14,%eax
 3c3:	cd 40                	int    $0x40
 3c5:	c3                   	ret

000003c6 <chdir>:
SYSCALL(chdir)
 3c6:	b8 09 00 00 00       	mov    $0x9,%eax
 3cb:	cd 40                	int    $0x40
 3cd:	c3                   	ret

000003ce <dup>:
SYSCALL(dup)
 3ce:	b8 0a 00 00 00       	mov    $0xa,%eax
 3d3:	cd 40                	int    $0x40
 3d5:	c3                   	ret

000003d6 <getpid>:
SYSCALL(getpid)
 3d6:	b8 0b 00 00 00       	mov    $0xb,%eax
 3db:	cd 40                	int    $0x40
 3dd:	c3                   	ret

000003de <sbrk>:
SYSCALL(sbrk)
 3de:	b8 0c 00 00 00       	mov    $0xc,%eax
 3e3:	cd 40                	int    $0x40
 3e5:	c3                   	ret

000003e6 <sleep>:
SYSCALL(sleep)
 3e6:	b8 0d 00 00 00       	mov    $0xd,%eax
 3eb:	cd 40                	int    $0x40
 3ed:	c3                   	ret

000003ee <uptime>:
SYSCALL(uptime)
 3ee:	b8 0e 00 00 00       	mov    $0xe,%eax
 3f3:	cd 40                	int    $0x40
 3f5:	c3                   	ret

000003f6 <gettid>:
SYSCALL(gettid)
 3f6:	b8 16 00 00 00       	mov    $0x16,%eax
 3fb:	cd 40                	int    $0x40
 3fd:	c3                   	ret

000003fe <getpgid>:
SYSCALL(getpgid)
 3fe:	b8 17 00 00 00       	mov    $0x17,%eax
 403:	cd 40                	int    $0x40
 405:	c3                   	ret

00000406 <setpgid>:
SYSCALL(setpgid)
 406:	b8 18 00 00 00       	mov    $0x18,%eax
 40b:	cd 40                	int    $0x40
 40d:	c3                   	ret

0000040e <getppid>:
SYSCALL(getppid)
 40e:	b8 19 00 00 00       	mov    $0x19,%eax
 413:	cd 40                	int    $0x40
 415:	c3                   	ret

00000416 <uptime_ms>:
SYSCALL(uptime_ms)
 416:	b8 1a 00 00 00       	mov    $0x1a,%eax
 41b:	cd 40                	int    $0x40
 41d:	c3                   	ret

0000041e <setpriority>:
 41e:	b8 1b 00 00 00       	mov    $0x1b,%eax
 423:	cd 40                	int    $0x40
 425:	c3                   	ret
 426:	66 90                	xchg   %ax,%ax
 428:	66 90                	xchg   %ax,%ax
 42a:	66 90                	xchg   %ax,%ax
 42c:	66 90                	xchg   %ax,%ax
 42e:	66 90                	xchg   %ax,%ax
 430:	66 90                	xchg   %ax,%ax
 432:	66 90                	xchg   %ax,%ax
 434:	66 90                	xchg   %ax,%ax
 436:	66 90                	xchg   %ax,%ax
 438:	66 90                	xchg   %ax,%ax
 43a:	66 90                	xchg   %ax,%ax
 43c:	66 90                	xchg   %ax,%ax
 43e:	66 90                	xchg   %ax,%ax

00000440 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 440:	55                   	push   %ebp
 441:	89 e5                	mov    %esp,%ebp
 443:	57                   	push   %edi
 444:	56                   	push   %esi
 445:	53                   	push   %ebx
 446:	89 cb                	mov    %ecx,%ebx
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 448:	89 d1                	mov    %edx,%ecx
{
 44a:	83 ec 3c             	sub    $0x3c,%esp
 44d:	89 45 c4             	mov    %eax,-0x3c(%ebp)
  if(sgn && xx < 0){
 450:	85 d2                	test   %edx,%edx
 452:	0f 89 98 00 00 00    	jns    4f0 <printint+0xb0>
 458:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 45c:	0f 84 8e 00 00 00    	je     4f0 <printint+0xb0>
    x = -xx;
 462:	f7 d9                	neg    %ecx
    neg = 1;
 464:	b8 01 00 00 00       	mov    $0x1,%eax
  } else {
    x = xx;
  }

  i = 0;
 469:	89 45 c0             	mov    %eax,-0x40(%ebp)
 46c:	31 f6                	xor    %esi,%esi
 46e:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 475:	00 
 476:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 47d:	00 
 47e:	66 90                	xchg   %ax,%ax
  do{
    buf[i++] = digits[x % base];
 480:	89 c8                	mov    %ecx,%eax
 482:	31 d2                	xor    %edx,%edx
 484:	89 f7                	mov    %esi,%edi
 486:	f7 f3                	div    %ebx
 488:	8d 76 01             	lea    0x1(%esi),%esi
 48b:	0f b6 92 f0 08 00 00 	movzbl 0x8f0(%edx),%edx
 492:	88 54 35 d7          	mov    %dl,-0x29(%ebp,%esi,1)
  }while((x /= base) != 0);
 496:	89 ca                	mov    %ecx,%edx
 498:	89 c1                	mov    %eax,%ecx
 49a:	39 da                	cmp    %ebx,%edx
 49c:	73 e2                	jae    480 <printint+0x40>
  if(neg)
 49e:	8b 45 c0             	mov    -0x40(%ebp),%eax
 4a1:	85 c0                	test   %eax,%eax
 4a3:	74 07                	je     4ac <printint+0x6c>
    buf[i++] = '-';
 4a5:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)
 4aa:	89 f7                	mov    %esi,%edi

  while(--i >= 0)
 4ac:	8d 5d d8             	lea    -0x28(%ebp),%ebx
 4af:	8b 75 c4             	mov    -0x3c(%ebp),%esi
 4b2:	01 df                	add    %ebx,%edi
 4b4:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 4bb:	00 
 4bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    putc(fd, buf[i]);
 4c0:	0f b6 07             	movzbl (%edi),%eax
  write(fd, &c, 1);
 4c3:	83 ec 04             	sub    $0x4,%esp
 4c6:	88 45 d7             	mov    %al,-0x29(%ebp)
 4c9:	8d 45 d7             	lea    -0x29(%ebp),%eax
 4cc:	6a 01                	push   $0x1
 4ce:	50                   	push   %eax
 4cf:	56                   	push   %esi
 4d0:	e8 a1 fe ff ff       	call   376 <write>
  while(--i >= 0)
 4d5:	89 f8                	mov    %edi,%eax
 4d7:	83 c4 10             	add    $0x10,%esp
 4da:	83 ef 01             	sub    $0x1,%edi
 4dd:	39 d8                	cmp    %ebx,%eax
 4df:	75 df                	jne    4c0 <printint+0x80>
}
 4e1:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4e4:	5b                   	pop    %ebx
 4e5:	5e                   	pop    %esi
 4e6:	5f                   	pop    %edi
 4e7:	5d                   	pop    %ebp
 4e8:	c3                   	ret
 4e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 4f0:	31 c0                	xor    %eax,%eax
 4f2:	e9 72 ff ff ff       	jmp    469 <printint+0x29>
 4f7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 4fe:	00 
 4ff:	90                   	nop

00000500 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 500:	55                   	push   %ebp
 501:	89 e5                	mov    %esp,%ebp
 503:	57                   	push   %edi
 504:	56                   	push   %esi
 505:	53                   	push   %ebx
 506:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 509:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 50c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 50f:	0f b6 13             	movzbl (%ebx),%edx
 512:	83 c3 01             	add    $0x1,%ebx
 515:	84 d2                	test   %dl,%dl
 517:	0f 84 a0 00 00 00    	je     5bd <printf+0xbd>
 51d:	8d 45 10             	lea    0x10(%ebp),%eax
 520:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    c = fmt[i] & 0xff;
 523:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 526:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 529:	eb 28                	jmp    553 <printf+0x53>
 52b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 530:	83 ec 04             	sub    $0x4,%esp
 533:	8d 45 e7             	lea    -0x19(%ebp),%eax
 536:	88 55 e7             	mov    %dl,-0x19(%ebp)
  for(i = 0; fmt[i]; i++){
 539:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 53c:	6a 01                	push   $0x1
 53e:	50                   	push   %eax
 53f:	56                   	push   %esi
 540:	e8 31 fe ff ff       	call   376 <write>
  for(i = 0; fmt[i]; i++){
 545:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 549:	83 c4 10             	add    $0x10,%esp
 54c:	84 d2                	test   %dl,%dl
 54e:	74 6d                	je     5bd <printf+0xbd>
    c = fmt[i] & 0xff;
 550:	0f b6 c2             	movzbl %dl,%eax
      if(c == '%'){
 553:	83 f8 25             	cmp    $0x25,%eax
 556:	75 d8                	jne    530 <printf+0x30>
  for(i = 0; fmt[i]; i++){
 558:	0f b6 13             	movzbl (%ebx),%edx
 55b:	84 d2                	test   %dl,%dl
 55d:	74 5e                	je     5bd <printf+0xbd>
    c = fmt[i] & 0xff;
 55f:	0f b6 c2             	movzbl %dl,%eax
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
 562:	80 fa 25             	cmp    $0x25,%dl
 565:	0f 84 1d 01 00 00    	je     688 <printf+0x188>
 56b:	83 e8 63             	sub    $0x63,%eax
 56e:	83 f8 15             	cmp    $0x15,%eax
 571:	77 0d                	ja     580 <printf+0x80>
 573:	ff 24 85 98 08 00 00 	jmp    *0x898(,%eax,4)
 57a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 580:	83 ec 04             	sub    $0x4,%esp
 583:	8d 4d e7             	lea    -0x19(%ebp),%ecx
 586:	88 55 d0             	mov    %dl,-0x30(%ebp)
        ap++;
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 589:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
  write(fd, &c, 1);
 58d:	6a 01                	push   $0x1
 58f:	51                   	push   %ecx
 590:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
 593:	56                   	push   %esi
 594:	e8 dd fd ff ff       	call   376 <write>
        putc(fd, c);
 599:	0f b6 55 d0          	movzbl -0x30(%ebp),%edx
  write(fd, &c, 1);
 59d:	83 c4 0c             	add    $0xc,%esp
 5a0:	88 55 e7             	mov    %dl,-0x19(%ebp)
 5a3:	6a 01                	push   $0x1
 5a5:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
 5a8:	51                   	push   %ecx
 5a9:	56                   	push   %esi
 5aa:	e8 c7 fd ff ff       	call   376 <write>
  for(i = 0; fmt[i]; i++){
 5af:	0f b6 53 01          	movzbl 0x1(%ebx),%edx
 5b3:	83 c3 02             	add    $0x2,%ebx
 5b6:	83 c4 10             	add    $0x10,%esp
 5b9:	84 d2                	test   %dl,%dl
 5bb:	75 93                	jne    550 <printf+0x50>
      }
      state = 0;
    }
  }
}
 5bd:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5c0:	5b                   	pop    %ebx
 5c1:	5e                   	pop    %esi
 5c2:	5f                   	pop    %edi
 5c3:	5d                   	pop    %ebp
 5c4:	c3                   	ret
 5c5:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 5c8:	83 ec 0c             	sub    $0xc,%esp
 5cb:	8b 17                	mov    (%edi),%edx
 5cd:	b9 10 00 00 00       	mov    $0x10,%ecx
 5d2:	89 f0                	mov    %esi,%eax
 5d4:	6a 00                	push   $0x0
        ap++;
 5d6:	83 c7 04             	add    $0x4,%edi
        printint(fd, *ap, 16, 0);
 5d9:	e8 62 fe ff ff       	call   440 <printint>
  for(i = 0; fmt[i]; i++){
 5de:	eb cf                	jmp    5af <printf+0xaf>
        s = (char*)*ap;
 5e0:	8b 07                	mov    (%edi),%eax
        ap++;
 5e2:	83 c7 04             	add    $0x4,%edi
        if(s == 0)
 5e5:	85 c0                	test   %eax,%eax
 5e7:	0f 84 b3 00 00 00    	je     6a0 <printf+0x1a0>
        while(*s != 0){
 5ed:	0f b6 10             	movzbl (%eax),%edx
 5f0:	84 d2                	test   %dl,%dl
 5f2:	0f 84 ba 00 00 00    	je     6b2 <printf+0x1b2>
 5f8:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 5fb:	89 c7                	mov    %eax,%edi
 5fd:	89 d0                	mov    %edx,%eax
 5ff:	8d 4d e7             	lea    -0x19(%ebp),%ecx
 602:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 605:	89 fb                	mov    %edi,%ebx
 607:	89 cf                	mov    %ecx,%edi
 609:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 610:	83 ec 04             	sub    $0x4,%esp
 613:	88 45 e7             	mov    %al,-0x19(%ebp)
          s++;
 616:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 619:	6a 01                	push   $0x1
 61b:	57                   	push   %edi
 61c:	56                   	push   %esi
 61d:	e8 54 fd ff ff       	call   376 <write>
        while(*s != 0){
 622:	0f b6 03             	movzbl (%ebx),%eax
 625:	83 c4 10             	add    $0x10,%esp
 628:	84 c0                	test   %al,%al
 62a:	75 e4                	jne    610 <printf+0x110>
 62c:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  for(i = 0; fmt[i]; i++){
 62f:	0f b6 53 01          	movzbl 0x1(%ebx),%edx
 633:	83 c3 02             	add    $0x2,%ebx
 636:	84 d2                	test   %dl,%dl
 638:	0f 85 e5 fe ff ff    	jne    523 <printf+0x23>
 63e:	e9 7a ff ff ff       	jmp    5bd <printf+0xbd>
 643:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 648:	83 ec 0c             	sub    $0xc,%esp
 64b:	8b 17                	mov    (%edi),%edx
 64d:	b9 0a 00 00 00       	mov    $0xa,%ecx
 652:	89 f0                	mov    %esi,%eax
 654:	6a 01                	push   $0x1
        ap++;
 656:	83 c7 04             	add    $0x4,%edi
        printint(fd, *ap, 10, 1);
 659:	e8 e2 fd ff ff       	call   440 <printint>
  for(i = 0; fmt[i]; i++){
 65e:	e9 4c ff ff ff       	jmp    5af <printf+0xaf>
 663:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 668:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
 66a:	83 ec 04             	sub    $0x4,%esp
 66d:	8d 4d e7             	lea    -0x19(%ebp),%ecx
        ap++;
 670:	83 c7 04             	add    $0x4,%edi
        putc(fd, *ap);
 673:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 676:	6a 01                	push   $0x1
 678:	51                   	push   %ecx
 679:	56                   	push   %esi
 67a:	e8 f7 fc ff ff       	call   376 <write>
  for(i = 0; fmt[i]; i++){
 67f:	e9 2b ff ff ff       	jmp    5af <printf+0xaf>
 684:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 688:	83 ec 04             	sub    $0x4,%esp
 68b:	88 55 e7             	mov    %dl,-0x19(%ebp)
 68e:	8d 4d e7             	lea    -0x19(%ebp),%ecx
 691:	6a 01                	push   $0x1
 693:	e9 10 ff ff ff       	jmp    5a8 <printf+0xa8>
 698:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 69f:	00 
          s = "(null)";
 6a0:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 6a3:	b8 28 00 00 00       	mov    $0x28,%eax
 6a8:	bf 88 08 00 00       	mov    $0x888,%edi
 6ad:	e9 4d ff ff ff       	jmp    5ff <printf+0xff>
  for(i = 0; fmt[i]; i++){
 6b2:	0f b6 53 01          	movzbl 0x1(%ebx),%edx
 6b6:	83 c3 02             	add    $0x2,%ebx
 6b9:	84 d2                	test   %dl,%dl
 6bb:	0f 85 8f fe ff ff    	jne    550 <printf+0x50>
 6c1:	e9 f7 fe ff ff       	jmp    5bd <printf+0xbd>
 6c6:	66 90                	xchg   %ax,%ax
 6c8:	66 90                	xchg   %ax,%ax
 6ca:	66 90                	xchg   %ax,%ax
 6cc:	66 90                	xchg   %ax,%ax
 6ce:	66 90                	xchg   %ax,%ax
 6d0:	66 90                	xchg   %ax,%ax
 6d2:	66 90                	xchg   %ax,%ax
 6d4:	66 90                	xchg   %ax,%ax
 6d6:	66 90                	xchg   %ax,%ax
 6d8:	66 90                	xchg   %ax,%ax
 6da:	66 90                	xchg   %ax,%ax
 6dc:	66 90                	xchg   %ax,%ax
 6de:	66 90                	xchg   %ax,%ax

000006e0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6e0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6e1:	a1 04 09 00 00       	mov    0x904,%eax
{
 6e6:	89 e5                	mov    %esp,%ebp
 6e8:	57                   	push   %edi
 6e9:	56                   	push   %esi
 6ea:	53                   	push   %ebx
 6eb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 6ee:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6f1:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 6f8:	00 
 6f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 700:	89 c2                	mov    %eax,%edx
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 702:	8b 00                	mov    (%eax),%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 704:	39 ca                	cmp    %ecx,%edx
 706:	73 30                	jae    738 <free+0x58>
 708:	39 c1                	cmp    %eax,%ecx
 70a:	72 04                	jb     710 <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 70c:	39 c2                	cmp    %eax,%edx
 70e:	72 f0                	jb     700 <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
 710:	8b 73 fc             	mov    -0x4(%ebx),%esi
 713:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 716:	39 f8                	cmp    %edi,%eax
 718:	74 36                	je     750 <free+0x70>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 71a:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 71d:	8b 42 04             	mov    0x4(%edx),%eax
 720:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 723:	39 f1                	cmp    %esi,%ecx
 725:	74 40                	je     767 <free+0x87>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 727:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 729:	5b                   	pop    %ebx
  freep = p;
 72a:	89 15 04 09 00 00    	mov    %edx,0x904
}
 730:	5e                   	pop    %esi
 731:	5f                   	pop    %edi
 732:	5d                   	pop    %ebp
 733:	c3                   	ret
 734:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 738:	39 c2                	cmp    %eax,%edx
 73a:	72 c4                	jb     700 <free+0x20>
 73c:	39 c1                	cmp    %eax,%ecx
 73e:	73 c0                	jae    700 <free+0x20>
  if(bp + bp->s.size == p->s.ptr){
 740:	8b 73 fc             	mov    -0x4(%ebx),%esi
 743:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 746:	39 f8                	cmp    %edi,%eax
 748:	75 d0                	jne    71a <free+0x3a>
 74a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    bp->s.size += p->s.ptr->s.size;
 750:	03 70 04             	add    0x4(%eax),%esi
 753:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 756:	8b 02                	mov    (%edx),%eax
 758:	8b 00                	mov    (%eax),%eax
 75a:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 75d:	8b 42 04             	mov    0x4(%edx),%eax
 760:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 763:	39 f1                	cmp    %esi,%ecx
 765:	75 c0                	jne    727 <free+0x47>
    p->s.size += bp->s.size;
 767:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 76a:	89 15 04 09 00 00    	mov    %edx,0x904
    p->s.size += bp->s.size;
 770:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 773:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 776:	89 0a                	mov    %ecx,(%edx)
}
 778:	5b                   	pop    %ebx
 779:	5e                   	pop    %esi
 77a:	5f                   	pop    %edi
 77b:	5d                   	pop    %ebp
 77c:	c3                   	ret
 77d:	8d 76 00             	lea    0x0(%esi),%esi

00000780 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 780:	55                   	push   %ebp
 781:	89 e5                	mov    %esp,%ebp
 783:	57                   	push   %edi
 784:	56                   	push   %esi
 785:	53                   	push   %ebx
 786:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 789:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 78c:	8b 15 04 09 00 00    	mov    0x904,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 792:	8d 78 07             	lea    0x7(%eax),%edi
 795:	c1 ef 03             	shr    $0x3,%edi
 798:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 79b:	85 d2                	test   %edx,%edx
 79d:	0f 84 8d 00 00 00    	je     830 <malloc+0xb0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7a3:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 7a5:	8b 48 04             	mov    0x4(%eax),%ecx
 7a8:	39 f9                	cmp    %edi,%ecx
 7aa:	73 64                	jae    810 <malloc+0x90>
  if(nu < 4096)
 7ac:	bb 00 10 00 00       	mov    $0x1000,%ebx
 7b1:	39 df                	cmp    %ebx,%edi
 7b3:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 7b6:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 7bd:	eb 0a                	jmp    7c9 <malloc+0x49>
 7bf:	90                   	nop
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7c0:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 7c2:	8b 48 04             	mov    0x4(%eax),%ecx
 7c5:	39 f9                	cmp    %edi,%ecx
 7c7:	73 47                	jae    810 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 7c9:	89 c2                	mov    %eax,%edx
 7cb:	39 05 04 09 00 00    	cmp    %eax,0x904
 7d1:	75 ed                	jne    7c0 <malloc+0x40>
  p = sbrk(nu * sizeof(Header));
 7d3:	83 ec 0c             	sub    $0xc,%esp
 7d6:	56                   	push   %esi
 7d7:	e8 02 fc ff ff       	call   3de <sbrk>
  if(p == (char*)-1)
 7dc:	83 c4 10             	add    $0x10,%esp
 7df:	83 f8 ff             	cmp    $0xffffffff,%eax
 7e2:	74 1c                	je     800 <malloc+0x80>
  hp->s.size = nu;
 7e4:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 7e7:	83 ec 0c             	sub    $0xc,%esp
 7ea:	83 c0 08             	add    $0x8,%eax
 7ed:	50                   	push   %eax
 7ee:	e8 ed fe ff ff       	call   6e0 <free>
  return freep;
 7f3:	8b 15 04 09 00 00    	mov    0x904,%edx
      if((p = morecore(nunits)) == 0)
 7f9:	83 c4 10             	add    $0x10,%esp
 7fc:	85 d2                	test   %edx,%edx
 7fe:	75 c0                	jne    7c0 <malloc+0x40>
        return 0;
  }
}
 800:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 803:	31 c0                	xor    %eax,%eax
}
 805:	5b                   	pop    %ebx
 806:	5e                   	pop    %esi
 807:	5f                   	pop    %edi
 808:	5d                   	pop    %ebp
 809:	c3                   	ret
 80a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 810:	39 cf                	cmp    %ecx,%edi
 812:	74 4c                	je     860 <malloc+0xe0>
        p->s.size -= nunits;
 814:	29 f9                	sub    %edi,%ecx
 816:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 819:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 81c:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 81f:	89 15 04 09 00 00    	mov    %edx,0x904
}
 825:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 828:	83 c0 08             	add    $0x8,%eax
}
 82b:	5b                   	pop    %ebx
 82c:	5e                   	pop    %esi
 82d:	5f                   	pop    %edi
 82e:	5d                   	pop    %ebp
 82f:	c3                   	ret
    base.s.ptr = freep = prevp = &base;
 830:	c7 05 04 09 00 00 08 	movl   $0x908,0x904
 837:	09 00 00 
    base.s.size = 0;
 83a:	b8 08 09 00 00       	mov    $0x908,%eax
    base.s.ptr = freep = prevp = &base;
 83f:	c7 05 08 09 00 00 08 	movl   $0x908,0x908
 846:	09 00 00 
    base.s.size = 0;
 849:	c7 05 0c 09 00 00 00 	movl   $0x0,0x90c
 850:	00 00 00 
    if(p->s.size >= nunits){
 853:	e9 54 ff ff ff       	jmp    7ac <malloc+0x2c>
 858:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 85f:	00 
        prevp->s.ptr = p->s.ptr;
 860:	8b 08                	mov    (%eax),%ecx
 862:	89 0a                	mov    %ecx,(%edx)
 864:	eb b9                	jmp    81f <malloc+0x9f>
