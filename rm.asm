
_rm:     file format elf32-i386


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
   e:	bf 01 00 00 00       	mov    $0x1,%edi
  13:	56                   	push   %esi
  14:	53                   	push   %ebx
  15:	51                   	push   %ecx
  16:	83 ec 08             	sub    $0x8,%esp
  19:	8b 59 04             	mov    0x4(%ecx),%ebx
  1c:	8b 31                	mov    (%ecx),%esi
  1e:	83 c3 04             	add    $0x4,%ebx
  int i;

  if(argc < 2){
  21:	83 fe 01             	cmp    $0x1,%esi
  24:	7e 3e                	jle    64 <main+0x64>
  26:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  2d:	8d 76 00             	lea    0x0(%esi),%esi
    printf(2, "Usage: rm files...\n");
    exit();
  }

  for(i = 1; i < argc; i++){
    if(unlink(argv[i]) < 0){
  30:	83 ec 0c             	sub    $0xc,%esp
  33:	ff 33                	push   (%ebx)
  35:	e8 92 03 00 00       	call   3cc <unlink>
  3a:	83 c4 10             	add    $0x10,%esp
  3d:	85 c0                	test   %eax,%eax
  3f:	78 0f                	js     50 <main+0x50>
  for(i = 1; i < argc; i++){
  41:	83 c7 01             	add    $0x1,%edi
  44:	83 c3 04             	add    $0x4,%ebx
  47:	39 fe                	cmp    %edi,%esi
  49:	75 e5                	jne    30 <main+0x30>
      printf(2, "rm: %s failed to delete\n", argv[i]);
      break;
    }
  }

  exit();
  4b:	e8 2c 03 00 00       	call   37c <exit>
      printf(2, "rm: %s failed to delete\n", argv[i]);
  50:	50                   	push   %eax
  51:	ff 33                	push   (%ebx)
  53:	68 3c 08 00 00       	push   $0x83c
  58:	6a 02                	push   $0x2
  5a:	e8 a1 04 00 00       	call   500 <printf>
      break;
  5f:	83 c4 10             	add    $0x10,%esp
  62:	eb e7                	jmp    4b <main+0x4b>
    printf(2, "Usage: rm files...\n");
  64:	52                   	push   %edx
  65:	52                   	push   %edx
  66:	68 28 08 00 00       	push   $0x828
  6b:	6a 02                	push   $0x2
  6d:	e8 8e 04 00 00       	call   500 <printf>
    exit();
  72:	e8 05 03 00 00       	call   37c <exit>
  77:	66 90                	xchg   %ax,%ax
  79:	66 90                	xchg   %ax,%ax
  7b:	66 90                	xchg   %ax,%ax
  7d:	66 90                	xchg   %ax,%ax
  7f:	90                   	nop

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
  a5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

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
  bf:	75 17                	jne    d8 <strcmp+0x28>
  c1:	eb 3a                	jmp    fd <strcmp+0x4d>
  c3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  c7:	90                   	nop
  c8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
  cc:	83 c2 01             	add    $0x1,%edx
  cf:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
  d2:	84 c0                	test   %al,%al
  d4:	74 1a                	je     f0 <strcmp+0x40>
    p++, q++;
  d6:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
  d8:	0f b6 19             	movzbl (%ecx),%ebx
  db:	38 c3                	cmp    %al,%bl
  dd:	74 e9                	je     c8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
  df:	29 d8                	sub    %ebx,%eax
}
  e1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  e4:	c9                   	leave  
  e5:	c3                   	ret    
  e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  ed:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
  f0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
  f4:	31 c0                	xor    %eax,%eax
  f6:	29 d8                	sub    %ebx,%eax
}
  f8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  fb:	c9                   	leave  
  fc:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
  fd:	0f b6 19             	movzbl (%ecx),%ebx
 100:	31 c0                	xor    %eax,%eax
 102:	eb db                	jmp    df <strcmp+0x2f>
 104:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 10b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 10f:	90                   	nop

00000110 <strlen>:

uint
strlen(const char *s)
{
 110:	55                   	push   %ebp
 111:	89 e5                	mov    %esp,%ebp
 113:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 116:	80 3a 00             	cmpb   $0x0,(%edx)
 119:	74 15                	je     130 <strlen+0x20>
 11b:	31 c0                	xor    %eax,%eax
 11d:	8d 76 00             	lea    0x0(%esi),%esi
 120:	83 c0 01             	add    $0x1,%eax
 123:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 127:	89 c1                	mov    %eax,%ecx
 129:	75 f5                	jne    120 <strlen+0x10>
    ;
  return n;
}
 12b:	89 c8                	mov    %ecx,%eax
 12d:	5d                   	pop    %ebp
 12e:	c3                   	ret    
 12f:	90                   	nop
  for(n = 0; s[n]; n++)
 130:	31 c9                	xor    %ecx,%ecx
}
 132:	5d                   	pop    %ebp
 133:	89 c8                	mov    %ecx,%eax
 135:	c3                   	ret    
 136:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 13d:	8d 76 00             	lea    0x0(%esi),%esi

00000140 <memset>:

void*
memset(void *dst, int c, uint n)
{
 140:	55                   	push   %ebp
 141:	89 e5                	mov    %esp,%ebp
 143:	57                   	push   %edi
 144:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 147:	8b 4d 10             	mov    0x10(%ebp),%ecx
 14a:	8b 45 0c             	mov    0xc(%ebp),%eax
 14d:	89 d7                	mov    %edx,%edi
 14f:	fc                   	cld    
 150:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 152:	8b 7d fc             	mov    -0x4(%ebp),%edi
 155:	89 d0                	mov    %edx,%eax
 157:	c9                   	leave  
 158:	c3                   	ret    
 159:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000160 <strchr>:

char*
strchr(const char *s, char c)
{
 160:	55                   	push   %ebp
 161:	89 e5                	mov    %esp,%ebp
 163:	8b 45 08             	mov    0x8(%ebp),%eax
 166:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 16a:	0f b6 10             	movzbl (%eax),%edx
 16d:	84 d2                	test   %dl,%dl
 16f:	75 12                	jne    183 <strchr+0x23>
 171:	eb 1d                	jmp    190 <strchr+0x30>
 173:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 177:	90                   	nop
 178:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 17c:	83 c0 01             	add    $0x1,%eax
 17f:	84 d2                	test   %dl,%dl
 181:	74 0d                	je     190 <strchr+0x30>
    if(*s == c)
 183:	38 d1                	cmp    %dl,%cl
 185:	75 f1                	jne    178 <strchr+0x18>
      return (char*)s;
  return 0;
}
 187:	5d                   	pop    %ebp
 188:	c3                   	ret    
 189:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 190:	31 c0                	xor    %eax,%eax
}
 192:	5d                   	pop    %ebp
 193:	c3                   	ret    
 194:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 19b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 19f:	90                   	nop

000001a0 <gets>:

char*
gets(char *buf, int max)
{
 1a0:	55                   	push   %ebp
 1a1:	89 e5                	mov    %esp,%ebp
 1a3:	57                   	push   %edi
 1a4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 1a5:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 1a8:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 1a9:	31 db                	xor    %ebx,%ebx
{
 1ab:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 1ae:	eb 27                	jmp    1d7 <gets+0x37>
    cc = read(0, &c, 1);
 1b0:	83 ec 04             	sub    $0x4,%esp
 1b3:	6a 01                	push   $0x1
 1b5:	57                   	push   %edi
 1b6:	6a 00                	push   $0x0
 1b8:	e8 d7 01 00 00       	call   394 <read>
    if(cc < 1)
 1bd:	83 c4 10             	add    $0x10,%esp
 1c0:	85 c0                	test   %eax,%eax
 1c2:	7e 1d                	jle    1e1 <gets+0x41>
      break;
    buf[i++] = c;
 1c4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1c8:	8b 55 08             	mov    0x8(%ebp),%edx
 1cb:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 1cf:	3c 0a                	cmp    $0xa,%al
 1d1:	74 1d                	je     1f0 <gets+0x50>
 1d3:	3c 0d                	cmp    $0xd,%al
 1d5:	74 19                	je     1f0 <gets+0x50>
  for(i=0; i+1 < max; ){
 1d7:	89 de                	mov    %ebx,%esi
 1d9:	83 c3 01             	add    $0x1,%ebx
 1dc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1df:	7c cf                	jl     1b0 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 1e1:	8b 45 08             	mov    0x8(%ebp),%eax
 1e4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 1e8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1eb:	5b                   	pop    %ebx
 1ec:	5e                   	pop    %esi
 1ed:	5f                   	pop    %edi
 1ee:	5d                   	pop    %ebp
 1ef:	c3                   	ret    
  buf[i] = '\0';
 1f0:	8b 45 08             	mov    0x8(%ebp),%eax
 1f3:	89 de                	mov    %ebx,%esi
 1f5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 1f9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1fc:	5b                   	pop    %ebx
 1fd:	5e                   	pop    %esi
 1fe:	5f                   	pop    %edi
 1ff:	5d                   	pop    %ebp
 200:	c3                   	ret    
 201:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 208:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 20f:	90                   	nop

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
 21d:	e8 9a 01 00 00       	call   3bc <open>
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
 232:	e8 9d 01 00 00       	call   3d4 <fstat>
  close(fd);
 237:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 23a:	89 c6                	mov    %eax,%esi
  close(fd);
 23c:	e8 63 01 00 00       	call   3a4 <close>
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
 257:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 25e:	66 90                	xchg   %ax,%ax

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
 277:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 27e:	66 90                	xchg   %ax,%ax
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
 2b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2bd:	8d 76 00             	lea    0x0(%esi),%esi
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
 2cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2cf:	90                   	nop

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
 2dd:	0f 88 8d 00 00 00    	js     370 <sqrt+0xa0>
    middle = (start + end) / 2;
 2e3:	89 d8                	mov    %ebx,%eax
 2e5:	d1 f8                	sar    %eax
    if (middle * middle == num) {
 2e7:	89 c2                	mov    %eax,%edx
 2e9:	0f af d0             	imul   %eax,%edx
 2ec:	39 d3                	cmp    %edx,%ebx
 2ee:	74 78                	je     368 <sqrt+0x98>
 2f0:	89 de                	mov    %ebx,%esi
  float solution = 0.0;
 2f2:	d9 ee                	fldz   
  int start = 0;
 2f4:	31 c9                	xor    %ecx,%ecx
 2f6:	eb 25                	jmp    31d <sqrt+0x4d>
 2f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2ff:	90                   	nop
 300:	dd d8                	fstp   %st(0)
      solution = middle;
      break;
    }
    if (middle * middle < num) {
      solution = start;
 302:	89 4d f4             	mov    %ecx,-0xc(%ebp)
      start = middle + 1;
 305:	8d 48 01             	lea    0x1(%eax),%ecx
      solution = start;
 308:	db 45 f4             	fildl  -0xc(%ebp)
  while (start <= end) {
 30b:	39 ce                	cmp    %ecx,%esi
 30d:	7c 19                	jl     328 <sqrt+0x58>
    middle = (start + end) / 2;
 30f:	8d 04 0e             	lea    (%esi,%ecx,1),%eax
 312:	d1 f8                	sar    %eax
    if (middle * middle == num) {
 314:	89 c2                	mov    %eax,%edx
 316:	0f af d0             	imul   %eax,%edx
 319:	39 da                	cmp    %ebx,%edx
 31b:	74 49                	je     366 <sqrt+0x96>
    if (middle * middle < num) {
 31d:	39 d3                	cmp    %edx,%ebx
 31f:	7f df                	jg     300 <sqrt+0x30>
    }
    else {
      end = middle - 1;
 321:	8d 70 ff             	lea    -0x1(%eax),%esi
  while (start <= end) {
 324:	39 ce                	cmp    %ecx,%esi
 326:	7d e7                	jge    30f <sqrt+0x3f>

  float eps = 0.1;
  int i;

  for (i = 0; i < 5; i++) {
    while (solution * solution <= num) {
 328:	89 5d f4             	mov    %ebx,-0xc(%ebp)
 32b:	b8 05 00 00 00       	mov    $0x5,%eax
 330:	db 45 f4             	fildl  -0xc(%ebp)
 333:	d9 05 58 08 00 00    	flds   0x858
 339:	eb 07                	jmp    342 <sqrt+0x72>
 33b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 33f:	90                   	nop
      solution += eps;
 340:	dc c2                	fadd   %st,%st(2)
    while (solution * solution <= num) {
 342:	d9 c2                	fld    %st(2)
 344:	d8 cb                	fmul   %st(3),%st
 346:	d9 ca                	fxch   %st(2)
 348:	db f2                	fcomi  %st(2),%st
 34a:	dd da                	fstp   %st(2)
 34c:	73 f2                	jae    340 <sqrt+0x70>
    }
    solution = solution - eps;
 34e:	dc ea                	fsubr  %st,%st(2)
    eps = eps / 10;
 350:	d8 35 5c 08 00 00    	fdivs  0x85c
  for (i = 0; i < 5; i++) {
 356:	83 e8 01             	sub    $0x1,%eax
 359:	75 e7                	jne    342 <sqrt+0x72>
 35b:	dd d8                	fstp   %st(0)
 35d:	dd d8                	fstp   %st(0)
  }
  return solution;

}
 35f:	83 c4 04             	add    $0x4,%esp
 362:	5b                   	pop    %ebx
 363:	5e                   	pop    %esi
 364:	5d                   	pop    %ebp
 365:	c3                   	ret    
 366:	dd d8                	fstp   %st(0)
      solution = middle;
 368:	89 45 f4             	mov    %eax,-0xc(%ebp)
 36b:	db 45 f4             	fildl  -0xc(%ebp)
      break;
 36e:	eb b8                	jmp    328 <sqrt+0x58>
  float solution = 0.0;
 370:	d9 ee                	fldz   
 372:	eb b4                	jmp    328 <sqrt+0x58>

00000374 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 374:	b8 01 00 00 00       	mov    $0x1,%eax
 379:	cd 40                	int    $0x40
 37b:	c3                   	ret    

0000037c <exit>:
SYSCALL(exit)
 37c:	b8 02 00 00 00       	mov    $0x2,%eax
 381:	cd 40                	int    $0x40
 383:	c3                   	ret    

00000384 <wait>:
SYSCALL(wait)
 384:	b8 03 00 00 00       	mov    $0x3,%eax
 389:	cd 40                	int    $0x40
 38b:	c3                   	ret    

0000038c <pipe>:
SYSCALL(pipe)
 38c:	b8 04 00 00 00       	mov    $0x4,%eax
 391:	cd 40                	int    $0x40
 393:	c3                   	ret    

00000394 <read>:
SYSCALL(read)
 394:	b8 05 00 00 00       	mov    $0x5,%eax
 399:	cd 40                	int    $0x40
 39b:	c3                   	ret    

0000039c <write>:
SYSCALL(write)
 39c:	b8 10 00 00 00       	mov    $0x10,%eax
 3a1:	cd 40                	int    $0x40
 3a3:	c3                   	ret    

000003a4 <close>:
SYSCALL(close)
 3a4:	b8 15 00 00 00       	mov    $0x15,%eax
 3a9:	cd 40                	int    $0x40
 3ab:	c3                   	ret    

000003ac <kill>:
SYSCALL(kill)
 3ac:	b8 06 00 00 00       	mov    $0x6,%eax
 3b1:	cd 40                	int    $0x40
 3b3:	c3                   	ret    

000003b4 <exec>:
SYSCALL(exec)
 3b4:	b8 07 00 00 00       	mov    $0x7,%eax
 3b9:	cd 40                	int    $0x40
 3bb:	c3                   	ret    

000003bc <open>:
SYSCALL(open)
 3bc:	b8 0f 00 00 00       	mov    $0xf,%eax
 3c1:	cd 40                	int    $0x40
 3c3:	c3                   	ret    

000003c4 <mknod>:
SYSCALL(mknod)
 3c4:	b8 11 00 00 00       	mov    $0x11,%eax
 3c9:	cd 40                	int    $0x40
 3cb:	c3                   	ret    

000003cc <unlink>:
SYSCALL(unlink)
 3cc:	b8 12 00 00 00       	mov    $0x12,%eax
 3d1:	cd 40                	int    $0x40
 3d3:	c3                   	ret    

000003d4 <fstat>:
SYSCALL(fstat)
 3d4:	b8 08 00 00 00       	mov    $0x8,%eax
 3d9:	cd 40                	int    $0x40
 3db:	c3                   	ret    

000003dc <link>:
SYSCALL(link)
 3dc:	b8 13 00 00 00       	mov    $0x13,%eax
 3e1:	cd 40                	int    $0x40
 3e3:	c3                   	ret    

000003e4 <mkdir>:
SYSCALL(mkdir)
 3e4:	b8 14 00 00 00       	mov    $0x14,%eax
 3e9:	cd 40                	int    $0x40
 3eb:	c3                   	ret    

000003ec <chdir>:
SYSCALL(chdir)
 3ec:	b8 09 00 00 00       	mov    $0x9,%eax
 3f1:	cd 40                	int    $0x40
 3f3:	c3                   	ret    

000003f4 <dup>:
SYSCALL(dup)
 3f4:	b8 0a 00 00 00       	mov    $0xa,%eax
 3f9:	cd 40                	int    $0x40
 3fb:	c3                   	ret    

000003fc <getpid>:
SYSCALL(getpid)
 3fc:	b8 0b 00 00 00       	mov    $0xb,%eax
 401:	cd 40                	int    $0x40
 403:	c3                   	ret    

00000404 <sbrk>:
SYSCALL(sbrk)
 404:	b8 0c 00 00 00       	mov    $0xc,%eax
 409:	cd 40                	int    $0x40
 40b:	c3                   	ret    

0000040c <sleep>:
SYSCALL(sleep)
 40c:	b8 0d 00 00 00       	mov    $0xd,%eax
 411:	cd 40                	int    $0x40
 413:	c3                   	ret    

00000414 <uptime>:
SYSCALL(uptime)
 414:	b8 0e 00 00 00       	mov    $0xe,%eax
 419:	cd 40                	int    $0x40
 41b:	c3                   	ret    

0000041c <gettid>:
SYSCALL(gettid)
 41c:	b8 16 00 00 00       	mov    $0x16,%eax
 421:	cd 40                	int    $0x40
 423:	c3                   	ret    

00000424 <getpgid>:
SYSCALL(getpgid)
 424:	b8 17 00 00 00       	mov    $0x17,%eax
 429:	cd 40                	int    $0x40
 42b:	c3                   	ret    

0000042c <setpgid>:
SYSCALL(setpgid)
 42c:	b8 18 00 00 00       	mov    $0x18,%eax
 431:	cd 40                	int    $0x40
 433:	c3                   	ret    

00000434 <getppid>:
SYSCALL(getppid)
 434:	b8 19 00 00 00       	mov    $0x19,%eax
 439:	cd 40                	int    $0x40
 43b:	c3                   	ret    

0000043c <uptime_ms>:
SYSCALL(uptime_ms)
 43c:	b8 1a 00 00 00       	mov    $0x1a,%eax
 441:	cd 40                	int    $0x40
 443:	c3                   	ret    
 444:	66 90                	xchg   %ax,%ax
 446:	66 90                	xchg   %ax,%ax
 448:	66 90                	xchg   %ax,%ax
 44a:	66 90                	xchg   %ax,%ax
 44c:	66 90                	xchg   %ax,%ax
 44e:	66 90                	xchg   %ax,%ax

00000450 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 450:	55                   	push   %ebp
 451:	89 e5                	mov    %esp,%ebp
 453:	57                   	push   %edi
 454:	56                   	push   %esi
 455:	53                   	push   %ebx
 456:	83 ec 3c             	sub    $0x3c,%esp
 459:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 45c:	89 d1                	mov    %edx,%ecx
{
 45e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 461:	85 d2                	test   %edx,%edx
 463:	0f 89 7f 00 00 00    	jns    4e8 <printint+0x98>
 469:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 46d:	74 79                	je     4e8 <printint+0x98>
    neg = 1;
 46f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 476:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 478:	31 db                	xor    %ebx,%ebx
 47a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 47d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 480:	89 c8                	mov    %ecx,%eax
 482:	31 d2                	xor    %edx,%edx
 484:	89 cf                	mov    %ecx,%edi
 486:	f7 75 c4             	divl   -0x3c(%ebp)
 489:	0f b6 92 c0 08 00 00 	movzbl 0x8c0(%edx),%edx
 490:	89 45 c0             	mov    %eax,-0x40(%ebp)
 493:	89 d8                	mov    %ebx,%eax
 495:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 498:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 49b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 49e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 4a1:	76 dd                	jbe    480 <printint+0x30>
  if(neg)
 4a3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 4a6:	85 c9                	test   %ecx,%ecx
 4a8:	74 0c                	je     4b6 <printint+0x66>
    buf[i++] = '-';
 4aa:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 4af:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 4b1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 4b6:	8b 7d b8             	mov    -0x48(%ebp),%edi
 4b9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 4bd:	eb 07                	jmp    4c6 <printint+0x76>
 4bf:	90                   	nop
    putc(fd, buf[i]);
 4c0:	0f b6 13             	movzbl (%ebx),%edx
 4c3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 4c6:	83 ec 04             	sub    $0x4,%esp
 4c9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 4cc:	6a 01                	push   $0x1
 4ce:	56                   	push   %esi
 4cf:	57                   	push   %edi
 4d0:	e8 c7 fe ff ff       	call   39c <write>
  while(--i >= 0)
 4d5:	83 c4 10             	add    $0x10,%esp
 4d8:	39 de                	cmp    %ebx,%esi
 4da:	75 e4                	jne    4c0 <printint+0x70>
}
 4dc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4df:	5b                   	pop    %ebx
 4e0:	5e                   	pop    %esi
 4e1:	5f                   	pop    %edi
 4e2:	5d                   	pop    %ebp
 4e3:	c3                   	ret    
 4e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 4e8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 4ef:	eb 87                	jmp    478 <printint+0x28>
 4f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
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
 512:	84 d2                	test   %dl,%dl
 514:	74 6a                	je     580 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 516:	8d 45 10             	lea    0x10(%ebp),%eax
 519:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 51c:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 51f:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 521:	89 45 d0             	mov    %eax,-0x30(%ebp)
 524:	eb 36                	jmp    55c <printf+0x5c>
 526:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 52d:	8d 76 00             	lea    0x0(%esi),%esi
 530:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 533:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 538:	83 f8 25             	cmp    $0x25,%eax
 53b:	74 15                	je     552 <printf+0x52>
  write(fd, &c, 1);
 53d:	83 ec 04             	sub    $0x4,%esp
 540:	88 55 e7             	mov    %dl,-0x19(%ebp)
 543:	6a 01                	push   $0x1
 545:	57                   	push   %edi
 546:	56                   	push   %esi
 547:	e8 50 fe ff ff       	call   39c <write>
 54c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 54f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 552:	0f b6 13             	movzbl (%ebx),%edx
 555:	83 c3 01             	add    $0x1,%ebx
 558:	84 d2                	test   %dl,%dl
 55a:	74 24                	je     580 <printf+0x80>
    c = fmt[i] & 0xff;
 55c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 55f:	85 c9                	test   %ecx,%ecx
 561:	74 cd                	je     530 <printf+0x30>
      }
    } else if(state == '%'){
 563:	83 f9 25             	cmp    $0x25,%ecx
 566:	75 ea                	jne    552 <printf+0x52>
      if(c == 'd'){
 568:	83 f8 25             	cmp    $0x25,%eax
 56b:	0f 84 07 01 00 00    	je     678 <printf+0x178>
 571:	83 e8 63             	sub    $0x63,%eax
 574:	83 f8 15             	cmp    $0x15,%eax
 577:	77 17                	ja     590 <printf+0x90>
 579:	ff 24 85 68 08 00 00 	jmp    *0x868(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 580:	8d 65 f4             	lea    -0xc(%ebp),%esp
 583:	5b                   	pop    %ebx
 584:	5e                   	pop    %esi
 585:	5f                   	pop    %edi
 586:	5d                   	pop    %ebp
 587:	c3                   	ret    
 588:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 58f:	90                   	nop
  write(fd, &c, 1);
 590:	83 ec 04             	sub    $0x4,%esp
 593:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 596:	6a 01                	push   $0x1
 598:	57                   	push   %edi
 599:	56                   	push   %esi
 59a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 59e:	e8 f9 fd ff ff       	call   39c <write>
        putc(fd, c);
 5a3:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 5a7:	83 c4 0c             	add    $0xc,%esp
 5aa:	88 55 e7             	mov    %dl,-0x19(%ebp)
 5ad:	6a 01                	push   $0x1
 5af:	57                   	push   %edi
 5b0:	56                   	push   %esi
 5b1:	e8 e6 fd ff ff       	call   39c <write>
        putc(fd, c);
 5b6:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5b9:	31 c9                	xor    %ecx,%ecx
 5bb:	eb 95                	jmp    552 <printf+0x52>
 5bd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 5c0:	83 ec 0c             	sub    $0xc,%esp
 5c3:	b9 10 00 00 00       	mov    $0x10,%ecx
 5c8:	6a 00                	push   $0x0
 5ca:	8b 45 d0             	mov    -0x30(%ebp),%eax
 5cd:	8b 10                	mov    (%eax),%edx
 5cf:	89 f0                	mov    %esi,%eax
 5d1:	e8 7a fe ff ff       	call   450 <printint>
        ap++;
 5d6:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 5da:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5dd:	31 c9                	xor    %ecx,%ecx
 5df:	e9 6e ff ff ff       	jmp    552 <printf+0x52>
 5e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 5e8:	8b 45 d0             	mov    -0x30(%ebp),%eax
 5eb:	8b 10                	mov    (%eax),%edx
        ap++;
 5ed:	83 c0 04             	add    $0x4,%eax
 5f0:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 5f3:	85 d2                	test   %edx,%edx
 5f5:	0f 84 8d 00 00 00    	je     688 <printf+0x188>
        while(*s != 0){
 5fb:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 5fe:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 600:	84 c0                	test   %al,%al
 602:	0f 84 4a ff ff ff    	je     552 <printf+0x52>
 608:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 60b:	89 d3                	mov    %edx,%ebx
 60d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 610:	83 ec 04             	sub    $0x4,%esp
          s++;
 613:	83 c3 01             	add    $0x1,%ebx
 616:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 619:	6a 01                	push   $0x1
 61b:	57                   	push   %edi
 61c:	56                   	push   %esi
 61d:	e8 7a fd ff ff       	call   39c <write>
        while(*s != 0){
 622:	0f b6 03             	movzbl (%ebx),%eax
 625:	83 c4 10             	add    $0x10,%esp
 628:	84 c0                	test   %al,%al
 62a:	75 e4                	jne    610 <printf+0x110>
      state = 0;
 62c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 62f:	31 c9                	xor    %ecx,%ecx
 631:	e9 1c ff ff ff       	jmp    552 <printf+0x52>
 636:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 63d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 640:	83 ec 0c             	sub    $0xc,%esp
 643:	b9 0a 00 00 00       	mov    $0xa,%ecx
 648:	6a 01                	push   $0x1
 64a:	e9 7b ff ff ff       	jmp    5ca <printf+0xca>
 64f:	90                   	nop
        putc(fd, *ap);
 650:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 653:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 656:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 658:	6a 01                	push   $0x1
 65a:	57                   	push   %edi
 65b:	56                   	push   %esi
        putc(fd, *ap);
 65c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 65f:	e8 38 fd ff ff       	call   39c <write>
        ap++;
 664:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 668:	83 c4 10             	add    $0x10,%esp
      state = 0;
 66b:	31 c9                	xor    %ecx,%ecx
 66d:	e9 e0 fe ff ff       	jmp    552 <printf+0x52>
 672:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 678:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 67b:	83 ec 04             	sub    $0x4,%esp
 67e:	e9 2a ff ff ff       	jmp    5ad <printf+0xad>
 683:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 687:	90                   	nop
          s = "(null)";
 688:	ba 60 08 00 00       	mov    $0x860,%edx
        while(*s != 0){
 68d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 690:	b8 28 00 00 00       	mov    $0x28,%eax
 695:	89 d3                	mov    %edx,%ebx
 697:	e9 74 ff ff ff       	jmp    610 <printf+0x110>
 69c:	66 90                	xchg   %ax,%ax
 69e:	66 90                	xchg   %ax,%ax

000006a0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6a0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6a1:	a1 a4 0b 00 00       	mov    0xba4,%eax
{
 6a6:	89 e5                	mov    %esp,%ebp
 6a8:	57                   	push   %edi
 6a9:	56                   	push   %esi
 6aa:	53                   	push   %ebx
 6ab:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 6ae:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6b8:	89 c2                	mov    %eax,%edx
 6ba:	8b 00                	mov    (%eax),%eax
 6bc:	39 ca                	cmp    %ecx,%edx
 6be:	73 30                	jae    6f0 <free+0x50>
 6c0:	39 c1                	cmp    %eax,%ecx
 6c2:	72 04                	jb     6c8 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6c4:	39 c2                	cmp    %eax,%edx
 6c6:	72 f0                	jb     6b8 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 6c8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 6cb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 6ce:	39 f8                	cmp    %edi,%eax
 6d0:	74 30                	je     702 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 6d2:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 6d5:	8b 42 04             	mov    0x4(%edx),%eax
 6d8:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 6db:	39 f1                	cmp    %esi,%ecx
 6dd:	74 3a                	je     719 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 6df:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 6e1:	5b                   	pop    %ebx
  freep = p;
 6e2:	89 15 a4 0b 00 00    	mov    %edx,0xba4
}
 6e8:	5e                   	pop    %esi
 6e9:	5f                   	pop    %edi
 6ea:	5d                   	pop    %ebp
 6eb:	c3                   	ret    
 6ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6f0:	39 c2                	cmp    %eax,%edx
 6f2:	72 c4                	jb     6b8 <free+0x18>
 6f4:	39 c1                	cmp    %eax,%ecx
 6f6:	73 c0                	jae    6b8 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 6f8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 6fb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 6fe:	39 f8                	cmp    %edi,%eax
 700:	75 d0                	jne    6d2 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 702:	03 70 04             	add    0x4(%eax),%esi
 705:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 708:	8b 02                	mov    (%edx),%eax
 70a:	8b 00                	mov    (%eax),%eax
 70c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 70f:	8b 42 04             	mov    0x4(%edx),%eax
 712:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 715:	39 f1                	cmp    %esi,%ecx
 717:	75 c6                	jne    6df <free+0x3f>
    p->s.size += bp->s.size;
 719:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 71c:	89 15 a4 0b 00 00    	mov    %edx,0xba4
    p->s.size += bp->s.size;
 722:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 725:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 728:	89 0a                	mov    %ecx,(%edx)
}
 72a:	5b                   	pop    %ebx
 72b:	5e                   	pop    %esi
 72c:	5f                   	pop    %edi
 72d:	5d                   	pop    %ebp
 72e:	c3                   	ret    
 72f:	90                   	nop

00000730 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 730:	55                   	push   %ebp
 731:	89 e5                	mov    %esp,%ebp
 733:	57                   	push   %edi
 734:	56                   	push   %esi
 735:	53                   	push   %ebx
 736:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 739:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 73c:	8b 3d a4 0b 00 00    	mov    0xba4,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 742:	8d 70 07             	lea    0x7(%eax),%esi
 745:	c1 ee 03             	shr    $0x3,%esi
 748:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 74b:	85 ff                	test   %edi,%edi
 74d:	0f 84 9d 00 00 00    	je     7f0 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 753:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 755:	8b 4a 04             	mov    0x4(%edx),%ecx
 758:	39 f1                	cmp    %esi,%ecx
 75a:	73 6a                	jae    7c6 <malloc+0x96>
 75c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 761:	39 de                	cmp    %ebx,%esi
 763:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 766:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 76d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 770:	eb 17                	jmp    789 <malloc+0x59>
 772:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 778:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 77a:	8b 48 04             	mov    0x4(%eax),%ecx
 77d:	39 f1                	cmp    %esi,%ecx
 77f:	73 4f                	jae    7d0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 781:	8b 3d a4 0b 00 00    	mov    0xba4,%edi
 787:	89 c2                	mov    %eax,%edx
 789:	39 d7                	cmp    %edx,%edi
 78b:	75 eb                	jne    778 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 78d:	83 ec 0c             	sub    $0xc,%esp
 790:	ff 75 e4             	push   -0x1c(%ebp)
 793:	e8 6c fc ff ff       	call   404 <sbrk>
  if(p == (char*)-1)
 798:	83 c4 10             	add    $0x10,%esp
 79b:	83 f8 ff             	cmp    $0xffffffff,%eax
 79e:	74 1c                	je     7bc <malloc+0x8c>
  hp->s.size = nu;
 7a0:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 7a3:	83 ec 0c             	sub    $0xc,%esp
 7a6:	83 c0 08             	add    $0x8,%eax
 7a9:	50                   	push   %eax
 7aa:	e8 f1 fe ff ff       	call   6a0 <free>
  return freep;
 7af:	8b 15 a4 0b 00 00    	mov    0xba4,%edx
      if((p = morecore(nunits)) == 0)
 7b5:	83 c4 10             	add    $0x10,%esp
 7b8:	85 d2                	test   %edx,%edx
 7ba:	75 bc                	jne    778 <malloc+0x48>
        return 0;
  }
}
 7bc:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 7bf:	31 c0                	xor    %eax,%eax
}
 7c1:	5b                   	pop    %ebx
 7c2:	5e                   	pop    %esi
 7c3:	5f                   	pop    %edi
 7c4:	5d                   	pop    %ebp
 7c5:	c3                   	ret    
    if(p->s.size >= nunits){
 7c6:	89 d0                	mov    %edx,%eax
 7c8:	89 fa                	mov    %edi,%edx
 7ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 7d0:	39 ce                	cmp    %ecx,%esi
 7d2:	74 4c                	je     820 <malloc+0xf0>
        p->s.size -= nunits;
 7d4:	29 f1                	sub    %esi,%ecx
 7d6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 7d9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 7dc:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 7df:	89 15 a4 0b 00 00    	mov    %edx,0xba4
}
 7e5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 7e8:	83 c0 08             	add    $0x8,%eax
}
 7eb:	5b                   	pop    %ebx
 7ec:	5e                   	pop    %esi
 7ed:	5f                   	pop    %edi
 7ee:	5d                   	pop    %ebp
 7ef:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 7f0:	c7 05 a4 0b 00 00 a8 	movl   $0xba8,0xba4
 7f7:	0b 00 00 
    base.s.size = 0;
 7fa:	bf a8 0b 00 00       	mov    $0xba8,%edi
    base.s.ptr = freep = prevp = &base;
 7ff:	c7 05 a8 0b 00 00 a8 	movl   $0xba8,0xba8
 806:	0b 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 809:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 80b:	c7 05 ac 0b 00 00 00 	movl   $0x0,0xbac
 812:	00 00 00 
    if(p->s.size >= nunits){
 815:	e9 42 ff ff ff       	jmp    75c <malloc+0x2c>
 81a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 820:	8b 08                	mov    (%eax),%ecx
 822:	89 0a                	mov    %ecx,(%edx)
 824:	eb b9                	jmp    7df <malloc+0xaf>
