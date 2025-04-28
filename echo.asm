
_echo:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

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
  11:	83 ec 08             	sub    $0x8,%esp
  14:	8b 31                	mov    (%ecx),%esi
  16:	8b 79 04             	mov    0x4(%ecx),%edi
  int i;

  for(i = 1; i < argc; i++)
  19:	83 fe 01             	cmp    $0x1,%esi
  1c:	7e 47                	jle    65 <main+0x65>
    printf(1, "%s%s", argv[i], i+1 < argc ? " " : "\n");
  1e:	8b 47 04             	mov    0x4(%edi),%eax
  21:	83 fe 02             	cmp    $0x2,%esi
  24:	74 2a                	je     50 <main+0x50>
  26:	bb 02 00 00 00       	mov    $0x2,%ebx
  2b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  30:	68 88 08 00 00       	push   $0x888
  35:	83 c3 01             	add    $0x1,%ebx
  38:	50                   	push   %eax
  39:	68 8a 08 00 00       	push   $0x88a
  3e:	6a 01                	push   $0x1
  40:	e8 db 04 00 00       	call   520 <printf>
  45:	8b 44 9f fc          	mov    -0x4(%edi,%ebx,4),%eax
  49:	83 c4 10             	add    $0x10,%esp
  4c:	39 de                	cmp    %ebx,%esi
  4e:	75 e0                	jne    30 <main+0x30>
  50:	68 8f 08 00 00       	push   $0x88f
  55:	50                   	push   %eax
  56:	68 8a 08 00 00       	push   $0x88a
  5b:	6a 01                	push   $0x1
  5d:	e8 be 04 00 00       	call   520 <printf>
  62:	83 c4 10             	add    $0x10,%esp
  exit();
  65:	e8 0c 03 00 00       	call   376 <exit>
  6a:	66 90                	xchg   %ax,%ax
  6c:	66 90                	xchg   %ax,%ax
  6e:	66 90                	xchg   %ax,%ax
  70:	66 90                	xchg   %ax,%ax
  72:	66 90                	xchg   %ax,%ax
  74:	66 90                	xchg   %ax,%ax
  76:	66 90                	xchg   %ax,%ax
  78:	66 90                	xchg   %ax,%ax
  7a:	66 90                	xchg   %ax,%ax
  7c:	66 90                	xchg   %ax,%ax
  7e:	66 90                	xchg   %ax,%ax

00000080 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  80:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  81:	31 c0                	xor    %eax,%eax
{
  83:	89 e5                	mov    %esp,%ebp
  85:	53                   	push   %ebx
  86:	8b 4d 08             	mov    0x8(%ebp),%ecx
  89:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
  90:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  94:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  97:	83 c0 01             	add    $0x1,%eax
  9a:	84 d2                	test   %dl,%dl
  9c:	75 f2                	jne    90 <strcpy+0x10>
    ;
  return os;
}
  9e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  a1:	89 c8                	mov    %ecx,%eax
  a3:	c9                   	leave
  a4:	c3                   	ret
  a5:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  ac:	00 
  ad:	8d 76 00             	lea    0x0(%esi),%esi

000000b0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  b0:	55                   	push   %ebp
  b1:	89 e5                	mov    %esp,%ebp
  b3:	53                   	push   %ebx
  b4:	8b 55 08             	mov    0x8(%ebp),%edx
  b7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
  ba:	0f b6 02             	movzbl (%edx),%eax
  bd:	84 c0                	test   %al,%al
  bf:	75 2f                	jne    f0 <strcmp+0x40>
  c1:	eb 4a                	jmp    10d <strcmp+0x5d>
  c3:	eb 1b                	jmp    e0 <strcmp+0x30>
  c5:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  cc:	00 
  cd:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  d4:	00 
  d5:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  dc:	00 
  dd:	8d 76 00             	lea    0x0(%esi),%esi
  e0:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
  e4:	83 c2 01             	add    $0x1,%edx
  e7:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
  ea:	84 c0                	test   %al,%al
  ec:	74 12                	je     100 <strcmp+0x50>
  ee:	89 d9                	mov    %ebx,%ecx
  f0:	0f b6 19             	movzbl (%ecx),%ebx
  f3:	38 c3                	cmp    %al,%bl
  f5:	74 e9                	je     e0 <strcmp+0x30>
  return (uchar)*p - (uchar)*q;
  f7:	29 d8                	sub    %ebx,%eax
}
  f9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  fc:	c9                   	leave
  fd:	c3                   	ret
  fe:	66 90                	xchg   %ax,%ax
  return (uchar)*p - (uchar)*q;
 100:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 104:	31 c0                	xor    %eax,%eax
 106:	29 d8                	sub    %ebx,%eax
}
 108:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 10b:	c9                   	leave
 10c:	c3                   	ret
  return (uchar)*p - (uchar)*q;
 10d:	0f b6 19             	movzbl (%ecx),%ebx
 110:	31 c0                	xor    %eax,%eax
 112:	eb e3                	jmp    f7 <strcmp+0x47>
 114:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 11b:	00 
 11c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000120 <strlen>:

uint
strlen(const char *s)
{
 120:	55                   	push   %ebp
 121:	89 e5                	mov    %esp,%ebp
 123:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 126:	80 3a 00             	cmpb   $0x0,(%edx)
 129:	74 15                	je     140 <strlen+0x20>
 12b:	31 c0                	xor    %eax,%eax
 12d:	8d 76 00             	lea    0x0(%esi),%esi
 130:	83 c0 01             	add    $0x1,%eax
 133:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 137:	89 c1                	mov    %eax,%ecx
 139:	75 f5                	jne    130 <strlen+0x10>
    ;
  return n;
}
 13b:	89 c8                	mov    %ecx,%eax
 13d:	5d                   	pop    %ebp
 13e:	c3                   	ret
 13f:	90                   	nop
  for(n = 0; s[n]; n++)
 140:	31 c9                	xor    %ecx,%ecx
}
 142:	5d                   	pop    %ebp
 143:	89 c8                	mov    %ecx,%eax
 145:	c3                   	ret
 146:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 14d:	00 
 14e:	66 90                	xchg   %ax,%ax

00000150 <memset>:

void*
memset(void *dst, int c, uint n)
{
 150:	55                   	push   %ebp
 151:	89 e5                	mov    %esp,%ebp
 153:	57                   	push   %edi
 154:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 157:	8b 4d 10             	mov    0x10(%ebp),%ecx
 15a:	8b 45 0c             	mov    0xc(%ebp),%eax
 15d:	89 d7                	mov    %edx,%edi
 15f:	fc                   	cld
 160:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 162:	8b 7d fc             	mov    -0x4(%ebp),%edi
 165:	89 d0                	mov    %edx,%eax
 167:	c9                   	leave
 168:	c3                   	ret
 169:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000170 <strchr>:

char*
strchr(const char *s, char c)
{
 170:	55                   	push   %ebp
 171:	89 e5                	mov    %esp,%ebp
 173:	8b 45 08             	mov    0x8(%ebp),%eax
 176:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 17a:	0f b6 10             	movzbl (%eax),%edx
 17d:	84 d2                	test   %dl,%dl
 17f:	75 1a                	jne    19b <strchr+0x2b>
 181:	eb 25                	jmp    1a8 <strchr+0x38>
 183:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 18a:	00 
 18b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 190:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 194:	83 c0 01             	add    $0x1,%eax
 197:	84 d2                	test   %dl,%dl
 199:	74 0d                	je     1a8 <strchr+0x38>
    if(*s == c)
 19b:	38 d1                	cmp    %dl,%cl
 19d:	75 f1                	jne    190 <strchr+0x20>
      return (char*)s;
  return 0;
}
 19f:	5d                   	pop    %ebp
 1a0:	c3                   	ret
 1a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 1a8:	31 c0                	xor    %eax,%eax
}
 1aa:	5d                   	pop    %ebp
 1ab:	c3                   	ret
 1ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000001b0 <gets>:

char*
gets(char *buf, int max)
{
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	57                   	push   %edi
 1b4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 1b5:	8d 75 e7             	lea    -0x19(%ebp),%esi
{
 1b8:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 1b9:	31 db                	xor    %ebx,%ebx
{
 1bb:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 1be:	eb 27                	jmp    1e7 <gets+0x37>
    cc = read(0, &c, 1);
 1c0:	83 ec 04             	sub    $0x4,%esp
 1c3:	6a 01                	push   $0x1
 1c5:	56                   	push   %esi
 1c6:	6a 00                	push   $0x0
 1c8:	e8 c1 01 00 00       	call   38e <read>
    if(cc < 1)
 1cd:	83 c4 10             	add    $0x10,%esp
 1d0:	85 c0                	test   %eax,%eax
 1d2:	7e 1d                	jle    1f1 <gets+0x41>
      break;
    buf[i++] = c;
 1d4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1d8:	8b 55 08             	mov    0x8(%ebp),%edx
 1db:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 1df:	3c 0a                	cmp    $0xa,%al
 1e1:	74 10                	je     1f3 <gets+0x43>
 1e3:	3c 0d                	cmp    $0xd,%al
 1e5:	74 0c                	je     1f3 <gets+0x43>
  for(i=0; i+1 < max; ){
 1e7:	89 df                	mov    %ebx,%edi
 1e9:	83 c3 01             	add    $0x1,%ebx
 1ec:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1ef:	7c cf                	jl     1c0 <gets+0x10>
 1f1:	89 fb                	mov    %edi,%ebx
      break;
  }
  buf[i] = '\0';
 1f3:	8b 45 08             	mov    0x8(%ebp),%eax
 1f6:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
 1fa:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1fd:	5b                   	pop    %ebx
 1fe:	5e                   	pop    %esi
 1ff:	5f                   	pop    %edi
 200:	5d                   	pop    %ebp
 201:	c3                   	ret
 202:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 209:	00 
 20a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000210 <stat>:

int
stat(const char *n, struct stat *st)
{
 210:	55                   	push   %ebp
 211:	89 e5                	mov    %esp,%ebp
 213:	56                   	push   %esi
 214:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 215:	83 ec 08             	sub    $0x8,%esp
 218:	6a 00                	push   $0x0
 21a:	ff 75 08             	push   0x8(%ebp)
 21d:	e8 94 01 00 00       	call   3b6 <open>
  if(fd < 0)
 222:	83 c4 10             	add    $0x10,%esp
 225:	85 c0                	test   %eax,%eax
 227:	78 27                	js     250 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 229:	83 ec 08             	sub    $0x8,%esp
 22c:	ff 75 0c             	push   0xc(%ebp)
 22f:	89 c3                	mov    %eax,%ebx
 231:	50                   	push   %eax
 232:	e8 97 01 00 00       	call   3ce <fstat>
  close(fd);
 237:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 23a:	89 c6                	mov    %eax,%esi
  close(fd);
 23c:	e8 5d 01 00 00       	call   39e <close>
  return r;
 241:	83 c4 10             	add    $0x10,%esp
}
 244:	8d 65 f8             	lea    -0x8(%ebp),%esp
 247:	89 f0                	mov    %esi,%eax
 249:	5b                   	pop    %ebx
 24a:	5e                   	pop    %esi
 24b:	5d                   	pop    %ebp
 24c:	c3                   	ret
 24d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 250:	be ff ff ff ff       	mov    $0xffffffff,%esi
 255:	eb ed                	jmp    244 <stat+0x34>
 257:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 25e:	00 
 25f:	90                   	nop

00000260 <atoi>:

int
atoi(const char *s)
{
 260:	55                   	push   %ebp
 261:	89 e5                	mov    %esp,%ebp
 263:	53                   	push   %ebx
 264:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 267:	0f be 02             	movsbl (%edx),%eax
 26a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 26d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 270:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 275:	77 1e                	ja     295 <atoi+0x35>
 277:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 27e:	00 
 27f:	90                   	nop
    n = n*10 + *s++ - '0';
 280:	83 c2 01             	add    $0x1,%edx
 283:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 286:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 28a:	0f be 02             	movsbl (%edx),%eax
 28d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 290:	80 fb 09             	cmp    $0x9,%bl
 293:	76 eb                	jbe    280 <atoi+0x20>
  return n;
}
 295:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 298:	89 c8                	mov    %ecx,%eax
 29a:	c9                   	leave
 29b:	c3                   	ret
 29c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000002a0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 2a0:	55                   	push   %ebp
 2a1:	89 e5                	mov    %esp,%ebp
 2a3:	57                   	push   %edi
 2a4:	8b 45 10             	mov    0x10(%ebp),%eax
 2a7:	8b 55 08             	mov    0x8(%ebp),%edx
 2aa:	56                   	push   %esi
 2ab:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2ae:	85 c0                	test   %eax,%eax
 2b0:	7e 13                	jle    2c5 <memmove+0x25>
 2b2:	01 d0                	add    %edx,%eax
  dst = vdst;
 2b4:	89 d7                	mov    %edx,%edi
 2b6:	66 90                	xchg   %ax,%ax
 2b8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 2bf:	00 
    *dst++ = *src++;
 2c0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 2c1:	39 f8                	cmp    %edi,%eax
 2c3:	75 fb                	jne    2c0 <memmove+0x20>
  return vdst;
}
 2c5:	5e                   	pop    %esi
 2c6:	89 d0                	mov    %edx,%eax
 2c8:	5f                   	pop    %edi
 2c9:	5d                   	pop    %ebp
 2ca:	c3                   	ret
 2cb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

000002d0 <sqrt>:


// https://www.geeksforgeeks.org/c-program-to-find-square-root-of-a-given-number/
float sqrt(int num) {
 2d0:	55                   	push   %ebp
 2d1:	89 e5                	mov    %esp,%ebp
 2d3:	56                   	push   %esi
 2d4:	53                   	push   %ebx
 2d5:	83 ec 04             	sub    $0x4,%esp
 2d8:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int end = num;
  int middle;

  float solution = 0.0;

  while (start <= end) {
 2db:	85 db                	test   %ebx,%ebx
 2dd:	0f 88 87 00 00 00    	js     36a <sqrt+0x9a>
  int end = num;
 2e3:	89 d9                	mov    %ebx,%ecx
  float solution = 0.0;
 2e5:	d9 ee                	fldz
  int start = 0;
 2e7:	31 d2                	xor    %edx,%edx
 2e9:	eb 14                	jmp    2ff <sqrt+0x2f>
 2eb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 2f0:	dd d8                	fstp   %st(0)
    if (middle * middle == num) {
      solution = middle;
      break;
    }
    if (middle * middle < num) {
      solution = start;
 2f2:	89 55 f4             	mov    %edx,-0xc(%ebp)
      start = middle + 1;
 2f5:	8d 50 01             	lea    0x1(%eax),%edx
      solution = start;
 2f8:	db 45 f4             	fildl  -0xc(%ebp)
  while (start <= end) {
 2fb:	39 ca                	cmp    %ecx,%edx
 2fd:	7f 1e                	jg     31d <sqrt+0x4d>
    middle = (start + end) / 2;
 2ff:	8d 34 0a             	lea    (%edx,%ecx,1),%esi
 302:	89 f0                	mov    %esi,%eax
 304:	c1 e8 1f             	shr    $0x1f,%eax
 307:	01 f0                	add    %esi,%eax
 309:	d1 f8                	sar    $1,%eax
    if (middle * middle == num) {
 30b:	89 c6                	mov    %eax,%esi
 30d:	0f af f0             	imul   %eax,%esi
 310:	39 de                	cmp    %ebx,%esi
 312:	74 4c                	je     360 <sqrt+0x90>
    if (middle * middle < num) {
 314:	7c da                	jl     2f0 <sqrt+0x20>
    }
    else {
      end = middle - 1;
 316:	8d 48 ff             	lea    -0x1(%eax),%ecx
  while (start <= end) {
 319:	39 ca                	cmp    %ecx,%edx
 31b:	7e e2                	jle    2ff <sqrt+0x2f>

  float eps = 0.1;
  int i;

  for (i = 0; i < 5; i++) {
    while (solution * solution <= num) {
 31d:	89 5d f4             	mov    %ebx,-0xc(%ebp)
 320:	b8 05 00 00 00       	mov    $0x5,%eax
 325:	db 45 f4             	fildl  -0xc(%ebp)
 328:	d9 05 98 08 00 00    	flds   0x898
 32e:	eb 02                	jmp    332 <sqrt+0x62>
      solution += eps;
 330:	dc c2                	fadd   %st,%st(2)
    while (solution * solution <= num) {
 332:	d9 c2                	fld    %st(2)
 334:	d8 cb                	fmul   %st(3),%st
 336:	d9 ca                	fxch   %st(2)
 338:	db f2                	fcomi  %st(2),%st
 33a:	dd da                	fstp   %st(2)
 33c:	73 f2                	jae    330 <sqrt+0x60>
    }
    solution = solution - eps;
 33e:	dc ea                	fsubr  %st,%st(2)
    eps = eps / 10;
 340:	d8 35 9c 08 00 00    	fdivs  0x89c
  for (i = 0; i < 5; i++) {
 346:	83 e8 01             	sub    $0x1,%eax
 349:	75 e7                	jne    332 <sqrt+0x62>
 34b:	dd d8                	fstp   %st(0)
 34d:	dd d8                	fstp   %st(0)
  }
  return solution;

}
 34f:	83 c4 04             	add    $0x4,%esp
 352:	5b                   	pop    %ebx
 353:	5e                   	pop    %esi
 354:	5d                   	pop    %ebp
 355:	c3                   	ret
 356:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 35d:	00 
 35e:	66 90                	xchg   %ax,%ax
 360:	dd d8                	fstp   %st(0)
      solution = middle;
 362:	89 45 f4             	mov    %eax,-0xc(%ebp)
 365:	db 45 f4             	fildl  -0xc(%ebp)
      break;
 368:	eb b3                	jmp    31d <sqrt+0x4d>
  float solution = 0.0;
 36a:	d9 ee                	fldz
 36c:	eb af                	jmp    31d <sqrt+0x4d>

0000036e <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 36e:	b8 01 00 00 00       	mov    $0x1,%eax
 373:	cd 40                	int    $0x40
 375:	c3                   	ret

00000376 <exit>:
SYSCALL(exit)
 376:	b8 02 00 00 00       	mov    $0x2,%eax
 37b:	cd 40                	int    $0x40
 37d:	c3                   	ret

0000037e <wait>:
SYSCALL(wait)
 37e:	b8 03 00 00 00       	mov    $0x3,%eax
 383:	cd 40                	int    $0x40
 385:	c3                   	ret

00000386 <pipe>:
SYSCALL(pipe)
 386:	b8 04 00 00 00       	mov    $0x4,%eax
 38b:	cd 40                	int    $0x40
 38d:	c3                   	ret

0000038e <read>:
SYSCALL(read)
 38e:	b8 05 00 00 00       	mov    $0x5,%eax
 393:	cd 40                	int    $0x40
 395:	c3                   	ret

00000396 <write>:
SYSCALL(write)
 396:	b8 10 00 00 00       	mov    $0x10,%eax
 39b:	cd 40                	int    $0x40
 39d:	c3                   	ret

0000039e <close>:
SYSCALL(close)
 39e:	b8 15 00 00 00       	mov    $0x15,%eax
 3a3:	cd 40                	int    $0x40
 3a5:	c3                   	ret

000003a6 <kill>:
SYSCALL(kill)
 3a6:	b8 06 00 00 00       	mov    $0x6,%eax
 3ab:	cd 40                	int    $0x40
 3ad:	c3                   	ret

000003ae <exec>:
SYSCALL(exec)
 3ae:	b8 07 00 00 00       	mov    $0x7,%eax
 3b3:	cd 40                	int    $0x40
 3b5:	c3                   	ret

000003b6 <open>:
SYSCALL(open)
 3b6:	b8 0f 00 00 00       	mov    $0xf,%eax
 3bb:	cd 40                	int    $0x40
 3bd:	c3                   	ret

000003be <mknod>:
SYSCALL(mknod)
 3be:	b8 11 00 00 00       	mov    $0x11,%eax
 3c3:	cd 40                	int    $0x40
 3c5:	c3                   	ret

000003c6 <unlink>:
SYSCALL(unlink)
 3c6:	b8 12 00 00 00       	mov    $0x12,%eax
 3cb:	cd 40                	int    $0x40
 3cd:	c3                   	ret

000003ce <fstat>:
SYSCALL(fstat)
 3ce:	b8 08 00 00 00       	mov    $0x8,%eax
 3d3:	cd 40                	int    $0x40
 3d5:	c3                   	ret

000003d6 <link>:
SYSCALL(link)
 3d6:	b8 13 00 00 00       	mov    $0x13,%eax
 3db:	cd 40                	int    $0x40
 3dd:	c3                   	ret

000003de <mkdir>:
SYSCALL(mkdir)
 3de:	b8 14 00 00 00       	mov    $0x14,%eax
 3e3:	cd 40                	int    $0x40
 3e5:	c3                   	ret

000003e6 <chdir>:
SYSCALL(chdir)
 3e6:	b8 09 00 00 00       	mov    $0x9,%eax
 3eb:	cd 40                	int    $0x40
 3ed:	c3                   	ret

000003ee <dup>:
SYSCALL(dup)
 3ee:	b8 0a 00 00 00       	mov    $0xa,%eax
 3f3:	cd 40                	int    $0x40
 3f5:	c3                   	ret

000003f6 <getpid>:
SYSCALL(getpid)
 3f6:	b8 0b 00 00 00       	mov    $0xb,%eax
 3fb:	cd 40                	int    $0x40
 3fd:	c3                   	ret

000003fe <sbrk>:
SYSCALL(sbrk)
 3fe:	b8 0c 00 00 00       	mov    $0xc,%eax
 403:	cd 40                	int    $0x40
 405:	c3                   	ret

00000406 <sleep>:
SYSCALL(sleep)
 406:	b8 0d 00 00 00       	mov    $0xd,%eax
 40b:	cd 40                	int    $0x40
 40d:	c3                   	ret

0000040e <uptime>:
SYSCALL(uptime)
 40e:	b8 0e 00 00 00       	mov    $0xe,%eax
 413:	cd 40                	int    $0x40
 415:	c3                   	ret

00000416 <gettid>:
SYSCALL(gettid)
 416:	b8 16 00 00 00       	mov    $0x16,%eax
 41b:	cd 40                	int    $0x40
 41d:	c3                   	ret

0000041e <getpgid>:
SYSCALL(getpgid)
 41e:	b8 17 00 00 00       	mov    $0x17,%eax
 423:	cd 40                	int    $0x40
 425:	c3                   	ret

00000426 <setpgid>:
SYSCALL(setpgid)
 426:	b8 18 00 00 00       	mov    $0x18,%eax
 42b:	cd 40                	int    $0x40
 42d:	c3                   	ret

0000042e <getppid>:
SYSCALL(getppid)
 42e:	b8 19 00 00 00       	mov    $0x19,%eax
 433:	cd 40                	int    $0x40
 435:	c3                   	ret

00000436 <uptime_ms>:
SYSCALL(uptime_ms)
 436:	b8 1a 00 00 00       	mov    $0x1a,%eax
 43b:	cd 40                	int    $0x40
 43d:	c3                   	ret

0000043e <setpriority>:
 43e:	b8 1b 00 00 00       	mov    $0x1b,%eax
 443:	cd 40                	int    $0x40
 445:	c3                   	ret
 446:	66 90                	xchg   %ax,%ax
 448:	66 90                	xchg   %ax,%ax
 44a:	66 90                	xchg   %ax,%ax
 44c:	66 90                	xchg   %ax,%ax
 44e:	66 90                	xchg   %ax,%ax
 450:	66 90                	xchg   %ax,%ax
 452:	66 90                	xchg   %ax,%ax
 454:	66 90                	xchg   %ax,%ax
 456:	66 90                	xchg   %ax,%ax
 458:	66 90                	xchg   %ax,%ax
 45a:	66 90                	xchg   %ax,%ax
 45c:	66 90                	xchg   %ax,%ax
 45e:	66 90                	xchg   %ax,%ax

00000460 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 460:	55                   	push   %ebp
 461:	89 e5                	mov    %esp,%ebp
 463:	57                   	push   %edi
 464:	56                   	push   %esi
 465:	53                   	push   %ebx
 466:	89 cb                	mov    %ecx,%ebx
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 468:	89 d1                	mov    %edx,%ecx
{
 46a:	83 ec 3c             	sub    $0x3c,%esp
 46d:	89 45 c4             	mov    %eax,-0x3c(%ebp)
  if(sgn && xx < 0){
 470:	85 d2                	test   %edx,%edx
 472:	0f 89 98 00 00 00    	jns    510 <printint+0xb0>
 478:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 47c:	0f 84 8e 00 00 00    	je     510 <printint+0xb0>
    x = -xx;
 482:	f7 d9                	neg    %ecx
    neg = 1;
 484:	b8 01 00 00 00       	mov    $0x1,%eax
  } else {
    x = xx;
  }

  i = 0;
 489:	89 45 c0             	mov    %eax,-0x40(%ebp)
 48c:	31 f6                	xor    %esi,%esi
 48e:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 495:	00 
 496:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 49d:	00 
 49e:	66 90                	xchg   %ax,%ax
  do{
    buf[i++] = digits[x % base];
 4a0:	89 c8                	mov    %ecx,%eax
 4a2:	31 d2                	xor    %edx,%edx
 4a4:	89 f7                	mov    %esi,%edi
 4a6:	f7 f3                	div    %ebx
 4a8:	8d 76 01             	lea    0x1(%esi),%esi
 4ab:	0f b6 92 f8 08 00 00 	movzbl 0x8f8(%edx),%edx
 4b2:	88 54 35 d7          	mov    %dl,-0x29(%ebp,%esi,1)
  }while((x /= base) != 0);
 4b6:	89 ca                	mov    %ecx,%edx
 4b8:	89 c1                	mov    %eax,%ecx
 4ba:	39 da                	cmp    %ebx,%edx
 4bc:	73 e2                	jae    4a0 <printint+0x40>
  if(neg)
 4be:	8b 45 c0             	mov    -0x40(%ebp),%eax
 4c1:	85 c0                	test   %eax,%eax
 4c3:	74 07                	je     4cc <printint+0x6c>
    buf[i++] = '-';
 4c5:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)
 4ca:	89 f7                	mov    %esi,%edi

  while(--i >= 0)
 4cc:	8d 5d d8             	lea    -0x28(%ebp),%ebx
 4cf:	8b 75 c4             	mov    -0x3c(%ebp),%esi
 4d2:	01 df                	add    %ebx,%edi
 4d4:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 4db:	00 
 4dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    putc(fd, buf[i]);
 4e0:	0f b6 07             	movzbl (%edi),%eax
  write(fd, &c, 1);
 4e3:	83 ec 04             	sub    $0x4,%esp
 4e6:	88 45 d7             	mov    %al,-0x29(%ebp)
 4e9:	8d 45 d7             	lea    -0x29(%ebp),%eax
 4ec:	6a 01                	push   $0x1
 4ee:	50                   	push   %eax
 4ef:	56                   	push   %esi
 4f0:	e8 a1 fe ff ff       	call   396 <write>
  while(--i >= 0)
 4f5:	89 f8                	mov    %edi,%eax
 4f7:	83 c4 10             	add    $0x10,%esp
 4fa:	83 ef 01             	sub    $0x1,%edi
 4fd:	39 d8                	cmp    %ebx,%eax
 4ff:	75 df                	jne    4e0 <printint+0x80>
}
 501:	8d 65 f4             	lea    -0xc(%ebp),%esp
 504:	5b                   	pop    %ebx
 505:	5e                   	pop    %esi
 506:	5f                   	pop    %edi
 507:	5d                   	pop    %ebp
 508:	c3                   	ret
 509:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 510:	31 c0                	xor    %eax,%eax
 512:	e9 72 ff ff ff       	jmp    489 <printint+0x29>
 517:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 51e:	00 
 51f:	90                   	nop

00000520 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 520:	55                   	push   %ebp
 521:	89 e5                	mov    %esp,%ebp
 523:	57                   	push   %edi
 524:	56                   	push   %esi
 525:	53                   	push   %ebx
 526:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 529:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 52c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 52f:	0f b6 13             	movzbl (%ebx),%edx
 532:	83 c3 01             	add    $0x1,%ebx
 535:	84 d2                	test   %dl,%dl
 537:	0f 84 a0 00 00 00    	je     5dd <printf+0xbd>
 53d:	8d 45 10             	lea    0x10(%ebp),%eax
 540:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    c = fmt[i] & 0xff;
 543:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 546:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 549:	eb 28                	jmp    573 <printf+0x53>
 54b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 550:	83 ec 04             	sub    $0x4,%esp
 553:	8d 45 e7             	lea    -0x19(%ebp),%eax
 556:	88 55 e7             	mov    %dl,-0x19(%ebp)
  for(i = 0; fmt[i]; i++){
 559:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 55c:	6a 01                	push   $0x1
 55e:	50                   	push   %eax
 55f:	56                   	push   %esi
 560:	e8 31 fe ff ff       	call   396 <write>
  for(i = 0; fmt[i]; i++){
 565:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 569:	83 c4 10             	add    $0x10,%esp
 56c:	84 d2                	test   %dl,%dl
 56e:	74 6d                	je     5dd <printf+0xbd>
    c = fmt[i] & 0xff;
 570:	0f b6 c2             	movzbl %dl,%eax
      if(c == '%'){
 573:	83 f8 25             	cmp    $0x25,%eax
 576:	75 d8                	jne    550 <printf+0x30>
  for(i = 0; fmt[i]; i++){
 578:	0f b6 13             	movzbl (%ebx),%edx
 57b:	84 d2                	test   %dl,%dl
 57d:	74 5e                	je     5dd <printf+0xbd>
    c = fmt[i] & 0xff;
 57f:	0f b6 c2             	movzbl %dl,%eax
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
 582:	80 fa 25             	cmp    $0x25,%dl
 585:	0f 84 1d 01 00 00    	je     6a8 <printf+0x188>
 58b:	83 e8 63             	sub    $0x63,%eax
 58e:	83 f8 15             	cmp    $0x15,%eax
 591:	77 0d                	ja     5a0 <printf+0x80>
 593:	ff 24 85 a0 08 00 00 	jmp    *0x8a0(,%eax,4)
 59a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 5a0:	83 ec 04             	sub    $0x4,%esp
 5a3:	8d 4d e7             	lea    -0x19(%ebp),%ecx
 5a6:	88 55 d0             	mov    %dl,-0x30(%ebp)
        ap++;
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 5a9:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
  write(fd, &c, 1);
 5ad:	6a 01                	push   $0x1
 5af:	51                   	push   %ecx
 5b0:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
 5b3:	56                   	push   %esi
 5b4:	e8 dd fd ff ff       	call   396 <write>
        putc(fd, c);
 5b9:	0f b6 55 d0          	movzbl -0x30(%ebp),%edx
  write(fd, &c, 1);
 5bd:	83 c4 0c             	add    $0xc,%esp
 5c0:	88 55 e7             	mov    %dl,-0x19(%ebp)
 5c3:	6a 01                	push   $0x1
 5c5:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
 5c8:	51                   	push   %ecx
 5c9:	56                   	push   %esi
 5ca:	e8 c7 fd ff ff       	call   396 <write>
  for(i = 0; fmt[i]; i++){
 5cf:	0f b6 53 01          	movzbl 0x1(%ebx),%edx
 5d3:	83 c3 02             	add    $0x2,%ebx
 5d6:	83 c4 10             	add    $0x10,%esp
 5d9:	84 d2                	test   %dl,%dl
 5db:	75 93                	jne    570 <printf+0x50>
      }
      state = 0;
    }
  }
}
 5dd:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5e0:	5b                   	pop    %ebx
 5e1:	5e                   	pop    %esi
 5e2:	5f                   	pop    %edi
 5e3:	5d                   	pop    %ebp
 5e4:	c3                   	ret
 5e5:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 5e8:	83 ec 0c             	sub    $0xc,%esp
 5eb:	8b 17                	mov    (%edi),%edx
 5ed:	b9 10 00 00 00       	mov    $0x10,%ecx
 5f2:	89 f0                	mov    %esi,%eax
 5f4:	6a 00                	push   $0x0
        ap++;
 5f6:	83 c7 04             	add    $0x4,%edi
        printint(fd, *ap, 16, 0);
 5f9:	e8 62 fe ff ff       	call   460 <printint>
  for(i = 0; fmt[i]; i++){
 5fe:	eb cf                	jmp    5cf <printf+0xaf>
        s = (char*)*ap;
 600:	8b 07                	mov    (%edi),%eax
        ap++;
 602:	83 c7 04             	add    $0x4,%edi
        if(s == 0)
 605:	85 c0                	test   %eax,%eax
 607:	0f 84 b3 00 00 00    	je     6c0 <printf+0x1a0>
        while(*s != 0){
 60d:	0f b6 10             	movzbl (%eax),%edx
 610:	84 d2                	test   %dl,%dl
 612:	0f 84 ba 00 00 00    	je     6d2 <printf+0x1b2>
 618:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 61b:	89 c7                	mov    %eax,%edi
 61d:	89 d0                	mov    %edx,%eax
 61f:	8d 4d e7             	lea    -0x19(%ebp),%ecx
 622:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 625:	89 fb                	mov    %edi,%ebx
 627:	89 cf                	mov    %ecx,%edi
 629:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 630:	83 ec 04             	sub    $0x4,%esp
 633:	88 45 e7             	mov    %al,-0x19(%ebp)
          s++;
 636:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 639:	6a 01                	push   $0x1
 63b:	57                   	push   %edi
 63c:	56                   	push   %esi
 63d:	e8 54 fd ff ff       	call   396 <write>
        while(*s != 0){
 642:	0f b6 03             	movzbl (%ebx),%eax
 645:	83 c4 10             	add    $0x10,%esp
 648:	84 c0                	test   %al,%al
 64a:	75 e4                	jne    630 <printf+0x110>
 64c:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  for(i = 0; fmt[i]; i++){
 64f:	0f b6 53 01          	movzbl 0x1(%ebx),%edx
 653:	83 c3 02             	add    $0x2,%ebx
 656:	84 d2                	test   %dl,%dl
 658:	0f 85 e5 fe ff ff    	jne    543 <printf+0x23>
 65e:	e9 7a ff ff ff       	jmp    5dd <printf+0xbd>
 663:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 668:	83 ec 0c             	sub    $0xc,%esp
 66b:	8b 17                	mov    (%edi),%edx
 66d:	b9 0a 00 00 00       	mov    $0xa,%ecx
 672:	89 f0                	mov    %esi,%eax
 674:	6a 01                	push   $0x1
        ap++;
 676:	83 c7 04             	add    $0x4,%edi
        printint(fd, *ap, 10, 1);
 679:	e8 e2 fd ff ff       	call   460 <printint>
  for(i = 0; fmt[i]; i++){
 67e:	e9 4c ff ff ff       	jmp    5cf <printf+0xaf>
 683:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 688:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
 68a:	83 ec 04             	sub    $0x4,%esp
 68d:	8d 4d e7             	lea    -0x19(%ebp),%ecx
        ap++;
 690:	83 c7 04             	add    $0x4,%edi
        putc(fd, *ap);
 693:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 696:	6a 01                	push   $0x1
 698:	51                   	push   %ecx
 699:	56                   	push   %esi
 69a:	e8 f7 fc ff ff       	call   396 <write>
  for(i = 0; fmt[i]; i++){
 69f:	e9 2b ff ff ff       	jmp    5cf <printf+0xaf>
 6a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 6a8:	83 ec 04             	sub    $0x4,%esp
 6ab:	88 55 e7             	mov    %dl,-0x19(%ebp)
 6ae:	8d 4d e7             	lea    -0x19(%ebp),%ecx
 6b1:	6a 01                	push   $0x1
 6b3:	e9 10 ff ff ff       	jmp    5c8 <printf+0xa8>
 6b8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 6bf:	00 
          s = "(null)";
 6c0:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 6c3:	b8 28 00 00 00       	mov    $0x28,%eax
 6c8:	bf 91 08 00 00       	mov    $0x891,%edi
 6cd:	e9 4d ff ff ff       	jmp    61f <printf+0xff>
  for(i = 0; fmt[i]; i++){
 6d2:	0f b6 53 01          	movzbl 0x1(%ebx),%edx
 6d6:	83 c3 02             	add    $0x2,%ebx
 6d9:	84 d2                	test   %dl,%dl
 6db:	0f 85 8f fe ff ff    	jne    570 <printf+0x50>
 6e1:	e9 f7 fe ff ff       	jmp    5dd <printf+0xbd>
 6e6:	66 90                	xchg   %ax,%ax
 6e8:	66 90                	xchg   %ax,%ax
 6ea:	66 90                	xchg   %ax,%ax
 6ec:	66 90                	xchg   %ax,%ax
 6ee:	66 90                	xchg   %ax,%ax
 6f0:	66 90                	xchg   %ax,%ax
 6f2:	66 90                	xchg   %ax,%ax
 6f4:	66 90                	xchg   %ax,%ax
 6f6:	66 90                	xchg   %ax,%ax
 6f8:	66 90                	xchg   %ax,%ax
 6fa:	66 90                	xchg   %ax,%ax
 6fc:	66 90                	xchg   %ax,%ax
 6fe:	66 90                	xchg   %ax,%ax

00000700 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 700:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 701:	a1 0c 09 00 00       	mov    0x90c,%eax
{
 706:	89 e5                	mov    %esp,%ebp
 708:	57                   	push   %edi
 709:	56                   	push   %esi
 70a:	53                   	push   %ebx
 70b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 70e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 711:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 718:	00 
 719:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 720:	89 c2                	mov    %eax,%edx
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 722:	8b 00                	mov    (%eax),%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 724:	39 ca                	cmp    %ecx,%edx
 726:	73 30                	jae    758 <free+0x58>
 728:	39 c1                	cmp    %eax,%ecx
 72a:	72 04                	jb     730 <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 72c:	39 c2                	cmp    %eax,%edx
 72e:	72 f0                	jb     720 <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
 730:	8b 73 fc             	mov    -0x4(%ebx),%esi
 733:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 736:	39 f8                	cmp    %edi,%eax
 738:	74 36                	je     770 <free+0x70>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 73a:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 73d:	8b 42 04             	mov    0x4(%edx),%eax
 740:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 743:	39 f1                	cmp    %esi,%ecx
 745:	74 40                	je     787 <free+0x87>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 747:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 749:	5b                   	pop    %ebx
  freep = p;
 74a:	89 15 0c 09 00 00    	mov    %edx,0x90c
}
 750:	5e                   	pop    %esi
 751:	5f                   	pop    %edi
 752:	5d                   	pop    %ebp
 753:	c3                   	ret
 754:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 758:	39 c2                	cmp    %eax,%edx
 75a:	72 c4                	jb     720 <free+0x20>
 75c:	39 c1                	cmp    %eax,%ecx
 75e:	73 c0                	jae    720 <free+0x20>
  if(bp + bp->s.size == p->s.ptr){
 760:	8b 73 fc             	mov    -0x4(%ebx),%esi
 763:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 766:	39 f8                	cmp    %edi,%eax
 768:	75 d0                	jne    73a <free+0x3a>
 76a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    bp->s.size += p->s.ptr->s.size;
 770:	03 70 04             	add    0x4(%eax),%esi
 773:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 776:	8b 02                	mov    (%edx),%eax
 778:	8b 00                	mov    (%eax),%eax
 77a:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 77d:	8b 42 04             	mov    0x4(%edx),%eax
 780:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 783:	39 f1                	cmp    %esi,%ecx
 785:	75 c0                	jne    747 <free+0x47>
    p->s.size += bp->s.size;
 787:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 78a:	89 15 0c 09 00 00    	mov    %edx,0x90c
    p->s.size += bp->s.size;
 790:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 793:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 796:	89 0a                	mov    %ecx,(%edx)
}
 798:	5b                   	pop    %ebx
 799:	5e                   	pop    %esi
 79a:	5f                   	pop    %edi
 79b:	5d                   	pop    %ebp
 79c:	c3                   	ret
 79d:	8d 76 00             	lea    0x0(%esi),%esi

000007a0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 7a0:	55                   	push   %ebp
 7a1:	89 e5                	mov    %esp,%ebp
 7a3:	57                   	push   %edi
 7a4:	56                   	push   %esi
 7a5:	53                   	push   %ebx
 7a6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7a9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 7ac:	8b 15 0c 09 00 00    	mov    0x90c,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7b2:	8d 78 07             	lea    0x7(%eax),%edi
 7b5:	c1 ef 03             	shr    $0x3,%edi
 7b8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 7bb:	85 d2                	test   %edx,%edx
 7bd:	0f 84 8d 00 00 00    	je     850 <malloc+0xb0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7c3:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 7c5:	8b 48 04             	mov    0x4(%eax),%ecx
 7c8:	39 f9                	cmp    %edi,%ecx
 7ca:	73 64                	jae    830 <malloc+0x90>
  if(nu < 4096)
 7cc:	bb 00 10 00 00       	mov    $0x1000,%ebx
 7d1:	39 df                	cmp    %ebx,%edi
 7d3:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 7d6:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 7dd:	eb 0a                	jmp    7e9 <malloc+0x49>
 7df:	90                   	nop
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7e0:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 7e2:	8b 48 04             	mov    0x4(%eax),%ecx
 7e5:	39 f9                	cmp    %edi,%ecx
 7e7:	73 47                	jae    830 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 7e9:	89 c2                	mov    %eax,%edx
 7eb:	39 05 0c 09 00 00    	cmp    %eax,0x90c
 7f1:	75 ed                	jne    7e0 <malloc+0x40>
  p = sbrk(nu * sizeof(Header));
 7f3:	83 ec 0c             	sub    $0xc,%esp
 7f6:	56                   	push   %esi
 7f7:	e8 02 fc ff ff       	call   3fe <sbrk>
  if(p == (char*)-1)
 7fc:	83 c4 10             	add    $0x10,%esp
 7ff:	83 f8 ff             	cmp    $0xffffffff,%eax
 802:	74 1c                	je     820 <malloc+0x80>
  hp->s.size = nu;
 804:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 807:	83 ec 0c             	sub    $0xc,%esp
 80a:	83 c0 08             	add    $0x8,%eax
 80d:	50                   	push   %eax
 80e:	e8 ed fe ff ff       	call   700 <free>
  return freep;
 813:	8b 15 0c 09 00 00    	mov    0x90c,%edx
      if((p = morecore(nunits)) == 0)
 819:	83 c4 10             	add    $0x10,%esp
 81c:	85 d2                	test   %edx,%edx
 81e:	75 c0                	jne    7e0 <malloc+0x40>
        return 0;
  }
}
 820:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 823:	31 c0                	xor    %eax,%eax
}
 825:	5b                   	pop    %ebx
 826:	5e                   	pop    %esi
 827:	5f                   	pop    %edi
 828:	5d                   	pop    %ebp
 829:	c3                   	ret
 82a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 830:	39 cf                	cmp    %ecx,%edi
 832:	74 4c                	je     880 <malloc+0xe0>
        p->s.size -= nunits;
 834:	29 f9                	sub    %edi,%ecx
 836:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 839:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 83c:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 83f:	89 15 0c 09 00 00    	mov    %edx,0x90c
}
 845:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 848:	83 c0 08             	add    $0x8,%eax
}
 84b:	5b                   	pop    %ebx
 84c:	5e                   	pop    %esi
 84d:	5f                   	pop    %edi
 84e:	5d                   	pop    %ebp
 84f:	c3                   	ret
    base.s.ptr = freep = prevp = &base;
 850:	c7 05 0c 09 00 00 10 	movl   $0x910,0x90c
 857:	09 00 00 
    base.s.size = 0;
 85a:	b8 10 09 00 00       	mov    $0x910,%eax
    base.s.ptr = freep = prevp = &base;
 85f:	c7 05 10 09 00 00 10 	movl   $0x910,0x910
 866:	09 00 00 
    base.s.size = 0;
 869:	c7 05 14 09 00 00 00 	movl   $0x0,0x914
 870:	00 00 00 
    if(p->s.size >= nunits){
 873:	e9 54 ff ff ff       	jmp    7cc <malloc+0x2c>
 878:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 87f:	00 
        prevp->s.ptr = p->s.ptr;
 880:	8b 08                	mov    (%eax),%ecx
 882:	89 0a                	mov    %ecx,(%edx)
 884:	eb b9                	jmp    83f <malloc+0x9f>
