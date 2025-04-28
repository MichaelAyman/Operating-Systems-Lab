
_bubblesort:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
        }
    }

}

int main(int argc, char *argv[]) {
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
  14:	8b 51 04             	mov    0x4(%ecx),%edx
  17:	8b 01                	mov    (%ecx),%eax
  19:	89 55 e4             	mov    %edx,-0x1c(%ebp)
    if (argc == 1) {
  1c:	83 f8 01             	cmp    $0x1,%eax
  1f:	0f 84 ab 00 00 00    	je     d0 <main+0xd0>
        printf(2, "Incorrect format. Try: bubblesort x y z\n");
        exit();
    }

    // turning arg into array to process
    int arr[argc-1];
  25:	8d 58 ff             	lea    -0x1(%eax),%ebx
  28:	8d 04 85 0b 00 00 00 	lea    0xb(,%eax,4),%eax
  2f:	89 e1                	mov    %esp,%ecx
  31:	89 c2                	mov    %eax,%edx
  33:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  38:	83 e2 f0             	and    $0xfffffff0,%edx
  3b:	29 c1                	sub    %eax,%ecx
  3d:	39 cc                	cmp    %ecx,%esp
  3f:	74 10                	je     51 <main+0x51>
  41:	81 ec 00 10 00 00    	sub    $0x1000,%esp
  47:	83 8c 24 fc 0f 00 00 	orl    $0x0,0xffc(%esp)
  4e:	00 
  4f:	eb ec                	jmp    3d <main+0x3d>
  51:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
  57:	29 d4                	sub    %edx,%esp
  59:	85 d2                	test   %edx,%edx
  5b:	0f 85 82 00 00 00    	jne    e3 <main+0xe3>
  61:	89 e6                	mov    %esp,%esi

    for (int i = 0; i < argc-1; i++) {
  63:	85 db                	test   %ebx,%ebx
  65:	0f 8e 82 00 00 00    	jle    ed <main+0xed>
  6b:	31 ff                	xor    %edi,%edi
  6d:	8d 76 00             	lea    0x0(%esi),%esi
        arr[i] = atoi(argv[i+1]);
  70:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  73:	83 ec 0c             	sub    $0xc,%esp
  76:	ff 74 b8 04          	push   0x4(%eax,%edi,4)
  7a:	e8 d1 02 00 00       	call   350 <atoi>
    for (int i = 0; i < argc-1; i++) {
  7f:	83 c4 10             	add    $0x10,%esp
        arr[i] = atoi(argv[i+1]);
  82:	89 04 be             	mov    %eax,(%esi,%edi,4)
    for (int i = 0; i < argc-1; i++) {
  85:	83 c7 01             	add    $0x1,%edi
  88:	39 fb                	cmp    %edi,%ebx
  8a:	75 e4                	jne    70 <main+0x70>
    }

    bubble(arr, argc-1);
  8c:	83 ec 08             	sub    $0x8,%esp
  8f:	31 ff                	xor    %edi,%edi
  91:	53                   	push   %ebx
  92:	56                   	push   %esi
  93:	e8 68 00 00 00       	call   100 <bubble>
  98:	83 c4 10             	add    $0x10,%esp
  9b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  9f:	90                   	nop
    
    // print everything out
    for (int i = 0; i < argc-1; i++) {
        printf(1, "%d ", arr[i]);
  a0:	83 ec 04             	sub    $0x4,%esp
  a3:	ff 34 be             	push   (%esi,%edi,4)
    for (int i = 0; i < argc-1; i++) {
  a6:	83 c7 01             	add    $0x1,%edi
        printf(1, "%d ", arr[i]);
  a9:	68 51 09 00 00       	push   $0x951
  ae:	6a 01                	push   $0x1
  b0:	e8 4b 05 00 00       	call   600 <printf>
    for (int i = 0; i < argc-1; i++) {
  b5:	83 c4 10             	add    $0x10,%esp
  b8:	39 fb                	cmp    %edi,%ebx
  ba:	75 e4                	jne    a0 <main+0xa0>
    }
    printf(1,"\n");
  bc:	83 ec 08             	sub    $0x8,%esp
  bf:	68 55 09 00 00       	push   $0x955
  c4:	6a 01                	push   $0x1
  c6:	e8 35 05 00 00       	call   600 <printf>
    exit();
  cb:	e8 9c 03 00 00       	call   46c <exit>
        printf(2, "Incorrect format. Try: bubblesort x y z\n");
  d0:	52                   	push   %edx
  d1:	52                   	push   %edx
  d2:	68 28 09 00 00       	push   $0x928
  d7:	6a 02                	push   $0x2
  d9:	e8 22 05 00 00       	call   600 <printf>
        exit();
  de:	e8 89 03 00 00       	call   46c <exit>
    int arr[argc-1];
  e3:	83 4c 14 fc 00       	orl    $0x0,-0x4(%esp,%edx,1)
  e8:	e9 74 ff ff ff       	jmp    61 <main+0x61>
    bubble(arr, argc-1);
  ed:	50                   	push   %eax
  ee:	50                   	push   %eax
  ef:	53                   	push   %ebx
  f0:	56                   	push   %esi
  f1:	e8 0a 00 00 00       	call   100 <bubble>
  f6:	83 c4 10             	add    $0x10,%esp
  f9:	eb c1                	jmp    bc <main+0xbc>
  fb:	66 90                	xchg   %ax,%ax
  fd:	66 90                	xchg   %ax,%ax
  ff:	90                   	nop

00000100 <bubble>:
void bubble(int *arr, int n) {
 100:	55                   	push   %ebp
 101:	89 e5                	mov    %esp,%ebp
 103:	57                   	push   %edi
 104:	56                   	push   %esi
 105:	53                   	push   %ebx
 106:	83 ec 04             	sub    $0x4,%esp
    for (int i = 0; i < n; i++) {
 109:	8b 45 0c             	mov    0xc(%ebp),%eax
 10c:	85 c0                	test   %eax,%eax
 10e:	7e 51                	jle    161 <bubble+0x61>
 110:	8b 7d 0c             	mov    0xc(%ebp),%edi
 113:	8b 45 08             	mov    0x8(%ebp),%eax
 116:	8d 5c b8 fc          	lea    -0x4(%eax,%edi,4),%ebx
 11a:	89 f8                	mov    %edi,%eax
 11c:	31 ff                	xor    %edi,%edi
 11e:	83 e8 01             	sub    $0x1,%eax
 121:	89 45 f0             	mov    %eax,-0x10(%ebp)
 124:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        for (int j = 0; j < (n-i-1); j++) {
 128:	3b 7d f0             	cmp    -0x10(%ebp),%edi
 12b:	74 34                	je     161 <bubble+0x61>
 12d:	8b 45 08             	mov    0x8(%ebp),%eax
        swap = 0;
 130:	31 f6                	xor    %esi,%esi
 132:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
            if (arr[j] > arr[j+1]) {
 138:	8b 10                	mov    (%eax),%edx
 13a:	8b 48 04             	mov    0x4(%eax),%ecx
 13d:	39 ca                	cmp    %ecx,%edx
 13f:	7e 0a                	jle    14b <bubble+0x4b>
                arr[j] = arr[j+1];
 141:	89 08                	mov    %ecx,(%eax)
                swap = 1;
 143:	be 01 00 00 00       	mov    $0x1,%esi
                arr[j+1] = temp;
 148:	89 50 04             	mov    %edx,0x4(%eax)
        for (int j = 0; j < (n-i-1); j++) {
 14b:	83 c0 04             	add    $0x4,%eax
 14e:	39 c3                	cmp    %eax,%ebx
 150:	75 e6                	jne    138 <bubble+0x38>
        if (swap == 0) {
 152:	85 f6                	test   %esi,%esi
 154:	74 0b                	je     161 <bubble+0x61>
    for (int i = 0; i < n; i++) {
 156:	83 c7 01             	add    $0x1,%edi
 159:	83 eb 04             	sub    $0x4,%ebx
 15c:	39 7d 0c             	cmp    %edi,0xc(%ebp)
 15f:	75 c7                	jne    128 <bubble+0x28>
}
 161:	83 c4 04             	add    $0x4,%esp
 164:	5b                   	pop    %ebx
 165:	5e                   	pop    %esi
 166:	5f                   	pop    %edi
 167:	5d                   	pop    %ebp
 168:	c3                   	ret    
 169:	66 90                	xchg   %ax,%ax
 16b:	66 90                	xchg   %ax,%ax
 16d:	66 90                	xchg   %ax,%ax
 16f:	90                   	nop

00000170 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 170:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 171:	31 c0                	xor    %eax,%eax
{
 173:	89 e5                	mov    %esp,%ebp
 175:	53                   	push   %ebx
 176:	8b 4d 08             	mov    0x8(%ebp),%ecx
 179:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 17c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 180:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 184:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 187:	83 c0 01             	add    $0x1,%eax
 18a:	84 d2                	test   %dl,%dl
 18c:	75 f2                	jne    180 <strcpy+0x10>
    ;
  return os;
}
 18e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 191:	89 c8                	mov    %ecx,%eax
 193:	c9                   	leave  
 194:	c3                   	ret    
 195:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 19c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000001a0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1a0:	55                   	push   %ebp
 1a1:	89 e5                	mov    %esp,%ebp
 1a3:	53                   	push   %ebx
 1a4:	8b 55 08             	mov    0x8(%ebp),%edx
 1a7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 1aa:	0f b6 02             	movzbl (%edx),%eax
 1ad:	84 c0                	test   %al,%al
 1af:	75 17                	jne    1c8 <strcmp+0x28>
 1b1:	eb 3a                	jmp    1ed <strcmp+0x4d>
 1b3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1b7:	90                   	nop
 1b8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 1bc:	83 c2 01             	add    $0x1,%edx
 1bf:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 1c2:	84 c0                	test   %al,%al
 1c4:	74 1a                	je     1e0 <strcmp+0x40>
    p++, q++;
 1c6:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 1c8:	0f b6 19             	movzbl (%ecx),%ebx
 1cb:	38 c3                	cmp    %al,%bl
 1cd:	74 e9                	je     1b8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 1cf:	29 d8                	sub    %ebx,%eax
}
 1d1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1d4:	c9                   	leave  
 1d5:	c3                   	ret    
 1d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1dd:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 1e0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 1e4:	31 c0                	xor    %eax,%eax
 1e6:	29 d8                	sub    %ebx,%eax
}
 1e8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1eb:	c9                   	leave  
 1ec:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 1ed:	0f b6 19             	movzbl (%ecx),%ebx
 1f0:	31 c0                	xor    %eax,%eax
 1f2:	eb db                	jmp    1cf <strcmp+0x2f>
 1f4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1fb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1ff:	90                   	nop

00000200 <strlen>:

uint
strlen(const char *s)
{
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
 203:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 206:	80 3a 00             	cmpb   $0x0,(%edx)
 209:	74 15                	je     220 <strlen+0x20>
 20b:	31 c0                	xor    %eax,%eax
 20d:	8d 76 00             	lea    0x0(%esi),%esi
 210:	83 c0 01             	add    $0x1,%eax
 213:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 217:	89 c1                	mov    %eax,%ecx
 219:	75 f5                	jne    210 <strlen+0x10>
    ;
  return n;
}
 21b:	89 c8                	mov    %ecx,%eax
 21d:	5d                   	pop    %ebp
 21e:	c3                   	ret    
 21f:	90                   	nop
  for(n = 0; s[n]; n++)
 220:	31 c9                	xor    %ecx,%ecx
}
 222:	5d                   	pop    %ebp
 223:	89 c8                	mov    %ecx,%eax
 225:	c3                   	ret    
 226:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 22d:	8d 76 00             	lea    0x0(%esi),%esi

00000230 <memset>:

void*
memset(void *dst, int c, uint n)
{
 230:	55                   	push   %ebp
 231:	89 e5                	mov    %esp,%ebp
 233:	57                   	push   %edi
 234:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 237:	8b 4d 10             	mov    0x10(%ebp),%ecx
 23a:	8b 45 0c             	mov    0xc(%ebp),%eax
 23d:	89 d7                	mov    %edx,%edi
 23f:	fc                   	cld    
 240:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 242:	8b 7d fc             	mov    -0x4(%ebp),%edi
 245:	89 d0                	mov    %edx,%eax
 247:	c9                   	leave  
 248:	c3                   	ret    
 249:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000250 <strchr>:

char*
strchr(const char *s, char c)
{
 250:	55                   	push   %ebp
 251:	89 e5                	mov    %esp,%ebp
 253:	8b 45 08             	mov    0x8(%ebp),%eax
 256:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 25a:	0f b6 10             	movzbl (%eax),%edx
 25d:	84 d2                	test   %dl,%dl
 25f:	75 12                	jne    273 <strchr+0x23>
 261:	eb 1d                	jmp    280 <strchr+0x30>
 263:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 267:	90                   	nop
 268:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 26c:	83 c0 01             	add    $0x1,%eax
 26f:	84 d2                	test   %dl,%dl
 271:	74 0d                	je     280 <strchr+0x30>
    if(*s == c)
 273:	38 d1                	cmp    %dl,%cl
 275:	75 f1                	jne    268 <strchr+0x18>
      return (char*)s;
  return 0;
}
 277:	5d                   	pop    %ebp
 278:	c3                   	ret    
 279:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 280:	31 c0                	xor    %eax,%eax
}
 282:	5d                   	pop    %ebp
 283:	c3                   	ret    
 284:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 28b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 28f:	90                   	nop

00000290 <gets>:

char*
gets(char *buf, int max)
{
 290:	55                   	push   %ebp
 291:	89 e5                	mov    %esp,%ebp
 293:	57                   	push   %edi
 294:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 295:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 298:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 299:	31 db                	xor    %ebx,%ebx
{
 29b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 29e:	eb 27                	jmp    2c7 <gets+0x37>
    cc = read(0, &c, 1);
 2a0:	83 ec 04             	sub    $0x4,%esp
 2a3:	6a 01                	push   $0x1
 2a5:	57                   	push   %edi
 2a6:	6a 00                	push   $0x0
 2a8:	e8 d7 01 00 00       	call   484 <read>
    if(cc < 1)
 2ad:	83 c4 10             	add    $0x10,%esp
 2b0:	85 c0                	test   %eax,%eax
 2b2:	7e 1d                	jle    2d1 <gets+0x41>
      break;
    buf[i++] = c;
 2b4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 2b8:	8b 55 08             	mov    0x8(%ebp),%edx
 2bb:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 2bf:	3c 0a                	cmp    $0xa,%al
 2c1:	74 1d                	je     2e0 <gets+0x50>
 2c3:	3c 0d                	cmp    $0xd,%al
 2c5:	74 19                	je     2e0 <gets+0x50>
  for(i=0; i+1 < max; ){
 2c7:	89 de                	mov    %ebx,%esi
 2c9:	83 c3 01             	add    $0x1,%ebx
 2cc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 2cf:	7c cf                	jl     2a0 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 2d1:	8b 45 08             	mov    0x8(%ebp),%eax
 2d4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 2d8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2db:	5b                   	pop    %ebx
 2dc:	5e                   	pop    %esi
 2dd:	5f                   	pop    %edi
 2de:	5d                   	pop    %ebp
 2df:	c3                   	ret    
  buf[i] = '\0';
 2e0:	8b 45 08             	mov    0x8(%ebp),%eax
 2e3:	89 de                	mov    %ebx,%esi
 2e5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 2e9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2ec:	5b                   	pop    %ebx
 2ed:	5e                   	pop    %esi
 2ee:	5f                   	pop    %edi
 2ef:	5d                   	pop    %ebp
 2f0:	c3                   	ret    
 2f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2ff:	90                   	nop

00000300 <stat>:

int
stat(const char *n, struct stat *st)
{
 300:	55                   	push   %ebp
 301:	89 e5                	mov    %esp,%ebp
 303:	56                   	push   %esi
 304:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 305:	83 ec 08             	sub    $0x8,%esp
 308:	6a 00                	push   $0x0
 30a:	ff 75 08             	push   0x8(%ebp)
 30d:	e8 9a 01 00 00       	call   4ac <open>
  if(fd < 0)
 312:	83 c4 10             	add    $0x10,%esp
 315:	85 c0                	test   %eax,%eax
 317:	78 27                	js     340 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 319:	83 ec 08             	sub    $0x8,%esp
 31c:	ff 75 0c             	push   0xc(%ebp)
 31f:	89 c3                	mov    %eax,%ebx
 321:	50                   	push   %eax
 322:	e8 9d 01 00 00       	call   4c4 <fstat>
  close(fd);
 327:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 32a:	89 c6                	mov    %eax,%esi
  close(fd);
 32c:	e8 63 01 00 00       	call   494 <close>
  return r;
 331:	83 c4 10             	add    $0x10,%esp
}
 334:	8d 65 f8             	lea    -0x8(%ebp),%esp
 337:	89 f0                	mov    %esi,%eax
 339:	5b                   	pop    %ebx
 33a:	5e                   	pop    %esi
 33b:	5d                   	pop    %ebp
 33c:	c3                   	ret    
 33d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 340:	be ff ff ff ff       	mov    $0xffffffff,%esi
 345:	eb ed                	jmp    334 <stat+0x34>
 347:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 34e:	66 90                	xchg   %ax,%ax

00000350 <atoi>:

int
atoi(const char *s)
{
 350:	55                   	push   %ebp
 351:	89 e5                	mov    %esp,%ebp
 353:	53                   	push   %ebx
 354:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 357:	0f be 02             	movsbl (%edx),%eax
 35a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 35d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 360:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 365:	77 1e                	ja     385 <atoi+0x35>
 367:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 36e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 370:	83 c2 01             	add    $0x1,%edx
 373:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 376:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 37a:	0f be 02             	movsbl (%edx),%eax
 37d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 380:	80 fb 09             	cmp    $0x9,%bl
 383:	76 eb                	jbe    370 <atoi+0x20>
  return n;
}
 385:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 388:	89 c8                	mov    %ecx,%eax
 38a:	c9                   	leave  
 38b:	c3                   	ret    
 38c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000390 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 390:	55                   	push   %ebp
 391:	89 e5                	mov    %esp,%ebp
 393:	57                   	push   %edi
 394:	8b 45 10             	mov    0x10(%ebp),%eax
 397:	8b 55 08             	mov    0x8(%ebp),%edx
 39a:	56                   	push   %esi
 39b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 39e:	85 c0                	test   %eax,%eax
 3a0:	7e 13                	jle    3b5 <memmove+0x25>
 3a2:	01 d0                	add    %edx,%eax
  dst = vdst;
 3a4:	89 d7                	mov    %edx,%edi
 3a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3ad:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 3b0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 3b1:	39 f8                	cmp    %edi,%eax
 3b3:	75 fb                	jne    3b0 <memmove+0x20>
  return vdst;
}
 3b5:	5e                   	pop    %esi
 3b6:	89 d0                	mov    %edx,%eax
 3b8:	5f                   	pop    %edi
 3b9:	5d                   	pop    %ebp
 3ba:	c3                   	ret    
 3bb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3bf:	90                   	nop

000003c0 <sqrt>:


// https://www.geeksforgeeks.org/c-program-to-find-square-root-of-a-given-number/
float sqrt(int num) {
 3c0:	55                   	push   %ebp
 3c1:	89 e5                	mov    %esp,%ebp
 3c3:	56                   	push   %esi
 3c4:	53                   	push   %ebx
 3c5:	83 ec 04             	sub    $0x4,%esp
 3c8:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int end = num;
  int middle;

  float solution = 0.0;

  while (start <= end) {
 3cb:	85 db                	test   %ebx,%ebx
 3cd:	0f 88 8d 00 00 00    	js     460 <sqrt+0xa0>
    middle = (start + end) / 2;
 3d3:	89 d8                	mov    %ebx,%eax
 3d5:	d1 f8                	sar    %eax
    if (middle * middle == num) {
 3d7:	89 c2                	mov    %eax,%edx
 3d9:	0f af d0             	imul   %eax,%edx
 3dc:	39 d3                	cmp    %edx,%ebx
 3de:	74 78                	je     458 <sqrt+0x98>
 3e0:	89 de                	mov    %ebx,%esi
  float solution = 0.0;
 3e2:	d9 ee                	fldz   
  int start = 0;
 3e4:	31 c9                	xor    %ecx,%ecx
 3e6:	eb 25                	jmp    40d <sqrt+0x4d>
 3e8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3ef:	90                   	nop
 3f0:	dd d8                	fstp   %st(0)
      solution = middle;
      break;
    }
    if (middle * middle < num) {
      solution = start;
 3f2:	89 4d f4             	mov    %ecx,-0xc(%ebp)
      start = middle + 1;
 3f5:	8d 48 01             	lea    0x1(%eax),%ecx
      solution = start;
 3f8:	db 45 f4             	fildl  -0xc(%ebp)
  while (start <= end) {
 3fb:	39 ce                	cmp    %ecx,%esi
 3fd:	7c 19                	jl     418 <sqrt+0x58>
    middle = (start + end) / 2;
 3ff:	8d 04 0e             	lea    (%esi,%ecx,1),%eax
 402:	d1 f8                	sar    %eax
    if (middle * middle == num) {
 404:	89 c2                	mov    %eax,%edx
 406:	0f af d0             	imul   %eax,%edx
 409:	39 da                	cmp    %ebx,%edx
 40b:	74 49                	je     456 <sqrt+0x96>
    if (middle * middle < num) {
 40d:	39 d3                	cmp    %edx,%ebx
 40f:	7f df                	jg     3f0 <sqrt+0x30>
    }
    else {
      end = middle - 1;
 411:	8d 70 ff             	lea    -0x1(%eax),%esi
  while (start <= end) {
 414:	39 ce                	cmp    %ecx,%esi
 416:	7d e7                	jge    3ff <sqrt+0x3f>

  float eps = 0.1;
  int i;

  for (i = 0; i < 5; i++) {
    while (solution * solution <= num) {
 418:	89 5d f4             	mov    %ebx,-0xc(%ebp)
 41b:	b8 05 00 00 00       	mov    $0x5,%eax
 420:	db 45 f4             	fildl  -0xc(%ebp)
 423:	d9 05 58 09 00 00    	flds   0x958
 429:	eb 07                	jmp    432 <sqrt+0x72>
 42b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 42f:	90                   	nop
      solution += eps;
 430:	dc c2                	fadd   %st,%st(2)
    while (solution * solution <= num) {
 432:	d9 c2                	fld    %st(2)
 434:	d8 cb                	fmul   %st(3),%st
 436:	d9 ca                	fxch   %st(2)
 438:	db f2                	fcomi  %st(2),%st
 43a:	dd da                	fstp   %st(2)
 43c:	73 f2                	jae    430 <sqrt+0x70>
    }
    solution = solution - eps;
 43e:	dc ea                	fsubr  %st,%st(2)
    eps = eps / 10;
 440:	d8 35 5c 09 00 00    	fdivs  0x95c
  for (i = 0; i < 5; i++) {
 446:	83 e8 01             	sub    $0x1,%eax
 449:	75 e7                	jne    432 <sqrt+0x72>
 44b:	dd d8                	fstp   %st(0)
 44d:	dd d8                	fstp   %st(0)
  }
  return solution;

}
 44f:	83 c4 04             	add    $0x4,%esp
 452:	5b                   	pop    %ebx
 453:	5e                   	pop    %esi
 454:	5d                   	pop    %ebp
 455:	c3                   	ret    
 456:	dd d8                	fstp   %st(0)
      solution = middle;
 458:	89 45 f4             	mov    %eax,-0xc(%ebp)
 45b:	db 45 f4             	fildl  -0xc(%ebp)
      break;
 45e:	eb b8                	jmp    418 <sqrt+0x58>
  float solution = 0.0;
 460:	d9 ee                	fldz   
 462:	eb b4                	jmp    418 <sqrt+0x58>

00000464 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 464:	b8 01 00 00 00       	mov    $0x1,%eax
 469:	cd 40                	int    $0x40
 46b:	c3                   	ret    

0000046c <exit>:
SYSCALL(exit)
 46c:	b8 02 00 00 00       	mov    $0x2,%eax
 471:	cd 40                	int    $0x40
 473:	c3                   	ret    

00000474 <wait>:
SYSCALL(wait)
 474:	b8 03 00 00 00       	mov    $0x3,%eax
 479:	cd 40                	int    $0x40
 47b:	c3                   	ret    

0000047c <pipe>:
SYSCALL(pipe)
 47c:	b8 04 00 00 00       	mov    $0x4,%eax
 481:	cd 40                	int    $0x40
 483:	c3                   	ret    

00000484 <read>:
SYSCALL(read)
 484:	b8 05 00 00 00       	mov    $0x5,%eax
 489:	cd 40                	int    $0x40
 48b:	c3                   	ret    

0000048c <write>:
SYSCALL(write)
 48c:	b8 10 00 00 00       	mov    $0x10,%eax
 491:	cd 40                	int    $0x40
 493:	c3                   	ret    

00000494 <close>:
SYSCALL(close)
 494:	b8 15 00 00 00       	mov    $0x15,%eax
 499:	cd 40                	int    $0x40
 49b:	c3                   	ret    

0000049c <kill>:
SYSCALL(kill)
 49c:	b8 06 00 00 00       	mov    $0x6,%eax
 4a1:	cd 40                	int    $0x40
 4a3:	c3                   	ret    

000004a4 <exec>:
SYSCALL(exec)
 4a4:	b8 07 00 00 00       	mov    $0x7,%eax
 4a9:	cd 40                	int    $0x40
 4ab:	c3                   	ret    

000004ac <open>:
SYSCALL(open)
 4ac:	b8 0f 00 00 00       	mov    $0xf,%eax
 4b1:	cd 40                	int    $0x40
 4b3:	c3                   	ret    

000004b4 <mknod>:
SYSCALL(mknod)
 4b4:	b8 11 00 00 00       	mov    $0x11,%eax
 4b9:	cd 40                	int    $0x40
 4bb:	c3                   	ret    

000004bc <unlink>:
SYSCALL(unlink)
 4bc:	b8 12 00 00 00       	mov    $0x12,%eax
 4c1:	cd 40                	int    $0x40
 4c3:	c3                   	ret    

000004c4 <fstat>:
SYSCALL(fstat)
 4c4:	b8 08 00 00 00       	mov    $0x8,%eax
 4c9:	cd 40                	int    $0x40
 4cb:	c3                   	ret    

000004cc <link>:
SYSCALL(link)
 4cc:	b8 13 00 00 00       	mov    $0x13,%eax
 4d1:	cd 40                	int    $0x40
 4d3:	c3                   	ret    

000004d4 <mkdir>:
SYSCALL(mkdir)
 4d4:	b8 14 00 00 00       	mov    $0x14,%eax
 4d9:	cd 40                	int    $0x40
 4db:	c3                   	ret    

000004dc <chdir>:
SYSCALL(chdir)
 4dc:	b8 09 00 00 00       	mov    $0x9,%eax
 4e1:	cd 40                	int    $0x40
 4e3:	c3                   	ret    

000004e4 <dup>:
SYSCALL(dup)
 4e4:	b8 0a 00 00 00       	mov    $0xa,%eax
 4e9:	cd 40                	int    $0x40
 4eb:	c3                   	ret    

000004ec <getpid>:
SYSCALL(getpid)
 4ec:	b8 0b 00 00 00       	mov    $0xb,%eax
 4f1:	cd 40                	int    $0x40
 4f3:	c3                   	ret    

000004f4 <sbrk>:
SYSCALL(sbrk)
 4f4:	b8 0c 00 00 00       	mov    $0xc,%eax
 4f9:	cd 40                	int    $0x40
 4fb:	c3                   	ret    

000004fc <sleep>:
SYSCALL(sleep)
 4fc:	b8 0d 00 00 00       	mov    $0xd,%eax
 501:	cd 40                	int    $0x40
 503:	c3                   	ret    

00000504 <uptime>:
SYSCALL(uptime)
 504:	b8 0e 00 00 00       	mov    $0xe,%eax
 509:	cd 40                	int    $0x40
 50b:	c3                   	ret    

0000050c <gettid>:
SYSCALL(gettid)
 50c:	b8 16 00 00 00       	mov    $0x16,%eax
 511:	cd 40                	int    $0x40
 513:	c3                   	ret    

00000514 <getpgid>:
SYSCALL(getpgid)
 514:	b8 17 00 00 00       	mov    $0x17,%eax
 519:	cd 40                	int    $0x40
 51b:	c3                   	ret    

0000051c <setpgid>:
SYSCALL(setpgid)
 51c:	b8 18 00 00 00       	mov    $0x18,%eax
 521:	cd 40                	int    $0x40
 523:	c3                   	ret    

00000524 <getppid>:
SYSCALL(getppid)
 524:	b8 19 00 00 00       	mov    $0x19,%eax
 529:	cd 40                	int    $0x40
 52b:	c3                   	ret    

0000052c <uptime_ms>:
SYSCALL(uptime_ms)
 52c:	b8 1a 00 00 00       	mov    $0x1a,%eax
 531:	cd 40                	int    $0x40
 533:	c3                   	ret    

00000534 <printptable>:
SYSCALL(printptable)
 534:	b8 1c 00 00 00       	mov    $0x1c,%eax
 539:	cd 40                	int    $0x40
 53b:	c3                   	ret    

0000053c <setpriority>:
SYSCALL(setpriority)
 53c:	b8 1b 00 00 00       	mov    $0x1b,%eax
 541:	cd 40                	int    $0x40
 543:	c3                   	ret    
 544:	66 90                	xchg   %ax,%ax
 546:	66 90                	xchg   %ax,%ax
 548:	66 90                	xchg   %ax,%ax
 54a:	66 90                	xchg   %ax,%ax
 54c:	66 90                	xchg   %ax,%ax
 54e:	66 90                	xchg   %ax,%ax

00000550 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 550:	55                   	push   %ebp
 551:	89 e5                	mov    %esp,%ebp
 553:	57                   	push   %edi
 554:	56                   	push   %esi
 555:	53                   	push   %ebx
 556:	83 ec 3c             	sub    $0x3c,%esp
 559:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 55c:	89 d1                	mov    %edx,%ecx
{
 55e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 561:	85 d2                	test   %edx,%edx
 563:	0f 89 7f 00 00 00    	jns    5e8 <printint+0x98>
 569:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 56d:	74 79                	je     5e8 <printint+0x98>
    neg = 1;
 56f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 576:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 578:	31 db                	xor    %ebx,%ebx
 57a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 57d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 580:	89 c8                	mov    %ecx,%eax
 582:	31 d2                	xor    %edx,%edx
 584:	89 cf                	mov    %ecx,%edi
 586:	f7 75 c4             	divl   -0x3c(%ebp)
 589:	0f b6 92 c0 09 00 00 	movzbl 0x9c0(%edx),%edx
 590:	89 45 c0             	mov    %eax,-0x40(%ebp)
 593:	89 d8                	mov    %ebx,%eax
 595:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 598:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 59b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 59e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 5a1:	76 dd                	jbe    580 <printint+0x30>
  if(neg)
 5a3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 5a6:	85 c9                	test   %ecx,%ecx
 5a8:	74 0c                	je     5b6 <printint+0x66>
    buf[i++] = '-';
 5aa:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 5af:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 5b1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 5b6:	8b 7d b8             	mov    -0x48(%ebp),%edi
 5b9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 5bd:	eb 07                	jmp    5c6 <printint+0x76>
 5bf:	90                   	nop
    putc(fd, buf[i]);
 5c0:	0f b6 13             	movzbl (%ebx),%edx
 5c3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 5c6:	83 ec 04             	sub    $0x4,%esp
 5c9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 5cc:	6a 01                	push   $0x1
 5ce:	56                   	push   %esi
 5cf:	57                   	push   %edi
 5d0:	e8 b7 fe ff ff       	call   48c <write>
  while(--i >= 0)
 5d5:	83 c4 10             	add    $0x10,%esp
 5d8:	39 de                	cmp    %ebx,%esi
 5da:	75 e4                	jne    5c0 <printint+0x70>
}
 5dc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5df:	5b                   	pop    %ebx
 5e0:	5e                   	pop    %esi
 5e1:	5f                   	pop    %edi
 5e2:	5d                   	pop    %ebp
 5e3:	c3                   	ret    
 5e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 5e8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 5ef:	eb 87                	jmp    578 <printint+0x28>
 5f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5ff:	90                   	nop

00000600 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 600:	55                   	push   %ebp
 601:	89 e5                	mov    %esp,%ebp
 603:	57                   	push   %edi
 604:	56                   	push   %esi
 605:	53                   	push   %ebx
 606:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 609:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 60c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 60f:	0f b6 13             	movzbl (%ebx),%edx
 612:	84 d2                	test   %dl,%dl
 614:	74 6a                	je     680 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 616:	8d 45 10             	lea    0x10(%ebp),%eax
 619:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 61c:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 61f:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 621:	89 45 d0             	mov    %eax,-0x30(%ebp)
 624:	eb 36                	jmp    65c <printf+0x5c>
 626:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 62d:	8d 76 00             	lea    0x0(%esi),%esi
 630:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 633:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 638:	83 f8 25             	cmp    $0x25,%eax
 63b:	74 15                	je     652 <printf+0x52>
  write(fd, &c, 1);
 63d:	83 ec 04             	sub    $0x4,%esp
 640:	88 55 e7             	mov    %dl,-0x19(%ebp)
 643:	6a 01                	push   $0x1
 645:	57                   	push   %edi
 646:	56                   	push   %esi
 647:	e8 40 fe ff ff       	call   48c <write>
 64c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 64f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 652:	0f b6 13             	movzbl (%ebx),%edx
 655:	83 c3 01             	add    $0x1,%ebx
 658:	84 d2                	test   %dl,%dl
 65a:	74 24                	je     680 <printf+0x80>
    c = fmt[i] & 0xff;
 65c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 65f:	85 c9                	test   %ecx,%ecx
 661:	74 cd                	je     630 <printf+0x30>
      }
    } else if(state == '%'){
 663:	83 f9 25             	cmp    $0x25,%ecx
 666:	75 ea                	jne    652 <printf+0x52>
      if(c == 'd'){
 668:	83 f8 25             	cmp    $0x25,%eax
 66b:	0f 84 07 01 00 00    	je     778 <printf+0x178>
 671:	83 e8 63             	sub    $0x63,%eax
 674:	83 f8 15             	cmp    $0x15,%eax
 677:	77 17                	ja     690 <printf+0x90>
 679:	ff 24 85 68 09 00 00 	jmp    *0x968(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 680:	8d 65 f4             	lea    -0xc(%ebp),%esp
 683:	5b                   	pop    %ebx
 684:	5e                   	pop    %esi
 685:	5f                   	pop    %edi
 686:	5d                   	pop    %ebp
 687:	c3                   	ret    
 688:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 68f:	90                   	nop
  write(fd, &c, 1);
 690:	83 ec 04             	sub    $0x4,%esp
 693:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 696:	6a 01                	push   $0x1
 698:	57                   	push   %edi
 699:	56                   	push   %esi
 69a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 69e:	e8 e9 fd ff ff       	call   48c <write>
        putc(fd, c);
 6a3:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 6a7:	83 c4 0c             	add    $0xc,%esp
 6aa:	88 55 e7             	mov    %dl,-0x19(%ebp)
 6ad:	6a 01                	push   $0x1
 6af:	57                   	push   %edi
 6b0:	56                   	push   %esi
 6b1:	e8 d6 fd ff ff       	call   48c <write>
        putc(fd, c);
 6b6:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6b9:	31 c9                	xor    %ecx,%ecx
 6bb:	eb 95                	jmp    652 <printf+0x52>
 6bd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 6c0:	83 ec 0c             	sub    $0xc,%esp
 6c3:	b9 10 00 00 00       	mov    $0x10,%ecx
 6c8:	6a 00                	push   $0x0
 6ca:	8b 45 d0             	mov    -0x30(%ebp),%eax
 6cd:	8b 10                	mov    (%eax),%edx
 6cf:	89 f0                	mov    %esi,%eax
 6d1:	e8 7a fe ff ff       	call   550 <printint>
        ap++;
 6d6:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 6da:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6dd:	31 c9                	xor    %ecx,%ecx
 6df:	e9 6e ff ff ff       	jmp    652 <printf+0x52>
 6e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 6e8:	8b 45 d0             	mov    -0x30(%ebp),%eax
 6eb:	8b 10                	mov    (%eax),%edx
        ap++;
 6ed:	83 c0 04             	add    $0x4,%eax
 6f0:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 6f3:	85 d2                	test   %edx,%edx
 6f5:	0f 84 8d 00 00 00    	je     788 <printf+0x188>
        while(*s != 0){
 6fb:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 6fe:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 700:	84 c0                	test   %al,%al
 702:	0f 84 4a ff ff ff    	je     652 <printf+0x52>
 708:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 70b:	89 d3                	mov    %edx,%ebx
 70d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 710:	83 ec 04             	sub    $0x4,%esp
          s++;
 713:	83 c3 01             	add    $0x1,%ebx
 716:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 719:	6a 01                	push   $0x1
 71b:	57                   	push   %edi
 71c:	56                   	push   %esi
 71d:	e8 6a fd ff ff       	call   48c <write>
        while(*s != 0){
 722:	0f b6 03             	movzbl (%ebx),%eax
 725:	83 c4 10             	add    $0x10,%esp
 728:	84 c0                	test   %al,%al
 72a:	75 e4                	jne    710 <printf+0x110>
      state = 0;
 72c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 72f:	31 c9                	xor    %ecx,%ecx
 731:	e9 1c ff ff ff       	jmp    652 <printf+0x52>
 736:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 73d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 740:	83 ec 0c             	sub    $0xc,%esp
 743:	b9 0a 00 00 00       	mov    $0xa,%ecx
 748:	6a 01                	push   $0x1
 74a:	e9 7b ff ff ff       	jmp    6ca <printf+0xca>
 74f:	90                   	nop
        putc(fd, *ap);
 750:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 753:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 756:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 758:	6a 01                	push   $0x1
 75a:	57                   	push   %edi
 75b:	56                   	push   %esi
        putc(fd, *ap);
 75c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 75f:	e8 28 fd ff ff       	call   48c <write>
        ap++;
 764:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 768:	83 c4 10             	add    $0x10,%esp
      state = 0;
 76b:	31 c9                	xor    %ecx,%ecx
 76d:	e9 e0 fe ff ff       	jmp    652 <printf+0x52>
 772:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 778:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 77b:	83 ec 04             	sub    $0x4,%esp
 77e:	e9 2a ff ff ff       	jmp    6ad <printf+0xad>
 783:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 787:	90                   	nop
          s = "(null)";
 788:	ba 60 09 00 00       	mov    $0x960,%edx
        while(*s != 0){
 78d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 790:	b8 28 00 00 00       	mov    $0x28,%eax
 795:	89 d3                	mov    %edx,%ebx
 797:	e9 74 ff ff ff       	jmp    710 <printf+0x110>
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
 7a1:	a1 cc 0c 00 00       	mov    0xccc,%eax
{
 7a6:	89 e5                	mov    %esp,%ebp
 7a8:	57                   	push   %edi
 7a9:	56                   	push   %esi
 7aa:	53                   	push   %ebx
 7ab:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 7ae:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7b8:	89 c2                	mov    %eax,%edx
 7ba:	8b 00                	mov    (%eax),%eax
 7bc:	39 ca                	cmp    %ecx,%edx
 7be:	73 30                	jae    7f0 <free+0x50>
 7c0:	39 c1                	cmp    %eax,%ecx
 7c2:	72 04                	jb     7c8 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7c4:	39 c2                	cmp    %eax,%edx
 7c6:	72 f0                	jb     7b8 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 7c8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7cb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7ce:	39 f8                	cmp    %edi,%eax
 7d0:	74 30                	je     802 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 7d2:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 7d5:	8b 42 04             	mov    0x4(%edx),%eax
 7d8:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 7db:	39 f1                	cmp    %esi,%ecx
 7dd:	74 3a                	je     819 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 7df:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 7e1:	5b                   	pop    %ebx
  freep = p;
 7e2:	89 15 cc 0c 00 00    	mov    %edx,0xccc
}
 7e8:	5e                   	pop    %esi
 7e9:	5f                   	pop    %edi
 7ea:	5d                   	pop    %ebp
 7eb:	c3                   	ret    
 7ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7f0:	39 c2                	cmp    %eax,%edx
 7f2:	72 c4                	jb     7b8 <free+0x18>
 7f4:	39 c1                	cmp    %eax,%ecx
 7f6:	73 c0                	jae    7b8 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 7f8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7fb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7fe:	39 f8                	cmp    %edi,%eax
 800:	75 d0                	jne    7d2 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 802:	03 70 04             	add    0x4(%eax),%esi
 805:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 808:	8b 02                	mov    (%edx),%eax
 80a:	8b 00                	mov    (%eax),%eax
 80c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 80f:	8b 42 04             	mov    0x4(%edx),%eax
 812:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 815:	39 f1                	cmp    %esi,%ecx
 817:	75 c6                	jne    7df <free+0x3f>
    p->s.size += bp->s.size;
 819:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 81c:	89 15 cc 0c 00 00    	mov    %edx,0xccc
    p->s.size += bp->s.size;
 822:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 825:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 828:	89 0a                	mov    %ecx,(%edx)
}
 82a:	5b                   	pop    %ebx
 82b:	5e                   	pop    %esi
 82c:	5f                   	pop    %edi
 82d:	5d                   	pop    %ebp
 82e:	c3                   	ret    
 82f:	90                   	nop

00000830 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 830:	55                   	push   %ebp
 831:	89 e5                	mov    %esp,%ebp
 833:	57                   	push   %edi
 834:	56                   	push   %esi
 835:	53                   	push   %ebx
 836:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 839:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 83c:	8b 3d cc 0c 00 00    	mov    0xccc,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 842:	8d 70 07             	lea    0x7(%eax),%esi
 845:	c1 ee 03             	shr    $0x3,%esi
 848:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 84b:	85 ff                	test   %edi,%edi
 84d:	0f 84 9d 00 00 00    	je     8f0 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 853:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 855:	8b 4a 04             	mov    0x4(%edx),%ecx
 858:	39 f1                	cmp    %esi,%ecx
 85a:	73 6a                	jae    8c6 <malloc+0x96>
 85c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 861:	39 de                	cmp    %ebx,%esi
 863:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 866:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 86d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 870:	eb 17                	jmp    889 <malloc+0x59>
 872:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 878:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 87a:	8b 48 04             	mov    0x4(%eax),%ecx
 87d:	39 f1                	cmp    %esi,%ecx
 87f:	73 4f                	jae    8d0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 881:	8b 3d cc 0c 00 00    	mov    0xccc,%edi
 887:	89 c2                	mov    %eax,%edx
 889:	39 d7                	cmp    %edx,%edi
 88b:	75 eb                	jne    878 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 88d:	83 ec 0c             	sub    $0xc,%esp
 890:	ff 75 e4             	push   -0x1c(%ebp)
 893:	e8 5c fc ff ff       	call   4f4 <sbrk>
  if(p == (char*)-1)
 898:	83 c4 10             	add    $0x10,%esp
 89b:	83 f8 ff             	cmp    $0xffffffff,%eax
 89e:	74 1c                	je     8bc <malloc+0x8c>
  hp->s.size = nu;
 8a0:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 8a3:	83 ec 0c             	sub    $0xc,%esp
 8a6:	83 c0 08             	add    $0x8,%eax
 8a9:	50                   	push   %eax
 8aa:	e8 f1 fe ff ff       	call   7a0 <free>
  return freep;
 8af:	8b 15 cc 0c 00 00    	mov    0xccc,%edx
      if((p = morecore(nunits)) == 0)
 8b5:	83 c4 10             	add    $0x10,%esp
 8b8:	85 d2                	test   %edx,%edx
 8ba:	75 bc                	jne    878 <malloc+0x48>
        return 0;
  }
}
 8bc:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 8bf:	31 c0                	xor    %eax,%eax
}
 8c1:	5b                   	pop    %ebx
 8c2:	5e                   	pop    %esi
 8c3:	5f                   	pop    %edi
 8c4:	5d                   	pop    %ebp
 8c5:	c3                   	ret    
    if(p->s.size >= nunits){
 8c6:	89 d0                	mov    %edx,%eax
 8c8:	89 fa                	mov    %edi,%edx
 8ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 8d0:	39 ce                	cmp    %ecx,%esi
 8d2:	74 4c                	je     920 <malloc+0xf0>
        p->s.size -= nunits;
 8d4:	29 f1                	sub    %esi,%ecx
 8d6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 8d9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 8dc:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 8df:	89 15 cc 0c 00 00    	mov    %edx,0xccc
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
 8f0:	c7 05 cc 0c 00 00 d0 	movl   $0xcd0,0xccc
 8f7:	0c 00 00 
    base.s.size = 0;
 8fa:	bf d0 0c 00 00       	mov    $0xcd0,%edi
    base.s.ptr = freep = prevp = &base;
 8ff:	c7 05 d0 0c 00 00 d0 	movl   $0xcd0,0xcd0
 906:	0c 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 909:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 90b:	c7 05 d4 0c 00 00 00 	movl   $0x0,0xcd4
 912:	00 00 00 
    if(p->s.size >= nunits){
 915:	e9 42 ff ff ff       	jmp    85c <malloc+0x2c>
 91a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 920:	8b 08                	mov    (%eax),%ecx
 922:	89 0a                	mov    %ecx,(%edx)
 924:	eb b9                	jmp    8df <malloc+0xaf>
