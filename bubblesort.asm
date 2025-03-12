
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
  a9:	68 41 09 00 00       	push   $0x941
  ae:	6a 01                	push   $0x1
  b0:	e8 3b 05 00 00       	call   5f0 <printf>
    for (int i = 0; i < argc-1; i++) {
  b5:	83 c4 10             	add    $0x10,%esp
  b8:	39 fb                	cmp    %edi,%ebx
  ba:	75 e4                	jne    a0 <main+0xa0>
    }
    printf(1,"\n");
  bc:	83 ec 08             	sub    $0x8,%esp
  bf:	68 45 09 00 00       	push   $0x945
  c4:	6a 01                	push   $0x1
  c6:	e8 25 05 00 00       	call   5f0 <printf>
    exit();
  cb:	e8 9c 03 00 00       	call   46c <exit>
        printf(2, "Incorrect format. Try: bubblesort x y z\n");
  d0:	52                   	push   %edx
  d1:	52                   	push   %edx
  d2:	68 18 09 00 00       	push   $0x918
  d7:	6a 02                	push   $0x2
  d9:	e8 12 05 00 00       	call   5f0 <printf>
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
 423:	d9 05 48 09 00 00    	flds   0x948
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
 440:	d8 35 4c 09 00 00    	fdivs  0x94c
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
 534:	66 90                	xchg   %ax,%ax
 536:	66 90                	xchg   %ax,%ax
 538:	66 90                	xchg   %ax,%ax
 53a:	66 90                	xchg   %ax,%ax
 53c:	66 90                	xchg   %ax,%ax
 53e:	66 90                	xchg   %ax,%ax

00000540 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 540:	55                   	push   %ebp
 541:	89 e5                	mov    %esp,%ebp
 543:	57                   	push   %edi
 544:	56                   	push   %esi
 545:	53                   	push   %ebx
 546:	83 ec 3c             	sub    $0x3c,%esp
 549:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 54c:	89 d1                	mov    %edx,%ecx
{
 54e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 551:	85 d2                	test   %edx,%edx
 553:	0f 89 7f 00 00 00    	jns    5d8 <printint+0x98>
 559:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 55d:	74 79                	je     5d8 <printint+0x98>
    neg = 1;
 55f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 566:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 568:	31 db                	xor    %ebx,%ebx
 56a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 56d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 570:	89 c8                	mov    %ecx,%eax
 572:	31 d2                	xor    %edx,%edx
 574:	89 cf                	mov    %ecx,%edi
 576:	f7 75 c4             	divl   -0x3c(%ebp)
 579:	0f b6 92 b0 09 00 00 	movzbl 0x9b0(%edx),%edx
 580:	89 45 c0             	mov    %eax,-0x40(%ebp)
 583:	89 d8                	mov    %ebx,%eax
 585:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 588:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 58b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 58e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 591:	76 dd                	jbe    570 <printint+0x30>
  if(neg)
 593:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 596:	85 c9                	test   %ecx,%ecx
 598:	74 0c                	je     5a6 <printint+0x66>
    buf[i++] = '-';
 59a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 59f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 5a1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 5a6:	8b 7d b8             	mov    -0x48(%ebp),%edi
 5a9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 5ad:	eb 07                	jmp    5b6 <printint+0x76>
 5af:	90                   	nop
    putc(fd, buf[i]);
 5b0:	0f b6 13             	movzbl (%ebx),%edx
 5b3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 5b6:	83 ec 04             	sub    $0x4,%esp
 5b9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 5bc:	6a 01                	push   $0x1
 5be:	56                   	push   %esi
 5bf:	57                   	push   %edi
 5c0:	e8 c7 fe ff ff       	call   48c <write>
  while(--i >= 0)
 5c5:	83 c4 10             	add    $0x10,%esp
 5c8:	39 de                	cmp    %ebx,%esi
 5ca:	75 e4                	jne    5b0 <printint+0x70>
}
 5cc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5cf:	5b                   	pop    %ebx
 5d0:	5e                   	pop    %esi
 5d1:	5f                   	pop    %edi
 5d2:	5d                   	pop    %ebp
 5d3:	c3                   	ret    
 5d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 5d8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 5df:	eb 87                	jmp    568 <printint+0x28>
 5e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5e8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5ef:	90                   	nop

000005f0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 5f0:	55                   	push   %ebp
 5f1:	89 e5                	mov    %esp,%ebp
 5f3:	57                   	push   %edi
 5f4:	56                   	push   %esi
 5f5:	53                   	push   %ebx
 5f6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5f9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 5fc:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 5ff:	0f b6 13             	movzbl (%ebx),%edx
 602:	84 d2                	test   %dl,%dl
 604:	74 6a                	je     670 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 606:	8d 45 10             	lea    0x10(%ebp),%eax
 609:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 60c:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 60f:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 611:	89 45 d0             	mov    %eax,-0x30(%ebp)
 614:	eb 36                	jmp    64c <printf+0x5c>
 616:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 61d:	8d 76 00             	lea    0x0(%esi),%esi
 620:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 623:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 628:	83 f8 25             	cmp    $0x25,%eax
 62b:	74 15                	je     642 <printf+0x52>
  write(fd, &c, 1);
 62d:	83 ec 04             	sub    $0x4,%esp
 630:	88 55 e7             	mov    %dl,-0x19(%ebp)
 633:	6a 01                	push   $0x1
 635:	57                   	push   %edi
 636:	56                   	push   %esi
 637:	e8 50 fe ff ff       	call   48c <write>
 63c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 63f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 642:	0f b6 13             	movzbl (%ebx),%edx
 645:	83 c3 01             	add    $0x1,%ebx
 648:	84 d2                	test   %dl,%dl
 64a:	74 24                	je     670 <printf+0x80>
    c = fmt[i] & 0xff;
 64c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 64f:	85 c9                	test   %ecx,%ecx
 651:	74 cd                	je     620 <printf+0x30>
      }
    } else if(state == '%'){
 653:	83 f9 25             	cmp    $0x25,%ecx
 656:	75 ea                	jne    642 <printf+0x52>
      if(c == 'd'){
 658:	83 f8 25             	cmp    $0x25,%eax
 65b:	0f 84 07 01 00 00    	je     768 <printf+0x178>
 661:	83 e8 63             	sub    $0x63,%eax
 664:	83 f8 15             	cmp    $0x15,%eax
 667:	77 17                	ja     680 <printf+0x90>
 669:	ff 24 85 58 09 00 00 	jmp    *0x958(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 670:	8d 65 f4             	lea    -0xc(%ebp),%esp
 673:	5b                   	pop    %ebx
 674:	5e                   	pop    %esi
 675:	5f                   	pop    %edi
 676:	5d                   	pop    %ebp
 677:	c3                   	ret    
 678:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 67f:	90                   	nop
  write(fd, &c, 1);
 680:	83 ec 04             	sub    $0x4,%esp
 683:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 686:	6a 01                	push   $0x1
 688:	57                   	push   %edi
 689:	56                   	push   %esi
 68a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 68e:	e8 f9 fd ff ff       	call   48c <write>
        putc(fd, c);
 693:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 697:	83 c4 0c             	add    $0xc,%esp
 69a:	88 55 e7             	mov    %dl,-0x19(%ebp)
 69d:	6a 01                	push   $0x1
 69f:	57                   	push   %edi
 6a0:	56                   	push   %esi
 6a1:	e8 e6 fd ff ff       	call   48c <write>
        putc(fd, c);
 6a6:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6a9:	31 c9                	xor    %ecx,%ecx
 6ab:	eb 95                	jmp    642 <printf+0x52>
 6ad:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 6b0:	83 ec 0c             	sub    $0xc,%esp
 6b3:	b9 10 00 00 00       	mov    $0x10,%ecx
 6b8:	6a 00                	push   $0x0
 6ba:	8b 45 d0             	mov    -0x30(%ebp),%eax
 6bd:	8b 10                	mov    (%eax),%edx
 6bf:	89 f0                	mov    %esi,%eax
 6c1:	e8 7a fe ff ff       	call   540 <printint>
        ap++;
 6c6:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 6ca:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6cd:	31 c9                	xor    %ecx,%ecx
 6cf:	e9 6e ff ff ff       	jmp    642 <printf+0x52>
 6d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 6d8:	8b 45 d0             	mov    -0x30(%ebp),%eax
 6db:	8b 10                	mov    (%eax),%edx
        ap++;
 6dd:	83 c0 04             	add    $0x4,%eax
 6e0:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 6e3:	85 d2                	test   %edx,%edx
 6e5:	0f 84 8d 00 00 00    	je     778 <printf+0x188>
        while(*s != 0){
 6eb:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 6ee:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 6f0:	84 c0                	test   %al,%al
 6f2:	0f 84 4a ff ff ff    	je     642 <printf+0x52>
 6f8:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 6fb:	89 d3                	mov    %edx,%ebx
 6fd:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 700:	83 ec 04             	sub    $0x4,%esp
          s++;
 703:	83 c3 01             	add    $0x1,%ebx
 706:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 709:	6a 01                	push   $0x1
 70b:	57                   	push   %edi
 70c:	56                   	push   %esi
 70d:	e8 7a fd ff ff       	call   48c <write>
        while(*s != 0){
 712:	0f b6 03             	movzbl (%ebx),%eax
 715:	83 c4 10             	add    $0x10,%esp
 718:	84 c0                	test   %al,%al
 71a:	75 e4                	jne    700 <printf+0x110>
      state = 0;
 71c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 71f:	31 c9                	xor    %ecx,%ecx
 721:	e9 1c ff ff ff       	jmp    642 <printf+0x52>
 726:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 72d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 730:	83 ec 0c             	sub    $0xc,%esp
 733:	b9 0a 00 00 00       	mov    $0xa,%ecx
 738:	6a 01                	push   $0x1
 73a:	e9 7b ff ff ff       	jmp    6ba <printf+0xca>
 73f:	90                   	nop
        putc(fd, *ap);
 740:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 743:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 746:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 748:	6a 01                	push   $0x1
 74a:	57                   	push   %edi
 74b:	56                   	push   %esi
        putc(fd, *ap);
 74c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 74f:	e8 38 fd ff ff       	call   48c <write>
        ap++;
 754:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 758:	83 c4 10             	add    $0x10,%esp
      state = 0;
 75b:	31 c9                	xor    %ecx,%ecx
 75d:	e9 e0 fe ff ff       	jmp    642 <printf+0x52>
 762:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 768:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 76b:	83 ec 04             	sub    $0x4,%esp
 76e:	e9 2a ff ff ff       	jmp    69d <printf+0xad>
 773:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 777:	90                   	nop
          s = "(null)";
 778:	ba 50 09 00 00       	mov    $0x950,%edx
        while(*s != 0){
 77d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 780:	b8 28 00 00 00       	mov    $0x28,%eax
 785:	89 d3                	mov    %edx,%ebx
 787:	e9 74 ff ff ff       	jmp    700 <printf+0x110>
 78c:	66 90                	xchg   %ax,%ax
 78e:	66 90                	xchg   %ax,%ax

00000790 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 790:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 791:	a1 bc 0c 00 00       	mov    0xcbc,%eax
{
 796:	89 e5                	mov    %esp,%ebp
 798:	57                   	push   %edi
 799:	56                   	push   %esi
 79a:	53                   	push   %ebx
 79b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 79e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7a8:	89 c2                	mov    %eax,%edx
 7aa:	8b 00                	mov    (%eax),%eax
 7ac:	39 ca                	cmp    %ecx,%edx
 7ae:	73 30                	jae    7e0 <free+0x50>
 7b0:	39 c1                	cmp    %eax,%ecx
 7b2:	72 04                	jb     7b8 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7b4:	39 c2                	cmp    %eax,%edx
 7b6:	72 f0                	jb     7a8 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 7b8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7bb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7be:	39 f8                	cmp    %edi,%eax
 7c0:	74 30                	je     7f2 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 7c2:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 7c5:	8b 42 04             	mov    0x4(%edx),%eax
 7c8:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 7cb:	39 f1                	cmp    %esi,%ecx
 7cd:	74 3a                	je     809 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 7cf:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 7d1:	5b                   	pop    %ebx
  freep = p;
 7d2:	89 15 bc 0c 00 00    	mov    %edx,0xcbc
}
 7d8:	5e                   	pop    %esi
 7d9:	5f                   	pop    %edi
 7da:	5d                   	pop    %ebp
 7db:	c3                   	ret    
 7dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7e0:	39 c2                	cmp    %eax,%edx
 7e2:	72 c4                	jb     7a8 <free+0x18>
 7e4:	39 c1                	cmp    %eax,%ecx
 7e6:	73 c0                	jae    7a8 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 7e8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7eb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7ee:	39 f8                	cmp    %edi,%eax
 7f0:	75 d0                	jne    7c2 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 7f2:	03 70 04             	add    0x4(%eax),%esi
 7f5:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 7f8:	8b 02                	mov    (%edx),%eax
 7fa:	8b 00                	mov    (%eax),%eax
 7fc:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 7ff:	8b 42 04             	mov    0x4(%edx),%eax
 802:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 805:	39 f1                	cmp    %esi,%ecx
 807:	75 c6                	jne    7cf <free+0x3f>
    p->s.size += bp->s.size;
 809:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 80c:	89 15 bc 0c 00 00    	mov    %edx,0xcbc
    p->s.size += bp->s.size;
 812:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 815:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 818:	89 0a                	mov    %ecx,(%edx)
}
 81a:	5b                   	pop    %ebx
 81b:	5e                   	pop    %esi
 81c:	5f                   	pop    %edi
 81d:	5d                   	pop    %ebp
 81e:	c3                   	ret    
 81f:	90                   	nop

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
 826:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 829:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 82c:	8b 3d bc 0c 00 00    	mov    0xcbc,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 832:	8d 70 07             	lea    0x7(%eax),%esi
 835:	c1 ee 03             	shr    $0x3,%esi
 838:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 83b:	85 ff                	test   %edi,%edi
 83d:	0f 84 9d 00 00 00    	je     8e0 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 843:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 845:	8b 4a 04             	mov    0x4(%edx),%ecx
 848:	39 f1                	cmp    %esi,%ecx
 84a:	73 6a                	jae    8b6 <malloc+0x96>
 84c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 851:	39 de                	cmp    %ebx,%esi
 853:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 856:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 85d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 860:	eb 17                	jmp    879 <malloc+0x59>
 862:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 868:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 86a:	8b 48 04             	mov    0x4(%eax),%ecx
 86d:	39 f1                	cmp    %esi,%ecx
 86f:	73 4f                	jae    8c0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 871:	8b 3d bc 0c 00 00    	mov    0xcbc,%edi
 877:	89 c2                	mov    %eax,%edx
 879:	39 d7                	cmp    %edx,%edi
 87b:	75 eb                	jne    868 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 87d:	83 ec 0c             	sub    $0xc,%esp
 880:	ff 75 e4             	push   -0x1c(%ebp)
 883:	e8 6c fc ff ff       	call   4f4 <sbrk>
  if(p == (char*)-1)
 888:	83 c4 10             	add    $0x10,%esp
 88b:	83 f8 ff             	cmp    $0xffffffff,%eax
 88e:	74 1c                	je     8ac <malloc+0x8c>
  hp->s.size = nu;
 890:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 893:	83 ec 0c             	sub    $0xc,%esp
 896:	83 c0 08             	add    $0x8,%eax
 899:	50                   	push   %eax
 89a:	e8 f1 fe ff ff       	call   790 <free>
  return freep;
 89f:	8b 15 bc 0c 00 00    	mov    0xcbc,%edx
      if((p = morecore(nunits)) == 0)
 8a5:	83 c4 10             	add    $0x10,%esp
 8a8:	85 d2                	test   %edx,%edx
 8aa:	75 bc                	jne    868 <malloc+0x48>
        return 0;
  }
}
 8ac:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 8af:	31 c0                	xor    %eax,%eax
}
 8b1:	5b                   	pop    %ebx
 8b2:	5e                   	pop    %esi
 8b3:	5f                   	pop    %edi
 8b4:	5d                   	pop    %ebp
 8b5:	c3                   	ret    
    if(p->s.size >= nunits){
 8b6:	89 d0                	mov    %edx,%eax
 8b8:	89 fa                	mov    %edi,%edx
 8ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 8c0:	39 ce                	cmp    %ecx,%esi
 8c2:	74 4c                	je     910 <malloc+0xf0>
        p->s.size -= nunits;
 8c4:	29 f1                	sub    %esi,%ecx
 8c6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 8c9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 8cc:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 8cf:	89 15 bc 0c 00 00    	mov    %edx,0xcbc
}
 8d5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 8d8:	83 c0 08             	add    $0x8,%eax
}
 8db:	5b                   	pop    %ebx
 8dc:	5e                   	pop    %esi
 8dd:	5f                   	pop    %edi
 8de:	5d                   	pop    %ebp
 8df:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 8e0:	c7 05 bc 0c 00 00 c0 	movl   $0xcc0,0xcbc
 8e7:	0c 00 00 
    base.s.size = 0;
 8ea:	bf c0 0c 00 00       	mov    $0xcc0,%edi
    base.s.ptr = freep = prevp = &base;
 8ef:	c7 05 c0 0c 00 00 c0 	movl   $0xcc0,0xcc0
 8f6:	0c 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8f9:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 8fb:	c7 05 c4 0c 00 00 00 	movl   $0x0,0xcc4
 902:	00 00 00 
    if(p->s.size >= nunits){
 905:	e9 42 ff ff ff       	jmp    84c <malloc+0x2c>
 90a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 910:	8b 08                	mov    (%eax),%ecx
 912:	89 0a                	mov    %ecx,(%edx)
 914:	eb b9                	jmp    8cf <malloc+0xaf>
