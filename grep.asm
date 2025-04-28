
_grep:     file format elf32-i386


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
   f:	53                   	push   %ebx
  10:	51                   	push   %ecx
  11:	83 ec 18             	sub    $0x18,%esp
  14:	8b 01                	mov    (%ecx),%eax
  16:	8b 59 04             	mov    0x4(%ecx),%ebx
  19:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  int fd, i;
  char *pattern;

  if(argc <= 1){
  1c:	83 f8 01             	cmp    $0x1,%eax
  1f:	7e 6f                	jle    90 <main+0x90>
    printf(2, "usage: grep pattern [file ...]\n");
    exit();
  }
  pattern = argv[1];
  21:	8b 43 04             	mov    0x4(%ebx),%eax
  24:	83 c3 08             	add    $0x8,%ebx

  if(argc <= 2){
  27:	83 7d e4 02          	cmpl   $0x2,-0x1c(%ebp)
    grep(pattern, 0);
    exit();
  }

  for(i = 2; i < argc; i++){
  2b:	be 02 00 00 00       	mov    $0x2,%esi
  pattern = argv[1];
  30:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(argc <= 2){
  33:	74 6e                	je     a3 <main+0xa3>
  35:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  3c:	00 
  3d:	8d 76 00             	lea    0x0(%esi),%esi
    if((fd = open(argv[i], 0)) < 0){
  40:	83 ec 08             	sub    $0x8,%esp
  43:	6a 00                	push   $0x0
  45:	ff 33                	push   (%ebx)
  47:	e8 aa 06 00 00       	call   6f6 <open>
  4c:	83 c4 10             	add    $0x10,%esp
  4f:	89 c7                	mov    %eax,%edi
  51:	85 c0                	test   %eax,%eax
  53:	78 27                	js     7c <main+0x7c>
      printf(1, "grep: cannot open %s\n", argv[i]);
      exit();
    }
    grep(pattern, fd);
  55:	83 ec 08             	sub    $0x8,%esp
  for(i = 2; i < argc; i++){
  58:	83 c6 01             	add    $0x1,%esi
  5b:	83 c3 04             	add    $0x4,%ebx
    grep(pattern, fd);
  5e:	50                   	push   %eax
  5f:	ff 75 e0             	push   -0x20(%ebp)
  62:	e8 a9 01 00 00       	call   210 <grep>
    close(fd);
  67:	89 3c 24             	mov    %edi,(%esp)
  6a:	e8 6f 06 00 00       	call   6de <close>
  for(i = 2; i < argc; i++){
  6f:	83 c4 10             	add    $0x10,%esp
  72:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
  75:	7f c9                	jg     40 <main+0x40>
  }
  exit();
  77:	e8 3a 06 00 00       	call   6b6 <exit>
      printf(1, "grep: cannot open %s\n", argv[i]);
  7c:	50                   	push   %eax
  7d:	ff 33                	push   (%ebx)
  7f:	68 e8 0b 00 00       	push   $0xbe8
  84:	6a 01                	push   $0x1
  86:	e8 d5 07 00 00       	call   860 <printf>
      exit();
  8b:	e8 26 06 00 00       	call   6b6 <exit>
    printf(2, "usage: grep pattern [file ...]\n");
  90:	51                   	push   %ecx
  91:	51                   	push   %ecx
  92:	68 c8 0b 00 00       	push   $0xbc8
  97:	6a 02                	push   $0x2
  99:	e8 c2 07 00 00       	call   860 <printf>
    exit();
  9e:	e8 13 06 00 00       	call   6b6 <exit>
    grep(pattern, 0);
  a3:	52                   	push   %edx
  a4:	52                   	push   %edx
  a5:	6a 00                	push   $0x0
  a7:	50                   	push   %eax
  a8:	e8 63 01 00 00       	call   210 <grep>
    exit();
  ad:	e8 04 06 00 00       	call   6b6 <exit>
  b2:	66 90                	xchg   %ax,%ax
  b4:	66 90                	xchg   %ax,%ax
  b6:	66 90                	xchg   %ax,%ax
  b8:	66 90                	xchg   %ax,%ax
  ba:	66 90                	xchg   %ax,%ax
  bc:	66 90                	xchg   %ax,%ax
  be:	66 90                	xchg   %ax,%ax

000000c0 <matchhere>:
  return 0;
}

// matchhere: search for re at beginning of text
int matchhere(char *re, char *text)
{
  c0:	55                   	push   %ebp
  c1:	89 e5                	mov    %esp,%ebp
  c3:	57                   	push   %edi
  c4:	56                   	push   %esi
  c5:	53                   	push   %ebx
  c6:	83 ec 1c             	sub    $0x1c,%esp
  c9:	8b 75 08             	mov    0x8(%ebp),%esi
  cc:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  if(re[0] == '\0')
  cf:	0f b6 16             	movzbl (%esi),%edx
  d2:	84 d2                	test   %dl,%dl
  d4:	0f 84 a6 00 00 00    	je     180 <matchhere+0xc0>
    return 1;
  if(re[1] == '*')
  da:	0f b6 46 01          	movzbl 0x1(%esi),%eax
  de:	3c 2a                	cmp    $0x2a,%al
  e0:	74 3f                	je     121 <matchhere+0x61>
  e2:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  e9:	00 
  ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return matchstar(re[0], re+2, text);
  if(re[0] == '$' && re[1] == '\0')
    return *text == '\0';
  f0:	0f b6 0b             	movzbl (%ebx),%ecx
  if(re[0] == '$' && re[1] == '\0')
  f3:	80 fa 24             	cmp    $0x24,%dl
  f6:	74 68                	je     160 <matchhere+0xa0>
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
  f8:	84 c9                	test   %cl,%cl
  fa:	0f 84 90 00 00 00    	je     190 <matchhere+0xd0>
 100:	80 fa 2e             	cmp    $0x2e,%dl
 103:	74 08                	je     10d <matchhere+0x4d>
 105:	38 d1                	cmp    %dl,%cl
 107:	0f 85 83 00 00 00    	jne    190 <matchhere+0xd0>
    return matchhere(re+1, text+1);
 10d:	83 c3 01             	add    $0x1,%ebx
 110:	83 c6 01             	add    $0x1,%esi
  if(re[0] == '\0')
 113:	84 c0                	test   %al,%al
 115:	74 69                	je     180 <matchhere+0xc0>
{
 117:	89 c2                	mov    %eax,%edx
  if(re[1] == '*')
 119:	0f b6 46 01          	movzbl 0x1(%esi),%eax
 11d:	3c 2a                	cmp    $0x2a,%al
 11f:	75 cf                	jne    f0 <matchhere+0x30>
    return matchstar(re[0], re+2, text);
 121:	83 c6 02             	add    $0x2,%esi
int matchstar(int c, char *re, char *text)
{
  do{  // a * matches zero or more instances
    if(matchhere(re, text))
      return 1;
  }while(*text!='\0' && (*text++==c || c=='.'));
 124:	80 fa 2e             	cmp    $0x2e,%dl
 127:	0f 94 c0             	sete   %al
 12a:	89 c7                	mov    %eax,%edi
 12c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(matchhere(re, text))
 130:	83 ec 08             	sub    $0x8,%esp
 133:	88 55 e7             	mov    %dl,-0x19(%ebp)
 136:	53                   	push   %ebx
 137:	56                   	push   %esi
 138:	e8 83 ff ff ff       	call   c0 <matchhere>
 13d:	83 c4 10             	add    $0x10,%esp
 140:	85 c0                	test   %eax,%eax
 142:	75 41                	jne    185 <matchhere+0xc5>
  }while(*text!='\0' && (*text++==c || c=='.'));
 144:	0f b6 0b             	movzbl (%ebx),%ecx
 147:	84 c9                	test   %cl,%cl
 149:	74 3a                	je     185 <matchhere+0xc5>
 14b:	0f b6 55 e7          	movzbl -0x19(%ebp),%edx
 14f:	83 c3 01             	add    $0x1,%ebx
 152:	38 d1                	cmp    %dl,%cl
 154:	74 da                	je     130 <matchhere+0x70>
 156:	89 f9                	mov    %edi,%ecx
 158:	84 c9                	test   %cl,%cl
 15a:	75 d4                	jne    130 <matchhere+0x70>
 15c:	eb 27                	jmp    185 <matchhere+0xc5>
 15e:	66 90                	xchg   %ax,%ax
  if(re[0] == '$' && re[1] == '\0')
 160:	84 c0                	test   %al,%al
 162:	74 36                	je     19a <matchhere+0xda>
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
 164:	84 c9                	test   %cl,%cl
 166:	74 28                	je     190 <matchhere+0xd0>
 168:	80 f9 24             	cmp    $0x24,%cl
 16b:	75 23                	jne    190 <matchhere+0xd0>
    return matchhere(re+1, text+1);
 16d:	83 c3 01             	add    $0x1,%ebx
 170:	83 c6 01             	add    $0x1,%esi
{
 173:	89 c2                	mov    %eax,%edx
 175:	eb a2                	jmp    119 <matchhere+0x59>
 177:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 17e:	00 
 17f:	90                   	nop
    return 1;
 180:	b8 01 00 00 00       	mov    $0x1,%eax
}
 185:	8d 65 f4             	lea    -0xc(%ebp),%esp
 188:	5b                   	pop    %ebx
 189:	5e                   	pop    %esi
 18a:	5f                   	pop    %edi
 18b:	5d                   	pop    %ebp
 18c:	c3                   	ret
 18d:	8d 76 00             	lea    0x0(%esi),%esi
 190:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
 193:	31 c0                	xor    %eax,%eax
}
 195:	5b                   	pop    %ebx
 196:	5e                   	pop    %esi
 197:	5f                   	pop    %edi
 198:	5d                   	pop    %ebp
 199:	c3                   	ret
    return *text == '\0';
 19a:	31 c0                	xor    %eax,%eax
 19c:	84 c9                	test   %cl,%cl
 19e:	0f 94 c0             	sete   %al
 1a1:	eb e2                	jmp    185 <matchhere+0xc5>
 1a3:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 1aa:	00 
 1ab:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

000001b0 <match>:
{
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	56                   	push   %esi
 1b4:	53                   	push   %ebx
 1b5:	8b 5d 08             	mov    0x8(%ebp),%ebx
 1b8:	8b 75 0c             	mov    0xc(%ebp),%esi
  if(re[0] == '^')
 1bb:	80 3b 5e             	cmpb   $0x5e,(%ebx)
 1be:	75 11                	jne    1d1 <match+0x21>
 1c0:	eb 2e                	jmp    1f0 <match+0x40>
 1c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  }while(*text++ != '\0');
 1c8:	83 c6 01             	add    $0x1,%esi
 1cb:	80 7e ff 00          	cmpb   $0x0,-0x1(%esi)
 1cf:	74 11                	je     1e2 <match+0x32>
    if(matchhere(re, text))
 1d1:	83 ec 08             	sub    $0x8,%esp
 1d4:	56                   	push   %esi
 1d5:	53                   	push   %ebx
 1d6:	e8 e5 fe ff ff       	call   c0 <matchhere>
 1db:	83 c4 10             	add    $0x10,%esp
 1de:	85 c0                	test   %eax,%eax
 1e0:	74 e6                	je     1c8 <match+0x18>
}
 1e2:	8d 65 f8             	lea    -0x8(%ebp),%esp
 1e5:	5b                   	pop    %ebx
 1e6:	5e                   	pop    %esi
 1e7:	5d                   	pop    %ebp
 1e8:	c3                   	ret
 1e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return matchhere(re+1, text);
 1f0:	83 c3 01             	add    $0x1,%ebx
 1f3:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
 1f6:	8d 65 f8             	lea    -0x8(%ebp),%esp
 1f9:	5b                   	pop    %ebx
 1fa:	5e                   	pop    %esi
 1fb:	5d                   	pop    %ebp
    return matchhere(re+1, text);
 1fc:	e9 bf fe ff ff       	jmp    c0 <matchhere>
 201:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 208:	00 
 209:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000210 <grep>:
{
 210:	55                   	push   %ebp
 211:	89 e5                	mov    %esp,%ebp
 213:	57                   	push   %edi
  m = 0;
 214:	31 ff                	xor    %edi,%edi
{
 216:	56                   	push   %esi
 217:	53                   	push   %ebx
 218:	83 ec 1c             	sub    $0x1c,%esp
 21b:	8b 5d 08             	mov    0x8(%ebp),%ebx
 21e:	89 7d e0             	mov    %edi,-0x20(%ebp)
    return matchhere(re+1, text);
 221:	8d 43 01             	lea    0x1(%ebx),%eax
 224:	89 45 dc             	mov    %eax,-0x24(%ebp)
 227:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 22e:	00 
 22f:	90                   	nop
  while((n = read(fd, buf+m, sizeof(buf)-m-1)) > 0){
 230:	8b 4d e0             	mov    -0x20(%ebp),%ecx
 233:	b8 ff 03 00 00       	mov    $0x3ff,%eax
 238:	83 ec 04             	sub    $0x4,%esp
 23b:	29 c8                	sub    %ecx,%eax
 23d:	50                   	push   %eax
 23e:	8d 81 80 0c 00 00    	lea    0xc80(%ecx),%eax
 244:	50                   	push   %eax
 245:	ff 75 0c             	push   0xc(%ebp)
 248:	e8 81 04 00 00       	call   6ce <read>
 24d:	83 c4 10             	add    $0x10,%esp
 250:	85 c0                	test   %eax,%eax
 252:	0f 8e fd 00 00 00    	jle    355 <grep+0x145>
    m += n;
 258:	01 45 e0             	add    %eax,-0x20(%ebp)
 25b:	8b 4d e0             	mov    -0x20(%ebp),%ecx
    buf[m] = '\0';
 25e:	bf 80 0c 00 00       	mov    $0xc80,%edi
 263:	89 de                	mov    %ebx,%esi
 265:	c6 81 80 0c 00 00 00 	movb   $0x0,0xc80(%ecx)
    while((q = strchr(p, '\n')) != 0){
 26c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 270:	83 ec 08             	sub    $0x8,%esp
 273:	6a 0a                	push   $0xa
 275:	57                   	push   %edi
 276:	e8 35 02 00 00       	call   4b0 <strchr>
 27b:	83 c4 10             	add    $0x10,%esp
 27e:	89 c2                	mov    %eax,%edx
 280:	85 c0                	test   %eax,%eax
 282:	0f 84 88 00 00 00    	je     310 <grep+0x100>
      *q = 0;
 288:	c6 02 00             	movb   $0x0,(%edx)
  if(re[0] == '^')
 28b:	80 3e 5e             	cmpb   $0x5e,(%esi)
 28e:	74 58                	je     2e8 <grep+0xd8>
 290:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 293:	89 d3                	mov    %edx,%ebx
 295:	eb 12                	jmp    2a9 <grep+0x99>
 297:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 29e:	00 
 29f:	90                   	nop
  }while(*text++ != '\0');
 2a0:	83 c7 01             	add    $0x1,%edi
 2a3:	80 7f ff 00          	cmpb   $0x0,-0x1(%edi)
 2a7:	74 37                	je     2e0 <grep+0xd0>
    if(matchhere(re, text))
 2a9:	83 ec 08             	sub    $0x8,%esp
 2ac:	57                   	push   %edi
 2ad:	56                   	push   %esi
 2ae:	e8 0d fe ff ff       	call   c0 <matchhere>
 2b3:	83 c4 10             	add    $0x10,%esp
 2b6:	85 c0                	test   %eax,%eax
 2b8:	74 e6                	je     2a0 <grep+0x90>
        write(1, p, q+1 - p);
 2ba:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 2bd:	89 da                	mov    %ebx,%edx
 2bf:	8d 5b 01             	lea    0x1(%ebx),%ebx
 2c2:	89 d8                	mov    %ebx,%eax
 2c4:	83 ec 04             	sub    $0x4,%esp
        *q = '\n';
 2c7:	c6 02 0a             	movb   $0xa,(%edx)
        write(1, p, q+1 - p);
 2ca:	29 f8                	sub    %edi,%eax
 2cc:	50                   	push   %eax
 2cd:	57                   	push   %edi
 2ce:	89 df                	mov    %ebx,%edi
 2d0:	6a 01                	push   $0x1
 2d2:	e8 ff 03 00 00       	call   6d6 <write>
 2d7:	83 c4 10             	add    $0x10,%esp
 2da:	eb 94                	jmp    270 <grep+0x60>
 2dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2e0:	8d 7b 01             	lea    0x1(%ebx),%edi
      p = q+1;
 2e3:	eb 8b                	jmp    270 <grep+0x60>
 2e5:	8d 76 00             	lea    0x0(%esi),%esi
    return matchhere(re+1, text);
 2e8:	83 ec 08             	sub    $0x8,%esp
 2eb:	89 55 e4             	mov    %edx,-0x1c(%ebp)
 2ee:	57                   	push   %edi
 2ef:	ff 75 dc             	push   -0x24(%ebp)
 2f2:	e8 c9 fd ff ff       	call   c0 <matchhere>
        write(1, p, q+1 - p);
 2f7:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    return matchhere(re+1, text);
 2fa:	83 c4 10             	add    $0x10,%esp
        write(1, p, q+1 - p);
 2fd:	8d 5a 01             	lea    0x1(%edx),%ebx
      if(match(pattern, p)){
 300:	85 c0                	test   %eax,%eax
 302:	75 be                	jne    2c2 <grep+0xb2>
        write(1, p, q+1 - p);
 304:	89 df                	mov    %ebx,%edi
 306:	e9 65 ff ff ff       	jmp    270 <grep+0x60>
 30b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    if(p == buf)
 310:	89 f3                	mov    %esi,%ebx
 312:	81 ff 80 0c 00 00    	cmp    $0xc80,%edi
 318:	74 2f                	je     349 <grep+0x139>
    if(m > 0){
 31a:	8b 45 e0             	mov    -0x20(%ebp),%eax
 31d:	85 c0                	test   %eax,%eax
 31f:	0f 8e 0b ff ff ff    	jle    230 <grep+0x20>
      m -= p - buf;
 325:	89 f8                	mov    %edi,%eax
      memmove(buf, p, m);
 327:	83 ec 04             	sub    $0x4,%esp
      m -= p - buf;
 32a:	2d 80 0c 00 00       	sub    $0xc80,%eax
 32f:	29 45 e0             	sub    %eax,-0x20(%ebp)
 332:	8b 4d e0             	mov    -0x20(%ebp),%ecx
      memmove(buf, p, m);
 335:	51                   	push   %ecx
 336:	57                   	push   %edi
 337:	68 80 0c 00 00       	push   $0xc80
 33c:	e8 9f 02 00 00       	call   5e0 <memmove>
 341:	83 c4 10             	add    $0x10,%esp
 344:	e9 e7 fe ff ff       	jmp    230 <grep+0x20>
      m = 0;
 349:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
 350:	e9 db fe ff ff       	jmp    230 <grep+0x20>
}
 355:	8d 65 f4             	lea    -0xc(%ebp),%esp
 358:	5b                   	pop    %ebx
 359:	5e                   	pop    %esi
 35a:	5f                   	pop    %edi
 35b:	5d                   	pop    %ebp
 35c:	c3                   	ret
 35d:	8d 76 00             	lea    0x0(%esi),%esi

00000360 <matchstar>:
{
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	57                   	push   %edi
 364:	56                   	push   %esi
 365:	53                   	push   %ebx
 366:	83 ec 1c             	sub    $0x1c,%esp
 369:	8b 5d 08             	mov    0x8(%ebp),%ebx
 36c:	8b 75 0c             	mov    0xc(%ebp),%esi
 36f:	8b 7d 10             	mov    0x10(%ebp),%edi
  }while(*text!='\0' && (*text++==c || c=='.'));
 372:	83 fb 2e             	cmp    $0x2e,%ebx
 375:	0f 94 45 e7          	sete   -0x19(%ebp)
 379:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(matchhere(re, text))
 380:	83 ec 08             	sub    $0x8,%esp
 383:	57                   	push   %edi
 384:	56                   	push   %esi
 385:	e8 36 fd ff ff       	call   c0 <matchhere>
 38a:	83 c4 10             	add    $0x10,%esp
 38d:	89 c1                	mov    %eax,%ecx
 38f:	85 c0                	test   %eax,%eax
 391:	75 14                	jne    3a7 <matchstar+0x47>
  }while(*text!='\0' && (*text++==c || c=='.'));
 393:	0f be 07             	movsbl (%edi),%eax
 396:	84 c0                	test   %al,%al
 398:	74 0d                	je     3a7 <matchstar+0x47>
 39a:	83 c7 01             	add    $0x1,%edi
 39d:	39 d8                	cmp    %ebx,%eax
 39f:	74 df                	je     380 <matchstar+0x20>
 3a1:	80 7d e7 00          	cmpb   $0x0,-0x19(%ebp)
 3a5:	75 d9                	jne    380 <matchstar+0x20>
}
 3a7:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3aa:	89 c8                	mov    %ecx,%eax
 3ac:	5b                   	pop    %ebx
 3ad:	5e                   	pop    %esi
 3ae:	5f                   	pop    %edi
 3af:	5d                   	pop    %ebp
 3b0:	c3                   	ret
 3b1:	66 90                	xchg   %ax,%ax
 3b3:	66 90                	xchg   %ax,%ax
 3b5:	66 90                	xchg   %ax,%ax
 3b7:	66 90                	xchg   %ax,%ax
 3b9:	66 90                	xchg   %ax,%ax
 3bb:	66 90                	xchg   %ax,%ax
 3bd:	66 90                	xchg   %ax,%ax
 3bf:	90                   	nop

000003c0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 3c0:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 3c1:	31 c0                	xor    %eax,%eax
{
 3c3:	89 e5                	mov    %esp,%ebp
 3c5:	53                   	push   %ebx
 3c6:	8b 4d 08             	mov    0x8(%ebp),%ecx
 3c9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 3cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 3d0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 3d4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 3d7:	83 c0 01             	add    $0x1,%eax
 3da:	84 d2                	test   %dl,%dl
 3dc:	75 f2                	jne    3d0 <strcpy+0x10>
    ;
  return os;
}
 3de:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3e1:	89 c8                	mov    %ecx,%eax
 3e3:	c9                   	leave
 3e4:	c3                   	ret
 3e5:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 3ec:	00 
 3ed:	8d 76 00             	lea    0x0(%esi),%esi

000003f0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 3f0:	55                   	push   %ebp
 3f1:	89 e5                	mov    %esp,%ebp
 3f3:	53                   	push   %ebx
 3f4:	8b 55 08             	mov    0x8(%ebp),%edx
 3f7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 3fa:	0f b6 02             	movzbl (%edx),%eax
 3fd:	84 c0                	test   %al,%al
 3ff:	75 2f                	jne    430 <strcmp+0x40>
 401:	eb 4a                	jmp    44d <strcmp+0x5d>
 403:	eb 1b                	jmp    420 <strcmp+0x30>
 405:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 40c:	00 
 40d:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 414:	00 
 415:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 41c:	00 
 41d:	8d 76 00             	lea    0x0(%esi),%esi
 420:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 424:	83 c2 01             	add    $0x1,%edx
 427:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 42a:	84 c0                	test   %al,%al
 42c:	74 12                	je     440 <strcmp+0x50>
 42e:	89 d9                	mov    %ebx,%ecx
 430:	0f b6 19             	movzbl (%ecx),%ebx
 433:	38 c3                	cmp    %al,%bl
 435:	74 e9                	je     420 <strcmp+0x30>
  return (uchar)*p - (uchar)*q;
 437:	29 d8                	sub    %ebx,%eax
}
 439:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 43c:	c9                   	leave
 43d:	c3                   	ret
 43e:	66 90                	xchg   %ax,%ax
  return (uchar)*p - (uchar)*q;
 440:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 444:	31 c0                	xor    %eax,%eax
 446:	29 d8                	sub    %ebx,%eax
}
 448:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 44b:	c9                   	leave
 44c:	c3                   	ret
  return (uchar)*p - (uchar)*q;
 44d:	0f b6 19             	movzbl (%ecx),%ebx
 450:	31 c0                	xor    %eax,%eax
 452:	eb e3                	jmp    437 <strcmp+0x47>
 454:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 45b:	00 
 45c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000460 <strlen>:

uint
strlen(const char *s)
{
 460:	55                   	push   %ebp
 461:	89 e5                	mov    %esp,%ebp
 463:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 466:	80 3a 00             	cmpb   $0x0,(%edx)
 469:	74 15                	je     480 <strlen+0x20>
 46b:	31 c0                	xor    %eax,%eax
 46d:	8d 76 00             	lea    0x0(%esi),%esi
 470:	83 c0 01             	add    $0x1,%eax
 473:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 477:	89 c1                	mov    %eax,%ecx
 479:	75 f5                	jne    470 <strlen+0x10>
    ;
  return n;
}
 47b:	89 c8                	mov    %ecx,%eax
 47d:	5d                   	pop    %ebp
 47e:	c3                   	ret
 47f:	90                   	nop
  for(n = 0; s[n]; n++)
 480:	31 c9                	xor    %ecx,%ecx
}
 482:	5d                   	pop    %ebp
 483:	89 c8                	mov    %ecx,%eax
 485:	c3                   	ret
 486:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 48d:	00 
 48e:	66 90                	xchg   %ax,%ax

00000490 <memset>:

void*
memset(void *dst, int c, uint n)
{
 490:	55                   	push   %ebp
 491:	89 e5                	mov    %esp,%ebp
 493:	57                   	push   %edi
 494:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 497:	8b 4d 10             	mov    0x10(%ebp),%ecx
 49a:	8b 45 0c             	mov    0xc(%ebp),%eax
 49d:	89 d7                	mov    %edx,%edi
 49f:	fc                   	cld
 4a0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 4a2:	8b 7d fc             	mov    -0x4(%ebp),%edi
 4a5:	89 d0                	mov    %edx,%eax
 4a7:	c9                   	leave
 4a8:	c3                   	ret
 4a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000004b0 <strchr>:

char*
strchr(const char *s, char c)
{
 4b0:	55                   	push   %ebp
 4b1:	89 e5                	mov    %esp,%ebp
 4b3:	8b 45 08             	mov    0x8(%ebp),%eax
 4b6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 4ba:	0f b6 10             	movzbl (%eax),%edx
 4bd:	84 d2                	test   %dl,%dl
 4bf:	75 1a                	jne    4db <strchr+0x2b>
 4c1:	eb 25                	jmp    4e8 <strchr+0x38>
 4c3:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 4ca:	00 
 4cb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 4d0:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 4d4:	83 c0 01             	add    $0x1,%eax
 4d7:	84 d2                	test   %dl,%dl
 4d9:	74 0d                	je     4e8 <strchr+0x38>
    if(*s == c)
 4db:	38 d1                	cmp    %dl,%cl
 4dd:	75 f1                	jne    4d0 <strchr+0x20>
      return (char*)s;
  return 0;
}
 4df:	5d                   	pop    %ebp
 4e0:	c3                   	ret
 4e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 4e8:	31 c0                	xor    %eax,%eax
}
 4ea:	5d                   	pop    %ebp
 4eb:	c3                   	ret
 4ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000004f0 <gets>:

char*
gets(char *buf, int max)
{
 4f0:	55                   	push   %ebp
 4f1:	89 e5                	mov    %esp,%ebp
 4f3:	57                   	push   %edi
 4f4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 4f5:	8d 75 e7             	lea    -0x19(%ebp),%esi
{
 4f8:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 4f9:	31 db                	xor    %ebx,%ebx
{
 4fb:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 4fe:	eb 27                	jmp    527 <gets+0x37>
    cc = read(0, &c, 1);
 500:	83 ec 04             	sub    $0x4,%esp
 503:	6a 01                	push   $0x1
 505:	56                   	push   %esi
 506:	6a 00                	push   $0x0
 508:	e8 c1 01 00 00       	call   6ce <read>
    if(cc < 1)
 50d:	83 c4 10             	add    $0x10,%esp
 510:	85 c0                	test   %eax,%eax
 512:	7e 1d                	jle    531 <gets+0x41>
      break;
    buf[i++] = c;
 514:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 518:	8b 55 08             	mov    0x8(%ebp),%edx
 51b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 51f:	3c 0a                	cmp    $0xa,%al
 521:	74 10                	je     533 <gets+0x43>
 523:	3c 0d                	cmp    $0xd,%al
 525:	74 0c                	je     533 <gets+0x43>
  for(i=0; i+1 < max; ){
 527:	89 df                	mov    %ebx,%edi
 529:	83 c3 01             	add    $0x1,%ebx
 52c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 52f:	7c cf                	jl     500 <gets+0x10>
 531:	89 fb                	mov    %edi,%ebx
      break;
  }
  buf[i] = '\0';
 533:	8b 45 08             	mov    0x8(%ebp),%eax
 536:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
 53a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 53d:	5b                   	pop    %ebx
 53e:	5e                   	pop    %esi
 53f:	5f                   	pop    %edi
 540:	5d                   	pop    %ebp
 541:	c3                   	ret
 542:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 549:	00 
 54a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000550 <stat>:

int
stat(const char *n, struct stat *st)
{
 550:	55                   	push   %ebp
 551:	89 e5                	mov    %esp,%ebp
 553:	56                   	push   %esi
 554:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 555:	83 ec 08             	sub    $0x8,%esp
 558:	6a 00                	push   $0x0
 55a:	ff 75 08             	push   0x8(%ebp)
 55d:	e8 94 01 00 00       	call   6f6 <open>
  if(fd < 0)
 562:	83 c4 10             	add    $0x10,%esp
 565:	85 c0                	test   %eax,%eax
 567:	78 27                	js     590 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 569:	83 ec 08             	sub    $0x8,%esp
 56c:	ff 75 0c             	push   0xc(%ebp)
 56f:	89 c3                	mov    %eax,%ebx
 571:	50                   	push   %eax
 572:	e8 97 01 00 00       	call   70e <fstat>
  close(fd);
 577:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 57a:	89 c6                	mov    %eax,%esi
  close(fd);
 57c:	e8 5d 01 00 00       	call   6de <close>
  return r;
 581:	83 c4 10             	add    $0x10,%esp
}
 584:	8d 65 f8             	lea    -0x8(%ebp),%esp
 587:	89 f0                	mov    %esi,%eax
 589:	5b                   	pop    %ebx
 58a:	5e                   	pop    %esi
 58b:	5d                   	pop    %ebp
 58c:	c3                   	ret
 58d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 590:	be ff ff ff ff       	mov    $0xffffffff,%esi
 595:	eb ed                	jmp    584 <stat+0x34>
 597:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 59e:	00 
 59f:	90                   	nop

000005a0 <atoi>:

int
atoi(const char *s)
{
 5a0:	55                   	push   %ebp
 5a1:	89 e5                	mov    %esp,%ebp
 5a3:	53                   	push   %ebx
 5a4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 5a7:	0f be 02             	movsbl (%edx),%eax
 5aa:	8d 48 d0             	lea    -0x30(%eax),%ecx
 5ad:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 5b0:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 5b5:	77 1e                	ja     5d5 <atoi+0x35>
 5b7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 5be:	00 
 5bf:	90                   	nop
    n = n*10 + *s++ - '0';
 5c0:	83 c2 01             	add    $0x1,%edx
 5c3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 5c6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 5ca:	0f be 02             	movsbl (%edx),%eax
 5cd:	8d 58 d0             	lea    -0x30(%eax),%ebx
 5d0:	80 fb 09             	cmp    $0x9,%bl
 5d3:	76 eb                	jbe    5c0 <atoi+0x20>
  return n;
}
 5d5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 5d8:	89 c8                	mov    %ecx,%eax
 5da:	c9                   	leave
 5db:	c3                   	ret
 5dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000005e0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 5e0:	55                   	push   %ebp
 5e1:	89 e5                	mov    %esp,%ebp
 5e3:	57                   	push   %edi
 5e4:	8b 45 10             	mov    0x10(%ebp),%eax
 5e7:	8b 55 08             	mov    0x8(%ebp),%edx
 5ea:	56                   	push   %esi
 5eb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 5ee:	85 c0                	test   %eax,%eax
 5f0:	7e 13                	jle    605 <memmove+0x25>
 5f2:	01 d0                	add    %edx,%eax
  dst = vdst;
 5f4:	89 d7                	mov    %edx,%edi
 5f6:	66 90                	xchg   %ax,%ax
 5f8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 5ff:	00 
    *dst++ = *src++;
 600:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 601:	39 f8                	cmp    %edi,%eax
 603:	75 fb                	jne    600 <memmove+0x20>
  return vdst;
}
 605:	5e                   	pop    %esi
 606:	89 d0                	mov    %edx,%eax
 608:	5f                   	pop    %edi
 609:	5d                   	pop    %ebp
 60a:	c3                   	ret
 60b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00000610 <sqrt>:


// https://www.geeksforgeeks.org/c-program-to-find-square-root-of-a-given-number/
float sqrt(int num) {
 610:	55                   	push   %ebp
 611:	89 e5                	mov    %esp,%ebp
 613:	56                   	push   %esi
 614:	53                   	push   %ebx
 615:	83 ec 04             	sub    $0x4,%esp
 618:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int end = num;
  int middle;

  float solution = 0.0;

  while (start <= end) {
 61b:	85 db                	test   %ebx,%ebx
 61d:	0f 88 87 00 00 00    	js     6aa <sqrt+0x9a>
  int end = num;
 623:	89 d9                	mov    %ebx,%ecx
  float solution = 0.0;
 625:	d9 ee                	fldz
  int start = 0;
 627:	31 d2                	xor    %edx,%edx
 629:	eb 14                	jmp    63f <sqrt+0x2f>
 62b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 630:	dd d8                	fstp   %st(0)
    if (middle * middle == num) {
      solution = middle;
      break;
    }
    if (middle * middle < num) {
      solution = start;
 632:	89 55 f4             	mov    %edx,-0xc(%ebp)
      start = middle + 1;
 635:	8d 50 01             	lea    0x1(%eax),%edx
      solution = start;
 638:	db 45 f4             	fildl  -0xc(%ebp)
  while (start <= end) {
 63b:	39 ca                	cmp    %ecx,%edx
 63d:	7f 1e                	jg     65d <sqrt+0x4d>
    middle = (start + end) / 2;
 63f:	8d 34 0a             	lea    (%edx,%ecx,1),%esi
 642:	89 f0                	mov    %esi,%eax
 644:	c1 e8 1f             	shr    $0x1f,%eax
 647:	01 f0                	add    %esi,%eax
 649:	d1 f8                	sar    $1,%eax
    if (middle * middle == num) {
 64b:	89 c6                	mov    %eax,%esi
 64d:	0f af f0             	imul   %eax,%esi
 650:	39 de                	cmp    %ebx,%esi
 652:	74 4c                	je     6a0 <sqrt+0x90>
    if (middle * middle < num) {
 654:	7c da                	jl     630 <sqrt+0x20>
    }
    else {
      end = middle - 1;
 656:	8d 48 ff             	lea    -0x1(%eax),%ecx
  while (start <= end) {
 659:	39 ca                	cmp    %ecx,%edx
 65b:	7e e2                	jle    63f <sqrt+0x2f>

  float eps = 0.1;
  int i;

  for (i = 0; i < 5; i++) {
    while (solution * solution <= num) {
 65d:	89 5d f4             	mov    %ebx,-0xc(%ebp)
 660:	b8 05 00 00 00       	mov    $0x5,%eax
 665:	db 45 f4             	fildl  -0xc(%ebp)
 668:	d9 05 08 0c 00 00    	flds   0xc08
 66e:	eb 02                	jmp    672 <sqrt+0x62>
      solution += eps;
 670:	dc c2                	fadd   %st,%st(2)
    while (solution * solution <= num) {
 672:	d9 c2                	fld    %st(2)
 674:	d8 cb                	fmul   %st(3),%st
 676:	d9 ca                	fxch   %st(2)
 678:	db f2                	fcomi  %st(2),%st
 67a:	dd da                	fstp   %st(2)
 67c:	73 f2                	jae    670 <sqrt+0x60>
    }
    solution = solution - eps;
 67e:	dc ea                	fsubr  %st,%st(2)
    eps = eps / 10;
 680:	d8 35 0c 0c 00 00    	fdivs  0xc0c
  for (i = 0; i < 5; i++) {
 686:	83 e8 01             	sub    $0x1,%eax
 689:	75 e7                	jne    672 <sqrt+0x62>
 68b:	dd d8                	fstp   %st(0)
 68d:	dd d8                	fstp   %st(0)
  }
  return solution;

}
 68f:	83 c4 04             	add    $0x4,%esp
 692:	5b                   	pop    %ebx
 693:	5e                   	pop    %esi
 694:	5d                   	pop    %ebp
 695:	c3                   	ret
 696:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 69d:	00 
 69e:	66 90                	xchg   %ax,%ax
 6a0:	dd d8                	fstp   %st(0)
      solution = middle;
 6a2:	89 45 f4             	mov    %eax,-0xc(%ebp)
 6a5:	db 45 f4             	fildl  -0xc(%ebp)
      break;
 6a8:	eb b3                	jmp    65d <sqrt+0x4d>
  float solution = 0.0;
 6aa:	d9 ee                	fldz
 6ac:	eb af                	jmp    65d <sqrt+0x4d>

000006ae <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 6ae:	b8 01 00 00 00       	mov    $0x1,%eax
 6b3:	cd 40                	int    $0x40
 6b5:	c3                   	ret

000006b6 <exit>:
SYSCALL(exit)
 6b6:	b8 02 00 00 00       	mov    $0x2,%eax
 6bb:	cd 40                	int    $0x40
 6bd:	c3                   	ret

000006be <wait>:
SYSCALL(wait)
 6be:	b8 03 00 00 00       	mov    $0x3,%eax
 6c3:	cd 40                	int    $0x40
 6c5:	c3                   	ret

000006c6 <pipe>:
SYSCALL(pipe)
 6c6:	b8 04 00 00 00       	mov    $0x4,%eax
 6cb:	cd 40                	int    $0x40
 6cd:	c3                   	ret

000006ce <read>:
SYSCALL(read)
 6ce:	b8 05 00 00 00       	mov    $0x5,%eax
 6d3:	cd 40                	int    $0x40
 6d5:	c3                   	ret

000006d6 <write>:
SYSCALL(write)
 6d6:	b8 10 00 00 00       	mov    $0x10,%eax
 6db:	cd 40                	int    $0x40
 6dd:	c3                   	ret

000006de <close>:
SYSCALL(close)
 6de:	b8 15 00 00 00       	mov    $0x15,%eax
 6e3:	cd 40                	int    $0x40
 6e5:	c3                   	ret

000006e6 <kill>:
SYSCALL(kill)
 6e6:	b8 06 00 00 00       	mov    $0x6,%eax
 6eb:	cd 40                	int    $0x40
 6ed:	c3                   	ret

000006ee <exec>:
SYSCALL(exec)
 6ee:	b8 07 00 00 00       	mov    $0x7,%eax
 6f3:	cd 40                	int    $0x40
 6f5:	c3                   	ret

000006f6 <open>:
SYSCALL(open)
 6f6:	b8 0f 00 00 00       	mov    $0xf,%eax
 6fb:	cd 40                	int    $0x40
 6fd:	c3                   	ret

000006fe <mknod>:
SYSCALL(mknod)
 6fe:	b8 11 00 00 00       	mov    $0x11,%eax
 703:	cd 40                	int    $0x40
 705:	c3                   	ret

00000706 <unlink>:
SYSCALL(unlink)
 706:	b8 12 00 00 00       	mov    $0x12,%eax
 70b:	cd 40                	int    $0x40
 70d:	c3                   	ret

0000070e <fstat>:
SYSCALL(fstat)
 70e:	b8 08 00 00 00       	mov    $0x8,%eax
 713:	cd 40                	int    $0x40
 715:	c3                   	ret

00000716 <link>:
SYSCALL(link)
 716:	b8 13 00 00 00       	mov    $0x13,%eax
 71b:	cd 40                	int    $0x40
 71d:	c3                   	ret

0000071e <mkdir>:
SYSCALL(mkdir)
 71e:	b8 14 00 00 00       	mov    $0x14,%eax
 723:	cd 40                	int    $0x40
 725:	c3                   	ret

00000726 <chdir>:
SYSCALL(chdir)
 726:	b8 09 00 00 00       	mov    $0x9,%eax
 72b:	cd 40                	int    $0x40
 72d:	c3                   	ret

0000072e <dup>:
SYSCALL(dup)
 72e:	b8 0a 00 00 00       	mov    $0xa,%eax
 733:	cd 40                	int    $0x40
 735:	c3                   	ret

00000736 <getpid>:
SYSCALL(getpid)
 736:	b8 0b 00 00 00       	mov    $0xb,%eax
 73b:	cd 40                	int    $0x40
 73d:	c3                   	ret

0000073e <sbrk>:
SYSCALL(sbrk)
 73e:	b8 0c 00 00 00       	mov    $0xc,%eax
 743:	cd 40                	int    $0x40
 745:	c3                   	ret

00000746 <sleep>:
SYSCALL(sleep)
 746:	b8 0d 00 00 00       	mov    $0xd,%eax
 74b:	cd 40                	int    $0x40
 74d:	c3                   	ret

0000074e <uptime>:
SYSCALL(uptime)
 74e:	b8 0e 00 00 00       	mov    $0xe,%eax
 753:	cd 40                	int    $0x40
 755:	c3                   	ret

00000756 <gettid>:
SYSCALL(gettid)
 756:	b8 16 00 00 00       	mov    $0x16,%eax
 75b:	cd 40                	int    $0x40
 75d:	c3                   	ret

0000075e <getpgid>:
SYSCALL(getpgid)
 75e:	b8 17 00 00 00       	mov    $0x17,%eax
 763:	cd 40                	int    $0x40
 765:	c3                   	ret

00000766 <setpgid>:
SYSCALL(setpgid)
 766:	b8 18 00 00 00       	mov    $0x18,%eax
 76b:	cd 40                	int    $0x40
 76d:	c3                   	ret

0000076e <getppid>:
SYSCALL(getppid)
 76e:	b8 19 00 00 00       	mov    $0x19,%eax
 773:	cd 40                	int    $0x40
 775:	c3                   	ret

00000776 <uptime_ms>:
SYSCALL(uptime_ms)
 776:	b8 1a 00 00 00       	mov    $0x1a,%eax
 77b:	cd 40                	int    $0x40
 77d:	c3                   	ret

0000077e <setpriority>:
 77e:	b8 1b 00 00 00       	mov    $0x1b,%eax
 783:	cd 40                	int    $0x40
 785:	c3                   	ret
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

000007a0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 7a0:	55                   	push   %ebp
 7a1:	89 e5                	mov    %esp,%ebp
 7a3:	57                   	push   %edi
 7a4:	56                   	push   %esi
 7a5:	53                   	push   %ebx
 7a6:	89 cb                	mov    %ecx,%ebx
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 7a8:	89 d1                	mov    %edx,%ecx
{
 7aa:	83 ec 3c             	sub    $0x3c,%esp
 7ad:	89 45 c4             	mov    %eax,-0x3c(%ebp)
  if(sgn && xx < 0){
 7b0:	85 d2                	test   %edx,%edx
 7b2:	0f 89 98 00 00 00    	jns    850 <printint+0xb0>
 7b8:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 7bc:	0f 84 8e 00 00 00    	je     850 <printint+0xb0>
    x = -xx;
 7c2:	f7 d9                	neg    %ecx
    neg = 1;
 7c4:	b8 01 00 00 00       	mov    $0x1,%eax
  } else {
    x = xx;
  }

  i = 0;
 7c9:	89 45 c0             	mov    %eax,-0x40(%ebp)
 7cc:	31 f6                	xor    %esi,%esi
 7ce:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 7d5:	00 
 7d6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 7dd:	00 
 7de:	66 90                	xchg   %ax,%ax
  do{
    buf[i++] = digits[x % base];
 7e0:	89 c8                	mov    %ecx,%eax
 7e2:	31 d2                	xor    %edx,%edx
 7e4:	89 f7                	mov    %esi,%edi
 7e6:	f7 f3                	div    %ebx
 7e8:	8d 76 01             	lea    0x1(%esi),%esi
 7eb:	0f b6 92 68 0c 00 00 	movzbl 0xc68(%edx),%edx
 7f2:	88 54 35 d7          	mov    %dl,-0x29(%ebp,%esi,1)
  }while((x /= base) != 0);
 7f6:	89 ca                	mov    %ecx,%edx
 7f8:	89 c1                	mov    %eax,%ecx
 7fa:	39 da                	cmp    %ebx,%edx
 7fc:	73 e2                	jae    7e0 <printint+0x40>
  if(neg)
 7fe:	8b 45 c0             	mov    -0x40(%ebp),%eax
 801:	85 c0                	test   %eax,%eax
 803:	74 07                	je     80c <printint+0x6c>
    buf[i++] = '-';
 805:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)
 80a:	89 f7                	mov    %esi,%edi

  while(--i >= 0)
 80c:	8d 5d d8             	lea    -0x28(%ebp),%ebx
 80f:	8b 75 c4             	mov    -0x3c(%ebp),%esi
 812:	01 df                	add    %ebx,%edi
 814:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 81b:	00 
 81c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    putc(fd, buf[i]);
 820:	0f b6 07             	movzbl (%edi),%eax
  write(fd, &c, 1);
 823:	83 ec 04             	sub    $0x4,%esp
 826:	88 45 d7             	mov    %al,-0x29(%ebp)
 829:	8d 45 d7             	lea    -0x29(%ebp),%eax
 82c:	6a 01                	push   $0x1
 82e:	50                   	push   %eax
 82f:	56                   	push   %esi
 830:	e8 a1 fe ff ff       	call   6d6 <write>
  while(--i >= 0)
 835:	89 f8                	mov    %edi,%eax
 837:	83 c4 10             	add    $0x10,%esp
 83a:	83 ef 01             	sub    $0x1,%edi
 83d:	39 d8                	cmp    %ebx,%eax
 83f:	75 df                	jne    820 <printint+0x80>
}
 841:	8d 65 f4             	lea    -0xc(%ebp),%esp
 844:	5b                   	pop    %ebx
 845:	5e                   	pop    %esi
 846:	5f                   	pop    %edi
 847:	5d                   	pop    %ebp
 848:	c3                   	ret
 849:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 850:	31 c0                	xor    %eax,%eax
 852:	e9 72 ff ff ff       	jmp    7c9 <printint+0x29>
 857:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 85e:	00 
 85f:	90                   	nop

00000860 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 860:	55                   	push   %ebp
 861:	89 e5                	mov    %esp,%ebp
 863:	57                   	push   %edi
 864:	56                   	push   %esi
 865:	53                   	push   %ebx
 866:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 869:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 86c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 86f:	0f b6 13             	movzbl (%ebx),%edx
 872:	83 c3 01             	add    $0x1,%ebx
 875:	84 d2                	test   %dl,%dl
 877:	0f 84 a0 00 00 00    	je     91d <printf+0xbd>
 87d:	8d 45 10             	lea    0x10(%ebp),%eax
 880:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    c = fmt[i] & 0xff;
 883:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 886:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 889:	eb 28                	jmp    8b3 <printf+0x53>
 88b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 890:	83 ec 04             	sub    $0x4,%esp
 893:	8d 45 e7             	lea    -0x19(%ebp),%eax
 896:	88 55 e7             	mov    %dl,-0x19(%ebp)
  for(i = 0; fmt[i]; i++){
 899:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 89c:	6a 01                	push   $0x1
 89e:	50                   	push   %eax
 89f:	56                   	push   %esi
 8a0:	e8 31 fe ff ff       	call   6d6 <write>
  for(i = 0; fmt[i]; i++){
 8a5:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 8a9:	83 c4 10             	add    $0x10,%esp
 8ac:	84 d2                	test   %dl,%dl
 8ae:	74 6d                	je     91d <printf+0xbd>
    c = fmt[i] & 0xff;
 8b0:	0f b6 c2             	movzbl %dl,%eax
      if(c == '%'){
 8b3:	83 f8 25             	cmp    $0x25,%eax
 8b6:	75 d8                	jne    890 <printf+0x30>
  for(i = 0; fmt[i]; i++){
 8b8:	0f b6 13             	movzbl (%ebx),%edx
 8bb:	84 d2                	test   %dl,%dl
 8bd:	74 5e                	je     91d <printf+0xbd>
    c = fmt[i] & 0xff;
 8bf:	0f b6 c2             	movzbl %dl,%eax
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
 8c2:	80 fa 25             	cmp    $0x25,%dl
 8c5:	0f 84 1d 01 00 00    	je     9e8 <printf+0x188>
 8cb:	83 e8 63             	sub    $0x63,%eax
 8ce:	83 f8 15             	cmp    $0x15,%eax
 8d1:	77 0d                	ja     8e0 <printf+0x80>
 8d3:	ff 24 85 10 0c 00 00 	jmp    *0xc10(,%eax,4)
 8da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 8e0:	83 ec 04             	sub    $0x4,%esp
 8e3:	8d 4d e7             	lea    -0x19(%ebp),%ecx
 8e6:	88 55 d0             	mov    %dl,-0x30(%ebp)
        ap++;
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 8e9:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
  write(fd, &c, 1);
 8ed:	6a 01                	push   $0x1
 8ef:	51                   	push   %ecx
 8f0:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
 8f3:	56                   	push   %esi
 8f4:	e8 dd fd ff ff       	call   6d6 <write>
        putc(fd, c);
 8f9:	0f b6 55 d0          	movzbl -0x30(%ebp),%edx
  write(fd, &c, 1);
 8fd:	83 c4 0c             	add    $0xc,%esp
 900:	88 55 e7             	mov    %dl,-0x19(%ebp)
 903:	6a 01                	push   $0x1
 905:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
 908:	51                   	push   %ecx
 909:	56                   	push   %esi
 90a:	e8 c7 fd ff ff       	call   6d6 <write>
  for(i = 0; fmt[i]; i++){
 90f:	0f b6 53 01          	movzbl 0x1(%ebx),%edx
 913:	83 c3 02             	add    $0x2,%ebx
 916:	83 c4 10             	add    $0x10,%esp
 919:	84 d2                	test   %dl,%dl
 91b:	75 93                	jne    8b0 <printf+0x50>
      }
      state = 0;
    }
  }
}
 91d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 920:	5b                   	pop    %ebx
 921:	5e                   	pop    %esi
 922:	5f                   	pop    %edi
 923:	5d                   	pop    %ebp
 924:	c3                   	ret
 925:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 928:	83 ec 0c             	sub    $0xc,%esp
 92b:	8b 17                	mov    (%edi),%edx
 92d:	b9 10 00 00 00       	mov    $0x10,%ecx
 932:	89 f0                	mov    %esi,%eax
 934:	6a 00                	push   $0x0
        ap++;
 936:	83 c7 04             	add    $0x4,%edi
        printint(fd, *ap, 16, 0);
 939:	e8 62 fe ff ff       	call   7a0 <printint>
  for(i = 0; fmt[i]; i++){
 93e:	eb cf                	jmp    90f <printf+0xaf>
        s = (char*)*ap;
 940:	8b 07                	mov    (%edi),%eax
        ap++;
 942:	83 c7 04             	add    $0x4,%edi
        if(s == 0)
 945:	85 c0                	test   %eax,%eax
 947:	0f 84 b3 00 00 00    	je     a00 <printf+0x1a0>
        while(*s != 0){
 94d:	0f b6 10             	movzbl (%eax),%edx
 950:	84 d2                	test   %dl,%dl
 952:	0f 84 ba 00 00 00    	je     a12 <printf+0x1b2>
 958:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 95b:	89 c7                	mov    %eax,%edi
 95d:	89 d0                	mov    %edx,%eax
 95f:	8d 4d e7             	lea    -0x19(%ebp),%ecx
 962:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 965:	89 fb                	mov    %edi,%ebx
 967:	89 cf                	mov    %ecx,%edi
 969:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 970:	83 ec 04             	sub    $0x4,%esp
 973:	88 45 e7             	mov    %al,-0x19(%ebp)
          s++;
 976:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 979:	6a 01                	push   $0x1
 97b:	57                   	push   %edi
 97c:	56                   	push   %esi
 97d:	e8 54 fd ff ff       	call   6d6 <write>
        while(*s != 0){
 982:	0f b6 03             	movzbl (%ebx),%eax
 985:	83 c4 10             	add    $0x10,%esp
 988:	84 c0                	test   %al,%al
 98a:	75 e4                	jne    970 <printf+0x110>
 98c:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  for(i = 0; fmt[i]; i++){
 98f:	0f b6 53 01          	movzbl 0x1(%ebx),%edx
 993:	83 c3 02             	add    $0x2,%ebx
 996:	84 d2                	test   %dl,%dl
 998:	0f 85 e5 fe ff ff    	jne    883 <printf+0x23>
 99e:	e9 7a ff ff ff       	jmp    91d <printf+0xbd>
 9a3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 9a8:	83 ec 0c             	sub    $0xc,%esp
 9ab:	8b 17                	mov    (%edi),%edx
 9ad:	b9 0a 00 00 00       	mov    $0xa,%ecx
 9b2:	89 f0                	mov    %esi,%eax
 9b4:	6a 01                	push   $0x1
        ap++;
 9b6:	83 c7 04             	add    $0x4,%edi
        printint(fd, *ap, 10, 1);
 9b9:	e8 e2 fd ff ff       	call   7a0 <printint>
  for(i = 0; fmt[i]; i++){
 9be:	e9 4c ff ff ff       	jmp    90f <printf+0xaf>
 9c3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 9c8:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
 9ca:	83 ec 04             	sub    $0x4,%esp
 9cd:	8d 4d e7             	lea    -0x19(%ebp),%ecx
        ap++;
 9d0:	83 c7 04             	add    $0x4,%edi
        putc(fd, *ap);
 9d3:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 9d6:	6a 01                	push   $0x1
 9d8:	51                   	push   %ecx
 9d9:	56                   	push   %esi
 9da:	e8 f7 fc ff ff       	call   6d6 <write>
  for(i = 0; fmt[i]; i++){
 9df:	e9 2b ff ff ff       	jmp    90f <printf+0xaf>
 9e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 9e8:	83 ec 04             	sub    $0x4,%esp
 9eb:	88 55 e7             	mov    %dl,-0x19(%ebp)
 9ee:	8d 4d e7             	lea    -0x19(%ebp),%ecx
 9f1:	6a 01                	push   $0x1
 9f3:	e9 10 ff ff ff       	jmp    908 <printf+0xa8>
 9f8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 9ff:	00 
          s = "(null)";
 a00:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 a03:	b8 28 00 00 00       	mov    $0x28,%eax
 a08:	bf fe 0b 00 00       	mov    $0xbfe,%edi
 a0d:	e9 4d ff ff ff       	jmp    95f <printf+0xff>
  for(i = 0; fmt[i]; i++){
 a12:	0f b6 53 01          	movzbl 0x1(%ebx),%edx
 a16:	83 c3 02             	add    $0x2,%ebx
 a19:	84 d2                	test   %dl,%dl
 a1b:	0f 85 8f fe ff ff    	jne    8b0 <printf+0x50>
 a21:	e9 f7 fe ff ff       	jmp    91d <printf+0xbd>
 a26:	66 90                	xchg   %ax,%ax
 a28:	66 90                	xchg   %ax,%ax
 a2a:	66 90                	xchg   %ax,%ax
 a2c:	66 90                	xchg   %ax,%ax
 a2e:	66 90                	xchg   %ax,%ax
 a30:	66 90                	xchg   %ax,%ax
 a32:	66 90                	xchg   %ax,%ax
 a34:	66 90                	xchg   %ax,%ax
 a36:	66 90                	xchg   %ax,%ax
 a38:	66 90                	xchg   %ax,%ax
 a3a:	66 90                	xchg   %ax,%ax
 a3c:	66 90                	xchg   %ax,%ax
 a3e:	66 90                	xchg   %ax,%ax

00000a40 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 a40:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a41:	a1 80 10 00 00       	mov    0x1080,%eax
{
 a46:	89 e5                	mov    %esp,%ebp
 a48:	57                   	push   %edi
 a49:	56                   	push   %esi
 a4a:	53                   	push   %ebx
 a4b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 a4e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a51:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 a58:	00 
 a59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 a60:	89 c2                	mov    %eax,%edx
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a62:	8b 00                	mov    (%eax),%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a64:	39 ca                	cmp    %ecx,%edx
 a66:	73 30                	jae    a98 <free+0x58>
 a68:	39 c1                	cmp    %eax,%ecx
 a6a:	72 04                	jb     a70 <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a6c:	39 c2                	cmp    %eax,%edx
 a6e:	72 f0                	jb     a60 <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
 a70:	8b 73 fc             	mov    -0x4(%ebx),%esi
 a73:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 a76:	39 f8                	cmp    %edi,%eax
 a78:	74 36                	je     ab0 <free+0x70>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 a7a:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 a7d:	8b 42 04             	mov    0x4(%edx),%eax
 a80:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 a83:	39 f1                	cmp    %esi,%ecx
 a85:	74 40                	je     ac7 <free+0x87>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 a87:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 a89:	5b                   	pop    %ebx
  freep = p;
 a8a:	89 15 80 10 00 00    	mov    %edx,0x1080
}
 a90:	5e                   	pop    %esi
 a91:	5f                   	pop    %edi
 a92:	5d                   	pop    %ebp
 a93:	c3                   	ret
 a94:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a98:	39 c2                	cmp    %eax,%edx
 a9a:	72 c4                	jb     a60 <free+0x20>
 a9c:	39 c1                	cmp    %eax,%ecx
 a9e:	73 c0                	jae    a60 <free+0x20>
  if(bp + bp->s.size == p->s.ptr){
 aa0:	8b 73 fc             	mov    -0x4(%ebx),%esi
 aa3:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 aa6:	39 f8                	cmp    %edi,%eax
 aa8:	75 d0                	jne    a7a <free+0x3a>
 aaa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    bp->s.size += p->s.ptr->s.size;
 ab0:	03 70 04             	add    0x4(%eax),%esi
 ab3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 ab6:	8b 02                	mov    (%edx),%eax
 ab8:	8b 00                	mov    (%eax),%eax
 aba:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 abd:	8b 42 04             	mov    0x4(%edx),%eax
 ac0:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 ac3:	39 f1                	cmp    %esi,%ecx
 ac5:	75 c0                	jne    a87 <free+0x47>
    p->s.size += bp->s.size;
 ac7:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 aca:	89 15 80 10 00 00    	mov    %edx,0x1080
    p->s.size += bp->s.size;
 ad0:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 ad3:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 ad6:	89 0a                	mov    %ecx,(%edx)
}
 ad8:	5b                   	pop    %ebx
 ad9:	5e                   	pop    %esi
 ada:	5f                   	pop    %edi
 adb:	5d                   	pop    %ebp
 adc:	c3                   	ret
 add:	8d 76 00             	lea    0x0(%esi),%esi

00000ae0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 ae0:	55                   	push   %ebp
 ae1:	89 e5                	mov    %esp,%ebp
 ae3:	57                   	push   %edi
 ae4:	56                   	push   %esi
 ae5:	53                   	push   %ebx
 ae6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 ae9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 aec:	8b 15 80 10 00 00    	mov    0x1080,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 af2:	8d 78 07             	lea    0x7(%eax),%edi
 af5:	c1 ef 03             	shr    $0x3,%edi
 af8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 afb:	85 d2                	test   %edx,%edx
 afd:	0f 84 8d 00 00 00    	je     b90 <malloc+0xb0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b03:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 b05:	8b 48 04             	mov    0x4(%eax),%ecx
 b08:	39 f9                	cmp    %edi,%ecx
 b0a:	73 64                	jae    b70 <malloc+0x90>
  if(nu < 4096)
 b0c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 b11:	39 df                	cmp    %ebx,%edi
 b13:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 b16:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 b1d:	eb 0a                	jmp    b29 <malloc+0x49>
 b1f:	90                   	nop
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b20:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 b22:	8b 48 04             	mov    0x4(%eax),%ecx
 b25:	39 f9                	cmp    %edi,%ecx
 b27:	73 47                	jae    b70 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 b29:	89 c2                	mov    %eax,%edx
 b2b:	39 05 80 10 00 00    	cmp    %eax,0x1080
 b31:	75 ed                	jne    b20 <malloc+0x40>
  p = sbrk(nu * sizeof(Header));
 b33:	83 ec 0c             	sub    $0xc,%esp
 b36:	56                   	push   %esi
 b37:	e8 02 fc ff ff       	call   73e <sbrk>
  if(p == (char*)-1)
 b3c:	83 c4 10             	add    $0x10,%esp
 b3f:	83 f8 ff             	cmp    $0xffffffff,%eax
 b42:	74 1c                	je     b60 <malloc+0x80>
  hp->s.size = nu;
 b44:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 b47:	83 ec 0c             	sub    $0xc,%esp
 b4a:	83 c0 08             	add    $0x8,%eax
 b4d:	50                   	push   %eax
 b4e:	e8 ed fe ff ff       	call   a40 <free>
  return freep;
 b53:	8b 15 80 10 00 00    	mov    0x1080,%edx
      if((p = morecore(nunits)) == 0)
 b59:	83 c4 10             	add    $0x10,%esp
 b5c:	85 d2                	test   %edx,%edx
 b5e:	75 c0                	jne    b20 <malloc+0x40>
        return 0;
  }
}
 b60:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 b63:	31 c0                	xor    %eax,%eax
}
 b65:	5b                   	pop    %ebx
 b66:	5e                   	pop    %esi
 b67:	5f                   	pop    %edi
 b68:	5d                   	pop    %ebp
 b69:	c3                   	ret
 b6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 b70:	39 cf                	cmp    %ecx,%edi
 b72:	74 4c                	je     bc0 <malloc+0xe0>
        p->s.size -= nunits;
 b74:	29 f9                	sub    %edi,%ecx
 b76:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 b79:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 b7c:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 b7f:	89 15 80 10 00 00    	mov    %edx,0x1080
}
 b85:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 b88:	83 c0 08             	add    $0x8,%eax
}
 b8b:	5b                   	pop    %ebx
 b8c:	5e                   	pop    %esi
 b8d:	5f                   	pop    %edi
 b8e:	5d                   	pop    %ebp
 b8f:	c3                   	ret
    base.s.ptr = freep = prevp = &base;
 b90:	c7 05 80 10 00 00 84 	movl   $0x1084,0x1080
 b97:	10 00 00 
    base.s.size = 0;
 b9a:	b8 84 10 00 00       	mov    $0x1084,%eax
    base.s.ptr = freep = prevp = &base;
 b9f:	c7 05 84 10 00 00 84 	movl   $0x1084,0x1084
 ba6:	10 00 00 
    base.s.size = 0;
 ba9:	c7 05 88 10 00 00 00 	movl   $0x0,0x1088
 bb0:	00 00 00 
    if(p->s.size >= nunits){
 bb3:	e9 54 ff ff ff       	jmp    b0c <malloc+0x2c>
 bb8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 bbf:	00 
        prevp->s.ptr = p->s.ptr;
 bc0:	8b 08                	mov    (%eax),%ecx
 bc2:	89 0a                	mov    %ecx,(%edx)
 bc4:	eb b9                	jmp    b7f <malloc+0x9f>
