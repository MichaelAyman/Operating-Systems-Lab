
_zombie:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

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
  if(fork() > 0)
  11:	e8 18 03 00 00       	call   32e <fork>
  16:	85 c0                	test   %eax,%eax
  18:	7e 0d                	jle    27 <main+0x27>
    sleep(5);  // Let child exit before parent.
  1a:	83 ec 0c             	sub    $0xc,%esp
  1d:	6a 05                	push   $0x5
  1f:	e8 a2 03 00 00       	call   3c6 <sleep>
  24:	83 c4 10             	add    $0x10,%esp
  exit();
  27:	e8 0a 03 00 00       	call   336 <exit>
  2c:	66 90                	xchg   %ax,%ax
  2e:	66 90                	xchg   %ax,%ax
  30:	66 90                	xchg   %ax,%ax
  32:	66 90                	xchg   %ax,%ax
  34:	66 90                	xchg   %ax,%ax
  36:	66 90                	xchg   %ax,%ax
  38:	66 90                	xchg   %ax,%ax
  3a:	66 90                	xchg   %ax,%ax
  3c:	66 90                	xchg   %ax,%ax
  3e:	66 90                	xchg   %ax,%ax

00000040 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  40:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  41:	31 c0                	xor    %eax,%eax
{
  43:	89 e5                	mov    %esp,%ebp
  45:	53                   	push   %ebx
  46:	8b 4d 08             	mov    0x8(%ebp),%ecx
  49:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
  50:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  54:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  57:	83 c0 01             	add    $0x1,%eax
  5a:	84 d2                	test   %dl,%dl
  5c:	75 f2                	jne    50 <strcpy+0x10>
    ;
  return os;
}
  5e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  61:	89 c8                	mov    %ecx,%eax
  63:	c9                   	leave
  64:	c3                   	ret
  65:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  6c:	00 
  6d:	8d 76 00             	lea    0x0(%esi),%esi

00000070 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  70:	55                   	push   %ebp
  71:	89 e5                	mov    %esp,%ebp
  73:	53                   	push   %ebx
  74:	8b 55 08             	mov    0x8(%ebp),%edx
  77:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
  7a:	0f b6 02             	movzbl (%edx),%eax
  7d:	84 c0                	test   %al,%al
  7f:	75 2f                	jne    b0 <strcmp+0x40>
  81:	eb 4a                	jmp    cd <strcmp+0x5d>
  83:	eb 1b                	jmp    a0 <strcmp+0x30>
  85:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  8c:	00 
  8d:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  94:	00 
  95:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  9c:	00 
  9d:	8d 76 00             	lea    0x0(%esi),%esi
  a0:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
  a4:	83 c2 01             	add    $0x1,%edx
  a7:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
  aa:	84 c0                	test   %al,%al
  ac:	74 12                	je     c0 <strcmp+0x50>
  ae:	89 d9                	mov    %ebx,%ecx
  b0:	0f b6 19             	movzbl (%ecx),%ebx
  b3:	38 c3                	cmp    %al,%bl
  b5:	74 e9                	je     a0 <strcmp+0x30>
  return (uchar)*p - (uchar)*q;
  b7:	29 d8                	sub    %ebx,%eax
}
  b9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  bc:	c9                   	leave
  bd:	c3                   	ret
  be:	66 90                	xchg   %ax,%ax
  return (uchar)*p - (uchar)*q;
  c0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
  c4:	31 c0                	xor    %eax,%eax
  c6:	29 d8                	sub    %ebx,%eax
}
  c8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  cb:	c9                   	leave
  cc:	c3                   	ret
  return (uchar)*p - (uchar)*q;
  cd:	0f b6 19             	movzbl (%ecx),%ebx
  d0:	31 c0                	xor    %eax,%eax
  d2:	eb e3                	jmp    b7 <strcmp+0x47>
  d4:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  db:	00 
  dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000000e0 <strlen>:

uint
strlen(const char *s)
{
  e0:	55                   	push   %ebp
  e1:	89 e5                	mov    %esp,%ebp
  e3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
  e6:	80 3a 00             	cmpb   $0x0,(%edx)
  e9:	74 15                	je     100 <strlen+0x20>
  eb:	31 c0                	xor    %eax,%eax
  ed:	8d 76 00             	lea    0x0(%esi),%esi
  f0:	83 c0 01             	add    $0x1,%eax
  f3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  f7:	89 c1                	mov    %eax,%ecx
  f9:	75 f5                	jne    f0 <strlen+0x10>
    ;
  return n;
}
  fb:	89 c8                	mov    %ecx,%eax
  fd:	5d                   	pop    %ebp
  fe:	c3                   	ret
  ff:	90                   	nop
  for(n = 0; s[n]; n++)
 100:	31 c9                	xor    %ecx,%ecx
}
 102:	5d                   	pop    %ebp
 103:	89 c8                	mov    %ecx,%eax
 105:	c3                   	ret
 106:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 10d:	00 
 10e:	66 90                	xchg   %ax,%ax

00000110 <memset>:

void*
memset(void *dst, int c, uint n)
{
 110:	55                   	push   %ebp
 111:	89 e5                	mov    %esp,%ebp
 113:	57                   	push   %edi
 114:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 117:	8b 4d 10             	mov    0x10(%ebp),%ecx
 11a:	8b 45 0c             	mov    0xc(%ebp),%eax
 11d:	89 d7                	mov    %edx,%edi
 11f:	fc                   	cld
 120:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 122:	8b 7d fc             	mov    -0x4(%ebp),%edi
 125:	89 d0                	mov    %edx,%eax
 127:	c9                   	leave
 128:	c3                   	ret
 129:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000130 <strchr>:

char*
strchr(const char *s, char c)
{
 130:	55                   	push   %ebp
 131:	89 e5                	mov    %esp,%ebp
 133:	8b 45 08             	mov    0x8(%ebp),%eax
 136:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 13a:	0f b6 10             	movzbl (%eax),%edx
 13d:	84 d2                	test   %dl,%dl
 13f:	75 1a                	jne    15b <strchr+0x2b>
 141:	eb 25                	jmp    168 <strchr+0x38>
 143:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 14a:	00 
 14b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 150:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 154:	83 c0 01             	add    $0x1,%eax
 157:	84 d2                	test   %dl,%dl
 159:	74 0d                	je     168 <strchr+0x38>
    if(*s == c)
 15b:	38 d1                	cmp    %dl,%cl
 15d:	75 f1                	jne    150 <strchr+0x20>
      return (char*)s;
  return 0;
}
 15f:	5d                   	pop    %ebp
 160:	c3                   	ret
 161:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 168:	31 c0                	xor    %eax,%eax
}
 16a:	5d                   	pop    %ebp
 16b:	c3                   	ret
 16c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000170 <gets>:

char*
gets(char *buf, int max)
{
 170:	55                   	push   %ebp
 171:	89 e5                	mov    %esp,%ebp
 173:	57                   	push   %edi
 174:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 175:	8d 75 e7             	lea    -0x19(%ebp),%esi
{
 178:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 179:	31 db                	xor    %ebx,%ebx
{
 17b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 17e:	eb 27                	jmp    1a7 <gets+0x37>
    cc = read(0, &c, 1);
 180:	83 ec 04             	sub    $0x4,%esp
 183:	6a 01                	push   $0x1
 185:	56                   	push   %esi
 186:	6a 00                	push   $0x0
 188:	e8 c1 01 00 00       	call   34e <read>
    if(cc < 1)
 18d:	83 c4 10             	add    $0x10,%esp
 190:	85 c0                	test   %eax,%eax
 192:	7e 1d                	jle    1b1 <gets+0x41>
      break;
    buf[i++] = c;
 194:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 198:	8b 55 08             	mov    0x8(%ebp),%edx
 19b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 19f:	3c 0a                	cmp    $0xa,%al
 1a1:	74 10                	je     1b3 <gets+0x43>
 1a3:	3c 0d                	cmp    $0xd,%al
 1a5:	74 0c                	je     1b3 <gets+0x43>
  for(i=0; i+1 < max; ){
 1a7:	89 df                	mov    %ebx,%edi
 1a9:	83 c3 01             	add    $0x1,%ebx
 1ac:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1af:	7c cf                	jl     180 <gets+0x10>
 1b1:	89 fb                	mov    %edi,%ebx
      break;
  }
  buf[i] = '\0';
 1b3:	8b 45 08             	mov    0x8(%ebp),%eax
 1b6:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
 1ba:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1bd:	5b                   	pop    %ebx
 1be:	5e                   	pop    %esi
 1bf:	5f                   	pop    %edi
 1c0:	5d                   	pop    %ebp
 1c1:	c3                   	ret
 1c2:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 1c9:	00 
 1ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000001d0 <stat>:

int
stat(const char *n, struct stat *st)
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	56                   	push   %esi
 1d4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1d5:	83 ec 08             	sub    $0x8,%esp
 1d8:	6a 00                	push   $0x0
 1da:	ff 75 08             	push   0x8(%ebp)
 1dd:	e8 94 01 00 00       	call   376 <open>
  if(fd < 0)
 1e2:	83 c4 10             	add    $0x10,%esp
 1e5:	85 c0                	test   %eax,%eax
 1e7:	78 27                	js     210 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 1e9:	83 ec 08             	sub    $0x8,%esp
 1ec:	ff 75 0c             	push   0xc(%ebp)
 1ef:	89 c3                	mov    %eax,%ebx
 1f1:	50                   	push   %eax
 1f2:	e8 97 01 00 00       	call   38e <fstat>
  close(fd);
 1f7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 1fa:	89 c6                	mov    %eax,%esi
  close(fd);
 1fc:	e8 5d 01 00 00       	call   35e <close>
  return r;
 201:	83 c4 10             	add    $0x10,%esp
}
 204:	8d 65 f8             	lea    -0x8(%ebp),%esp
 207:	89 f0                	mov    %esi,%eax
 209:	5b                   	pop    %ebx
 20a:	5e                   	pop    %esi
 20b:	5d                   	pop    %ebp
 20c:	c3                   	ret
 20d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 210:	be ff ff ff ff       	mov    $0xffffffff,%esi
 215:	eb ed                	jmp    204 <stat+0x34>
 217:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 21e:	00 
 21f:	90                   	nop

00000220 <atoi>:

int
atoi(const char *s)
{
 220:	55                   	push   %ebp
 221:	89 e5                	mov    %esp,%ebp
 223:	53                   	push   %ebx
 224:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 227:	0f be 02             	movsbl (%edx),%eax
 22a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 22d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 230:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 235:	77 1e                	ja     255 <atoi+0x35>
 237:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 23e:	00 
 23f:	90                   	nop
    n = n*10 + *s++ - '0';
 240:	83 c2 01             	add    $0x1,%edx
 243:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 246:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 24a:	0f be 02             	movsbl (%edx),%eax
 24d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 250:	80 fb 09             	cmp    $0x9,%bl
 253:	76 eb                	jbe    240 <atoi+0x20>
  return n;
}
 255:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 258:	89 c8                	mov    %ecx,%eax
 25a:	c9                   	leave
 25b:	c3                   	ret
 25c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000260 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 260:	55                   	push   %ebp
 261:	89 e5                	mov    %esp,%ebp
 263:	57                   	push   %edi
 264:	8b 45 10             	mov    0x10(%ebp),%eax
 267:	8b 55 08             	mov    0x8(%ebp),%edx
 26a:	56                   	push   %esi
 26b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 26e:	85 c0                	test   %eax,%eax
 270:	7e 13                	jle    285 <memmove+0x25>
 272:	01 d0                	add    %edx,%eax
  dst = vdst;
 274:	89 d7                	mov    %edx,%edi
 276:	66 90                	xchg   %ax,%ax
 278:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 27f:	00 
    *dst++ = *src++;
 280:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 281:	39 f8                	cmp    %edi,%eax
 283:	75 fb                	jne    280 <memmove+0x20>
  return vdst;
}
 285:	5e                   	pop    %esi
 286:	89 d0                	mov    %edx,%eax
 288:	5f                   	pop    %edi
 289:	5d                   	pop    %ebp
 28a:	c3                   	ret
 28b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00000290 <sqrt>:


// https://www.geeksforgeeks.org/c-program-to-find-square-root-of-a-given-number/
float sqrt(int num) {
 290:	55                   	push   %ebp
 291:	89 e5                	mov    %esp,%ebp
 293:	56                   	push   %esi
 294:	53                   	push   %ebx
 295:	83 ec 04             	sub    $0x4,%esp
 298:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int end = num;
  int middle;

  float solution = 0.0;

  while (start <= end) {
 29b:	85 db                	test   %ebx,%ebx
 29d:	0f 88 87 00 00 00    	js     32a <sqrt+0x9a>
  int end = num;
 2a3:	89 d9                	mov    %ebx,%ecx
  float solution = 0.0;
 2a5:	d9 ee                	fldz
  int start = 0;
 2a7:	31 d2                	xor    %edx,%edx
 2a9:	eb 14                	jmp    2bf <sqrt+0x2f>
 2ab:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 2b0:	dd d8                	fstp   %st(0)
    if (middle * middle == num) {
      solution = middle;
      break;
    }
    if (middle * middle < num) {
      solution = start;
 2b2:	89 55 f4             	mov    %edx,-0xc(%ebp)
      start = middle + 1;
 2b5:	8d 50 01             	lea    0x1(%eax),%edx
      solution = start;
 2b8:	db 45 f4             	fildl  -0xc(%ebp)
  while (start <= end) {
 2bb:	39 ca                	cmp    %ecx,%edx
 2bd:	7f 1e                	jg     2dd <sqrt+0x4d>
    middle = (start + end) / 2;
 2bf:	8d 34 0a             	lea    (%edx,%ecx,1),%esi
 2c2:	89 f0                	mov    %esi,%eax
 2c4:	c1 e8 1f             	shr    $0x1f,%eax
 2c7:	01 f0                	add    %esi,%eax
 2c9:	d1 f8                	sar    $1,%eax
    if (middle * middle == num) {
 2cb:	89 c6                	mov    %eax,%esi
 2cd:	0f af f0             	imul   %eax,%esi
 2d0:	39 de                	cmp    %ebx,%esi
 2d2:	74 4c                	je     320 <sqrt+0x90>
    if (middle * middle < num) {
 2d4:	7c da                	jl     2b0 <sqrt+0x20>
    }
    else {
      end = middle - 1;
 2d6:	8d 48 ff             	lea    -0x1(%eax),%ecx
  while (start <= end) {
 2d9:	39 ca                	cmp    %ecx,%edx
 2db:	7e e2                	jle    2bf <sqrt+0x2f>

  float eps = 0.1;
  int i;

  for (i = 0; i < 5; i++) {
    while (solution * solution <= num) {
 2dd:	89 5d f4             	mov    %ebx,-0xc(%ebp)
 2e0:	b8 05 00 00 00       	mov    $0x5,%eax
 2e5:	db 45 f4             	fildl  -0xc(%ebp)
 2e8:	d9 05 48 08 00 00    	flds   0x848
 2ee:	eb 02                	jmp    2f2 <sqrt+0x62>
      solution += eps;
 2f0:	dc c2                	fadd   %st,%st(2)
    while (solution * solution <= num) {
 2f2:	d9 c2                	fld    %st(2)
 2f4:	d8 cb                	fmul   %st(3),%st
 2f6:	d9 ca                	fxch   %st(2)
 2f8:	db f2                	fcomi  %st(2),%st
 2fa:	dd da                	fstp   %st(2)
 2fc:	73 f2                	jae    2f0 <sqrt+0x60>
    }
    solution = solution - eps;
 2fe:	dc ea                	fsubr  %st,%st(2)
    eps = eps / 10;
 300:	d8 35 4c 08 00 00    	fdivs  0x84c
  for (i = 0; i < 5; i++) {
 306:	83 e8 01             	sub    $0x1,%eax
 309:	75 e7                	jne    2f2 <sqrt+0x62>
 30b:	dd d8                	fstp   %st(0)
 30d:	dd d8                	fstp   %st(0)
  }
  return solution;

}
 30f:	83 c4 04             	add    $0x4,%esp
 312:	5b                   	pop    %ebx
 313:	5e                   	pop    %esi
 314:	5d                   	pop    %ebp
 315:	c3                   	ret
 316:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 31d:	00 
 31e:	66 90                	xchg   %ax,%ax
 320:	dd d8                	fstp   %st(0)
      solution = middle;
 322:	89 45 f4             	mov    %eax,-0xc(%ebp)
 325:	db 45 f4             	fildl  -0xc(%ebp)
      break;
 328:	eb b3                	jmp    2dd <sqrt+0x4d>
  float solution = 0.0;
 32a:	d9 ee                	fldz
 32c:	eb af                	jmp    2dd <sqrt+0x4d>

0000032e <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 32e:	b8 01 00 00 00       	mov    $0x1,%eax
 333:	cd 40                	int    $0x40
 335:	c3                   	ret

00000336 <exit>:
SYSCALL(exit)
 336:	b8 02 00 00 00       	mov    $0x2,%eax
 33b:	cd 40                	int    $0x40
 33d:	c3                   	ret

0000033e <wait>:
SYSCALL(wait)
 33e:	b8 03 00 00 00       	mov    $0x3,%eax
 343:	cd 40                	int    $0x40
 345:	c3                   	ret

00000346 <pipe>:
SYSCALL(pipe)
 346:	b8 04 00 00 00       	mov    $0x4,%eax
 34b:	cd 40                	int    $0x40
 34d:	c3                   	ret

0000034e <read>:
SYSCALL(read)
 34e:	b8 05 00 00 00       	mov    $0x5,%eax
 353:	cd 40                	int    $0x40
 355:	c3                   	ret

00000356 <write>:
SYSCALL(write)
 356:	b8 10 00 00 00       	mov    $0x10,%eax
 35b:	cd 40                	int    $0x40
 35d:	c3                   	ret

0000035e <close>:
SYSCALL(close)
 35e:	b8 15 00 00 00       	mov    $0x15,%eax
 363:	cd 40                	int    $0x40
 365:	c3                   	ret

00000366 <kill>:
SYSCALL(kill)
 366:	b8 06 00 00 00       	mov    $0x6,%eax
 36b:	cd 40                	int    $0x40
 36d:	c3                   	ret

0000036e <exec>:
SYSCALL(exec)
 36e:	b8 07 00 00 00       	mov    $0x7,%eax
 373:	cd 40                	int    $0x40
 375:	c3                   	ret

00000376 <open>:
SYSCALL(open)
 376:	b8 0f 00 00 00       	mov    $0xf,%eax
 37b:	cd 40                	int    $0x40
 37d:	c3                   	ret

0000037e <mknod>:
SYSCALL(mknod)
 37e:	b8 11 00 00 00       	mov    $0x11,%eax
 383:	cd 40                	int    $0x40
 385:	c3                   	ret

00000386 <unlink>:
SYSCALL(unlink)
 386:	b8 12 00 00 00       	mov    $0x12,%eax
 38b:	cd 40                	int    $0x40
 38d:	c3                   	ret

0000038e <fstat>:
SYSCALL(fstat)
 38e:	b8 08 00 00 00       	mov    $0x8,%eax
 393:	cd 40                	int    $0x40
 395:	c3                   	ret

00000396 <link>:
SYSCALL(link)
 396:	b8 13 00 00 00       	mov    $0x13,%eax
 39b:	cd 40                	int    $0x40
 39d:	c3                   	ret

0000039e <mkdir>:
SYSCALL(mkdir)
 39e:	b8 14 00 00 00       	mov    $0x14,%eax
 3a3:	cd 40                	int    $0x40
 3a5:	c3                   	ret

000003a6 <chdir>:
SYSCALL(chdir)
 3a6:	b8 09 00 00 00       	mov    $0x9,%eax
 3ab:	cd 40                	int    $0x40
 3ad:	c3                   	ret

000003ae <dup>:
SYSCALL(dup)
 3ae:	b8 0a 00 00 00       	mov    $0xa,%eax
 3b3:	cd 40                	int    $0x40
 3b5:	c3                   	ret

000003b6 <getpid>:
SYSCALL(getpid)
 3b6:	b8 0b 00 00 00       	mov    $0xb,%eax
 3bb:	cd 40                	int    $0x40
 3bd:	c3                   	ret

000003be <sbrk>:
SYSCALL(sbrk)
 3be:	b8 0c 00 00 00       	mov    $0xc,%eax
 3c3:	cd 40                	int    $0x40
 3c5:	c3                   	ret

000003c6 <sleep>:
SYSCALL(sleep)
 3c6:	b8 0d 00 00 00       	mov    $0xd,%eax
 3cb:	cd 40                	int    $0x40
 3cd:	c3                   	ret

000003ce <uptime>:
SYSCALL(uptime)
 3ce:	b8 0e 00 00 00       	mov    $0xe,%eax
 3d3:	cd 40                	int    $0x40
 3d5:	c3                   	ret

000003d6 <gettid>:
SYSCALL(gettid)
 3d6:	b8 16 00 00 00       	mov    $0x16,%eax
 3db:	cd 40                	int    $0x40
 3dd:	c3                   	ret

000003de <getpgid>:
SYSCALL(getpgid)
 3de:	b8 17 00 00 00       	mov    $0x17,%eax
 3e3:	cd 40                	int    $0x40
 3e5:	c3                   	ret

000003e6 <setpgid>:
SYSCALL(setpgid)
 3e6:	b8 18 00 00 00       	mov    $0x18,%eax
 3eb:	cd 40                	int    $0x40
 3ed:	c3                   	ret

000003ee <getppid>:
SYSCALL(getppid)
 3ee:	b8 19 00 00 00       	mov    $0x19,%eax
 3f3:	cd 40                	int    $0x40
 3f5:	c3                   	ret

000003f6 <uptime_ms>:
SYSCALL(uptime_ms)
 3f6:	b8 1a 00 00 00       	mov    $0x1a,%eax
 3fb:	cd 40                	int    $0x40
 3fd:	c3                   	ret

000003fe <setpriority>:
 3fe:	b8 1b 00 00 00       	mov    $0x1b,%eax
 403:	cd 40                	int    $0x40
 405:	c3                   	ret
 406:	66 90                	xchg   %ax,%ax
 408:	66 90                	xchg   %ax,%ax
 40a:	66 90                	xchg   %ax,%ax
 40c:	66 90                	xchg   %ax,%ax
 40e:	66 90                	xchg   %ax,%ax
 410:	66 90                	xchg   %ax,%ax
 412:	66 90                	xchg   %ax,%ax
 414:	66 90                	xchg   %ax,%ax
 416:	66 90                	xchg   %ax,%ax
 418:	66 90                	xchg   %ax,%ax
 41a:	66 90                	xchg   %ax,%ax
 41c:	66 90                	xchg   %ax,%ax
 41e:	66 90                	xchg   %ax,%ax

00000420 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 420:	55                   	push   %ebp
 421:	89 e5                	mov    %esp,%ebp
 423:	57                   	push   %edi
 424:	56                   	push   %esi
 425:	53                   	push   %ebx
 426:	89 cb                	mov    %ecx,%ebx
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 428:	89 d1                	mov    %edx,%ecx
{
 42a:	83 ec 3c             	sub    $0x3c,%esp
 42d:	89 45 c4             	mov    %eax,-0x3c(%ebp)
  if(sgn && xx < 0){
 430:	85 d2                	test   %edx,%edx
 432:	0f 89 98 00 00 00    	jns    4d0 <printint+0xb0>
 438:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 43c:	0f 84 8e 00 00 00    	je     4d0 <printint+0xb0>
    x = -xx;
 442:	f7 d9                	neg    %ecx
    neg = 1;
 444:	b8 01 00 00 00       	mov    $0x1,%eax
  } else {
    x = xx;
  }

  i = 0;
 449:	89 45 c0             	mov    %eax,-0x40(%ebp)
 44c:	31 f6                	xor    %esi,%esi
 44e:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 455:	00 
 456:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 45d:	00 
 45e:	66 90                	xchg   %ax,%ax
  do{
    buf[i++] = digits[x % base];
 460:	89 c8                	mov    %ecx,%eax
 462:	31 d2                	xor    %edx,%edx
 464:	89 f7                	mov    %esi,%edi
 466:	f7 f3                	div    %ebx
 468:	8d 76 01             	lea    0x1(%esi),%esi
 46b:	0f b6 92 b0 08 00 00 	movzbl 0x8b0(%edx),%edx
 472:	88 54 35 d7          	mov    %dl,-0x29(%ebp,%esi,1)
  }while((x /= base) != 0);
 476:	89 ca                	mov    %ecx,%edx
 478:	89 c1                	mov    %eax,%ecx
 47a:	39 da                	cmp    %ebx,%edx
 47c:	73 e2                	jae    460 <printint+0x40>
  if(neg)
 47e:	8b 45 c0             	mov    -0x40(%ebp),%eax
 481:	85 c0                	test   %eax,%eax
 483:	74 07                	je     48c <printint+0x6c>
    buf[i++] = '-';
 485:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)
 48a:	89 f7                	mov    %esi,%edi

  while(--i >= 0)
 48c:	8d 5d d8             	lea    -0x28(%ebp),%ebx
 48f:	8b 75 c4             	mov    -0x3c(%ebp),%esi
 492:	01 df                	add    %ebx,%edi
 494:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 49b:	00 
 49c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    putc(fd, buf[i]);
 4a0:	0f b6 07             	movzbl (%edi),%eax
  write(fd, &c, 1);
 4a3:	83 ec 04             	sub    $0x4,%esp
 4a6:	88 45 d7             	mov    %al,-0x29(%ebp)
 4a9:	8d 45 d7             	lea    -0x29(%ebp),%eax
 4ac:	6a 01                	push   $0x1
 4ae:	50                   	push   %eax
 4af:	56                   	push   %esi
 4b0:	e8 a1 fe ff ff       	call   356 <write>
  while(--i >= 0)
 4b5:	89 f8                	mov    %edi,%eax
 4b7:	83 c4 10             	add    $0x10,%esp
 4ba:	83 ef 01             	sub    $0x1,%edi
 4bd:	39 d8                	cmp    %ebx,%eax
 4bf:	75 df                	jne    4a0 <printint+0x80>
}
 4c1:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4c4:	5b                   	pop    %ebx
 4c5:	5e                   	pop    %esi
 4c6:	5f                   	pop    %edi
 4c7:	5d                   	pop    %ebp
 4c8:	c3                   	ret
 4c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 4d0:	31 c0                	xor    %eax,%eax
 4d2:	e9 72 ff ff ff       	jmp    449 <printint+0x29>
 4d7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 4de:	00 
 4df:	90                   	nop

000004e0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 4e0:	55                   	push   %ebp
 4e1:	89 e5                	mov    %esp,%ebp
 4e3:	57                   	push   %edi
 4e4:	56                   	push   %esi
 4e5:	53                   	push   %ebx
 4e6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 4e9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 4ec:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 4ef:	0f b6 13             	movzbl (%ebx),%edx
 4f2:	83 c3 01             	add    $0x1,%ebx
 4f5:	84 d2                	test   %dl,%dl
 4f7:	0f 84 a0 00 00 00    	je     59d <printf+0xbd>
 4fd:	8d 45 10             	lea    0x10(%ebp),%eax
 500:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    c = fmt[i] & 0xff;
 503:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 506:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 509:	eb 28                	jmp    533 <printf+0x53>
 50b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 510:	83 ec 04             	sub    $0x4,%esp
 513:	8d 45 e7             	lea    -0x19(%ebp),%eax
 516:	88 55 e7             	mov    %dl,-0x19(%ebp)
  for(i = 0; fmt[i]; i++){
 519:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 51c:	6a 01                	push   $0x1
 51e:	50                   	push   %eax
 51f:	56                   	push   %esi
 520:	e8 31 fe ff ff       	call   356 <write>
  for(i = 0; fmt[i]; i++){
 525:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 529:	83 c4 10             	add    $0x10,%esp
 52c:	84 d2                	test   %dl,%dl
 52e:	74 6d                	je     59d <printf+0xbd>
    c = fmt[i] & 0xff;
 530:	0f b6 c2             	movzbl %dl,%eax
      if(c == '%'){
 533:	83 f8 25             	cmp    $0x25,%eax
 536:	75 d8                	jne    510 <printf+0x30>
  for(i = 0; fmt[i]; i++){
 538:	0f b6 13             	movzbl (%ebx),%edx
 53b:	84 d2                	test   %dl,%dl
 53d:	74 5e                	je     59d <printf+0xbd>
    c = fmt[i] & 0xff;
 53f:	0f b6 c2             	movzbl %dl,%eax
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
 542:	80 fa 25             	cmp    $0x25,%dl
 545:	0f 84 1d 01 00 00    	je     668 <printf+0x188>
 54b:	83 e8 63             	sub    $0x63,%eax
 54e:	83 f8 15             	cmp    $0x15,%eax
 551:	77 0d                	ja     560 <printf+0x80>
 553:	ff 24 85 58 08 00 00 	jmp    *0x858(,%eax,4)
 55a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 560:	83 ec 04             	sub    $0x4,%esp
 563:	8d 4d e7             	lea    -0x19(%ebp),%ecx
 566:	88 55 d0             	mov    %dl,-0x30(%ebp)
        ap++;
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 569:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
  write(fd, &c, 1);
 56d:	6a 01                	push   $0x1
 56f:	51                   	push   %ecx
 570:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
 573:	56                   	push   %esi
 574:	e8 dd fd ff ff       	call   356 <write>
        putc(fd, c);
 579:	0f b6 55 d0          	movzbl -0x30(%ebp),%edx
  write(fd, &c, 1);
 57d:	83 c4 0c             	add    $0xc,%esp
 580:	88 55 e7             	mov    %dl,-0x19(%ebp)
 583:	6a 01                	push   $0x1
 585:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
 588:	51                   	push   %ecx
 589:	56                   	push   %esi
 58a:	e8 c7 fd ff ff       	call   356 <write>
  for(i = 0; fmt[i]; i++){
 58f:	0f b6 53 01          	movzbl 0x1(%ebx),%edx
 593:	83 c3 02             	add    $0x2,%ebx
 596:	83 c4 10             	add    $0x10,%esp
 599:	84 d2                	test   %dl,%dl
 59b:	75 93                	jne    530 <printf+0x50>
      }
      state = 0;
    }
  }
}
 59d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5a0:	5b                   	pop    %ebx
 5a1:	5e                   	pop    %esi
 5a2:	5f                   	pop    %edi
 5a3:	5d                   	pop    %ebp
 5a4:	c3                   	ret
 5a5:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 5a8:	83 ec 0c             	sub    $0xc,%esp
 5ab:	8b 17                	mov    (%edi),%edx
 5ad:	b9 10 00 00 00       	mov    $0x10,%ecx
 5b2:	89 f0                	mov    %esi,%eax
 5b4:	6a 00                	push   $0x0
        ap++;
 5b6:	83 c7 04             	add    $0x4,%edi
        printint(fd, *ap, 16, 0);
 5b9:	e8 62 fe ff ff       	call   420 <printint>
  for(i = 0; fmt[i]; i++){
 5be:	eb cf                	jmp    58f <printf+0xaf>
        s = (char*)*ap;
 5c0:	8b 07                	mov    (%edi),%eax
        ap++;
 5c2:	83 c7 04             	add    $0x4,%edi
        if(s == 0)
 5c5:	85 c0                	test   %eax,%eax
 5c7:	0f 84 b3 00 00 00    	je     680 <printf+0x1a0>
        while(*s != 0){
 5cd:	0f b6 10             	movzbl (%eax),%edx
 5d0:	84 d2                	test   %dl,%dl
 5d2:	0f 84 ba 00 00 00    	je     692 <printf+0x1b2>
 5d8:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 5db:	89 c7                	mov    %eax,%edi
 5dd:	89 d0                	mov    %edx,%eax
 5df:	8d 4d e7             	lea    -0x19(%ebp),%ecx
 5e2:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 5e5:	89 fb                	mov    %edi,%ebx
 5e7:	89 cf                	mov    %ecx,%edi
 5e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 5f0:	83 ec 04             	sub    $0x4,%esp
 5f3:	88 45 e7             	mov    %al,-0x19(%ebp)
          s++;
 5f6:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 5f9:	6a 01                	push   $0x1
 5fb:	57                   	push   %edi
 5fc:	56                   	push   %esi
 5fd:	e8 54 fd ff ff       	call   356 <write>
        while(*s != 0){
 602:	0f b6 03             	movzbl (%ebx),%eax
 605:	83 c4 10             	add    $0x10,%esp
 608:	84 c0                	test   %al,%al
 60a:	75 e4                	jne    5f0 <printf+0x110>
 60c:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  for(i = 0; fmt[i]; i++){
 60f:	0f b6 53 01          	movzbl 0x1(%ebx),%edx
 613:	83 c3 02             	add    $0x2,%ebx
 616:	84 d2                	test   %dl,%dl
 618:	0f 85 e5 fe ff ff    	jne    503 <printf+0x23>
 61e:	e9 7a ff ff ff       	jmp    59d <printf+0xbd>
 623:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 628:	83 ec 0c             	sub    $0xc,%esp
 62b:	8b 17                	mov    (%edi),%edx
 62d:	b9 0a 00 00 00       	mov    $0xa,%ecx
 632:	89 f0                	mov    %esi,%eax
 634:	6a 01                	push   $0x1
        ap++;
 636:	83 c7 04             	add    $0x4,%edi
        printint(fd, *ap, 10, 1);
 639:	e8 e2 fd ff ff       	call   420 <printint>
  for(i = 0; fmt[i]; i++){
 63e:	e9 4c ff ff ff       	jmp    58f <printf+0xaf>
 643:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 648:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
 64a:	83 ec 04             	sub    $0x4,%esp
 64d:	8d 4d e7             	lea    -0x19(%ebp),%ecx
        ap++;
 650:	83 c7 04             	add    $0x4,%edi
        putc(fd, *ap);
 653:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 656:	6a 01                	push   $0x1
 658:	51                   	push   %ecx
 659:	56                   	push   %esi
 65a:	e8 f7 fc ff ff       	call   356 <write>
  for(i = 0; fmt[i]; i++){
 65f:	e9 2b ff ff ff       	jmp    58f <printf+0xaf>
 664:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 668:	83 ec 04             	sub    $0x4,%esp
 66b:	88 55 e7             	mov    %dl,-0x19(%ebp)
 66e:	8d 4d e7             	lea    -0x19(%ebp),%ecx
 671:	6a 01                	push   $0x1
 673:	e9 10 ff ff ff       	jmp    588 <printf+0xa8>
 678:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 67f:	00 
          s = "(null)";
 680:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 683:	b8 28 00 00 00       	mov    $0x28,%eax
 688:	bf 50 08 00 00       	mov    $0x850,%edi
 68d:	e9 4d ff ff ff       	jmp    5df <printf+0xff>
  for(i = 0; fmt[i]; i++){
 692:	0f b6 53 01          	movzbl 0x1(%ebx),%edx
 696:	83 c3 02             	add    $0x2,%ebx
 699:	84 d2                	test   %dl,%dl
 69b:	0f 85 8f fe ff ff    	jne    530 <printf+0x50>
 6a1:	e9 f7 fe ff ff       	jmp    59d <printf+0xbd>
 6a6:	66 90                	xchg   %ax,%ax
 6a8:	66 90                	xchg   %ax,%ax
 6aa:	66 90                	xchg   %ax,%ax
 6ac:	66 90                	xchg   %ax,%ax
 6ae:	66 90                	xchg   %ax,%ax
 6b0:	66 90                	xchg   %ax,%ax
 6b2:	66 90                	xchg   %ax,%ax
 6b4:	66 90                	xchg   %ax,%ax
 6b6:	66 90                	xchg   %ax,%ax
 6b8:	66 90                	xchg   %ax,%ax
 6ba:	66 90                	xchg   %ax,%ax
 6bc:	66 90                	xchg   %ax,%ax
 6be:	66 90                	xchg   %ax,%ax

000006c0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6c0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6c1:	a1 c4 08 00 00       	mov    0x8c4,%eax
{
 6c6:	89 e5                	mov    %esp,%ebp
 6c8:	57                   	push   %edi
 6c9:	56                   	push   %esi
 6ca:	53                   	push   %ebx
 6cb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 6ce:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6d1:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 6d8:	00 
 6d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6e0:	89 c2                	mov    %eax,%edx
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6e2:	8b 00                	mov    (%eax),%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6e4:	39 ca                	cmp    %ecx,%edx
 6e6:	73 30                	jae    718 <free+0x58>
 6e8:	39 c1                	cmp    %eax,%ecx
 6ea:	72 04                	jb     6f0 <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6ec:	39 c2                	cmp    %eax,%edx
 6ee:	72 f0                	jb     6e0 <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
 6f0:	8b 73 fc             	mov    -0x4(%ebx),%esi
 6f3:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 6f6:	39 f8                	cmp    %edi,%eax
 6f8:	74 36                	je     730 <free+0x70>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 6fa:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 6fd:	8b 42 04             	mov    0x4(%edx),%eax
 700:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 703:	39 f1                	cmp    %esi,%ecx
 705:	74 40                	je     747 <free+0x87>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 707:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 709:	5b                   	pop    %ebx
  freep = p;
 70a:	89 15 c4 08 00 00    	mov    %edx,0x8c4
}
 710:	5e                   	pop    %esi
 711:	5f                   	pop    %edi
 712:	5d                   	pop    %ebp
 713:	c3                   	ret
 714:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 718:	39 c2                	cmp    %eax,%edx
 71a:	72 c4                	jb     6e0 <free+0x20>
 71c:	39 c1                	cmp    %eax,%ecx
 71e:	73 c0                	jae    6e0 <free+0x20>
  if(bp + bp->s.size == p->s.ptr){
 720:	8b 73 fc             	mov    -0x4(%ebx),%esi
 723:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 726:	39 f8                	cmp    %edi,%eax
 728:	75 d0                	jne    6fa <free+0x3a>
 72a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    bp->s.size += p->s.ptr->s.size;
 730:	03 70 04             	add    0x4(%eax),%esi
 733:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 736:	8b 02                	mov    (%edx),%eax
 738:	8b 00                	mov    (%eax),%eax
 73a:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 73d:	8b 42 04             	mov    0x4(%edx),%eax
 740:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 743:	39 f1                	cmp    %esi,%ecx
 745:	75 c0                	jne    707 <free+0x47>
    p->s.size += bp->s.size;
 747:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 74a:	89 15 c4 08 00 00    	mov    %edx,0x8c4
    p->s.size += bp->s.size;
 750:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 753:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 756:	89 0a                	mov    %ecx,(%edx)
}
 758:	5b                   	pop    %ebx
 759:	5e                   	pop    %esi
 75a:	5f                   	pop    %edi
 75b:	5d                   	pop    %ebp
 75c:	c3                   	ret
 75d:	8d 76 00             	lea    0x0(%esi),%esi

00000760 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 760:	55                   	push   %ebp
 761:	89 e5                	mov    %esp,%ebp
 763:	57                   	push   %edi
 764:	56                   	push   %esi
 765:	53                   	push   %ebx
 766:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 769:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 76c:	8b 15 c4 08 00 00    	mov    0x8c4,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 772:	8d 78 07             	lea    0x7(%eax),%edi
 775:	c1 ef 03             	shr    $0x3,%edi
 778:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 77b:	85 d2                	test   %edx,%edx
 77d:	0f 84 8d 00 00 00    	je     810 <malloc+0xb0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 783:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 785:	8b 48 04             	mov    0x4(%eax),%ecx
 788:	39 f9                	cmp    %edi,%ecx
 78a:	73 64                	jae    7f0 <malloc+0x90>
  if(nu < 4096)
 78c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 791:	39 df                	cmp    %ebx,%edi
 793:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 796:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 79d:	eb 0a                	jmp    7a9 <malloc+0x49>
 79f:	90                   	nop
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7a0:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 7a2:	8b 48 04             	mov    0x4(%eax),%ecx
 7a5:	39 f9                	cmp    %edi,%ecx
 7a7:	73 47                	jae    7f0 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 7a9:	89 c2                	mov    %eax,%edx
 7ab:	39 05 c4 08 00 00    	cmp    %eax,0x8c4
 7b1:	75 ed                	jne    7a0 <malloc+0x40>
  p = sbrk(nu * sizeof(Header));
 7b3:	83 ec 0c             	sub    $0xc,%esp
 7b6:	56                   	push   %esi
 7b7:	e8 02 fc ff ff       	call   3be <sbrk>
  if(p == (char*)-1)
 7bc:	83 c4 10             	add    $0x10,%esp
 7bf:	83 f8 ff             	cmp    $0xffffffff,%eax
 7c2:	74 1c                	je     7e0 <malloc+0x80>
  hp->s.size = nu;
 7c4:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 7c7:	83 ec 0c             	sub    $0xc,%esp
 7ca:	83 c0 08             	add    $0x8,%eax
 7cd:	50                   	push   %eax
 7ce:	e8 ed fe ff ff       	call   6c0 <free>
  return freep;
 7d3:	8b 15 c4 08 00 00    	mov    0x8c4,%edx
      if((p = morecore(nunits)) == 0)
 7d9:	83 c4 10             	add    $0x10,%esp
 7dc:	85 d2                	test   %edx,%edx
 7de:	75 c0                	jne    7a0 <malloc+0x40>
        return 0;
  }
}
 7e0:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 7e3:	31 c0                	xor    %eax,%eax
}
 7e5:	5b                   	pop    %ebx
 7e6:	5e                   	pop    %esi
 7e7:	5f                   	pop    %edi
 7e8:	5d                   	pop    %ebp
 7e9:	c3                   	ret
 7ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 7f0:	39 cf                	cmp    %ecx,%edi
 7f2:	74 4c                	je     840 <malloc+0xe0>
        p->s.size -= nunits;
 7f4:	29 f9                	sub    %edi,%ecx
 7f6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 7f9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 7fc:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 7ff:	89 15 c4 08 00 00    	mov    %edx,0x8c4
}
 805:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 808:	83 c0 08             	add    $0x8,%eax
}
 80b:	5b                   	pop    %ebx
 80c:	5e                   	pop    %esi
 80d:	5f                   	pop    %edi
 80e:	5d                   	pop    %ebp
 80f:	c3                   	ret
    base.s.ptr = freep = prevp = &base;
 810:	c7 05 c4 08 00 00 c8 	movl   $0x8c8,0x8c4
 817:	08 00 00 
    base.s.size = 0;
 81a:	b8 c8 08 00 00       	mov    $0x8c8,%eax
    base.s.ptr = freep = prevp = &base;
 81f:	c7 05 c8 08 00 00 c8 	movl   $0x8c8,0x8c8
 826:	08 00 00 
    base.s.size = 0;
 829:	c7 05 cc 08 00 00 00 	movl   $0x0,0x8cc
 830:	00 00 00 
    if(p->s.size >= nunits){
 833:	e9 54 ff ff ff       	jmp    78c <malloc+0x2c>
 838:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 83f:	00 
        prevp->s.ptr = p->s.ptr;
 840:	8b 08                	mov    (%eax),%ecx
 842:	89 0a                	mov    %ecx,(%edx)
 844:	eb b9                	jmp    7ff <malloc+0x9f>
