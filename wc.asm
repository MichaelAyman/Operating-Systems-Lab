
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
  27:	7e 56                	jle    7f <main+0x7f>
  29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    wc(0, "");
    exit();
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
  30:	83 ec 08             	sub    $0x8,%esp
  33:	6a 00                	push   $0x0
  35:	ff 33                	push   (%ebx)
  37:	e8 80 04 00 00       	call   4bc <open>
  3c:	83 c4 10             	add    $0x10,%esp
  3f:	89 c7                	mov    %eax,%edi
  41:	85 c0                	test   %eax,%eax
  43:	78 26                	js     6b <main+0x6b>
      printf(1, "wc: cannot open %s\n", argv[i]);
      exit();
    }
    wc(fd, argv[i]);
  45:	83 ec 08             	sub    $0x8,%esp
  48:	ff 33                	push   (%ebx)
  for(i = 1; i < argc; i++){
  4a:	83 c6 01             	add    $0x1,%esi
  4d:	83 c3 04             	add    $0x4,%ebx
    wc(fd, argv[i]);
  50:	50                   	push   %eax
  51:	e8 4a 00 00 00       	call   a0 <wc>
    close(fd);
  56:	89 3c 24             	mov    %edi,(%esp)
  59:	e8 46 04 00 00       	call   4a4 <close>
  for(i = 1; i < argc; i++){
  5e:	83 c4 10             	add    $0x10,%esp
  61:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
  64:	75 ca                	jne    30 <main+0x30>
  }
  exit();
  66:	e8 11 04 00 00       	call   47c <exit>
      printf(1, "wc: cannot open %s\n", argv[i]);
  6b:	50                   	push   %eax
  6c:	ff 33                	push   (%ebx)
  6e:	68 4b 09 00 00       	push   $0x94b
  73:	6a 01                	push   $0x1
  75:	e8 86 05 00 00       	call   600 <printf>
      exit();
  7a:	e8 fd 03 00 00       	call   47c <exit>
    wc(0, "");
  7f:	52                   	push   %edx
  80:	52                   	push   %edx
  81:	68 3d 09 00 00       	push   $0x93d
  86:	6a 00                	push   $0x0
  88:	e8 13 00 00 00       	call   a0 <wc>
    exit();
  8d:	e8 ea 03 00 00       	call   47c <exit>
  92:	66 90                	xchg   %ax,%ax
  94:	66 90                	xchg   %ax,%ax
  96:	66 90                	xchg   %ax,%ax
  98:	66 90                	xchg   %ax,%ax
  9a:	66 90                	xchg   %ax,%ax
  9c:	66 90                	xchg   %ax,%ax
  9e:	66 90                	xchg   %ax,%ax

000000a0 <wc>:
{
  a0:	55                   	push   %ebp
  a1:	89 e5                	mov    %esp,%ebp
  a3:	57                   	push   %edi
  a4:	56                   	push   %esi
  a5:	53                   	push   %ebx
  l = w = c = 0;
  a6:	31 db                	xor    %ebx,%ebx
{
  a8:	83 ec 1c             	sub    $0x1c,%esp
  inword = 0;
  ab:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  l = w = c = 0;
  b2:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  b9:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  while((n = read(fd, buf, sizeof(buf))) > 0){
  c0:	83 ec 04             	sub    $0x4,%esp
  c3:	68 00 02 00 00       	push   $0x200
  c8:	68 e0 0c 00 00       	push   $0xce0
  cd:	ff 75 08             	push   0x8(%ebp)
  d0:	e8 bf 03 00 00       	call   494 <read>
  d5:	83 c4 10             	add    $0x10,%esp
  d8:	89 c6                	mov    %eax,%esi
  da:	85 c0                	test   %eax,%eax
  dc:	7e 62                	jle    140 <wc+0xa0>
    for(i=0; i<n; i++){
  de:	31 ff                	xor    %edi,%edi
  e0:	eb 14                	jmp    f6 <wc+0x56>
  e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        inword = 0;
  e8:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    for(i=0; i<n; i++){
  ef:	83 c7 01             	add    $0x1,%edi
  f2:	39 fe                	cmp    %edi,%esi
  f4:	74 42                	je     138 <wc+0x98>
      if(buf[i] == '\n')
  f6:	0f be 87 e0 0c 00 00 	movsbl 0xce0(%edi),%eax
        l++;
  fd:	31 c9                	xor    %ecx,%ecx
  ff:	3c 0a                	cmp    $0xa,%al
 101:	0f 94 c1             	sete   %cl
      if(strchr(" \r\t\n\v", buf[i]))
 104:	83 ec 08             	sub    $0x8,%esp
 107:	50                   	push   %eax
        l++;
 108:	01 cb                	add    %ecx,%ebx
      if(strchr(" \r\t\n\v", buf[i]))
 10a:	68 28 09 00 00       	push   $0x928
 10f:	e8 4c 01 00 00       	call   260 <strchr>
 114:	83 c4 10             	add    $0x10,%esp
 117:	85 c0                	test   %eax,%eax
 119:	75 cd                	jne    e8 <wc+0x48>
      else if(!inword){
 11b:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 11e:	85 d2                	test   %edx,%edx
 120:	75 cd                	jne    ef <wc+0x4f>
    for(i=0; i<n; i++){
 122:	83 c7 01             	add    $0x1,%edi
        w++;
 125:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
        inword = 1;
 129:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
    for(i=0; i<n; i++){
 130:	39 fe                	cmp    %edi,%esi
 132:	75 c2                	jne    f6 <wc+0x56>
 134:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      c++;
 138:	01 75 dc             	add    %esi,-0x24(%ebp)
 13b:	eb 83                	jmp    c0 <wc+0x20>
 13d:	8d 76 00             	lea    0x0(%esi),%esi
  if(n < 0){
 140:	75 24                	jne    166 <wc+0xc6>
  printf(1, "%d %d %d %s\n", l, w, c, name);
 142:	83 ec 08             	sub    $0x8,%esp
 145:	ff 75 0c             	push   0xc(%ebp)
 148:	ff 75 dc             	push   -0x24(%ebp)
 14b:	ff 75 e0             	push   -0x20(%ebp)
 14e:	53                   	push   %ebx
 14f:	68 3e 09 00 00       	push   $0x93e
 154:	6a 01                	push   $0x1
 156:	e8 a5 04 00 00       	call   600 <printf>
}
 15b:	83 c4 20             	add    $0x20,%esp
 15e:	8d 65 f4             	lea    -0xc(%ebp),%esp
 161:	5b                   	pop    %ebx
 162:	5e                   	pop    %esi
 163:	5f                   	pop    %edi
 164:	5d                   	pop    %ebp
 165:	c3                   	ret    
    printf(1, "wc: read error\n");
 166:	50                   	push   %eax
 167:	50                   	push   %eax
 168:	68 2e 09 00 00       	push   $0x92e
 16d:	6a 01                	push   $0x1
 16f:	e8 8c 04 00 00       	call   600 <printf>
    exit();
 174:	e8 03 03 00 00       	call   47c <exit>
 179:	66 90                	xchg   %ax,%ax
 17b:	66 90                	xchg   %ax,%ax
 17d:	66 90                	xchg   %ax,%ax
 17f:	90                   	nop

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
 1a5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

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
 1bf:	75 17                	jne    1d8 <strcmp+0x28>
 1c1:	eb 3a                	jmp    1fd <strcmp+0x4d>
 1c3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1c7:	90                   	nop
 1c8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 1cc:	83 c2 01             	add    $0x1,%edx
 1cf:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 1d2:	84 c0                	test   %al,%al
 1d4:	74 1a                	je     1f0 <strcmp+0x40>
    p++, q++;
 1d6:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 1d8:	0f b6 19             	movzbl (%ecx),%ebx
 1db:	38 c3                	cmp    %al,%bl
 1dd:	74 e9                	je     1c8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 1df:	29 d8                	sub    %ebx,%eax
}
 1e1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1e4:	c9                   	leave  
 1e5:	c3                   	ret    
 1e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1ed:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 1f0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 1f4:	31 c0                	xor    %eax,%eax
 1f6:	29 d8                	sub    %ebx,%eax
}
 1f8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1fb:	c9                   	leave  
 1fc:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 1fd:	0f b6 19             	movzbl (%ecx),%ebx
 200:	31 c0                	xor    %eax,%eax
 202:	eb db                	jmp    1df <strcmp+0x2f>
 204:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 20b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 20f:	90                   	nop

00000210 <strlen>:

uint
strlen(const char *s)
{
 210:	55                   	push   %ebp
 211:	89 e5                	mov    %esp,%ebp
 213:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 216:	80 3a 00             	cmpb   $0x0,(%edx)
 219:	74 15                	je     230 <strlen+0x20>
 21b:	31 c0                	xor    %eax,%eax
 21d:	8d 76 00             	lea    0x0(%esi),%esi
 220:	83 c0 01             	add    $0x1,%eax
 223:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 227:	89 c1                	mov    %eax,%ecx
 229:	75 f5                	jne    220 <strlen+0x10>
    ;
  return n;
}
 22b:	89 c8                	mov    %ecx,%eax
 22d:	5d                   	pop    %ebp
 22e:	c3                   	ret    
 22f:	90                   	nop
  for(n = 0; s[n]; n++)
 230:	31 c9                	xor    %ecx,%ecx
}
 232:	5d                   	pop    %ebp
 233:	89 c8                	mov    %ecx,%eax
 235:	c3                   	ret    
 236:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 23d:	8d 76 00             	lea    0x0(%esi),%esi

00000240 <memset>:

void*
memset(void *dst, int c, uint n)
{
 240:	55                   	push   %ebp
 241:	89 e5                	mov    %esp,%ebp
 243:	57                   	push   %edi
 244:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 247:	8b 4d 10             	mov    0x10(%ebp),%ecx
 24a:	8b 45 0c             	mov    0xc(%ebp),%eax
 24d:	89 d7                	mov    %edx,%edi
 24f:	fc                   	cld    
 250:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 252:	8b 7d fc             	mov    -0x4(%ebp),%edi
 255:	89 d0                	mov    %edx,%eax
 257:	c9                   	leave  
 258:	c3                   	ret    
 259:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000260 <strchr>:

char*
strchr(const char *s, char c)
{
 260:	55                   	push   %ebp
 261:	89 e5                	mov    %esp,%ebp
 263:	8b 45 08             	mov    0x8(%ebp),%eax
 266:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 26a:	0f b6 10             	movzbl (%eax),%edx
 26d:	84 d2                	test   %dl,%dl
 26f:	75 12                	jne    283 <strchr+0x23>
 271:	eb 1d                	jmp    290 <strchr+0x30>
 273:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 277:	90                   	nop
 278:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 27c:	83 c0 01             	add    $0x1,%eax
 27f:	84 d2                	test   %dl,%dl
 281:	74 0d                	je     290 <strchr+0x30>
    if(*s == c)
 283:	38 d1                	cmp    %dl,%cl
 285:	75 f1                	jne    278 <strchr+0x18>
      return (char*)s;
  return 0;
}
 287:	5d                   	pop    %ebp
 288:	c3                   	ret    
 289:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 290:	31 c0                	xor    %eax,%eax
}
 292:	5d                   	pop    %ebp
 293:	c3                   	ret    
 294:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 29b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 29f:	90                   	nop

000002a0 <gets>:

char*
gets(char *buf, int max)
{
 2a0:	55                   	push   %ebp
 2a1:	89 e5                	mov    %esp,%ebp
 2a3:	57                   	push   %edi
 2a4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 2a5:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 2a8:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 2a9:	31 db                	xor    %ebx,%ebx
{
 2ab:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 2ae:	eb 27                	jmp    2d7 <gets+0x37>
    cc = read(0, &c, 1);
 2b0:	83 ec 04             	sub    $0x4,%esp
 2b3:	6a 01                	push   $0x1
 2b5:	57                   	push   %edi
 2b6:	6a 00                	push   $0x0
 2b8:	e8 d7 01 00 00       	call   494 <read>
    if(cc < 1)
 2bd:	83 c4 10             	add    $0x10,%esp
 2c0:	85 c0                	test   %eax,%eax
 2c2:	7e 1d                	jle    2e1 <gets+0x41>
      break;
    buf[i++] = c;
 2c4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 2c8:	8b 55 08             	mov    0x8(%ebp),%edx
 2cb:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 2cf:	3c 0a                	cmp    $0xa,%al
 2d1:	74 1d                	je     2f0 <gets+0x50>
 2d3:	3c 0d                	cmp    $0xd,%al
 2d5:	74 19                	je     2f0 <gets+0x50>
  for(i=0; i+1 < max; ){
 2d7:	89 de                	mov    %ebx,%esi
 2d9:	83 c3 01             	add    $0x1,%ebx
 2dc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 2df:	7c cf                	jl     2b0 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 2e1:	8b 45 08             	mov    0x8(%ebp),%eax
 2e4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 2e8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2eb:	5b                   	pop    %ebx
 2ec:	5e                   	pop    %esi
 2ed:	5f                   	pop    %edi
 2ee:	5d                   	pop    %ebp
 2ef:	c3                   	ret    
  buf[i] = '\0';
 2f0:	8b 45 08             	mov    0x8(%ebp),%eax
 2f3:	89 de                	mov    %ebx,%esi
 2f5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 2f9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2fc:	5b                   	pop    %ebx
 2fd:	5e                   	pop    %esi
 2fe:	5f                   	pop    %edi
 2ff:	5d                   	pop    %ebp
 300:	c3                   	ret    
 301:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 308:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 30f:	90                   	nop

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
 31d:	e8 9a 01 00 00       	call   4bc <open>
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
 332:	e8 9d 01 00 00       	call   4d4 <fstat>
  close(fd);
 337:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 33a:	89 c6                	mov    %eax,%esi
  close(fd);
 33c:	e8 63 01 00 00       	call   4a4 <close>
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
 357:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 35e:	66 90                	xchg   %ax,%ax

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
 377:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 37e:	66 90                	xchg   %ax,%ax
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
 3b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3bd:	8d 76 00             	lea    0x0(%esi),%esi
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
 3cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3cf:	90                   	nop

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
 3dd:	0f 88 8d 00 00 00    	js     470 <sqrt+0xa0>
    middle = (start + end) / 2;
 3e3:	89 d8                	mov    %ebx,%eax
 3e5:	d1 f8                	sar    %eax
    if (middle * middle == num) {
 3e7:	89 c2                	mov    %eax,%edx
 3e9:	0f af d0             	imul   %eax,%edx
 3ec:	39 d3                	cmp    %edx,%ebx
 3ee:	74 78                	je     468 <sqrt+0x98>
 3f0:	89 de                	mov    %ebx,%esi
  float solution = 0.0;
 3f2:	d9 ee                	fldz   
  int start = 0;
 3f4:	31 c9                	xor    %ecx,%ecx
 3f6:	eb 25                	jmp    41d <sqrt+0x4d>
 3f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3ff:	90                   	nop
 400:	dd d8                	fstp   %st(0)
      solution = middle;
      break;
    }
    if (middle * middle < num) {
      solution = start;
 402:	89 4d f4             	mov    %ecx,-0xc(%ebp)
      start = middle + 1;
 405:	8d 48 01             	lea    0x1(%eax),%ecx
      solution = start;
 408:	db 45 f4             	fildl  -0xc(%ebp)
  while (start <= end) {
 40b:	39 ce                	cmp    %ecx,%esi
 40d:	7c 19                	jl     428 <sqrt+0x58>
    middle = (start + end) / 2;
 40f:	8d 04 0e             	lea    (%esi,%ecx,1),%eax
 412:	d1 f8                	sar    %eax
    if (middle * middle == num) {
 414:	89 c2                	mov    %eax,%edx
 416:	0f af d0             	imul   %eax,%edx
 419:	39 da                	cmp    %ebx,%edx
 41b:	74 49                	je     466 <sqrt+0x96>
    if (middle * middle < num) {
 41d:	39 d3                	cmp    %edx,%ebx
 41f:	7f df                	jg     400 <sqrt+0x30>
    }
    else {
      end = middle - 1;
 421:	8d 70 ff             	lea    -0x1(%eax),%esi
  while (start <= end) {
 424:	39 ce                	cmp    %ecx,%esi
 426:	7d e7                	jge    40f <sqrt+0x3f>

  float eps = 0.1;
  int i;

  for (i = 0; i < 5; i++) {
    while (solution * solution <= num) {
 428:	89 5d f4             	mov    %ebx,-0xc(%ebp)
 42b:	b8 05 00 00 00       	mov    $0x5,%eax
 430:	db 45 f4             	fildl  -0xc(%ebp)
 433:	d9 05 60 09 00 00    	flds   0x960
 439:	eb 07                	jmp    442 <sqrt+0x72>
 43b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 43f:	90                   	nop
      solution += eps;
 440:	dc c2                	fadd   %st,%st(2)
    while (solution * solution <= num) {
 442:	d9 c2                	fld    %st(2)
 444:	d8 cb                	fmul   %st(3),%st
 446:	d9 ca                	fxch   %st(2)
 448:	db f2                	fcomi  %st(2),%st
 44a:	dd da                	fstp   %st(2)
 44c:	73 f2                	jae    440 <sqrt+0x70>
    }
    solution = solution - eps;
 44e:	dc ea                	fsubr  %st,%st(2)
    eps = eps / 10;
 450:	d8 35 64 09 00 00    	fdivs  0x964
  for (i = 0; i < 5; i++) {
 456:	83 e8 01             	sub    $0x1,%eax
 459:	75 e7                	jne    442 <sqrt+0x72>
 45b:	dd d8                	fstp   %st(0)
 45d:	dd d8                	fstp   %st(0)
  }
  return solution;

}
 45f:	83 c4 04             	add    $0x4,%esp
 462:	5b                   	pop    %ebx
 463:	5e                   	pop    %esi
 464:	5d                   	pop    %ebp
 465:	c3                   	ret    
 466:	dd d8                	fstp   %st(0)
      solution = middle;
 468:	89 45 f4             	mov    %eax,-0xc(%ebp)
 46b:	db 45 f4             	fildl  -0xc(%ebp)
      break;
 46e:	eb b8                	jmp    428 <sqrt+0x58>
  float solution = 0.0;
 470:	d9 ee                	fldz   
 472:	eb b4                	jmp    428 <sqrt+0x58>

00000474 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 474:	b8 01 00 00 00       	mov    $0x1,%eax
 479:	cd 40                	int    $0x40
 47b:	c3                   	ret    

0000047c <exit>:
SYSCALL(exit)
 47c:	b8 02 00 00 00       	mov    $0x2,%eax
 481:	cd 40                	int    $0x40
 483:	c3                   	ret    

00000484 <wait>:
SYSCALL(wait)
 484:	b8 03 00 00 00       	mov    $0x3,%eax
 489:	cd 40                	int    $0x40
 48b:	c3                   	ret    

0000048c <pipe>:
SYSCALL(pipe)
 48c:	b8 04 00 00 00       	mov    $0x4,%eax
 491:	cd 40                	int    $0x40
 493:	c3                   	ret    

00000494 <read>:
SYSCALL(read)
 494:	b8 05 00 00 00       	mov    $0x5,%eax
 499:	cd 40                	int    $0x40
 49b:	c3                   	ret    

0000049c <write>:
SYSCALL(write)
 49c:	b8 10 00 00 00       	mov    $0x10,%eax
 4a1:	cd 40                	int    $0x40
 4a3:	c3                   	ret    

000004a4 <close>:
SYSCALL(close)
 4a4:	b8 15 00 00 00       	mov    $0x15,%eax
 4a9:	cd 40                	int    $0x40
 4ab:	c3                   	ret    

000004ac <kill>:
SYSCALL(kill)
 4ac:	b8 06 00 00 00       	mov    $0x6,%eax
 4b1:	cd 40                	int    $0x40
 4b3:	c3                   	ret    

000004b4 <exec>:
SYSCALL(exec)
 4b4:	b8 07 00 00 00       	mov    $0x7,%eax
 4b9:	cd 40                	int    $0x40
 4bb:	c3                   	ret    

000004bc <open>:
SYSCALL(open)
 4bc:	b8 0f 00 00 00       	mov    $0xf,%eax
 4c1:	cd 40                	int    $0x40
 4c3:	c3                   	ret    

000004c4 <mknod>:
SYSCALL(mknod)
 4c4:	b8 11 00 00 00       	mov    $0x11,%eax
 4c9:	cd 40                	int    $0x40
 4cb:	c3                   	ret    

000004cc <unlink>:
SYSCALL(unlink)
 4cc:	b8 12 00 00 00       	mov    $0x12,%eax
 4d1:	cd 40                	int    $0x40
 4d3:	c3                   	ret    

000004d4 <fstat>:
SYSCALL(fstat)
 4d4:	b8 08 00 00 00       	mov    $0x8,%eax
 4d9:	cd 40                	int    $0x40
 4db:	c3                   	ret    

000004dc <link>:
SYSCALL(link)
 4dc:	b8 13 00 00 00       	mov    $0x13,%eax
 4e1:	cd 40                	int    $0x40
 4e3:	c3                   	ret    

000004e4 <mkdir>:
SYSCALL(mkdir)
 4e4:	b8 14 00 00 00       	mov    $0x14,%eax
 4e9:	cd 40                	int    $0x40
 4eb:	c3                   	ret    

000004ec <chdir>:
SYSCALL(chdir)
 4ec:	b8 09 00 00 00       	mov    $0x9,%eax
 4f1:	cd 40                	int    $0x40
 4f3:	c3                   	ret    

000004f4 <dup>:
SYSCALL(dup)
 4f4:	b8 0a 00 00 00       	mov    $0xa,%eax
 4f9:	cd 40                	int    $0x40
 4fb:	c3                   	ret    

000004fc <getpid>:
SYSCALL(getpid)
 4fc:	b8 0b 00 00 00       	mov    $0xb,%eax
 501:	cd 40                	int    $0x40
 503:	c3                   	ret    

00000504 <sbrk>:
SYSCALL(sbrk)
 504:	b8 0c 00 00 00       	mov    $0xc,%eax
 509:	cd 40                	int    $0x40
 50b:	c3                   	ret    

0000050c <sleep>:
SYSCALL(sleep)
 50c:	b8 0d 00 00 00       	mov    $0xd,%eax
 511:	cd 40                	int    $0x40
 513:	c3                   	ret    

00000514 <uptime>:
SYSCALL(uptime)
 514:	b8 0e 00 00 00       	mov    $0xe,%eax
 519:	cd 40                	int    $0x40
 51b:	c3                   	ret    

0000051c <gettid>:
SYSCALL(gettid)
 51c:	b8 16 00 00 00       	mov    $0x16,%eax
 521:	cd 40                	int    $0x40
 523:	c3                   	ret    

00000524 <getpgid>:
SYSCALL(getpgid)
 524:	b8 17 00 00 00       	mov    $0x17,%eax
 529:	cd 40                	int    $0x40
 52b:	c3                   	ret    

0000052c <setpgid>:
SYSCALL(setpgid)
 52c:	b8 18 00 00 00       	mov    $0x18,%eax
 531:	cd 40                	int    $0x40
 533:	c3                   	ret    

00000534 <getppid>:
SYSCALL(getppid)
 534:	b8 19 00 00 00       	mov    $0x19,%eax
 539:	cd 40                	int    $0x40
 53b:	c3                   	ret    

0000053c <uptime_ms>:
SYSCALL(uptime_ms)
 53c:	b8 1a 00 00 00       	mov    $0x1a,%eax
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
 589:	0f b6 92 c8 09 00 00 	movzbl 0x9c8(%edx),%edx
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
 5d0:	e8 c7 fe ff ff       	call   49c <write>
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
 647:	e8 50 fe ff ff       	call   49c <write>
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
 679:	ff 24 85 70 09 00 00 	jmp    *0x970(,%eax,4)
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
 69e:	e8 f9 fd ff ff       	call   49c <write>
        putc(fd, c);
 6a3:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 6a7:	83 c4 0c             	add    $0xc,%esp
 6aa:	88 55 e7             	mov    %dl,-0x19(%ebp)
 6ad:	6a 01                	push   $0x1
 6af:	57                   	push   %edi
 6b0:	56                   	push   %esi
 6b1:	e8 e6 fd ff ff       	call   49c <write>
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
 71d:	e8 7a fd ff ff       	call   49c <write>
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
 75f:	e8 38 fd ff ff       	call   49c <write>
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
 788:	ba 68 09 00 00       	mov    $0x968,%edx
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
 7a1:	a1 e0 0e 00 00       	mov    0xee0,%eax
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
 7e2:	89 15 e0 0e 00 00    	mov    %edx,0xee0
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
 81c:	89 15 e0 0e 00 00    	mov    %edx,0xee0
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
 83c:	8b 3d e0 0e 00 00    	mov    0xee0,%edi
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
 881:	8b 3d e0 0e 00 00    	mov    0xee0,%edi
 887:	89 c2                	mov    %eax,%edx
 889:	39 d7                	cmp    %edx,%edi
 88b:	75 eb                	jne    878 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 88d:	83 ec 0c             	sub    $0xc,%esp
 890:	ff 75 e4             	push   -0x1c(%ebp)
 893:	e8 6c fc ff ff       	call   504 <sbrk>
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
 8af:	8b 15 e0 0e 00 00    	mov    0xee0,%edx
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
 8df:	89 15 e0 0e 00 00    	mov    %edx,0xee0
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
 8f0:	c7 05 e0 0e 00 00 e4 	movl   $0xee4,0xee0
 8f7:	0e 00 00 
    base.s.size = 0;
 8fa:	bf e4 0e 00 00       	mov    $0xee4,%edi
    base.s.ptr = freep = prevp = &base;
 8ff:	c7 05 e4 0e 00 00 e4 	movl   $0xee4,0xee4
 906:	0e 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 909:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 90b:	c7 05 e8 0e 00 00 00 	movl   $0x0,0xee8
 912:	00 00 00 
    if(p->s.size >= nunits){
 915:	e9 42 ff ff ff       	jmp    85c <malloc+0x2c>
 91a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 920:	8b 08                	mov    (%eax),%ecx
 922:	89 0a                	mov    %ecx,(%edx)
 924:	eb b9                	jmp    8df <malloc+0xaf>
