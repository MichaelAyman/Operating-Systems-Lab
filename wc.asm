
_wc:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  printf(1, "%d %d %d %s\n", l, w, c, name);
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
   e:	bf 01 00 00 00       	mov    $0x1,%edi
  13:	56                   	push   %esi
  14:	53                   	push   %ebx
  15:	51                   	push   %ecx
  16:	83 ec 18             	sub    $0x18,%esp
  19:	8b 01                	mov    (%ecx),%eax
  1b:	8b 71 04             	mov    0x4(%ecx),%esi
  1e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  int fd, i;

  if(argc <= 1){
  21:	83 f8 01             	cmp    $0x1,%eax
  24:	7e 58                	jle    7e <main+0x7e>
  26:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  2d:	00 
  2e:	66 90                	xchg   %ax,%ax
    wc(0, "");
    exit();
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
  30:	83 ec 08             	sub    $0x8,%esp
  33:	6a 00                	push   $0x0
  35:	ff 34 be             	push   (%esi,%edi,4)
  38:	e8 79 04 00 00       	call   4b6 <open>
  3d:	83 c4 10             	add    $0x10,%esp
  40:	89 c3                	mov    %eax,%ebx
      printf(1, "wc: cannot open %s\n", argv[i]);
  42:	8b 04 be             	mov    (%esi,%edi,4),%eax
    if((fd = open(argv[i], 0)) < 0){
  45:	85 db                	test   %ebx,%ebx
  47:	78 22                	js     6b <main+0x6b>
      exit();
    }
    wc(fd, argv[i]);
  49:	83 ec 08             	sub    $0x8,%esp
  for(i = 1; i < argc; i++){
  4c:	83 c7 01             	add    $0x1,%edi
    wc(fd, argv[i]);
  4f:	50                   	push   %eax
  50:	53                   	push   %ebx
  51:	e8 4a 00 00 00       	call   a0 <wc>
    close(fd);
  56:	89 1c 24             	mov    %ebx,(%esp)
  59:	e8 40 04 00 00       	call   49e <close>
  for(i = 1; i < argc; i++){
  5e:	83 c4 10             	add    $0x10,%esp
  61:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
  64:	75 ca                	jne    30 <main+0x30>
  }
  exit();
  66:	e8 0b 04 00 00       	call   476 <exit>
      printf(1, "wc: cannot open %s\n", argv[i]);
  6b:	52                   	push   %edx
  6c:	50                   	push   %eax
  6d:	68 ab 09 00 00       	push   $0x9ab
  72:	6a 01                	push   $0x1
  74:	e8 a7 05 00 00       	call   620 <printf>
      exit();
  79:	e8 f8 03 00 00       	call   476 <exit>
    wc(0, "");
  7e:	51                   	push   %ecx
  7f:	51                   	push   %ecx
  80:	68 9d 09 00 00       	push   $0x99d
  85:	6a 00                	push   $0x0
  87:	e8 14 00 00 00       	call   a0 <wc>
    exit();
  8c:	e8 e5 03 00 00       	call   476 <exit>
  91:	66 90                	xchg   %ax,%ax
  93:	66 90                	xchg   %ax,%ax
  95:	66 90                	xchg   %ax,%ax
  97:	66 90                	xchg   %ax,%ax
  99:	66 90                	xchg   %ax,%ax
  9b:	66 90                	xchg   %ax,%ax
  9d:	66 90                	xchg   %ax,%ax
  9f:	90                   	nop

000000a0 <wc>:
{
  a0:	55                   	push   %ebp
  l = w = c = 0;
  a1:	31 d2                	xor    %edx,%edx
{
  a3:	89 e5                	mov    %esp,%ebp
  a5:	57                   	push   %edi
  a6:	56                   	push   %esi
  inword = 0;
  a7:	31 f6                	xor    %esi,%esi
{
  a9:	53                   	push   %ebx
  l = w = c = 0;
  aa:	31 db                	xor    %ebx,%ebx
{
  ac:	83 ec 1c             	sub    $0x1c,%esp
  l = w = c = 0;
  af:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  b6:	89 55 dc             	mov    %edx,-0x24(%ebp)
  b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  while((n = read(fd, buf, sizeof(buf))) > 0){
  c0:	83 ec 04             	sub    $0x4,%esp
  c3:	68 00 02 00 00       	push   $0x200
  c8:	68 40 0a 00 00       	push   $0xa40
  cd:	ff 75 08             	push   0x8(%ebp)
  d0:	e8 b9 03 00 00       	call   48e <read>
  d5:	83 c4 10             	add    $0x10,%esp
  d8:	89 c1                	mov    %eax,%ecx
  da:	85 c0                	test   %eax,%eax
  dc:	7e 62                	jle    140 <wc+0xa0>
    for(i=0; i<n; i++){
  de:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
  e1:	31 ff                	xor    %edi,%edi
  e3:	eb 0d                	jmp    f2 <wc+0x52>
  e5:	8d 76 00             	lea    0x0(%esi),%esi
        inword = 0;
  e8:	31 f6                	xor    %esi,%esi
    for(i=0; i<n; i++){
  ea:	83 c7 01             	add    $0x1,%edi
  ed:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
  f0:	74 3e                	je     130 <wc+0x90>
      if(buf[i] == '\n')
  f2:	0f be 87 40 0a 00 00 	movsbl 0xa40(%edi),%eax
        l++;
  f9:	31 c9                	xor    %ecx,%ecx
  fb:	3c 0a                	cmp    $0xa,%al
  fd:	0f 94 c1             	sete   %cl
      if(strchr(" \r\t\n\v", buf[i]))
 100:	83 ec 08             	sub    $0x8,%esp
 103:	50                   	push   %eax
        l++;
 104:	01 cb                	add    %ecx,%ebx
      if(strchr(" \r\t\n\v", buf[i]))
 106:	68 88 09 00 00       	push   $0x988
 10b:	e8 60 01 00 00       	call   270 <strchr>
 110:	83 c4 10             	add    $0x10,%esp
 113:	85 c0                	test   %eax,%eax
 115:	75 d1                	jne    e8 <wc+0x48>
      else if(!inword){
 117:	85 f6                	test   %esi,%esi
 119:	75 cf                	jne    ea <wc+0x4a>
        w++;
 11b:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
        inword = 1;
 11f:	be 01 00 00 00       	mov    $0x1,%esi
    for(i=0; i<n; i++){
 124:	83 c7 01             	add    $0x1,%edi
 127:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
 12a:	75 c6                	jne    f2 <wc+0x52>
 12c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 130:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 133:	01 4d dc             	add    %ecx,-0x24(%ebp)
 136:	eb 88                	jmp    c0 <wc+0x20>
 138:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 13f:	00 
  if(n < 0){
 140:	8b 55 dc             	mov    -0x24(%ebp),%edx
 143:	75 22                	jne    167 <wc+0xc7>
  printf(1, "%d %d %d %s\n", l, w, c, name);
 145:	83 ec 08             	sub    $0x8,%esp
 148:	ff 75 0c             	push   0xc(%ebp)
 14b:	52                   	push   %edx
 14c:	ff 75 e0             	push   -0x20(%ebp)
 14f:	53                   	push   %ebx
 150:	68 9e 09 00 00       	push   $0x99e
 155:	6a 01                	push   $0x1
 157:	e8 c4 04 00 00       	call   620 <printf>
}
 15c:	83 c4 20             	add    $0x20,%esp
 15f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 162:	5b                   	pop    %ebx
 163:	5e                   	pop    %esi
 164:	5f                   	pop    %edi
 165:	5d                   	pop    %ebp
 166:	c3                   	ret
    printf(1, "wc: read error\n");
 167:	50                   	push   %eax
 168:	50                   	push   %eax
 169:	68 8e 09 00 00       	push   $0x98e
 16e:	6a 01                	push   $0x1
 170:	e8 ab 04 00 00       	call   620 <printf>
    exit();
 175:	e8 fc 02 00 00       	call   476 <exit>
 17a:	66 90                	xchg   %ax,%ax
 17c:	66 90                	xchg   %ax,%ax
 17e:	66 90                	xchg   %ax,%ax

00000180 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 180:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 181:	31 c0                	xor    %eax,%eax
{
 183:	89 e5                	mov    %esp,%ebp
 185:	53                   	push   %ebx
 186:	8b 4d 08             	mov    0x8(%ebp),%ecx
 189:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 18c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 190:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 194:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 197:	83 c0 01             	add    $0x1,%eax
 19a:	84 d2                	test   %dl,%dl
 19c:	75 f2                	jne    190 <strcpy+0x10>
    ;
  return os;
}
 19e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1a1:	89 c8                	mov    %ecx,%eax
 1a3:	c9                   	leave
 1a4:	c3                   	ret
 1a5:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 1ac:	00 
 1ad:	8d 76 00             	lea    0x0(%esi),%esi

000001b0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	53                   	push   %ebx
 1b4:	8b 55 08             	mov    0x8(%ebp),%edx
 1b7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 1ba:	0f b6 02             	movzbl (%edx),%eax
 1bd:	84 c0                	test   %al,%al
 1bf:	75 2f                	jne    1f0 <strcmp+0x40>
 1c1:	eb 4a                	jmp    20d <strcmp+0x5d>
 1c3:	eb 1b                	jmp    1e0 <strcmp+0x30>
 1c5:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 1cc:	00 
 1cd:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 1d4:	00 
 1d5:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 1dc:	00 
 1dd:	8d 76 00             	lea    0x0(%esi),%esi
 1e0:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 1e4:	83 c2 01             	add    $0x1,%edx
 1e7:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 1ea:	84 c0                	test   %al,%al
 1ec:	74 12                	je     200 <strcmp+0x50>
 1ee:	89 d9                	mov    %ebx,%ecx
 1f0:	0f b6 19             	movzbl (%ecx),%ebx
 1f3:	38 c3                	cmp    %al,%bl
 1f5:	74 e9                	je     1e0 <strcmp+0x30>
  return (uchar)*p - (uchar)*q;
 1f7:	29 d8                	sub    %ebx,%eax
}
 1f9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1fc:	c9                   	leave
 1fd:	c3                   	ret
 1fe:	66 90                	xchg   %ax,%ax
  return (uchar)*p - (uchar)*q;
 200:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 204:	31 c0                	xor    %eax,%eax
 206:	29 d8                	sub    %ebx,%eax
}
 208:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 20b:	c9                   	leave
 20c:	c3                   	ret
  return (uchar)*p - (uchar)*q;
 20d:	0f b6 19             	movzbl (%ecx),%ebx
 210:	31 c0                	xor    %eax,%eax
 212:	eb e3                	jmp    1f7 <strcmp+0x47>
 214:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 21b:	00 
 21c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000220 <strlen>:

uint
strlen(const char *s)
{
 220:	55                   	push   %ebp
 221:	89 e5                	mov    %esp,%ebp
 223:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 226:	80 3a 00             	cmpb   $0x0,(%edx)
 229:	74 15                	je     240 <strlen+0x20>
 22b:	31 c0                	xor    %eax,%eax
 22d:	8d 76 00             	lea    0x0(%esi),%esi
 230:	83 c0 01             	add    $0x1,%eax
 233:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 237:	89 c1                	mov    %eax,%ecx
 239:	75 f5                	jne    230 <strlen+0x10>
    ;
  return n;
}
 23b:	89 c8                	mov    %ecx,%eax
 23d:	5d                   	pop    %ebp
 23e:	c3                   	ret
 23f:	90                   	nop
  for(n = 0; s[n]; n++)
 240:	31 c9                	xor    %ecx,%ecx
}
 242:	5d                   	pop    %ebp
 243:	89 c8                	mov    %ecx,%eax
 245:	c3                   	ret
 246:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 24d:	00 
 24e:	66 90                	xchg   %ax,%ax

00000250 <memset>:

void*
memset(void *dst, int c, uint n)
{
 250:	55                   	push   %ebp
 251:	89 e5                	mov    %esp,%ebp
 253:	57                   	push   %edi
 254:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 257:	8b 4d 10             	mov    0x10(%ebp),%ecx
 25a:	8b 45 0c             	mov    0xc(%ebp),%eax
 25d:	89 d7                	mov    %edx,%edi
 25f:	fc                   	cld
 260:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 262:	8b 7d fc             	mov    -0x4(%ebp),%edi
 265:	89 d0                	mov    %edx,%eax
 267:	c9                   	leave
 268:	c3                   	ret
 269:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000270 <strchr>:

char*
strchr(const char *s, char c)
{
 270:	55                   	push   %ebp
 271:	89 e5                	mov    %esp,%ebp
 273:	8b 45 08             	mov    0x8(%ebp),%eax
 276:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 27a:	0f b6 10             	movzbl (%eax),%edx
 27d:	84 d2                	test   %dl,%dl
 27f:	75 1a                	jne    29b <strchr+0x2b>
 281:	eb 25                	jmp    2a8 <strchr+0x38>
 283:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 28a:	00 
 28b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 290:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 294:	83 c0 01             	add    $0x1,%eax
 297:	84 d2                	test   %dl,%dl
 299:	74 0d                	je     2a8 <strchr+0x38>
    if(*s == c)
 29b:	38 d1                	cmp    %dl,%cl
 29d:	75 f1                	jne    290 <strchr+0x20>
      return (char*)s;
  return 0;
}
 29f:	5d                   	pop    %ebp
 2a0:	c3                   	ret
 2a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 2a8:	31 c0                	xor    %eax,%eax
}
 2aa:	5d                   	pop    %ebp
 2ab:	c3                   	ret
 2ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000002b0 <gets>:

char*
gets(char *buf, int max)
{
 2b0:	55                   	push   %ebp
 2b1:	89 e5                	mov    %esp,%ebp
 2b3:	57                   	push   %edi
 2b4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 2b5:	8d 75 e7             	lea    -0x19(%ebp),%esi
{
 2b8:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 2b9:	31 db                	xor    %ebx,%ebx
{
 2bb:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 2be:	eb 27                	jmp    2e7 <gets+0x37>
    cc = read(0, &c, 1);
 2c0:	83 ec 04             	sub    $0x4,%esp
 2c3:	6a 01                	push   $0x1
 2c5:	56                   	push   %esi
 2c6:	6a 00                	push   $0x0
 2c8:	e8 c1 01 00 00       	call   48e <read>
    if(cc < 1)
 2cd:	83 c4 10             	add    $0x10,%esp
 2d0:	85 c0                	test   %eax,%eax
 2d2:	7e 1d                	jle    2f1 <gets+0x41>
      break;
    buf[i++] = c;
 2d4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 2d8:	8b 55 08             	mov    0x8(%ebp),%edx
 2db:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 2df:	3c 0a                	cmp    $0xa,%al
 2e1:	74 10                	je     2f3 <gets+0x43>
 2e3:	3c 0d                	cmp    $0xd,%al
 2e5:	74 0c                	je     2f3 <gets+0x43>
  for(i=0; i+1 < max; ){
 2e7:	89 df                	mov    %ebx,%edi
 2e9:	83 c3 01             	add    $0x1,%ebx
 2ec:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 2ef:	7c cf                	jl     2c0 <gets+0x10>
 2f1:	89 fb                	mov    %edi,%ebx
      break;
  }
  buf[i] = '\0';
 2f3:	8b 45 08             	mov    0x8(%ebp),%eax
 2f6:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
 2fa:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2fd:	5b                   	pop    %ebx
 2fe:	5e                   	pop    %esi
 2ff:	5f                   	pop    %edi
 300:	5d                   	pop    %ebp
 301:	c3                   	ret
 302:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 309:	00 
 30a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000310 <stat>:

int
stat(const char *n, struct stat *st)
{
 310:	55                   	push   %ebp
 311:	89 e5                	mov    %esp,%ebp
 313:	56                   	push   %esi
 314:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 315:	83 ec 08             	sub    $0x8,%esp
 318:	6a 00                	push   $0x0
 31a:	ff 75 08             	push   0x8(%ebp)
 31d:	e8 94 01 00 00       	call   4b6 <open>
  if(fd < 0)
 322:	83 c4 10             	add    $0x10,%esp
 325:	85 c0                	test   %eax,%eax
 327:	78 27                	js     350 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 329:	83 ec 08             	sub    $0x8,%esp
 32c:	ff 75 0c             	push   0xc(%ebp)
 32f:	89 c3                	mov    %eax,%ebx
 331:	50                   	push   %eax
 332:	e8 97 01 00 00       	call   4ce <fstat>
  close(fd);
 337:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 33a:	89 c6                	mov    %eax,%esi
  close(fd);
 33c:	e8 5d 01 00 00       	call   49e <close>
  return r;
 341:	83 c4 10             	add    $0x10,%esp
}
 344:	8d 65 f8             	lea    -0x8(%ebp),%esp
 347:	89 f0                	mov    %esi,%eax
 349:	5b                   	pop    %ebx
 34a:	5e                   	pop    %esi
 34b:	5d                   	pop    %ebp
 34c:	c3                   	ret
 34d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 350:	be ff ff ff ff       	mov    $0xffffffff,%esi
 355:	eb ed                	jmp    344 <stat+0x34>
 357:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 35e:	00 
 35f:	90                   	nop

00000360 <atoi>:

int
atoi(const char *s)
{
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	53                   	push   %ebx
 364:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 367:	0f be 02             	movsbl (%edx),%eax
 36a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 36d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 370:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 375:	77 1e                	ja     395 <atoi+0x35>
 377:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 37e:	00 
 37f:	90                   	nop
    n = n*10 + *s++ - '0';
 380:	83 c2 01             	add    $0x1,%edx
 383:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 386:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 38a:	0f be 02             	movsbl (%edx),%eax
 38d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 390:	80 fb 09             	cmp    $0x9,%bl
 393:	76 eb                	jbe    380 <atoi+0x20>
  return n;
}
 395:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 398:	89 c8                	mov    %ecx,%eax
 39a:	c9                   	leave
 39b:	c3                   	ret
 39c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000003a0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3a0:	55                   	push   %ebp
 3a1:	89 e5                	mov    %esp,%ebp
 3a3:	57                   	push   %edi
 3a4:	8b 45 10             	mov    0x10(%ebp),%eax
 3a7:	8b 55 08             	mov    0x8(%ebp),%edx
 3aa:	56                   	push   %esi
 3ab:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3ae:	85 c0                	test   %eax,%eax
 3b0:	7e 13                	jle    3c5 <memmove+0x25>
 3b2:	01 d0                	add    %edx,%eax
  dst = vdst;
 3b4:	89 d7                	mov    %edx,%edi
 3b6:	66 90                	xchg   %ax,%ax
 3b8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 3bf:	00 
    *dst++ = *src++;
 3c0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 3c1:	39 f8                	cmp    %edi,%eax
 3c3:	75 fb                	jne    3c0 <memmove+0x20>
  return vdst;
}
 3c5:	5e                   	pop    %esi
 3c6:	89 d0                	mov    %edx,%eax
 3c8:	5f                   	pop    %edi
 3c9:	5d                   	pop    %ebp
 3ca:	c3                   	ret
 3cb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

000003d0 <sqrt>:


// https://www.geeksforgeeks.org/c-program-to-find-square-root-of-a-given-number/
float sqrt(int num) {
 3d0:	55                   	push   %ebp
 3d1:	89 e5                	mov    %esp,%ebp
 3d3:	56                   	push   %esi
 3d4:	53                   	push   %ebx
 3d5:	83 ec 04             	sub    $0x4,%esp
 3d8:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int end = num;
  int middle;

  float solution = 0.0;

  while (start <= end) {
 3db:	85 db                	test   %ebx,%ebx
 3dd:	0f 88 87 00 00 00    	js     46a <sqrt+0x9a>
  int end = num;
 3e3:	89 d9                	mov    %ebx,%ecx
  float solution = 0.0;
 3e5:	d9 ee                	fldz
  int start = 0;
 3e7:	31 d2                	xor    %edx,%edx
 3e9:	eb 14                	jmp    3ff <sqrt+0x2f>
 3eb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 3f0:	dd d8                	fstp   %st(0)
    if (middle * middle == num) {
      solution = middle;
      break;
    }
    if (middle * middle < num) {
      solution = start;
 3f2:	89 55 f4             	mov    %edx,-0xc(%ebp)
      start = middle + 1;
 3f5:	8d 50 01             	lea    0x1(%eax),%edx
      solution = start;
 3f8:	db 45 f4             	fildl  -0xc(%ebp)
  while (start <= end) {
 3fb:	39 ca                	cmp    %ecx,%edx
 3fd:	7f 1e                	jg     41d <sqrt+0x4d>
    middle = (start + end) / 2;
 3ff:	8d 34 0a             	lea    (%edx,%ecx,1),%esi
 402:	89 f0                	mov    %esi,%eax
 404:	c1 e8 1f             	shr    $0x1f,%eax
 407:	01 f0                	add    %esi,%eax
 409:	d1 f8                	sar    $1,%eax
    if (middle * middle == num) {
 40b:	89 c6                	mov    %eax,%esi
 40d:	0f af f0             	imul   %eax,%esi
 410:	39 de                	cmp    %ebx,%esi
 412:	74 4c                	je     460 <sqrt+0x90>
    if (middle * middle < num) {
 414:	7c da                	jl     3f0 <sqrt+0x20>
    }
    else {
      end = middle - 1;
 416:	8d 48 ff             	lea    -0x1(%eax),%ecx
  while (start <= end) {
 419:	39 ca                	cmp    %ecx,%edx
 41b:	7e e2                	jle    3ff <sqrt+0x2f>

  float eps = 0.1;
  int i;

  for (i = 0; i < 5; i++) {
    while (solution * solution <= num) {
 41d:	89 5d f4             	mov    %ebx,-0xc(%ebp)
 420:	b8 05 00 00 00       	mov    $0x5,%eax
 425:	db 45 f4             	fildl  -0xc(%ebp)
 428:	d9 05 c8 09 00 00    	flds   0x9c8
 42e:	eb 02                	jmp    432 <sqrt+0x62>
      solution += eps;
 430:	dc c2                	fadd   %st,%st(2)
    while (solution * solution <= num) {
 432:	d9 c2                	fld    %st(2)
 434:	d8 cb                	fmul   %st(3),%st
 436:	d9 ca                	fxch   %st(2)
 438:	db f2                	fcomi  %st(2),%st
 43a:	dd da                	fstp   %st(2)
 43c:	73 f2                	jae    430 <sqrt+0x60>
    }
    solution = solution - eps;
 43e:	dc ea                	fsubr  %st,%st(2)
    eps = eps / 10;
 440:	d8 35 cc 09 00 00    	fdivs  0x9cc
  for (i = 0; i < 5; i++) {
 446:	83 e8 01             	sub    $0x1,%eax
 449:	75 e7                	jne    432 <sqrt+0x62>
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
 456:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 45d:	00 
 45e:	66 90                	xchg   %ax,%ax
 460:	dd d8                	fstp   %st(0)
      solution = middle;
 462:	89 45 f4             	mov    %eax,-0xc(%ebp)
 465:	db 45 f4             	fildl  -0xc(%ebp)
      break;
 468:	eb b3                	jmp    41d <sqrt+0x4d>
  float solution = 0.0;
 46a:	d9 ee                	fldz
 46c:	eb af                	jmp    41d <sqrt+0x4d>

0000046e <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 46e:	b8 01 00 00 00       	mov    $0x1,%eax
 473:	cd 40                	int    $0x40
 475:	c3                   	ret

00000476 <exit>:
SYSCALL(exit)
 476:	b8 02 00 00 00       	mov    $0x2,%eax
 47b:	cd 40                	int    $0x40
 47d:	c3                   	ret

0000047e <wait>:
SYSCALL(wait)
 47e:	b8 03 00 00 00       	mov    $0x3,%eax
 483:	cd 40                	int    $0x40
 485:	c3                   	ret

00000486 <pipe>:
SYSCALL(pipe)
 486:	b8 04 00 00 00       	mov    $0x4,%eax
 48b:	cd 40                	int    $0x40
 48d:	c3                   	ret

0000048e <read>:
SYSCALL(read)
 48e:	b8 05 00 00 00       	mov    $0x5,%eax
 493:	cd 40                	int    $0x40
 495:	c3                   	ret

00000496 <write>:
SYSCALL(write)
 496:	b8 10 00 00 00       	mov    $0x10,%eax
 49b:	cd 40                	int    $0x40
 49d:	c3                   	ret

0000049e <close>:
SYSCALL(close)
 49e:	b8 15 00 00 00       	mov    $0x15,%eax
 4a3:	cd 40                	int    $0x40
 4a5:	c3                   	ret

000004a6 <kill>:
SYSCALL(kill)
 4a6:	b8 06 00 00 00       	mov    $0x6,%eax
 4ab:	cd 40                	int    $0x40
 4ad:	c3                   	ret

000004ae <exec>:
SYSCALL(exec)
 4ae:	b8 07 00 00 00       	mov    $0x7,%eax
 4b3:	cd 40                	int    $0x40
 4b5:	c3                   	ret

000004b6 <open>:
SYSCALL(open)
 4b6:	b8 0f 00 00 00       	mov    $0xf,%eax
 4bb:	cd 40                	int    $0x40
 4bd:	c3                   	ret

000004be <mknod>:
SYSCALL(mknod)
 4be:	b8 11 00 00 00       	mov    $0x11,%eax
 4c3:	cd 40                	int    $0x40
 4c5:	c3                   	ret

000004c6 <unlink>:
SYSCALL(unlink)
 4c6:	b8 12 00 00 00       	mov    $0x12,%eax
 4cb:	cd 40                	int    $0x40
 4cd:	c3                   	ret

000004ce <fstat>:
SYSCALL(fstat)
 4ce:	b8 08 00 00 00       	mov    $0x8,%eax
 4d3:	cd 40                	int    $0x40
 4d5:	c3                   	ret

000004d6 <link>:
SYSCALL(link)
 4d6:	b8 13 00 00 00       	mov    $0x13,%eax
 4db:	cd 40                	int    $0x40
 4dd:	c3                   	ret

000004de <mkdir>:
SYSCALL(mkdir)
 4de:	b8 14 00 00 00       	mov    $0x14,%eax
 4e3:	cd 40                	int    $0x40
 4e5:	c3                   	ret

000004e6 <chdir>:
SYSCALL(chdir)
 4e6:	b8 09 00 00 00       	mov    $0x9,%eax
 4eb:	cd 40                	int    $0x40
 4ed:	c3                   	ret

000004ee <dup>:
SYSCALL(dup)
 4ee:	b8 0a 00 00 00       	mov    $0xa,%eax
 4f3:	cd 40                	int    $0x40
 4f5:	c3                   	ret

000004f6 <getpid>:
SYSCALL(getpid)
 4f6:	b8 0b 00 00 00       	mov    $0xb,%eax
 4fb:	cd 40                	int    $0x40
 4fd:	c3                   	ret

000004fe <sbrk>:
SYSCALL(sbrk)
 4fe:	b8 0c 00 00 00       	mov    $0xc,%eax
 503:	cd 40                	int    $0x40
 505:	c3                   	ret

00000506 <sleep>:
SYSCALL(sleep)
 506:	b8 0d 00 00 00       	mov    $0xd,%eax
 50b:	cd 40                	int    $0x40
 50d:	c3                   	ret

0000050e <uptime>:
SYSCALL(uptime)
 50e:	b8 0e 00 00 00       	mov    $0xe,%eax
 513:	cd 40                	int    $0x40
 515:	c3                   	ret

00000516 <gettid>:
SYSCALL(gettid)
 516:	b8 16 00 00 00       	mov    $0x16,%eax
 51b:	cd 40                	int    $0x40
 51d:	c3                   	ret

0000051e <getpgid>:
SYSCALL(getpgid)
 51e:	b8 17 00 00 00       	mov    $0x17,%eax
 523:	cd 40                	int    $0x40
 525:	c3                   	ret

00000526 <setpgid>:
SYSCALL(setpgid)
 526:	b8 18 00 00 00       	mov    $0x18,%eax
 52b:	cd 40                	int    $0x40
 52d:	c3                   	ret

0000052e <getppid>:
SYSCALL(getppid)
 52e:	b8 19 00 00 00       	mov    $0x19,%eax
 533:	cd 40                	int    $0x40
 535:	c3                   	ret

00000536 <uptime_ms>:
SYSCALL(uptime_ms)
 536:	b8 1a 00 00 00       	mov    $0x1a,%eax
 53b:	cd 40                	int    $0x40
 53d:	c3                   	ret

0000053e <setpriority>:
 53e:	b8 1b 00 00 00       	mov    $0x1b,%eax
 543:	cd 40                	int    $0x40
 545:	c3                   	ret
 546:	66 90                	xchg   %ax,%ax
 548:	66 90                	xchg   %ax,%ax
 54a:	66 90                	xchg   %ax,%ax
 54c:	66 90                	xchg   %ax,%ax
 54e:	66 90                	xchg   %ax,%ax
 550:	66 90                	xchg   %ax,%ax
 552:	66 90                	xchg   %ax,%ax
 554:	66 90                	xchg   %ax,%ax
 556:	66 90                	xchg   %ax,%ax
 558:	66 90                	xchg   %ax,%ax
 55a:	66 90                	xchg   %ax,%ax
 55c:	66 90                	xchg   %ax,%ax
 55e:	66 90                	xchg   %ax,%ax

00000560 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 560:	55                   	push   %ebp
 561:	89 e5                	mov    %esp,%ebp
 563:	57                   	push   %edi
 564:	56                   	push   %esi
 565:	53                   	push   %ebx
 566:	89 cb                	mov    %ecx,%ebx
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 568:	89 d1                	mov    %edx,%ecx
{
 56a:	83 ec 3c             	sub    $0x3c,%esp
 56d:	89 45 c4             	mov    %eax,-0x3c(%ebp)
  if(sgn && xx < 0){
 570:	85 d2                	test   %edx,%edx
 572:	0f 89 98 00 00 00    	jns    610 <printint+0xb0>
 578:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 57c:	0f 84 8e 00 00 00    	je     610 <printint+0xb0>
    x = -xx;
 582:	f7 d9                	neg    %ecx
    neg = 1;
 584:	b8 01 00 00 00       	mov    $0x1,%eax
  } else {
    x = xx;
  }

  i = 0;
 589:	89 45 c0             	mov    %eax,-0x40(%ebp)
 58c:	31 f6                	xor    %esi,%esi
 58e:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 595:	00 
 596:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 59d:	00 
 59e:	66 90                	xchg   %ax,%ax
  do{
    buf[i++] = digits[x % base];
 5a0:	89 c8                	mov    %ecx,%eax
 5a2:	31 d2                	xor    %edx,%edx
 5a4:	89 f7                	mov    %esi,%edi
 5a6:	f7 f3                	div    %ebx
 5a8:	8d 76 01             	lea    0x1(%esi),%esi
 5ab:	0f b6 92 28 0a 00 00 	movzbl 0xa28(%edx),%edx
 5b2:	88 54 35 d7          	mov    %dl,-0x29(%ebp,%esi,1)
  }while((x /= base) != 0);
 5b6:	89 ca                	mov    %ecx,%edx
 5b8:	89 c1                	mov    %eax,%ecx
 5ba:	39 da                	cmp    %ebx,%edx
 5bc:	73 e2                	jae    5a0 <printint+0x40>
  if(neg)
 5be:	8b 45 c0             	mov    -0x40(%ebp),%eax
 5c1:	85 c0                	test   %eax,%eax
 5c3:	74 07                	je     5cc <printint+0x6c>
    buf[i++] = '-';
 5c5:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)
 5ca:	89 f7                	mov    %esi,%edi

  while(--i >= 0)
 5cc:	8d 5d d8             	lea    -0x28(%ebp),%ebx
 5cf:	8b 75 c4             	mov    -0x3c(%ebp),%esi
 5d2:	01 df                	add    %ebx,%edi
 5d4:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 5db:	00 
 5dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    putc(fd, buf[i]);
 5e0:	0f b6 07             	movzbl (%edi),%eax
  write(fd, &c, 1);
 5e3:	83 ec 04             	sub    $0x4,%esp
 5e6:	88 45 d7             	mov    %al,-0x29(%ebp)
 5e9:	8d 45 d7             	lea    -0x29(%ebp),%eax
 5ec:	6a 01                	push   $0x1
 5ee:	50                   	push   %eax
 5ef:	56                   	push   %esi
 5f0:	e8 a1 fe ff ff       	call   496 <write>
  while(--i >= 0)
 5f5:	89 f8                	mov    %edi,%eax
 5f7:	83 c4 10             	add    $0x10,%esp
 5fa:	83 ef 01             	sub    $0x1,%edi
 5fd:	39 d8                	cmp    %ebx,%eax
 5ff:	75 df                	jne    5e0 <printint+0x80>
}
 601:	8d 65 f4             	lea    -0xc(%ebp),%esp
 604:	5b                   	pop    %ebx
 605:	5e                   	pop    %esi
 606:	5f                   	pop    %edi
 607:	5d                   	pop    %ebp
 608:	c3                   	ret
 609:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 610:	31 c0                	xor    %eax,%eax
 612:	e9 72 ff ff ff       	jmp    589 <printint+0x29>
 617:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 61e:	00 
 61f:	90                   	nop

00000620 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 620:	55                   	push   %ebp
 621:	89 e5                	mov    %esp,%ebp
 623:	57                   	push   %edi
 624:	56                   	push   %esi
 625:	53                   	push   %ebx
 626:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 629:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 62c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 62f:	0f b6 13             	movzbl (%ebx),%edx
 632:	83 c3 01             	add    $0x1,%ebx
 635:	84 d2                	test   %dl,%dl
 637:	0f 84 a0 00 00 00    	je     6dd <printf+0xbd>
 63d:	8d 45 10             	lea    0x10(%ebp),%eax
 640:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    c = fmt[i] & 0xff;
 643:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 646:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 649:	eb 28                	jmp    673 <printf+0x53>
 64b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 650:	83 ec 04             	sub    $0x4,%esp
 653:	8d 45 e7             	lea    -0x19(%ebp),%eax
 656:	88 55 e7             	mov    %dl,-0x19(%ebp)
  for(i = 0; fmt[i]; i++){
 659:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 65c:	6a 01                	push   $0x1
 65e:	50                   	push   %eax
 65f:	56                   	push   %esi
 660:	e8 31 fe ff ff       	call   496 <write>
  for(i = 0; fmt[i]; i++){
 665:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 669:	83 c4 10             	add    $0x10,%esp
 66c:	84 d2                	test   %dl,%dl
 66e:	74 6d                	je     6dd <printf+0xbd>
    c = fmt[i] & 0xff;
 670:	0f b6 c2             	movzbl %dl,%eax
      if(c == '%'){
 673:	83 f8 25             	cmp    $0x25,%eax
 676:	75 d8                	jne    650 <printf+0x30>
  for(i = 0; fmt[i]; i++){
 678:	0f b6 13             	movzbl (%ebx),%edx
 67b:	84 d2                	test   %dl,%dl
 67d:	74 5e                	je     6dd <printf+0xbd>
    c = fmt[i] & 0xff;
 67f:	0f b6 c2             	movzbl %dl,%eax
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
 682:	80 fa 25             	cmp    $0x25,%dl
 685:	0f 84 1d 01 00 00    	je     7a8 <printf+0x188>
 68b:	83 e8 63             	sub    $0x63,%eax
 68e:	83 f8 15             	cmp    $0x15,%eax
 691:	77 0d                	ja     6a0 <printf+0x80>
 693:	ff 24 85 d0 09 00 00 	jmp    *0x9d0(,%eax,4)
 69a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 6a0:	83 ec 04             	sub    $0x4,%esp
 6a3:	8d 4d e7             	lea    -0x19(%ebp),%ecx
 6a6:	88 55 d0             	mov    %dl,-0x30(%ebp)
        ap++;
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 6a9:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
  write(fd, &c, 1);
 6ad:	6a 01                	push   $0x1
 6af:	51                   	push   %ecx
 6b0:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
 6b3:	56                   	push   %esi
 6b4:	e8 dd fd ff ff       	call   496 <write>
        putc(fd, c);
 6b9:	0f b6 55 d0          	movzbl -0x30(%ebp),%edx
  write(fd, &c, 1);
 6bd:	83 c4 0c             	add    $0xc,%esp
 6c0:	88 55 e7             	mov    %dl,-0x19(%ebp)
 6c3:	6a 01                	push   $0x1
 6c5:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
 6c8:	51                   	push   %ecx
 6c9:	56                   	push   %esi
 6ca:	e8 c7 fd ff ff       	call   496 <write>
  for(i = 0; fmt[i]; i++){
 6cf:	0f b6 53 01          	movzbl 0x1(%ebx),%edx
 6d3:	83 c3 02             	add    $0x2,%ebx
 6d6:	83 c4 10             	add    $0x10,%esp
 6d9:	84 d2                	test   %dl,%dl
 6db:	75 93                	jne    670 <printf+0x50>
      }
      state = 0;
    }
  }
}
 6dd:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6e0:	5b                   	pop    %ebx
 6e1:	5e                   	pop    %esi
 6e2:	5f                   	pop    %edi
 6e3:	5d                   	pop    %ebp
 6e4:	c3                   	ret
 6e5:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 6e8:	83 ec 0c             	sub    $0xc,%esp
 6eb:	8b 17                	mov    (%edi),%edx
 6ed:	b9 10 00 00 00       	mov    $0x10,%ecx
 6f2:	89 f0                	mov    %esi,%eax
 6f4:	6a 00                	push   $0x0
        ap++;
 6f6:	83 c7 04             	add    $0x4,%edi
        printint(fd, *ap, 16, 0);
 6f9:	e8 62 fe ff ff       	call   560 <printint>
  for(i = 0; fmt[i]; i++){
 6fe:	eb cf                	jmp    6cf <printf+0xaf>
        s = (char*)*ap;
 700:	8b 07                	mov    (%edi),%eax
        ap++;
 702:	83 c7 04             	add    $0x4,%edi
        if(s == 0)
 705:	85 c0                	test   %eax,%eax
 707:	0f 84 b3 00 00 00    	je     7c0 <printf+0x1a0>
        while(*s != 0){
 70d:	0f b6 10             	movzbl (%eax),%edx
 710:	84 d2                	test   %dl,%dl
 712:	0f 84 ba 00 00 00    	je     7d2 <printf+0x1b2>
 718:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 71b:	89 c7                	mov    %eax,%edi
 71d:	89 d0                	mov    %edx,%eax
 71f:	8d 4d e7             	lea    -0x19(%ebp),%ecx
 722:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 725:	89 fb                	mov    %edi,%ebx
 727:	89 cf                	mov    %ecx,%edi
 729:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 730:	83 ec 04             	sub    $0x4,%esp
 733:	88 45 e7             	mov    %al,-0x19(%ebp)
          s++;
 736:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 739:	6a 01                	push   $0x1
 73b:	57                   	push   %edi
 73c:	56                   	push   %esi
 73d:	e8 54 fd ff ff       	call   496 <write>
        while(*s != 0){
 742:	0f b6 03             	movzbl (%ebx),%eax
 745:	83 c4 10             	add    $0x10,%esp
 748:	84 c0                	test   %al,%al
 74a:	75 e4                	jne    730 <printf+0x110>
 74c:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  for(i = 0; fmt[i]; i++){
 74f:	0f b6 53 01          	movzbl 0x1(%ebx),%edx
 753:	83 c3 02             	add    $0x2,%ebx
 756:	84 d2                	test   %dl,%dl
 758:	0f 85 e5 fe ff ff    	jne    643 <printf+0x23>
 75e:	e9 7a ff ff ff       	jmp    6dd <printf+0xbd>
 763:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 768:	83 ec 0c             	sub    $0xc,%esp
 76b:	8b 17                	mov    (%edi),%edx
 76d:	b9 0a 00 00 00       	mov    $0xa,%ecx
 772:	89 f0                	mov    %esi,%eax
 774:	6a 01                	push   $0x1
        ap++;
 776:	83 c7 04             	add    $0x4,%edi
        printint(fd, *ap, 10, 1);
 779:	e8 e2 fd ff ff       	call   560 <printint>
  for(i = 0; fmt[i]; i++){
 77e:	e9 4c ff ff ff       	jmp    6cf <printf+0xaf>
 783:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 788:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
 78a:	83 ec 04             	sub    $0x4,%esp
 78d:	8d 4d e7             	lea    -0x19(%ebp),%ecx
        ap++;
 790:	83 c7 04             	add    $0x4,%edi
        putc(fd, *ap);
 793:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 796:	6a 01                	push   $0x1
 798:	51                   	push   %ecx
 799:	56                   	push   %esi
 79a:	e8 f7 fc ff ff       	call   496 <write>
  for(i = 0; fmt[i]; i++){
 79f:	e9 2b ff ff ff       	jmp    6cf <printf+0xaf>
 7a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 7a8:	83 ec 04             	sub    $0x4,%esp
 7ab:	88 55 e7             	mov    %dl,-0x19(%ebp)
 7ae:	8d 4d e7             	lea    -0x19(%ebp),%ecx
 7b1:	6a 01                	push   $0x1
 7b3:	e9 10 ff ff ff       	jmp    6c8 <printf+0xa8>
 7b8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 7bf:	00 
          s = "(null)";
 7c0:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 7c3:	b8 28 00 00 00       	mov    $0x28,%eax
 7c8:	bf bf 09 00 00       	mov    $0x9bf,%edi
 7cd:	e9 4d ff ff ff       	jmp    71f <printf+0xff>
  for(i = 0; fmt[i]; i++){
 7d2:	0f b6 53 01          	movzbl 0x1(%ebx),%edx
 7d6:	83 c3 02             	add    $0x2,%ebx
 7d9:	84 d2                	test   %dl,%dl
 7db:	0f 85 8f fe ff ff    	jne    670 <printf+0x50>
 7e1:	e9 f7 fe ff ff       	jmp    6dd <printf+0xbd>
 7e6:	66 90                	xchg   %ax,%ax
 7e8:	66 90                	xchg   %ax,%ax
 7ea:	66 90                	xchg   %ax,%ax
 7ec:	66 90                	xchg   %ax,%ax
 7ee:	66 90                	xchg   %ax,%ax
 7f0:	66 90                	xchg   %ax,%ax
 7f2:	66 90                	xchg   %ax,%ax
 7f4:	66 90                	xchg   %ax,%ax
 7f6:	66 90                	xchg   %ax,%ax
 7f8:	66 90                	xchg   %ax,%ax
 7fa:	66 90                	xchg   %ax,%ax
 7fc:	66 90                	xchg   %ax,%ax
 7fe:	66 90                	xchg   %ax,%ax

00000800 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 800:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 801:	a1 40 0c 00 00       	mov    0xc40,%eax
{
 806:	89 e5                	mov    %esp,%ebp
 808:	57                   	push   %edi
 809:	56                   	push   %esi
 80a:	53                   	push   %ebx
 80b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 80e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 811:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 818:	00 
 819:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 820:	89 c2                	mov    %eax,%edx
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 822:	8b 00                	mov    (%eax),%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 824:	39 ca                	cmp    %ecx,%edx
 826:	73 30                	jae    858 <free+0x58>
 828:	39 c1                	cmp    %eax,%ecx
 82a:	72 04                	jb     830 <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 82c:	39 c2                	cmp    %eax,%edx
 82e:	72 f0                	jb     820 <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
 830:	8b 73 fc             	mov    -0x4(%ebx),%esi
 833:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 836:	39 f8                	cmp    %edi,%eax
 838:	74 36                	je     870 <free+0x70>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 83a:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 83d:	8b 42 04             	mov    0x4(%edx),%eax
 840:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 843:	39 f1                	cmp    %esi,%ecx
 845:	74 40                	je     887 <free+0x87>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 847:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 849:	5b                   	pop    %ebx
  freep = p;
 84a:	89 15 40 0c 00 00    	mov    %edx,0xc40
}
 850:	5e                   	pop    %esi
 851:	5f                   	pop    %edi
 852:	5d                   	pop    %ebp
 853:	c3                   	ret
 854:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 858:	39 c2                	cmp    %eax,%edx
 85a:	72 c4                	jb     820 <free+0x20>
 85c:	39 c1                	cmp    %eax,%ecx
 85e:	73 c0                	jae    820 <free+0x20>
  if(bp + bp->s.size == p->s.ptr){
 860:	8b 73 fc             	mov    -0x4(%ebx),%esi
 863:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 866:	39 f8                	cmp    %edi,%eax
 868:	75 d0                	jne    83a <free+0x3a>
 86a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    bp->s.size += p->s.ptr->s.size;
 870:	03 70 04             	add    0x4(%eax),%esi
 873:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 876:	8b 02                	mov    (%edx),%eax
 878:	8b 00                	mov    (%eax),%eax
 87a:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 87d:	8b 42 04             	mov    0x4(%edx),%eax
 880:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 883:	39 f1                	cmp    %esi,%ecx
 885:	75 c0                	jne    847 <free+0x47>
    p->s.size += bp->s.size;
 887:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 88a:	89 15 40 0c 00 00    	mov    %edx,0xc40
    p->s.size += bp->s.size;
 890:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 893:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 896:	89 0a                	mov    %ecx,(%edx)
}
 898:	5b                   	pop    %ebx
 899:	5e                   	pop    %esi
 89a:	5f                   	pop    %edi
 89b:	5d                   	pop    %ebp
 89c:	c3                   	ret
 89d:	8d 76 00             	lea    0x0(%esi),%esi

000008a0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 8a0:	55                   	push   %ebp
 8a1:	89 e5                	mov    %esp,%ebp
 8a3:	57                   	push   %edi
 8a4:	56                   	push   %esi
 8a5:	53                   	push   %ebx
 8a6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8a9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 8ac:	8b 15 40 0c 00 00    	mov    0xc40,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8b2:	8d 78 07             	lea    0x7(%eax),%edi
 8b5:	c1 ef 03             	shr    $0x3,%edi
 8b8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 8bb:	85 d2                	test   %edx,%edx
 8bd:	0f 84 8d 00 00 00    	je     950 <malloc+0xb0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8c3:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 8c5:	8b 48 04             	mov    0x4(%eax),%ecx
 8c8:	39 f9                	cmp    %edi,%ecx
 8ca:	73 64                	jae    930 <malloc+0x90>
  if(nu < 4096)
 8cc:	bb 00 10 00 00       	mov    $0x1000,%ebx
 8d1:	39 df                	cmp    %ebx,%edi
 8d3:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 8d6:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 8dd:	eb 0a                	jmp    8e9 <malloc+0x49>
 8df:	90                   	nop
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8e0:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 8e2:	8b 48 04             	mov    0x4(%eax),%ecx
 8e5:	39 f9                	cmp    %edi,%ecx
 8e7:	73 47                	jae    930 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 8e9:	89 c2                	mov    %eax,%edx
 8eb:	39 05 40 0c 00 00    	cmp    %eax,0xc40
 8f1:	75 ed                	jne    8e0 <malloc+0x40>
  p = sbrk(nu * sizeof(Header));
 8f3:	83 ec 0c             	sub    $0xc,%esp
 8f6:	56                   	push   %esi
 8f7:	e8 02 fc ff ff       	call   4fe <sbrk>
  if(p == (char*)-1)
 8fc:	83 c4 10             	add    $0x10,%esp
 8ff:	83 f8 ff             	cmp    $0xffffffff,%eax
 902:	74 1c                	je     920 <malloc+0x80>
  hp->s.size = nu;
 904:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 907:	83 ec 0c             	sub    $0xc,%esp
 90a:	83 c0 08             	add    $0x8,%eax
 90d:	50                   	push   %eax
 90e:	e8 ed fe ff ff       	call   800 <free>
  return freep;
 913:	8b 15 40 0c 00 00    	mov    0xc40,%edx
      if((p = morecore(nunits)) == 0)
 919:	83 c4 10             	add    $0x10,%esp
 91c:	85 d2                	test   %edx,%edx
 91e:	75 c0                	jne    8e0 <malloc+0x40>
        return 0;
  }
}
 920:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 923:	31 c0                	xor    %eax,%eax
}
 925:	5b                   	pop    %ebx
 926:	5e                   	pop    %esi
 927:	5f                   	pop    %edi
 928:	5d                   	pop    %ebp
 929:	c3                   	ret
 92a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 930:	39 cf                	cmp    %ecx,%edi
 932:	74 4c                	je     980 <malloc+0xe0>
        p->s.size -= nunits;
 934:	29 f9                	sub    %edi,%ecx
 936:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 939:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 93c:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 93f:	89 15 40 0c 00 00    	mov    %edx,0xc40
}
 945:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 948:	83 c0 08             	add    $0x8,%eax
}
 94b:	5b                   	pop    %ebx
 94c:	5e                   	pop    %esi
 94d:	5f                   	pop    %edi
 94e:	5d                   	pop    %ebp
 94f:	c3                   	ret
    base.s.ptr = freep = prevp = &base;
 950:	c7 05 40 0c 00 00 44 	movl   $0xc44,0xc40
 957:	0c 00 00 
    base.s.size = 0;
 95a:	b8 44 0c 00 00       	mov    $0xc44,%eax
    base.s.ptr = freep = prevp = &base;
 95f:	c7 05 44 0c 00 00 44 	movl   $0xc44,0xc44
 966:	0c 00 00 
    base.s.size = 0;
 969:	c7 05 48 0c 00 00 00 	movl   $0x0,0xc48
 970:	00 00 00 
    if(p->s.size >= nunits){
 973:	e9 54 ff ff ff       	jmp    8cc <malloc+0x2c>
 978:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 97f:	00 
        prevp->s.ptr = p->s.ptr;
 980:	8b 08                	mov    (%eax),%ecx
 982:	89 0a                	mov    %ecx,(%edx)
 984:	eb b9                	jmp    93f <malloc+0x9f>
