
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
  1f:	74 7f                	je     a0 <main+0xa0>
        printf(2, "Incorrect format. Try: bubblesort x y z\n");
        exit();
    }

    // turning arg into array to process
    int arr[argc-1];
  21:	8d 58 ff             	lea    -0x1(%eax),%ebx
  24:	8d 04 85 0b 00 00 00 	lea    0xb(,%eax,4),%eax
  2b:	83 e0 f0             	and    $0xfffffff0,%eax
  2e:	29 c4                	sub    %eax,%esp
  30:	89 e6                	mov    %esp,%esi

    for (int i = 0; i < argc-1; i++) {
  32:	85 db                	test   %ebx,%ebx
  34:	7e 7d                	jle    b3 <main+0xb3>
  36:	31 ff                	xor    %edi,%edi
  38:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  3f:	00 
        arr[i] = atoi(argv[i+1]);
  40:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  43:	83 ec 0c             	sub    $0xc,%esp
  46:	ff 74 b8 04          	push   0x4(%eax,%edi,4)
  4a:	e8 f1 02 00 00       	call   340 <atoi>
    for (int i = 0; i < argc-1; i++) {
  4f:	83 c4 10             	add    $0x10,%esp
        arr[i] = atoi(argv[i+1]);
  52:	89 04 be             	mov    %eax,(%esi,%edi,4)
    for (int i = 0; i < argc-1; i++) {
  55:	83 c7 01             	add    $0x1,%edi
  58:	39 fb                	cmp    %edi,%ebx
  5a:	75 e4                	jne    40 <main+0x40>
    }

    bubble(arr, argc-1);
  5c:	83 ec 08             	sub    $0x8,%esp
    
    // print everything out
    for (int i = 0; i < argc-1; i++) {
  5f:	31 ff                	xor    %edi,%edi
    bubble(arr, argc-1);
  61:	53                   	push   %ebx
  62:	56                   	push   %esi
  63:	e8 78 00 00 00       	call   e0 <bubble>
  68:	83 c4 10             	add    $0x10,%esp
  6b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        printf(1, "%d ", arr[i]);
  70:	83 ec 04             	sub    $0x4,%esp
  73:	ff 34 be             	push   (%esi,%edi,4)
    for (int i = 0; i < argc-1; i++) {
  76:	83 c7 01             	add    $0x1,%edi
        printf(1, "%d ", arr[i]);
  79:	68 91 09 00 00       	push   $0x991
  7e:	6a 01                	push   $0x1
  80:	e8 7b 05 00 00       	call   600 <printf>
    for (int i = 0; i < argc-1; i++) {
  85:	83 c4 10             	add    $0x10,%esp
  88:	39 fb                	cmp    %edi,%ebx
  8a:	75 e4                	jne    70 <main+0x70>
    }
    printf(1,"\n");
  8c:	83 ec 08             	sub    $0x8,%esp
  8f:	68 95 09 00 00       	push   $0x995
  94:	6a 01                	push   $0x1
  96:	e8 65 05 00 00       	call   600 <printf>
    exit();
  9b:	e8 b6 03 00 00       	call   456 <exit>
        printf(2, "Incorrect format. Try: bubblesort x y z\n");
  a0:	52                   	push   %edx
  a1:	52                   	push   %edx
  a2:	68 68 09 00 00       	push   $0x968
  a7:	6a 02                	push   $0x2
  a9:	e8 52 05 00 00       	call   600 <printf>
        exit();
  ae:	e8 a3 03 00 00       	call   456 <exit>
    bubble(arr, argc-1);
  b3:	50                   	push   %eax
  b4:	50                   	push   %eax
  b5:	53                   	push   %ebx
  b6:	56                   	push   %esi
  b7:	e8 24 00 00 00       	call   e0 <bubble>
  bc:	83 c4 10             	add    $0x10,%esp
  bf:	eb cb                	jmp    8c <main+0x8c>
  c1:	66 90                	xchg   %ax,%ax
  c3:	66 90                	xchg   %ax,%ax
  c5:	66 90                	xchg   %ax,%ax
  c7:	66 90                	xchg   %ax,%ax
  c9:	66 90                	xchg   %ax,%ax
  cb:	66 90                	xchg   %ax,%ax
  cd:	66 90                	xchg   %ax,%ax
  cf:	66 90                	xchg   %ax,%ax
  d1:	66 90                	xchg   %ax,%ax
  d3:	66 90                	xchg   %ax,%ax
  d5:	66 90                	xchg   %ax,%ax
  d7:	66 90                	xchg   %ax,%ax
  d9:	66 90                	xchg   %ax,%ax
  db:	66 90                	xchg   %ax,%ax
  dd:	66 90                	xchg   %ax,%ax
  df:	90                   	nop

000000e0 <bubble>:
void bubble(int *arr, int n) {
  e0:	55                   	push   %ebp
  e1:	89 e5                	mov    %esp,%ebp
  e3:	57                   	push   %edi
  e4:	56                   	push   %esi
  e5:	53                   	push   %ebx
  e6:	83 ec 04             	sub    $0x4,%esp
    for (int i = 0; i < n; i++) {
  e9:	8b 45 0c             	mov    0xc(%ebp),%eax
  ec:	85 c0                	test   %eax,%eax
  ee:	7e 5c                	jle    14c <bubble+0x6c>
  f0:	8b 75 0c             	mov    0xc(%ebp),%esi
  f3:	8b 45 08             	mov    0x8(%ebp),%eax
  f6:	31 c9                	xor    %ecx,%ecx
  f8:	8d 7e ff             	lea    -0x1(%esi),%edi
  fb:	8d 5c b0 fc          	lea    -0x4(%eax,%esi,4),%ebx
  ff:	89 fe                	mov    %edi,%esi
 101:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 108:	00 
 109:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        for (int j = 0; j < (n-i-1); j++) {
 110:	39 f1                	cmp    %esi,%ecx
 112:	74 38                	je     14c <bubble+0x6c>
        swap = 0;
 114:	89 4d f0             	mov    %ecx,-0x10(%ebp)
        for (int j = 0; j < (n-i-1); j++) {
 117:	8b 45 08             	mov    0x8(%ebp),%eax
        swap = 0;
 11a:	31 ff                	xor    %edi,%edi
 11c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
            if (arr[j] > arr[j+1]) {
 120:	8b 10                	mov    (%eax),%edx
 122:	8b 48 04             	mov    0x4(%eax),%ecx
 125:	39 ca                	cmp    %ecx,%edx
 127:	7e 0a                	jle    133 <bubble+0x53>
                arr[j] = arr[j+1];
 129:	89 08                	mov    %ecx,(%eax)
                swap = 1;
 12b:	bf 01 00 00 00       	mov    $0x1,%edi
                arr[j+1] = temp;
 130:	89 50 04             	mov    %edx,0x4(%eax)
        for (int j = 0; j < (n-i-1); j++) {
 133:	83 c0 04             	add    $0x4,%eax
 136:	39 d8                	cmp    %ebx,%eax
 138:	75 e6                	jne    120 <bubble+0x40>
        if (swap == 0) {
 13a:	8b 4d f0             	mov    -0x10(%ebp),%ecx
 13d:	85 ff                	test   %edi,%edi
 13f:	74 0b                	je     14c <bubble+0x6c>
    for (int i = 0; i < n; i++) {
 141:	83 c1 01             	add    $0x1,%ecx
 144:	83 eb 04             	sub    $0x4,%ebx
 147:	39 4d 0c             	cmp    %ecx,0xc(%ebp)
 14a:	75 c4                	jne    110 <bubble+0x30>
}
 14c:	83 c4 04             	add    $0x4,%esp
 14f:	5b                   	pop    %ebx
 150:	5e                   	pop    %esi
 151:	5f                   	pop    %edi
 152:	5d                   	pop    %ebp
 153:	c3                   	ret
 154:	66 90                	xchg   %ax,%ax
 156:	66 90                	xchg   %ax,%ax
 158:	66 90                	xchg   %ax,%ax
 15a:	66 90                	xchg   %ax,%ax
 15c:	66 90                	xchg   %ax,%ax
 15e:	66 90                	xchg   %ax,%ax

00000160 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 160:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 161:	31 c0                	xor    %eax,%eax
{
 163:	89 e5                	mov    %esp,%ebp
 165:	53                   	push   %ebx
 166:	8b 4d 08             	mov    0x8(%ebp),%ecx
 169:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 16c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 170:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 174:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 177:	83 c0 01             	add    $0x1,%eax
 17a:	84 d2                	test   %dl,%dl
 17c:	75 f2                	jne    170 <strcpy+0x10>
    ;
  return os;
}
 17e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 181:	89 c8                	mov    %ecx,%eax
 183:	c9                   	leave
 184:	c3                   	ret
 185:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 18c:	00 
 18d:	8d 76 00             	lea    0x0(%esi),%esi

00000190 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 190:	55                   	push   %ebp
 191:	89 e5                	mov    %esp,%ebp
 193:	53                   	push   %ebx
 194:	8b 55 08             	mov    0x8(%ebp),%edx
 197:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 19a:	0f b6 02             	movzbl (%edx),%eax
 19d:	84 c0                	test   %al,%al
 19f:	75 2f                	jne    1d0 <strcmp+0x40>
 1a1:	eb 4a                	jmp    1ed <strcmp+0x5d>
 1a3:	eb 1b                	jmp    1c0 <strcmp+0x30>
 1a5:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 1ac:	00 
 1ad:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 1b4:	00 
 1b5:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 1bc:	00 
 1bd:	8d 76 00             	lea    0x0(%esi),%esi
 1c0:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 1c4:	83 c2 01             	add    $0x1,%edx
 1c7:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 1ca:	84 c0                	test   %al,%al
 1cc:	74 12                	je     1e0 <strcmp+0x50>
 1ce:	89 d9                	mov    %ebx,%ecx
 1d0:	0f b6 19             	movzbl (%ecx),%ebx
 1d3:	38 c3                	cmp    %al,%bl
 1d5:	74 e9                	je     1c0 <strcmp+0x30>
  return (uchar)*p - (uchar)*q;
 1d7:	29 d8                	sub    %ebx,%eax
}
 1d9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1dc:	c9                   	leave
 1dd:	c3                   	ret
 1de:	66 90                	xchg   %ax,%ax
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
 1f2:	eb e3                	jmp    1d7 <strcmp+0x47>
 1f4:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 1fb:	00 
 1fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

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
 226:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 22d:	00 
 22e:	66 90                	xchg   %ax,%ax

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
 25f:	75 1a                	jne    27b <strchr+0x2b>
 261:	eb 25                	jmp    288 <strchr+0x38>
 263:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 26a:	00 
 26b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 270:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 274:	83 c0 01             	add    $0x1,%eax
 277:	84 d2                	test   %dl,%dl
 279:	74 0d                	je     288 <strchr+0x38>
    if(*s == c)
 27b:	38 d1                	cmp    %dl,%cl
 27d:	75 f1                	jne    270 <strchr+0x20>
      return (char*)s;
  return 0;
}
 27f:	5d                   	pop    %ebp
 280:	c3                   	ret
 281:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 288:	31 c0                	xor    %eax,%eax
}
 28a:	5d                   	pop    %ebp
 28b:	c3                   	ret
 28c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

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
 295:	8d 75 e7             	lea    -0x19(%ebp),%esi
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
 2a5:	56                   	push   %esi
 2a6:	6a 00                	push   $0x0
 2a8:	e8 c1 01 00 00       	call   46e <read>
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
 2c1:	74 10                	je     2d3 <gets+0x43>
 2c3:	3c 0d                	cmp    $0xd,%al
 2c5:	74 0c                	je     2d3 <gets+0x43>
  for(i=0; i+1 < max; ){
 2c7:	89 df                	mov    %ebx,%edi
 2c9:	83 c3 01             	add    $0x1,%ebx
 2cc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 2cf:	7c cf                	jl     2a0 <gets+0x10>
 2d1:	89 fb                	mov    %edi,%ebx
      break;
  }
  buf[i] = '\0';
 2d3:	8b 45 08             	mov    0x8(%ebp),%eax
 2d6:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
 2da:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2dd:	5b                   	pop    %ebx
 2de:	5e                   	pop    %esi
 2df:	5f                   	pop    %edi
 2e0:	5d                   	pop    %ebp
 2e1:	c3                   	ret
 2e2:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 2e9:	00 
 2ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000002f0 <stat>:

int
stat(const char *n, struct stat *st)
{
 2f0:	55                   	push   %ebp
 2f1:	89 e5                	mov    %esp,%ebp
 2f3:	56                   	push   %esi
 2f4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2f5:	83 ec 08             	sub    $0x8,%esp
 2f8:	6a 00                	push   $0x0
 2fa:	ff 75 08             	push   0x8(%ebp)
 2fd:	e8 94 01 00 00       	call   496 <open>
  if(fd < 0)
 302:	83 c4 10             	add    $0x10,%esp
 305:	85 c0                	test   %eax,%eax
 307:	78 27                	js     330 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 309:	83 ec 08             	sub    $0x8,%esp
 30c:	ff 75 0c             	push   0xc(%ebp)
 30f:	89 c3                	mov    %eax,%ebx
 311:	50                   	push   %eax
 312:	e8 97 01 00 00       	call   4ae <fstat>
  close(fd);
 317:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 31a:	89 c6                	mov    %eax,%esi
  close(fd);
 31c:	e8 5d 01 00 00       	call   47e <close>
  return r;
 321:	83 c4 10             	add    $0x10,%esp
}
 324:	8d 65 f8             	lea    -0x8(%ebp),%esp
 327:	89 f0                	mov    %esi,%eax
 329:	5b                   	pop    %ebx
 32a:	5e                   	pop    %esi
 32b:	5d                   	pop    %ebp
 32c:	c3                   	ret
 32d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 330:	be ff ff ff ff       	mov    $0xffffffff,%esi
 335:	eb ed                	jmp    324 <stat+0x34>
 337:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 33e:	00 
 33f:	90                   	nop

00000340 <atoi>:

int
atoi(const char *s)
{
 340:	55                   	push   %ebp
 341:	89 e5                	mov    %esp,%ebp
 343:	53                   	push   %ebx
 344:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 347:	0f be 02             	movsbl (%edx),%eax
 34a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 34d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 350:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 355:	77 1e                	ja     375 <atoi+0x35>
 357:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 35e:	00 
 35f:	90                   	nop
    n = n*10 + *s++ - '0';
 360:	83 c2 01             	add    $0x1,%edx
 363:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 366:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 36a:	0f be 02             	movsbl (%edx),%eax
 36d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 370:	80 fb 09             	cmp    $0x9,%bl
 373:	76 eb                	jbe    360 <atoi+0x20>
  return n;
}
 375:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 378:	89 c8                	mov    %ecx,%eax
 37a:	c9                   	leave
 37b:	c3                   	ret
 37c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000380 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 380:	55                   	push   %ebp
 381:	89 e5                	mov    %esp,%ebp
 383:	57                   	push   %edi
 384:	8b 45 10             	mov    0x10(%ebp),%eax
 387:	8b 55 08             	mov    0x8(%ebp),%edx
 38a:	56                   	push   %esi
 38b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 38e:	85 c0                	test   %eax,%eax
 390:	7e 13                	jle    3a5 <memmove+0x25>
 392:	01 d0                	add    %edx,%eax
  dst = vdst;
 394:	89 d7                	mov    %edx,%edi
 396:	66 90                	xchg   %ax,%ax
 398:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 39f:	00 
    *dst++ = *src++;
 3a0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 3a1:	39 f8                	cmp    %edi,%eax
 3a3:	75 fb                	jne    3a0 <memmove+0x20>
  return vdst;
}
 3a5:	5e                   	pop    %esi
 3a6:	89 d0                	mov    %edx,%eax
 3a8:	5f                   	pop    %edi
 3a9:	5d                   	pop    %ebp
 3aa:	c3                   	ret
 3ab:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

000003b0 <sqrt>:


// https://www.geeksforgeeks.org/c-program-to-find-square-root-of-a-given-number/
float sqrt(int num) {
 3b0:	55                   	push   %ebp
 3b1:	89 e5                	mov    %esp,%ebp
 3b3:	56                   	push   %esi
 3b4:	53                   	push   %ebx
 3b5:	83 ec 04             	sub    $0x4,%esp
 3b8:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int end = num;
  int middle;

  float solution = 0.0;

  while (start <= end) {
 3bb:	85 db                	test   %ebx,%ebx
 3bd:	0f 88 87 00 00 00    	js     44a <sqrt+0x9a>
  int end = num;
 3c3:	89 d9                	mov    %ebx,%ecx
  float solution = 0.0;
 3c5:	d9 ee                	fldz
  int start = 0;
 3c7:	31 d2                	xor    %edx,%edx
 3c9:	eb 14                	jmp    3df <sqrt+0x2f>
 3cb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 3d0:	dd d8                	fstp   %st(0)
    if (middle * middle == num) {
      solution = middle;
      break;
    }
    if (middle * middle < num) {
      solution = start;
 3d2:	89 55 f4             	mov    %edx,-0xc(%ebp)
      start = middle + 1;
 3d5:	8d 50 01             	lea    0x1(%eax),%edx
      solution = start;
 3d8:	db 45 f4             	fildl  -0xc(%ebp)
  while (start <= end) {
 3db:	39 ca                	cmp    %ecx,%edx
 3dd:	7f 1e                	jg     3fd <sqrt+0x4d>
    middle = (start + end) / 2;
 3df:	8d 34 0a             	lea    (%edx,%ecx,1),%esi
 3e2:	89 f0                	mov    %esi,%eax
 3e4:	c1 e8 1f             	shr    $0x1f,%eax
 3e7:	01 f0                	add    %esi,%eax
 3e9:	d1 f8                	sar    $1,%eax
    if (middle * middle == num) {
 3eb:	89 c6                	mov    %eax,%esi
 3ed:	0f af f0             	imul   %eax,%esi
 3f0:	39 de                	cmp    %ebx,%esi
 3f2:	74 4c                	je     440 <sqrt+0x90>
    if (middle * middle < num) {
 3f4:	7c da                	jl     3d0 <sqrt+0x20>
    }
    else {
      end = middle - 1;
 3f6:	8d 48 ff             	lea    -0x1(%eax),%ecx
  while (start <= end) {
 3f9:	39 ca                	cmp    %ecx,%edx
 3fb:	7e e2                	jle    3df <sqrt+0x2f>

  float eps = 0.1;
  int i;

  for (i = 0; i < 5; i++) {
    while (solution * solution <= num) {
 3fd:	89 5d f4             	mov    %ebx,-0xc(%ebp)
 400:	b8 05 00 00 00       	mov    $0x5,%eax
 405:	db 45 f4             	fildl  -0xc(%ebp)
 408:	d9 05 a0 09 00 00    	flds   0x9a0
 40e:	eb 02                	jmp    412 <sqrt+0x62>
      solution += eps;
 410:	dc c2                	fadd   %st,%st(2)
    while (solution * solution <= num) {
 412:	d9 c2                	fld    %st(2)
 414:	d8 cb                	fmul   %st(3),%st
 416:	d9 ca                	fxch   %st(2)
 418:	db f2                	fcomi  %st(2),%st
 41a:	dd da                	fstp   %st(2)
 41c:	73 f2                	jae    410 <sqrt+0x60>
    }
    solution = solution - eps;
 41e:	dc ea                	fsubr  %st,%st(2)
    eps = eps / 10;
 420:	d8 35 a4 09 00 00    	fdivs  0x9a4
  for (i = 0; i < 5; i++) {
 426:	83 e8 01             	sub    $0x1,%eax
 429:	75 e7                	jne    412 <sqrt+0x62>
 42b:	dd d8                	fstp   %st(0)
 42d:	dd d8                	fstp   %st(0)
  }
  return solution;

}
 42f:	83 c4 04             	add    $0x4,%esp
 432:	5b                   	pop    %ebx
 433:	5e                   	pop    %esi
 434:	5d                   	pop    %ebp
 435:	c3                   	ret
 436:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 43d:	00 
 43e:	66 90                	xchg   %ax,%ax
 440:	dd d8                	fstp   %st(0)
      solution = middle;
 442:	89 45 f4             	mov    %eax,-0xc(%ebp)
 445:	db 45 f4             	fildl  -0xc(%ebp)
      break;
 448:	eb b3                	jmp    3fd <sqrt+0x4d>
  float solution = 0.0;
 44a:	d9 ee                	fldz
 44c:	eb af                	jmp    3fd <sqrt+0x4d>

0000044e <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 44e:	b8 01 00 00 00       	mov    $0x1,%eax
 453:	cd 40                	int    $0x40
 455:	c3                   	ret

00000456 <exit>:
SYSCALL(exit)
 456:	b8 02 00 00 00       	mov    $0x2,%eax
 45b:	cd 40                	int    $0x40
 45d:	c3                   	ret

0000045e <wait>:
SYSCALL(wait)
 45e:	b8 03 00 00 00       	mov    $0x3,%eax
 463:	cd 40                	int    $0x40
 465:	c3                   	ret

00000466 <pipe>:
SYSCALL(pipe)
 466:	b8 04 00 00 00       	mov    $0x4,%eax
 46b:	cd 40                	int    $0x40
 46d:	c3                   	ret

0000046e <read>:
SYSCALL(read)
 46e:	b8 05 00 00 00       	mov    $0x5,%eax
 473:	cd 40                	int    $0x40
 475:	c3                   	ret

00000476 <write>:
SYSCALL(write)
 476:	b8 10 00 00 00       	mov    $0x10,%eax
 47b:	cd 40                	int    $0x40
 47d:	c3                   	ret

0000047e <close>:
SYSCALL(close)
 47e:	b8 15 00 00 00       	mov    $0x15,%eax
 483:	cd 40                	int    $0x40
 485:	c3                   	ret

00000486 <kill>:
SYSCALL(kill)
 486:	b8 06 00 00 00       	mov    $0x6,%eax
 48b:	cd 40                	int    $0x40
 48d:	c3                   	ret

0000048e <exec>:
SYSCALL(exec)
 48e:	b8 07 00 00 00       	mov    $0x7,%eax
 493:	cd 40                	int    $0x40
 495:	c3                   	ret

00000496 <open>:
SYSCALL(open)
 496:	b8 0f 00 00 00       	mov    $0xf,%eax
 49b:	cd 40                	int    $0x40
 49d:	c3                   	ret

0000049e <mknod>:
SYSCALL(mknod)
 49e:	b8 11 00 00 00       	mov    $0x11,%eax
 4a3:	cd 40                	int    $0x40
 4a5:	c3                   	ret

000004a6 <unlink>:
SYSCALL(unlink)
 4a6:	b8 12 00 00 00       	mov    $0x12,%eax
 4ab:	cd 40                	int    $0x40
 4ad:	c3                   	ret

000004ae <fstat>:
SYSCALL(fstat)
 4ae:	b8 08 00 00 00       	mov    $0x8,%eax
 4b3:	cd 40                	int    $0x40
 4b5:	c3                   	ret

000004b6 <link>:
SYSCALL(link)
 4b6:	b8 13 00 00 00       	mov    $0x13,%eax
 4bb:	cd 40                	int    $0x40
 4bd:	c3                   	ret

000004be <mkdir>:
SYSCALL(mkdir)
 4be:	b8 14 00 00 00       	mov    $0x14,%eax
 4c3:	cd 40                	int    $0x40
 4c5:	c3                   	ret

000004c6 <chdir>:
SYSCALL(chdir)
 4c6:	b8 09 00 00 00       	mov    $0x9,%eax
 4cb:	cd 40                	int    $0x40
 4cd:	c3                   	ret

000004ce <dup>:
SYSCALL(dup)
 4ce:	b8 0a 00 00 00       	mov    $0xa,%eax
 4d3:	cd 40                	int    $0x40
 4d5:	c3                   	ret

000004d6 <getpid>:
SYSCALL(getpid)
 4d6:	b8 0b 00 00 00       	mov    $0xb,%eax
 4db:	cd 40                	int    $0x40
 4dd:	c3                   	ret

000004de <sbrk>:
SYSCALL(sbrk)
 4de:	b8 0c 00 00 00       	mov    $0xc,%eax
 4e3:	cd 40                	int    $0x40
 4e5:	c3                   	ret

000004e6 <sleep>:
SYSCALL(sleep)
 4e6:	b8 0d 00 00 00       	mov    $0xd,%eax
 4eb:	cd 40                	int    $0x40
 4ed:	c3                   	ret

000004ee <uptime>:
SYSCALL(uptime)
 4ee:	b8 0e 00 00 00       	mov    $0xe,%eax
 4f3:	cd 40                	int    $0x40
 4f5:	c3                   	ret

000004f6 <gettid>:
SYSCALL(gettid)
 4f6:	b8 16 00 00 00       	mov    $0x16,%eax
 4fb:	cd 40                	int    $0x40
 4fd:	c3                   	ret

000004fe <getpgid>:
SYSCALL(getpgid)
 4fe:	b8 17 00 00 00       	mov    $0x17,%eax
 503:	cd 40                	int    $0x40
 505:	c3                   	ret

00000506 <setpgid>:
SYSCALL(setpgid)
 506:	b8 18 00 00 00       	mov    $0x18,%eax
 50b:	cd 40                	int    $0x40
 50d:	c3                   	ret

0000050e <getppid>:
SYSCALL(getppid)
 50e:	b8 19 00 00 00       	mov    $0x19,%eax
 513:	cd 40                	int    $0x40
 515:	c3                   	ret

00000516 <uptime_ms>:
SYSCALL(uptime_ms)
 516:	b8 1a 00 00 00       	mov    $0x1a,%eax
 51b:	cd 40                	int    $0x40
 51d:	c3                   	ret

0000051e <setpriority>:
 51e:	b8 1b 00 00 00       	mov    $0x1b,%eax
 523:	cd 40                	int    $0x40
 525:	c3                   	ret
 526:	66 90                	xchg   %ax,%ax
 528:	66 90                	xchg   %ax,%ax
 52a:	66 90                	xchg   %ax,%ax
 52c:	66 90                	xchg   %ax,%ax
 52e:	66 90                	xchg   %ax,%ax
 530:	66 90                	xchg   %ax,%ax
 532:	66 90                	xchg   %ax,%ax
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
 546:	89 cb                	mov    %ecx,%ebx
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 548:	89 d1                	mov    %edx,%ecx
{
 54a:	83 ec 3c             	sub    $0x3c,%esp
 54d:	89 45 c4             	mov    %eax,-0x3c(%ebp)
  if(sgn && xx < 0){
 550:	85 d2                	test   %edx,%edx
 552:	0f 89 98 00 00 00    	jns    5f0 <printint+0xb0>
 558:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 55c:	0f 84 8e 00 00 00    	je     5f0 <printint+0xb0>
    x = -xx;
 562:	f7 d9                	neg    %ecx
    neg = 1;
 564:	b8 01 00 00 00       	mov    $0x1,%eax
  } else {
    x = xx;
  }

  i = 0;
 569:	89 45 c0             	mov    %eax,-0x40(%ebp)
 56c:	31 f6                	xor    %esi,%esi
 56e:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 575:	00 
 576:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 57d:	00 
 57e:	66 90                	xchg   %ax,%ax
  do{
    buf[i++] = digits[x % base];
 580:	89 c8                	mov    %ecx,%eax
 582:	31 d2                	xor    %edx,%edx
 584:	89 f7                	mov    %esi,%edi
 586:	f7 f3                	div    %ebx
 588:	8d 76 01             	lea    0x1(%esi),%esi
 58b:	0f b6 92 00 0a 00 00 	movzbl 0xa00(%edx),%edx
 592:	88 54 35 d7          	mov    %dl,-0x29(%ebp,%esi,1)
  }while((x /= base) != 0);
 596:	89 ca                	mov    %ecx,%edx
 598:	89 c1                	mov    %eax,%ecx
 59a:	39 da                	cmp    %ebx,%edx
 59c:	73 e2                	jae    580 <printint+0x40>
  if(neg)
 59e:	8b 45 c0             	mov    -0x40(%ebp),%eax
 5a1:	85 c0                	test   %eax,%eax
 5a3:	74 07                	je     5ac <printint+0x6c>
    buf[i++] = '-';
 5a5:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)
 5aa:	89 f7                	mov    %esi,%edi

  while(--i >= 0)
 5ac:	8d 5d d8             	lea    -0x28(%ebp),%ebx
 5af:	8b 75 c4             	mov    -0x3c(%ebp),%esi
 5b2:	01 df                	add    %ebx,%edi
 5b4:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 5bb:	00 
 5bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    putc(fd, buf[i]);
 5c0:	0f b6 07             	movzbl (%edi),%eax
  write(fd, &c, 1);
 5c3:	83 ec 04             	sub    $0x4,%esp
 5c6:	88 45 d7             	mov    %al,-0x29(%ebp)
 5c9:	8d 45 d7             	lea    -0x29(%ebp),%eax
 5cc:	6a 01                	push   $0x1
 5ce:	50                   	push   %eax
 5cf:	56                   	push   %esi
 5d0:	e8 a1 fe ff ff       	call   476 <write>
  while(--i >= 0)
 5d5:	89 f8                	mov    %edi,%eax
 5d7:	83 c4 10             	add    $0x10,%esp
 5da:	83 ef 01             	sub    $0x1,%edi
 5dd:	39 d8                	cmp    %ebx,%eax
 5df:	75 df                	jne    5c0 <printint+0x80>
}
 5e1:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5e4:	5b                   	pop    %ebx
 5e5:	5e                   	pop    %esi
 5e6:	5f                   	pop    %edi
 5e7:	5d                   	pop    %ebp
 5e8:	c3                   	ret
 5e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 5f0:	31 c0                	xor    %eax,%eax
 5f2:	e9 72 ff ff ff       	jmp    569 <printint+0x29>
 5f7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 5fe:	00 
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
 612:	83 c3 01             	add    $0x1,%ebx
 615:	84 d2                	test   %dl,%dl
 617:	0f 84 a0 00 00 00    	je     6bd <printf+0xbd>
 61d:	8d 45 10             	lea    0x10(%ebp),%eax
 620:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    c = fmt[i] & 0xff;
 623:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 626:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 629:	eb 28                	jmp    653 <printf+0x53>
 62b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 630:	83 ec 04             	sub    $0x4,%esp
 633:	8d 45 e7             	lea    -0x19(%ebp),%eax
 636:	88 55 e7             	mov    %dl,-0x19(%ebp)
  for(i = 0; fmt[i]; i++){
 639:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 63c:	6a 01                	push   $0x1
 63e:	50                   	push   %eax
 63f:	56                   	push   %esi
 640:	e8 31 fe ff ff       	call   476 <write>
  for(i = 0; fmt[i]; i++){
 645:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 649:	83 c4 10             	add    $0x10,%esp
 64c:	84 d2                	test   %dl,%dl
 64e:	74 6d                	je     6bd <printf+0xbd>
    c = fmt[i] & 0xff;
 650:	0f b6 c2             	movzbl %dl,%eax
      if(c == '%'){
 653:	83 f8 25             	cmp    $0x25,%eax
 656:	75 d8                	jne    630 <printf+0x30>
  for(i = 0; fmt[i]; i++){
 658:	0f b6 13             	movzbl (%ebx),%edx
 65b:	84 d2                	test   %dl,%dl
 65d:	74 5e                	je     6bd <printf+0xbd>
    c = fmt[i] & 0xff;
 65f:	0f b6 c2             	movzbl %dl,%eax
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
 662:	80 fa 25             	cmp    $0x25,%dl
 665:	0f 84 1d 01 00 00    	je     788 <printf+0x188>
 66b:	83 e8 63             	sub    $0x63,%eax
 66e:	83 f8 15             	cmp    $0x15,%eax
 671:	77 0d                	ja     680 <printf+0x80>
 673:	ff 24 85 a8 09 00 00 	jmp    *0x9a8(,%eax,4)
 67a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 680:	83 ec 04             	sub    $0x4,%esp
 683:	8d 4d e7             	lea    -0x19(%ebp),%ecx
 686:	88 55 d0             	mov    %dl,-0x30(%ebp)
        ap++;
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 689:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
  write(fd, &c, 1);
 68d:	6a 01                	push   $0x1
 68f:	51                   	push   %ecx
 690:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
 693:	56                   	push   %esi
 694:	e8 dd fd ff ff       	call   476 <write>
        putc(fd, c);
 699:	0f b6 55 d0          	movzbl -0x30(%ebp),%edx
  write(fd, &c, 1);
 69d:	83 c4 0c             	add    $0xc,%esp
 6a0:	88 55 e7             	mov    %dl,-0x19(%ebp)
 6a3:	6a 01                	push   $0x1
 6a5:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
 6a8:	51                   	push   %ecx
 6a9:	56                   	push   %esi
 6aa:	e8 c7 fd ff ff       	call   476 <write>
  for(i = 0; fmt[i]; i++){
 6af:	0f b6 53 01          	movzbl 0x1(%ebx),%edx
 6b3:	83 c3 02             	add    $0x2,%ebx
 6b6:	83 c4 10             	add    $0x10,%esp
 6b9:	84 d2                	test   %dl,%dl
 6bb:	75 93                	jne    650 <printf+0x50>
      }
      state = 0;
    }
  }
}
 6bd:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6c0:	5b                   	pop    %ebx
 6c1:	5e                   	pop    %esi
 6c2:	5f                   	pop    %edi
 6c3:	5d                   	pop    %ebp
 6c4:	c3                   	ret
 6c5:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 6c8:	83 ec 0c             	sub    $0xc,%esp
 6cb:	8b 17                	mov    (%edi),%edx
 6cd:	b9 10 00 00 00       	mov    $0x10,%ecx
 6d2:	89 f0                	mov    %esi,%eax
 6d4:	6a 00                	push   $0x0
        ap++;
 6d6:	83 c7 04             	add    $0x4,%edi
        printint(fd, *ap, 16, 0);
 6d9:	e8 62 fe ff ff       	call   540 <printint>
  for(i = 0; fmt[i]; i++){
 6de:	eb cf                	jmp    6af <printf+0xaf>
        s = (char*)*ap;
 6e0:	8b 07                	mov    (%edi),%eax
        ap++;
 6e2:	83 c7 04             	add    $0x4,%edi
        if(s == 0)
 6e5:	85 c0                	test   %eax,%eax
 6e7:	0f 84 b3 00 00 00    	je     7a0 <printf+0x1a0>
        while(*s != 0){
 6ed:	0f b6 10             	movzbl (%eax),%edx
 6f0:	84 d2                	test   %dl,%dl
 6f2:	0f 84 ba 00 00 00    	je     7b2 <printf+0x1b2>
 6f8:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 6fb:	89 c7                	mov    %eax,%edi
 6fd:	89 d0                	mov    %edx,%eax
 6ff:	8d 4d e7             	lea    -0x19(%ebp),%ecx
 702:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 705:	89 fb                	mov    %edi,%ebx
 707:	89 cf                	mov    %ecx,%edi
 709:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 710:	83 ec 04             	sub    $0x4,%esp
 713:	88 45 e7             	mov    %al,-0x19(%ebp)
          s++;
 716:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 719:	6a 01                	push   $0x1
 71b:	57                   	push   %edi
 71c:	56                   	push   %esi
 71d:	e8 54 fd ff ff       	call   476 <write>
        while(*s != 0){
 722:	0f b6 03             	movzbl (%ebx),%eax
 725:	83 c4 10             	add    $0x10,%esp
 728:	84 c0                	test   %al,%al
 72a:	75 e4                	jne    710 <printf+0x110>
 72c:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  for(i = 0; fmt[i]; i++){
 72f:	0f b6 53 01          	movzbl 0x1(%ebx),%edx
 733:	83 c3 02             	add    $0x2,%ebx
 736:	84 d2                	test   %dl,%dl
 738:	0f 85 e5 fe ff ff    	jne    623 <printf+0x23>
 73e:	e9 7a ff ff ff       	jmp    6bd <printf+0xbd>
 743:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 748:	83 ec 0c             	sub    $0xc,%esp
 74b:	8b 17                	mov    (%edi),%edx
 74d:	b9 0a 00 00 00       	mov    $0xa,%ecx
 752:	89 f0                	mov    %esi,%eax
 754:	6a 01                	push   $0x1
        ap++;
 756:	83 c7 04             	add    $0x4,%edi
        printint(fd, *ap, 10, 1);
 759:	e8 e2 fd ff ff       	call   540 <printint>
  for(i = 0; fmt[i]; i++){
 75e:	e9 4c ff ff ff       	jmp    6af <printf+0xaf>
 763:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 768:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
 76a:	83 ec 04             	sub    $0x4,%esp
 76d:	8d 4d e7             	lea    -0x19(%ebp),%ecx
        ap++;
 770:	83 c7 04             	add    $0x4,%edi
        putc(fd, *ap);
 773:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 776:	6a 01                	push   $0x1
 778:	51                   	push   %ecx
 779:	56                   	push   %esi
 77a:	e8 f7 fc ff ff       	call   476 <write>
  for(i = 0; fmt[i]; i++){
 77f:	e9 2b ff ff ff       	jmp    6af <printf+0xaf>
 784:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 788:	83 ec 04             	sub    $0x4,%esp
 78b:	88 55 e7             	mov    %dl,-0x19(%ebp)
 78e:	8d 4d e7             	lea    -0x19(%ebp),%ecx
 791:	6a 01                	push   $0x1
 793:	e9 10 ff ff ff       	jmp    6a8 <printf+0xa8>
 798:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 79f:	00 
          s = "(null)";
 7a0:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 7a3:	b8 28 00 00 00       	mov    $0x28,%eax
 7a8:	bf 97 09 00 00       	mov    $0x997,%edi
 7ad:	e9 4d ff ff ff       	jmp    6ff <printf+0xff>
  for(i = 0; fmt[i]; i++){
 7b2:	0f b6 53 01          	movzbl 0x1(%ebx),%edx
 7b6:	83 c3 02             	add    $0x2,%ebx
 7b9:	84 d2                	test   %dl,%dl
 7bb:	0f 85 8f fe ff ff    	jne    650 <printf+0x50>
 7c1:	e9 f7 fe ff ff       	jmp    6bd <printf+0xbd>
 7c6:	66 90                	xchg   %ax,%ax
 7c8:	66 90                	xchg   %ax,%ax
 7ca:	66 90                	xchg   %ax,%ax
 7cc:	66 90                	xchg   %ax,%ax
 7ce:	66 90                	xchg   %ax,%ax
 7d0:	66 90                	xchg   %ax,%ax
 7d2:	66 90                	xchg   %ax,%ax
 7d4:	66 90                	xchg   %ax,%ax
 7d6:	66 90                	xchg   %ax,%ax
 7d8:	66 90                	xchg   %ax,%ax
 7da:	66 90                	xchg   %ax,%ax
 7dc:	66 90                	xchg   %ax,%ax
 7de:	66 90                	xchg   %ax,%ax

000007e0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7e0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7e1:	a1 14 0a 00 00       	mov    0xa14,%eax
{
 7e6:	89 e5                	mov    %esp,%ebp
 7e8:	57                   	push   %edi
 7e9:	56                   	push   %esi
 7ea:	53                   	push   %ebx
 7eb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 7ee:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7f1:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 7f8:	00 
 7f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 800:	89 c2                	mov    %eax,%edx
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 802:	8b 00                	mov    (%eax),%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 804:	39 ca                	cmp    %ecx,%edx
 806:	73 30                	jae    838 <free+0x58>
 808:	39 c1                	cmp    %eax,%ecx
 80a:	72 04                	jb     810 <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 80c:	39 c2                	cmp    %eax,%edx
 80e:	72 f0                	jb     800 <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
 810:	8b 73 fc             	mov    -0x4(%ebx),%esi
 813:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 816:	39 f8                	cmp    %edi,%eax
 818:	74 36                	je     850 <free+0x70>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 81a:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 81d:	8b 42 04             	mov    0x4(%edx),%eax
 820:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 823:	39 f1                	cmp    %esi,%ecx
 825:	74 40                	je     867 <free+0x87>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 827:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 829:	5b                   	pop    %ebx
  freep = p;
 82a:	89 15 14 0a 00 00    	mov    %edx,0xa14
}
 830:	5e                   	pop    %esi
 831:	5f                   	pop    %edi
 832:	5d                   	pop    %ebp
 833:	c3                   	ret
 834:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 838:	39 c2                	cmp    %eax,%edx
 83a:	72 c4                	jb     800 <free+0x20>
 83c:	39 c1                	cmp    %eax,%ecx
 83e:	73 c0                	jae    800 <free+0x20>
  if(bp + bp->s.size == p->s.ptr){
 840:	8b 73 fc             	mov    -0x4(%ebx),%esi
 843:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 846:	39 f8                	cmp    %edi,%eax
 848:	75 d0                	jne    81a <free+0x3a>
 84a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    bp->s.size += p->s.ptr->s.size;
 850:	03 70 04             	add    0x4(%eax),%esi
 853:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 856:	8b 02                	mov    (%edx),%eax
 858:	8b 00                	mov    (%eax),%eax
 85a:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 85d:	8b 42 04             	mov    0x4(%edx),%eax
 860:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 863:	39 f1                	cmp    %esi,%ecx
 865:	75 c0                	jne    827 <free+0x47>
    p->s.size += bp->s.size;
 867:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 86a:	89 15 14 0a 00 00    	mov    %edx,0xa14
    p->s.size += bp->s.size;
 870:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 873:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 876:	89 0a                	mov    %ecx,(%edx)
}
 878:	5b                   	pop    %ebx
 879:	5e                   	pop    %esi
 87a:	5f                   	pop    %edi
 87b:	5d                   	pop    %ebp
 87c:	c3                   	ret
 87d:	8d 76 00             	lea    0x0(%esi),%esi

00000880 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 880:	55                   	push   %ebp
 881:	89 e5                	mov    %esp,%ebp
 883:	57                   	push   %edi
 884:	56                   	push   %esi
 885:	53                   	push   %ebx
 886:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 889:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 88c:	8b 15 14 0a 00 00    	mov    0xa14,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 892:	8d 78 07             	lea    0x7(%eax),%edi
 895:	c1 ef 03             	shr    $0x3,%edi
 898:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 89b:	85 d2                	test   %edx,%edx
 89d:	0f 84 8d 00 00 00    	je     930 <malloc+0xb0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8a3:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 8a5:	8b 48 04             	mov    0x4(%eax),%ecx
 8a8:	39 f9                	cmp    %edi,%ecx
 8aa:	73 64                	jae    910 <malloc+0x90>
  if(nu < 4096)
 8ac:	bb 00 10 00 00       	mov    $0x1000,%ebx
 8b1:	39 df                	cmp    %ebx,%edi
 8b3:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 8b6:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 8bd:	eb 0a                	jmp    8c9 <malloc+0x49>
 8bf:	90                   	nop
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8c0:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 8c2:	8b 48 04             	mov    0x4(%eax),%ecx
 8c5:	39 f9                	cmp    %edi,%ecx
 8c7:	73 47                	jae    910 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 8c9:	89 c2                	mov    %eax,%edx
 8cb:	39 05 14 0a 00 00    	cmp    %eax,0xa14
 8d1:	75 ed                	jne    8c0 <malloc+0x40>
  p = sbrk(nu * sizeof(Header));
 8d3:	83 ec 0c             	sub    $0xc,%esp
 8d6:	56                   	push   %esi
 8d7:	e8 02 fc ff ff       	call   4de <sbrk>
  if(p == (char*)-1)
 8dc:	83 c4 10             	add    $0x10,%esp
 8df:	83 f8 ff             	cmp    $0xffffffff,%eax
 8e2:	74 1c                	je     900 <malloc+0x80>
  hp->s.size = nu;
 8e4:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 8e7:	83 ec 0c             	sub    $0xc,%esp
 8ea:	83 c0 08             	add    $0x8,%eax
 8ed:	50                   	push   %eax
 8ee:	e8 ed fe ff ff       	call   7e0 <free>
  return freep;
 8f3:	8b 15 14 0a 00 00    	mov    0xa14,%edx
      if((p = morecore(nunits)) == 0)
 8f9:	83 c4 10             	add    $0x10,%esp
 8fc:	85 d2                	test   %edx,%edx
 8fe:	75 c0                	jne    8c0 <malloc+0x40>
        return 0;
  }
}
 900:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 903:	31 c0                	xor    %eax,%eax
}
 905:	5b                   	pop    %ebx
 906:	5e                   	pop    %esi
 907:	5f                   	pop    %edi
 908:	5d                   	pop    %ebp
 909:	c3                   	ret
 90a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 910:	39 cf                	cmp    %ecx,%edi
 912:	74 4c                	je     960 <malloc+0xe0>
        p->s.size -= nunits;
 914:	29 f9                	sub    %edi,%ecx
 916:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 919:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 91c:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 91f:	89 15 14 0a 00 00    	mov    %edx,0xa14
}
 925:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 928:	83 c0 08             	add    $0x8,%eax
}
 92b:	5b                   	pop    %ebx
 92c:	5e                   	pop    %esi
 92d:	5f                   	pop    %edi
 92e:	5d                   	pop    %ebp
 92f:	c3                   	ret
    base.s.ptr = freep = prevp = &base;
 930:	c7 05 14 0a 00 00 18 	movl   $0xa18,0xa14
 937:	0a 00 00 
    base.s.size = 0;
 93a:	b8 18 0a 00 00       	mov    $0xa18,%eax
    base.s.ptr = freep = prevp = &base;
 93f:	c7 05 18 0a 00 00 18 	movl   $0xa18,0xa18
 946:	0a 00 00 
    base.s.size = 0;
 949:	c7 05 1c 0a 00 00 00 	movl   $0x0,0xa1c
 950:	00 00 00 
    if(p->s.size >= nunits){
 953:	e9 54 ff ff ff       	jmp    8ac <malloc+0x2c>
 958:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 95f:	00 
        prevp->s.ptr = p->s.ptr;
 960:	8b 08                	mov    (%eax),%ecx
 962:	89 0a                	mov    %ecx,(%edx)
 964:	eb b9                	jmp    91f <malloc+0x9f>
