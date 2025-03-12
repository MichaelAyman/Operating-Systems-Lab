
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
  33:	75 2d                	jne    62 <main+0x62>
  35:	eb 6c                	jmp    a3 <main+0xa3>
  37:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  3e:	66 90                	xchg   %ax,%ax
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "grep: cannot open %s\n", argv[i]);
      exit();
    }
    grep(pattern, fd);
  40:	83 ec 08             	sub    $0x8,%esp
  for(i = 2; i < argc; i++){
  43:	83 c6 01             	add    $0x1,%esi
  46:	83 c3 04             	add    $0x4,%ebx
    grep(pattern, fd);
  49:	50                   	push   %eax
  4a:	ff 75 e0             	push   -0x20(%ebp)
  4d:	e8 7e 01 00 00       	call   1d0 <grep>
    close(fd);
  52:	89 3c 24             	mov    %edi,(%esp)
  55:	e8 3a 06 00 00       	call   694 <close>
  for(i = 2; i < argc; i++){
  5a:	83 c4 10             	add    $0x10,%esp
  5d:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
  60:	7e 29                	jle    8b <main+0x8b>
    if((fd = open(argv[i], 0)) < 0){
  62:	83 ec 08             	sub    $0x8,%esp
  65:	6a 00                	push   $0x0
  67:	ff 33                	push   (%ebx)
  69:	e8 3e 06 00 00       	call   6ac <open>
  6e:	83 c4 10             	add    $0x10,%esp
  71:	89 c7                	mov    %eax,%edi
  73:	85 c0                	test   %eax,%eax
  75:	79 c9                	jns    40 <main+0x40>
      printf(1, "grep: cannot open %s\n", argv[i]);
  77:	50                   	push   %eax
  78:	ff 33                	push   (%ebx)
  7a:	68 38 0b 00 00       	push   $0xb38
  7f:	6a 01                	push   $0x1
  81:	e8 6a 07 00 00       	call   7f0 <printf>
      exit();
  86:	e8 e1 05 00 00       	call   66c <exit>
  }
  exit();
  8b:	e8 dc 05 00 00       	call   66c <exit>
    printf(2, "usage: grep pattern [file ...]\n");
  90:	51                   	push   %ecx
  91:	51                   	push   %ecx
  92:	68 18 0b 00 00       	push   $0xb18
  97:	6a 02                	push   $0x2
  99:	e8 52 07 00 00       	call   7f0 <printf>
    exit();
  9e:	e8 c9 05 00 00       	call   66c <exit>
    grep(pattern, 0);
  a3:	52                   	push   %edx
  a4:	52                   	push   %edx
  a5:	6a 00                	push   $0x0
  a7:	50                   	push   %eax
  a8:	e8 23 01 00 00       	call   1d0 <grep>
    exit();
  ad:	e8 ba 05 00 00       	call   66c <exit>
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
  c6:	83 ec 0c             	sub    $0xc,%esp
  c9:	8b 75 08             	mov    0x8(%ebp),%esi
  cc:	8b 7d 0c             	mov    0xc(%ebp),%edi
  if(re[0] == '\0')
  cf:	0f b6 06             	movzbl (%esi),%eax
  d2:	84 c0                	test   %al,%al
  d4:	75 2d                	jne    103 <matchhere+0x43>
  d6:	e9 7d 00 00 00       	jmp    158 <matchhere+0x98>
  db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  df:	90                   	nop
    return 1;
  if(re[1] == '*')
    return matchstar(re[0], re+2, text);
  if(re[0] == '$' && re[1] == '\0')
    return *text == '\0';
  e0:	0f b6 0f             	movzbl (%edi),%ecx
  if(re[0] == '$' && re[1] == '\0')
  e3:	80 fb 24             	cmp    $0x24,%bl
  e6:	75 04                	jne    ec <matchhere+0x2c>
  e8:	84 c0                	test   %al,%al
  ea:	74 79                	je     165 <matchhere+0xa5>
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
  ec:	84 c9                	test   %cl,%cl
  ee:	74 58                	je     148 <matchhere+0x88>
  f0:	38 d9                	cmp    %bl,%cl
  f2:	74 05                	je     f9 <matchhere+0x39>
  f4:	80 fb 2e             	cmp    $0x2e,%bl
  f7:	75 4f                	jne    148 <matchhere+0x88>
    return matchhere(re+1, text+1);
  f9:	83 c7 01             	add    $0x1,%edi
  fc:	83 c6 01             	add    $0x1,%esi
  if(re[0] == '\0')
  ff:	84 c0                	test   %al,%al
 101:	74 55                	je     158 <matchhere+0x98>
  if(re[1] == '*')
 103:	0f be d8             	movsbl %al,%ebx
 106:	0f b6 46 01          	movzbl 0x1(%esi),%eax
 10a:	3c 2a                	cmp    $0x2a,%al
 10c:	75 d2                	jne    e0 <matchhere+0x20>
    return matchstar(re[0], re+2, text);
 10e:	83 c6 02             	add    $0x2,%esi
  return 0;
}

// matchstar: search for c*re at beginning of text
int matchstar(int c, char *re, char *text)
 111:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
{
  do{  // a * matches zero or more instances
    if(matchhere(re, text))
 118:	83 ec 08             	sub    $0x8,%esp
 11b:	57                   	push   %edi
 11c:	56                   	push   %esi
 11d:	e8 9e ff ff ff       	call   c0 <matchhere>
 122:	83 c4 10             	add    $0x10,%esp
 125:	85 c0                	test   %eax,%eax
 127:	75 2f                	jne    158 <matchhere+0x98>
      return 1;
  }while(*text!='\0' && (*text++==c || c=='.'));
 129:	0f be 17             	movsbl (%edi),%edx
 12c:	84 d2                	test   %dl,%dl
 12e:	74 0c                	je     13c <matchhere+0x7c>
 130:	83 c7 01             	add    $0x1,%edi
 133:	83 fb 2e             	cmp    $0x2e,%ebx
 136:	74 e0                	je     118 <matchhere+0x58>
 138:	39 da                	cmp    %ebx,%edx
 13a:	74 dc                	je     118 <matchhere+0x58>
}
 13c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 13f:	5b                   	pop    %ebx
 140:	5e                   	pop    %esi
 141:	5f                   	pop    %edi
 142:	5d                   	pop    %ebp
 143:	c3                   	ret    
 144:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 148:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
 14b:	31 c0                	xor    %eax,%eax
}
 14d:	5b                   	pop    %ebx
 14e:	5e                   	pop    %esi
 14f:	5f                   	pop    %edi
 150:	5d                   	pop    %ebp
 151:	c3                   	ret    
 152:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 158:	8d 65 f4             	lea    -0xc(%ebp),%esp
    return 1;
 15b:	b8 01 00 00 00       	mov    $0x1,%eax
}
 160:	5b                   	pop    %ebx
 161:	5e                   	pop    %esi
 162:	5f                   	pop    %edi
 163:	5d                   	pop    %ebp
 164:	c3                   	ret    
    return *text == '\0';
 165:	31 c0                	xor    %eax,%eax
 167:	84 c9                	test   %cl,%cl
 169:	0f 94 c0             	sete   %al
 16c:	eb ce                	jmp    13c <matchhere+0x7c>
 16e:	66 90                	xchg   %ax,%ax

00000170 <match>:
{
 170:	55                   	push   %ebp
 171:	89 e5                	mov    %esp,%ebp
 173:	56                   	push   %esi
 174:	53                   	push   %ebx
 175:	8b 5d 08             	mov    0x8(%ebp),%ebx
 178:	8b 75 0c             	mov    0xc(%ebp),%esi
  if(re[0] == '^')
 17b:	80 3b 5e             	cmpb   $0x5e,(%ebx)
 17e:	75 11                	jne    191 <match+0x21>
 180:	eb 2e                	jmp    1b0 <match+0x40>
 182:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  }while(*text++ != '\0');
 188:	83 c6 01             	add    $0x1,%esi
 18b:	80 7e ff 00          	cmpb   $0x0,-0x1(%esi)
 18f:	74 16                	je     1a7 <match+0x37>
    if(matchhere(re, text))
 191:	83 ec 08             	sub    $0x8,%esp
 194:	56                   	push   %esi
 195:	53                   	push   %ebx
 196:	e8 25 ff ff ff       	call   c0 <matchhere>
 19b:	83 c4 10             	add    $0x10,%esp
 19e:	85 c0                	test   %eax,%eax
 1a0:	74 e6                	je     188 <match+0x18>
      return 1;
 1a2:	b8 01 00 00 00       	mov    $0x1,%eax
}
 1a7:	8d 65 f8             	lea    -0x8(%ebp),%esp
 1aa:	5b                   	pop    %ebx
 1ab:	5e                   	pop    %esi
 1ac:	5d                   	pop    %ebp
 1ad:	c3                   	ret    
 1ae:	66 90                	xchg   %ax,%ax
    return matchhere(re+1, text);
 1b0:	83 c3 01             	add    $0x1,%ebx
 1b3:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
 1b6:	8d 65 f8             	lea    -0x8(%ebp),%esp
 1b9:	5b                   	pop    %ebx
 1ba:	5e                   	pop    %esi
 1bb:	5d                   	pop    %ebp
    return matchhere(re+1, text);
 1bc:	e9 ff fe ff ff       	jmp    c0 <matchhere>
 1c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1c8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1cf:	90                   	nop

000001d0 <grep>:
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	57                   	push   %edi
 1d4:	56                   	push   %esi
 1d5:	53                   	push   %ebx
 1d6:	83 ec 1c             	sub    $0x1c,%esp
 1d9:	8b 7d 08             	mov    0x8(%ebp),%edi
  m = 0;
 1dc:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    return matchhere(re+1, text);
 1e3:	8d 47 01             	lea    0x1(%edi),%eax
 1e6:	89 45 d8             	mov    %eax,-0x28(%ebp)
 1e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  while((n = read(fd, buf+m, sizeof(buf)-m-1)) > 0){
 1f0:	8b 4d dc             	mov    -0x24(%ebp),%ecx
 1f3:	b8 ff 03 00 00       	mov    $0x3ff,%eax
 1f8:	83 ec 04             	sub    $0x4,%esp
 1fb:	29 c8                	sub    %ecx,%eax
 1fd:	50                   	push   %eax
 1fe:	8d 81 a0 0f 00 00    	lea    0xfa0(%ecx),%eax
 204:	50                   	push   %eax
 205:	ff 75 0c             	push   0xc(%ebp)
 208:	e8 77 04 00 00       	call   684 <read>
 20d:	83 c4 10             	add    $0x10,%esp
 210:	85 c0                	test   %eax,%eax
 212:	0f 8e e5 00 00 00    	jle    2fd <grep+0x12d>
    m += n;
 218:	01 45 dc             	add    %eax,-0x24(%ebp)
 21b:	8b 4d dc             	mov    -0x24(%ebp),%ecx
    p = buf;
 21e:	c7 45 e4 a0 0f 00 00 	movl   $0xfa0,-0x1c(%ebp)
    buf[m] = '\0';
 225:	c6 81 a0 0f 00 00 00 	movb   $0x0,0xfa0(%ecx)
    while((q = strchr(p, '\n')) != 0){
 22c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 230:	83 ec 08             	sub    $0x8,%esp
 233:	6a 0a                	push   $0xa
 235:	ff 75 e4             	push   -0x1c(%ebp)
 238:	e8 13 02 00 00       	call   450 <strchr>
 23d:	83 c4 10             	add    $0x10,%esp
 240:	89 c3                	mov    %eax,%ebx
 242:	85 c0                	test   %eax,%eax
 244:	74 72                	je     2b8 <grep+0xe8>
      *q = 0;
 246:	c6 03 00             	movb   $0x0,(%ebx)
        write(1, p, q+1 - p);
 249:	8d 43 01             	lea    0x1(%ebx),%eax
  if(re[0] == '^')
 24c:	80 3f 5e             	cmpb   $0x5e,(%edi)
        write(1, p, q+1 - p);
 24f:	89 45 e0             	mov    %eax,-0x20(%ebp)
 252:	8b 75 e4             	mov    -0x1c(%ebp),%esi
  if(re[0] == '^')
 255:	75 12                	jne    269 <grep+0x99>
 257:	eb 47                	jmp    2a0 <grep+0xd0>
 259:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  }while(*text++ != '\0');
 260:	83 c6 01             	add    $0x1,%esi
 263:	80 7e ff 00          	cmpb   $0x0,-0x1(%esi)
 267:	74 2b                	je     294 <grep+0xc4>
    if(matchhere(re, text))
 269:	83 ec 08             	sub    $0x8,%esp
 26c:	56                   	push   %esi
 26d:	57                   	push   %edi
 26e:	e8 4d fe ff ff       	call   c0 <matchhere>
 273:	83 c4 10             	add    $0x10,%esp
 276:	85 c0                	test   %eax,%eax
 278:	74 e6                	je     260 <grep+0x90>
        write(1, p, q+1 - p);
 27a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 27d:	8b 45 e0             	mov    -0x20(%ebp),%eax
 280:	83 ec 04             	sub    $0x4,%esp
        *q = '\n';
 283:	c6 03 0a             	movb   $0xa,(%ebx)
        write(1, p, q+1 - p);
 286:	29 d0                	sub    %edx,%eax
 288:	50                   	push   %eax
 289:	52                   	push   %edx
 28a:	6a 01                	push   $0x1
 28c:	e8 fb 03 00 00       	call   68c <write>
 291:	83 c4 10             	add    $0x10,%esp
      p = q+1;
 294:	8b 45 e0             	mov    -0x20(%ebp),%eax
 297:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 29a:	eb 94                	jmp    230 <grep+0x60>
 29c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return matchhere(re+1, text);
 2a0:	83 ec 08             	sub    $0x8,%esp
 2a3:	56                   	push   %esi
 2a4:	ff 75 d8             	push   -0x28(%ebp)
 2a7:	e8 14 fe ff ff       	call   c0 <matchhere>
 2ac:	83 c4 10             	add    $0x10,%esp
      if(match(pattern, p)){
 2af:	85 c0                	test   %eax,%eax
 2b1:	74 e1                	je     294 <grep+0xc4>
 2b3:	eb c5                	jmp    27a <grep+0xaa>
 2b5:	8d 76 00             	lea    0x0(%esi),%esi
    if(p == buf)
 2b8:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 2bb:	81 fa a0 0f 00 00    	cmp    $0xfa0,%edx
 2c1:	74 2e                	je     2f1 <grep+0x121>
    if(m > 0){
 2c3:	8b 4d dc             	mov    -0x24(%ebp),%ecx
 2c6:	85 c9                	test   %ecx,%ecx
 2c8:	0f 8e 22 ff ff ff    	jle    1f0 <grep+0x20>
      m -= p - buf;
 2ce:	89 d0                	mov    %edx,%eax
      memmove(buf, p, m);
 2d0:	83 ec 04             	sub    $0x4,%esp
      m -= p - buf;
 2d3:	2d a0 0f 00 00       	sub    $0xfa0,%eax
 2d8:	29 c1                	sub    %eax,%ecx
      memmove(buf, p, m);
 2da:	51                   	push   %ecx
 2db:	52                   	push   %edx
 2dc:	68 a0 0f 00 00       	push   $0xfa0
      m -= p - buf;
 2e1:	89 4d dc             	mov    %ecx,-0x24(%ebp)
      memmove(buf, p, m);
 2e4:	e8 a7 02 00 00       	call   590 <memmove>
 2e9:	83 c4 10             	add    $0x10,%esp
 2ec:	e9 ff fe ff ff       	jmp    1f0 <grep+0x20>
      m = 0;
 2f1:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
 2f8:	e9 f3 fe ff ff       	jmp    1f0 <grep+0x20>
}
 2fd:	8d 65 f4             	lea    -0xc(%ebp),%esp
 300:	5b                   	pop    %ebx
 301:	5e                   	pop    %esi
 302:	5f                   	pop    %edi
 303:	5d                   	pop    %ebp
 304:	c3                   	ret    
 305:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 30c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000310 <matchstar>:
{
 310:	55                   	push   %ebp
 311:	89 e5                	mov    %esp,%ebp
 313:	57                   	push   %edi
 314:	56                   	push   %esi
 315:	53                   	push   %ebx
 316:	83 ec 0c             	sub    $0xc,%esp
 319:	8b 5d 08             	mov    0x8(%ebp),%ebx
 31c:	8b 75 0c             	mov    0xc(%ebp),%esi
 31f:	8b 7d 10             	mov    0x10(%ebp),%edi
 322:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(matchhere(re, text))
 328:	83 ec 08             	sub    $0x8,%esp
 32b:	57                   	push   %edi
 32c:	56                   	push   %esi
 32d:	e8 8e fd ff ff       	call   c0 <matchhere>
 332:	83 c4 10             	add    $0x10,%esp
 335:	85 c0                	test   %eax,%eax
 337:	75 1f                	jne    358 <matchstar+0x48>
  }while(*text!='\0' && (*text++==c || c=='.'));
 339:	0f be 17             	movsbl (%edi),%edx
 33c:	84 d2                	test   %dl,%dl
 33e:	74 0c                	je     34c <matchstar+0x3c>
 340:	83 c7 01             	add    $0x1,%edi
 343:	39 da                	cmp    %ebx,%edx
 345:	74 e1                	je     328 <matchstar+0x18>
 347:	83 fb 2e             	cmp    $0x2e,%ebx
 34a:	74 dc                	je     328 <matchstar+0x18>
}
 34c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 34f:	5b                   	pop    %ebx
 350:	5e                   	pop    %esi
 351:	5f                   	pop    %edi
 352:	5d                   	pop    %ebp
 353:	c3                   	ret    
 354:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 358:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return 1;
 35b:	b8 01 00 00 00       	mov    $0x1,%eax
}
 360:	5b                   	pop    %ebx
 361:	5e                   	pop    %esi
 362:	5f                   	pop    %edi
 363:	5d                   	pop    %ebp
 364:	c3                   	ret    
 365:	66 90                	xchg   %ax,%ax
 367:	66 90                	xchg   %ax,%ax
 369:	66 90                	xchg   %ax,%ax
 36b:	66 90                	xchg   %ax,%ax
 36d:	66 90                	xchg   %ax,%ax
 36f:	90                   	nop

00000370 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 370:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 371:	31 c0                	xor    %eax,%eax
{
 373:	89 e5                	mov    %esp,%ebp
 375:	53                   	push   %ebx
 376:	8b 4d 08             	mov    0x8(%ebp),%ecx
 379:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 37c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 380:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 384:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 387:	83 c0 01             	add    $0x1,%eax
 38a:	84 d2                	test   %dl,%dl
 38c:	75 f2                	jne    380 <strcpy+0x10>
    ;
  return os;
}
 38e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 391:	89 c8                	mov    %ecx,%eax
 393:	c9                   	leave  
 394:	c3                   	ret    
 395:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 39c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000003a0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 3a0:	55                   	push   %ebp
 3a1:	89 e5                	mov    %esp,%ebp
 3a3:	53                   	push   %ebx
 3a4:	8b 55 08             	mov    0x8(%ebp),%edx
 3a7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 3aa:	0f b6 02             	movzbl (%edx),%eax
 3ad:	84 c0                	test   %al,%al
 3af:	75 17                	jne    3c8 <strcmp+0x28>
 3b1:	eb 3a                	jmp    3ed <strcmp+0x4d>
 3b3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3b7:	90                   	nop
 3b8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 3bc:	83 c2 01             	add    $0x1,%edx
 3bf:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 3c2:	84 c0                	test   %al,%al
 3c4:	74 1a                	je     3e0 <strcmp+0x40>
    p++, q++;
 3c6:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 3c8:	0f b6 19             	movzbl (%ecx),%ebx
 3cb:	38 c3                	cmp    %al,%bl
 3cd:	74 e9                	je     3b8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 3cf:	29 d8                	sub    %ebx,%eax
}
 3d1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3d4:	c9                   	leave  
 3d5:	c3                   	ret    
 3d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3dd:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 3e0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 3e4:	31 c0                	xor    %eax,%eax
 3e6:	29 d8                	sub    %ebx,%eax
}
 3e8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3eb:	c9                   	leave  
 3ec:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 3ed:	0f b6 19             	movzbl (%ecx),%ebx
 3f0:	31 c0                	xor    %eax,%eax
 3f2:	eb db                	jmp    3cf <strcmp+0x2f>
 3f4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3fb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3ff:	90                   	nop

00000400 <strlen>:

uint
strlen(const char *s)
{
 400:	55                   	push   %ebp
 401:	89 e5                	mov    %esp,%ebp
 403:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 406:	80 3a 00             	cmpb   $0x0,(%edx)
 409:	74 15                	je     420 <strlen+0x20>
 40b:	31 c0                	xor    %eax,%eax
 40d:	8d 76 00             	lea    0x0(%esi),%esi
 410:	83 c0 01             	add    $0x1,%eax
 413:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 417:	89 c1                	mov    %eax,%ecx
 419:	75 f5                	jne    410 <strlen+0x10>
    ;
  return n;
}
 41b:	89 c8                	mov    %ecx,%eax
 41d:	5d                   	pop    %ebp
 41e:	c3                   	ret    
 41f:	90                   	nop
  for(n = 0; s[n]; n++)
 420:	31 c9                	xor    %ecx,%ecx
}
 422:	5d                   	pop    %ebp
 423:	89 c8                	mov    %ecx,%eax
 425:	c3                   	ret    
 426:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 42d:	8d 76 00             	lea    0x0(%esi),%esi

00000430 <memset>:

void*
memset(void *dst, int c, uint n)
{
 430:	55                   	push   %ebp
 431:	89 e5                	mov    %esp,%ebp
 433:	57                   	push   %edi
 434:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 437:	8b 4d 10             	mov    0x10(%ebp),%ecx
 43a:	8b 45 0c             	mov    0xc(%ebp),%eax
 43d:	89 d7                	mov    %edx,%edi
 43f:	fc                   	cld    
 440:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 442:	8b 7d fc             	mov    -0x4(%ebp),%edi
 445:	89 d0                	mov    %edx,%eax
 447:	c9                   	leave  
 448:	c3                   	ret    
 449:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000450 <strchr>:

char*
strchr(const char *s, char c)
{
 450:	55                   	push   %ebp
 451:	89 e5                	mov    %esp,%ebp
 453:	8b 45 08             	mov    0x8(%ebp),%eax
 456:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 45a:	0f b6 10             	movzbl (%eax),%edx
 45d:	84 d2                	test   %dl,%dl
 45f:	75 12                	jne    473 <strchr+0x23>
 461:	eb 1d                	jmp    480 <strchr+0x30>
 463:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 467:	90                   	nop
 468:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 46c:	83 c0 01             	add    $0x1,%eax
 46f:	84 d2                	test   %dl,%dl
 471:	74 0d                	je     480 <strchr+0x30>
    if(*s == c)
 473:	38 d1                	cmp    %dl,%cl
 475:	75 f1                	jne    468 <strchr+0x18>
      return (char*)s;
  return 0;
}
 477:	5d                   	pop    %ebp
 478:	c3                   	ret    
 479:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 480:	31 c0                	xor    %eax,%eax
}
 482:	5d                   	pop    %ebp
 483:	c3                   	ret    
 484:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 48b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 48f:	90                   	nop

00000490 <gets>:

char*
gets(char *buf, int max)
{
 490:	55                   	push   %ebp
 491:	89 e5                	mov    %esp,%ebp
 493:	57                   	push   %edi
 494:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 495:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 498:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 499:	31 db                	xor    %ebx,%ebx
{
 49b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 49e:	eb 27                	jmp    4c7 <gets+0x37>
    cc = read(0, &c, 1);
 4a0:	83 ec 04             	sub    $0x4,%esp
 4a3:	6a 01                	push   $0x1
 4a5:	57                   	push   %edi
 4a6:	6a 00                	push   $0x0
 4a8:	e8 d7 01 00 00       	call   684 <read>
    if(cc < 1)
 4ad:	83 c4 10             	add    $0x10,%esp
 4b0:	85 c0                	test   %eax,%eax
 4b2:	7e 1d                	jle    4d1 <gets+0x41>
      break;
    buf[i++] = c;
 4b4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 4b8:	8b 55 08             	mov    0x8(%ebp),%edx
 4bb:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 4bf:	3c 0a                	cmp    $0xa,%al
 4c1:	74 1d                	je     4e0 <gets+0x50>
 4c3:	3c 0d                	cmp    $0xd,%al
 4c5:	74 19                	je     4e0 <gets+0x50>
  for(i=0; i+1 < max; ){
 4c7:	89 de                	mov    %ebx,%esi
 4c9:	83 c3 01             	add    $0x1,%ebx
 4cc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 4cf:	7c cf                	jl     4a0 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 4d1:	8b 45 08             	mov    0x8(%ebp),%eax
 4d4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 4d8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4db:	5b                   	pop    %ebx
 4dc:	5e                   	pop    %esi
 4dd:	5f                   	pop    %edi
 4de:	5d                   	pop    %ebp
 4df:	c3                   	ret    
  buf[i] = '\0';
 4e0:	8b 45 08             	mov    0x8(%ebp),%eax
 4e3:	89 de                	mov    %ebx,%esi
 4e5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 4e9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4ec:	5b                   	pop    %ebx
 4ed:	5e                   	pop    %esi
 4ee:	5f                   	pop    %edi
 4ef:	5d                   	pop    %ebp
 4f0:	c3                   	ret    
 4f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4ff:	90                   	nop

00000500 <stat>:

int
stat(const char *n, struct stat *st)
{
 500:	55                   	push   %ebp
 501:	89 e5                	mov    %esp,%ebp
 503:	56                   	push   %esi
 504:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 505:	83 ec 08             	sub    $0x8,%esp
 508:	6a 00                	push   $0x0
 50a:	ff 75 08             	push   0x8(%ebp)
 50d:	e8 9a 01 00 00       	call   6ac <open>
  if(fd < 0)
 512:	83 c4 10             	add    $0x10,%esp
 515:	85 c0                	test   %eax,%eax
 517:	78 27                	js     540 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 519:	83 ec 08             	sub    $0x8,%esp
 51c:	ff 75 0c             	push   0xc(%ebp)
 51f:	89 c3                	mov    %eax,%ebx
 521:	50                   	push   %eax
 522:	e8 9d 01 00 00       	call   6c4 <fstat>
  close(fd);
 527:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 52a:	89 c6                	mov    %eax,%esi
  close(fd);
 52c:	e8 63 01 00 00       	call   694 <close>
  return r;
 531:	83 c4 10             	add    $0x10,%esp
}
 534:	8d 65 f8             	lea    -0x8(%ebp),%esp
 537:	89 f0                	mov    %esi,%eax
 539:	5b                   	pop    %ebx
 53a:	5e                   	pop    %esi
 53b:	5d                   	pop    %ebp
 53c:	c3                   	ret    
 53d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 540:	be ff ff ff ff       	mov    $0xffffffff,%esi
 545:	eb ed                	jmp    534 <stat+0x34>
 547:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 54e:	66 90                	xchg   %ax,%ax

00000550 <atoi>:

int
atoi(const char *s)
{
 550:	55                   	push   %ebp
 551:	89 e5                	mov    %esp,%ebp
 553:	53                   	push   %ebx
 554:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 557:	0f be 02             	movsbl (%edx),%eax
 55a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 55d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 560:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 565:	77 1e                	ja     585 <atoi+0x35>
 567:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 56e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 570:	83 c2 01             	add    $0x1,%edx
 573:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 576:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 57a:	0f be 02             	movsbl (%edx),%eax
 57d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 580:	80 fb 09             	cmp    $0x9,%bl
 583:	76 eb                	jbe    570 <atoi+0x20>
  return n;
}
 585:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 588:	89 c8                	mov    %ecx,%eax
 58a:	c9                   	leave  
 58b:	c3                   	ret    
 58c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000590 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 590:	55                   	push   %ebp
 591:	89 e5                	mov    %esp,%ebp
 593:	57                   	push   %edi
 594:	8b 45 10             	mov    0x10(%ebp),%eax
 597:	8b 55 08             	mov    0x8(%ebp),%edx
 59a:	56                   	push   %esi
 59b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 59e:	85 c0                	test   %eax,%eax
 5a0:	7e 13                	jle    5b5 <memmove+0x25>
 5a2:	01 d0                	add    %edx,%eax
  dst = vdst;
 5a4:	89 d7                	mov    %edx,%edi
 5a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5ad:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 5b0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 5b1:	39 f8                	cmp    %edi,%eax
 5b3:	75 fb                	jne    5b0 <memmove+0x20>
  return vdst;
}
 5b5:	5e                   	pop    %esi
 5b6:	89 d0                	mov    %edx,%eax
 5b8:	5f                   	pop    %edi
 5b9:	5d                   	pop    %ebp
 5ba:	c3                   	ret    
 5bb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 5bf:	90                   	nop

000005c0 <sqrt>:


// https://www.geeksforgeeks.org/c-program-to-find-square-root-of-a-given-number/
float sqrt(int num) {
 5c0:	55                   	push   %ebp
 5c1:	89 e5                	mov    %esp,%ebp
 5c3:	56                   	push   %esi
 5c4:	53                   	push   %ebx
 5c5:	83 ec 04             	sub    $0x4,%esp
 5c8:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int end = num;
  int middle;

  float solution = 0.0;

  while (start <= end) {
 5cb:	85 db                	test   %ebx,%ebx
 5cd:	0f 88 8d 00 00 00    	js     660 <sqrt+0xa0>
    middle = (start + end) / 2;
 5d3:	89 d8                	mov    %ebx,%eax
 5d5:	d1 f8                	sar    %eax
    if (middle * middle == num) {
 5d7:	89 c2                	mov    %eax,%edx
 5d9:	0f af d0             	imul   %eax,%edx
 5dc:	39 d3                	cmp    %edx,%ebx
 5de:	74 78                	je     658 <sqrt+0x98>
 5e0:	89 de                	mov    %ebx,%esi
  float solution = 0.0;
 5e2:	d9 ee                	fldz   
  int start = 0;
 5e4:	31 c9                	xor    %ecx,%ecx
 5e6:	eb 25                	jmp    60d <sqrt+0x4d>
 5e8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5ef:	90                   	nop
 5f0:	dd d8                	fstp   %st(0)
      solution = middle;
      break;
    }
    if (middle * middle < num) {
      solution = start;
 5f2:	89 4d f4             	mov    %ecx,-0xc(%ebp)
      start = middle + 1;
 5f5:	8d 48 01             	lea    0x1(%eax),%ecx
      solution = start;
 5f8:	db 45 f4             	fildl  -0xc(%ebp)
  while (start <= end) {
 5fb:	39 ce                	cmp    %ecx,%esi
 5fd:	7c 19                	jl     618 <sqrt+0x58>
    middle = (start + end) / 2;
 5ff:	8d 04 0e             	lea    (%esi,%ecx,1),%eax
 602:	d1 f8                	sar    %eax
    if (middle * middle == num) {
 604:	89 c2                	mov    %eax,%edx
 606:	0f af d0             	imul   %eax,%edx
 609:	39 da                	cmp    %ebx,%edx
 60b:	74 49                	je     656 <sqrt+0x96>
    if (middle * middle < num) {
 60d:	39 d3                	cmp    %edx,%ebx
 60f:	7f df                	jg     5f0 <sqrt+0x30>
    }
    else {
      end = middle - 1;
 611:	8d 70 ff             	lea    -0x1(%eax),%esi
  while (start <= end) {
 614:	39 ce                	cmp    %ecx,%esi
 616:	7d e7                	jge    5ff <sqrt+0x3f>

  float eps = 0.1;
  int i;

  for (i = 0; i < 5; i++) {
    while (solution * solution <= num) {
 618:	89 5d f4             	mov    %ebx,-0xc(%ebp)
 61b:	b8 05 00 00 00       	mov    $0x5,%eax
 620:	db 45 f4             	fildl  -0xc(%ebp)
 623:	d9 05 50 0b 00 00    	flds   0xb50
 629:	eb 07                	jmp    632 <sqrt+0x72>
 62b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 62f:	90                   	nop
      solution += eps;
 630:	dc c2                	fadd   %st,%st(2)
    while (solution * solution <= num) {
 632:	d9 c2                	fld    %st(2)
 634:	d8 cb                	fmul   %st(3),%st
 636:	d9 ca                	fxch   %st(2)
 638:	db f2                	fcomi  %st(2),%st
 63a:	dd da                	fstp   %st(2)
 63c:	73 f2                	jae    630 <sqrt+0x70>
    }
    solution = solution - eps;
 63e:	dc ea                	fsubr  %st,%st(2)
    eps = eps / 10;
 640:	d8 35 54 0b 00 00    	fdivs  0xb54
  for (i = 0; i < 5; i++) {
 646:	83 e8 01             	sub    $0x1,%eax
 649:	75 e7                	jne    632 <sqrt+0x72>
 64b:	dd d8                	fstp   %st(0)
 64d:	dd d8                	fstp   %st(0)
  }
  return solution;

}
 64f:	83 c4 04             	add    $0x4,%esp
 652:	5b                   	pop    %ebx
 653:	5e                   	pop    %esi
 654:	5d                   	pop    %ebp
 655:	c3                   	ret    
 656:	dd d8                	fstp   %st(0)
      solution = middle;
 658:	89 45 f4             	mov    %eax,-0xc(%ebp)
 65b:	db 45 f4             	fildl  -0xc(%ebp)
      break;
 65e:	eb b8                	jmp    618 <sqrt+0x58>
  float solution = 0.0;
 660:	d9 ee                	fldz   
 662:	eb b4                	jmp    618 <sqrt+0x58>

00000664 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 664:	b8 01 00 00 00       	mov    $0x1,%eax
 669:	cd 40                	int    $0x40
 66b:	c3                   	ret    

0000066c <exit>:
SYSCALL(exit)
 66c:	b8 02 00 00 00       	mov    $0x2,%eax
 671:	cd 40                	int    $0x40
 673:	c3                   	ret    

00000674 <wait>:
SYSCALL(wait)
 674:	b8 03 00 00 00       	mov    $0x3,%eax
 679:	cd 40                	int    $0x40
 67b:	c3                   	ret    

0000067c <pipe>:
SYSCALL(pipe)
 67c:	b8 04 00 00 00       	mov    $0x4,%eax
 681:	cd 40                	int    $0x40
 683:	c3                   	ret    

00000684 <read>:
SYSCALL(read)
 684:	b8 05 00 00 00       	mov    $0x5,%eax
 689:	cd 40                	int    $0x40
 68b:	c3                   	ret    

0000068c <write>:
SYSCALL(write)
 68c:	b8 10 00 00 00       	mov    $0x10,%eax
 691:	cd 40                	int    $0x40
 693:	c3                   	ret    

00000694 <close>:
SYSCALL(close)
 694:	b8 15 00 00 00       	mov    $0x15,%eax
 699:	cd 40                	int    $0x40
 69b:	c3                   	ret    

0000069c <kill>:
SYSCALL(kill)
 69c:	b8 06 00 00 00       	mov    $0x6,%eax
 6a1:	cd 40                	int    $0x40
 6a3:	c3                   	ret    

000006a4 <exec>:
SYSCALL(exec)
 6a4:	b8 07 00 00 00       	mov    $0x7,%eax
 6a9:	cd 40                	int    $0x40
 6ab:	c3                   	ret    

000006ac <open>:
SYSCALL(open)
 6ac:	b8 0f 00 00 00       	mov    $0xf,%eax
 6b1:	cd 40                	int    $0x40
 6b3:	c3                   	ret    

000006b4 <mknod>:
SYSCALL(mknod)
 6b4:	b8 11 00 00 00       	mov    $0x11,%eax
 6b9:	cd 40                	int    $0x40
 6bb:	c3                   	ret    

000006bc <unlink>:
SYSCALL(unlink)
 6bc:	b8 12 00 00 00       	mov    $0x12,%eax
 6c1:	cd 40                	int    $0x40
 6c3:	c3                   	ret    

000006c4 <fstat>:
SYSCALL(fstat)
 6c4:	b8 08 00 00 00       	mov    $0x8,%eax
 6c9:	cd 40                	int    $0x40
 6cb:	c3                   	ret    

000006cc <link>:
SYSCALL(link)
 6cc:	b8 13 00 00 00       	mov    $0x13,%eax
 6d1:	cd 40                	int    $0x40
 6d3:	c3                   	ret    

000006d4 <mkdir>:
SYSCALL(mkdir)
 6d4:	b8 14 00 00 00       	mov    $0x14,%eax
 6d9:	cd 40                	int    $0x40
 6db:	c3                   	ret    

000006dc <chdir>:
SYSCALL(chdir)
 6dc:	b8 09 00 00 00       	mov    $0x9,%eax
 6e1:	cd 40                	int    $0x40
 6e3:	c3                   	ret    

000006e4 <dup>:
SYSCALL(dup)
 6e4:	b8 0a 00 00 00       	mov    $0xa,%eax
 6e9:	cd 40                	int    $0x40
 6eb:	c3                   	ret    

000006ec <getpid>:
SYSCALL(getpid)
 6ec:	b8 0b 00 00 00       	mov    $0xb,%eax
 6f1:	cd 40                	int    $0x40
 6f3:	c3                   	ret    

000006f4 <sbrk>:
SYSCALL(sbrk)
 6f4:	b8 0c 00 00 00       	mov    $0xc,%eax
 6f9:	cd 40                	int    $0x40
 6fb:	c3                   	ret    

000006fc <sleep>:
SYSCALL(sleep)
 6fc:	b8 0d 00 00 00       	mov    $0xd,%eax
 701:	cd 40                	int    $0x40
 703:	c3                   	ret    

00000704 <uptime>:
SYSCALL(uptime)
 704:	b8 0e 00 00 00       	mov    $0xe,%eax
 709:	cd 40                	int    $0x40
 70b:	c3                   	ret    

0000070c <gettid>:
SYSCALL(gettid)
 70c:	b8 16 00 00 00       	mov    $0x16,%eax
 711:	cd 40                	int    $0x40
 713:	c3                   	ret    

00000714 <getpgid>:
SYSCALL(getpgid)
 714:	b8 17 00 00 00       	mov    $0x17,%eax
 719:	cd 40                	int    $0x40
 71b:	c3                   	ret    

0000071c <setpgid>:
SYSCALL(setpgid)
 71c:	b8 18 00 00 00       	mov    $0x18,%eax
 721:	cd 40                	int    $0x40
 723:	c3                   	ret    

00000724 <getppid>:
SYSCALL(getppid)
 724:	b8 19 00 00 00       	mov    $0x19,%eax
 729:	cd 40                	int    $0x40
 72b:	c3                   	ret    

0000072c <uptime_ms>:
SYSCALL(uptime_ms)
 72c:	b8 1a 00 00 00       	mov    $0x1a,%eax
 731:	cd 40                	int    $0x40
 733:	c3                   	ret    
 734:	66 90                	xchg   %ax,%ax
 736:	66 90                	xchg   %ax,%ax
 738:	66 90                	xchg   %ax,%ax
 73a:	66 90                	xchg   %ax,%ax
 73c:	66 90                	xchg   %ax,%ax
 73e:	66 90                	xchg   %ax,%ax

00000740 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 740:	55                   	push   %ebp
 741:	89 e5                	mov    %esp,%ebp
 743:	57                   	push   %edi
 744:	56                   	push   %esi
 745:	53                   	push   %ebx
 746:	83 ec 3c             	sub    $0x3c,%esp
 749:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 74c:	89 d1                	mov    %edx,%ecx
{
 74e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 751:	85 d2                	test   %edx,%edx
 753:	0f 89 7f 00 00 00    	jns    7d8 <printint+0x98>
 759:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 75d:	74 79                	je     7d8 <printint+0x98>
    neg = 1;
 75f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 766:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 768:	31 db                	xor    %ebx,%ebx
 76a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 76d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 770:	89 c8                	mov    %ecx,%eax
 772:	31 d2                	xor    %edx,%edx
 774:	89 cf                	mov    %ecx,%edi
 776:	f7 75 c4             	divl   -0x3c(%ebp)
 779:	0f b6 92 b8 0b 00 00 	movzbl 0xbb8(%edx),%edx
 780:	89 45 c0             	mov    %eax,-0x40(%ebp)
 783:	89 d8                	mov    %ebx,%eax
 785:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 788:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 78b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 78e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 791:	76 dd                	jbe    770 <printint+0x30>
  if(neg)
 793:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 796:	85 c9                	test   %ecx,%ecx
 798:	74 0c                	je     7a6 <printint+0x66>
    buf[i++] = '-';
 79a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 79f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 7a1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 7a6:	8b 7d b8             	mov    -0x48(%ebp),%edi
 7a9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 7ad:	eb 07                	jmp    7b6 <printint+0x76>
 7af:	90                   	nop
    putc(fd, buf[i]);
 7b0:	0f b6 13             	movzbl (%ebx),%edx
 7b3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 7b6:	83 ec 04             	sub    $0x4,%esp
 7b9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 7bc:	6a 01                	push   $0x1
 7be:	56                   	push   %esi
 7bf:	57                   	push   %edi
 7c0:	e8 c7 fe ff ff       	call   68c <write>
  while(--i >= 0)
 7c5:	83 c4 10             	add    $0x10,%esp
 7c8:	39 de                	cmp    %ebx,%esi
 7ca:	75 e4                	jne    7b0 <printint+0x70>
}
 7cc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7cf:	5b                   	pop    %ebx
 7d0:	5e                   	pop    %esi
 7d1:	5f                   	pop    %edi
 7d2:	5d                   	pop    %ebp
 7d3:	c3                   	ret    
 7d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 7d8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 7df:	eb 87                	jmp    768 <printint+0x28>
 7e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7e8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7ef:	90                   	nop

000007f0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 7f0:	55                   	push   %ebp
 7f1:	89 e5                	mov    %esp,%ebp
 7f3:	57                   	push   %edi
 7f4:	56                   	push   %esi
 7f5:	53                   	push   %ebx
 7f6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 7f9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 7fc:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 7ff:	0f b6 13             	movzbl (%ebx),%edx
 802:	84 d2                	test   %dl,%dl
 804:	74 6a                	je     870 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 806:	8d 45 10             	lea    0x10(%ebp),%eax
 809:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 80c:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 80f:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 811:	89 45 d0             	mov    %eax,-0x30(%ebp)
 814:	eb 36                	jmp    84c <printf+0x5c>
 816:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 81d:	8d 76 00             	lea    0x0(%esi),%esi
 820:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 823:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 828:	83 f8 25             	cmp    $0x25,%eax
 82b:	74 15                	je     842 <printf+0x52>
  write(fd, &c, 1);
 82d:	83 ec 04             	sub    $0x4,%esp
 830:	88 55 e7             	mov    %dl,-0x19(%ebp)
 833:	6a 01                	push   $0x1
 835:	57                   	push   %edi
 836:	56                   	push   %esi
 837:	e8 50 fe ff ff       	call   68c <write>
 83c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 83f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 842:	0f b6 13             	movzbl (%ebx),%edx
 845:	83 c3 01             	add    $0x1,%ebx
 848:	84 d2                	test   %dl,%dl
 84a:	74 24                	je     870 <printf+0x80>
    c = fmt[i] & 0xff;
 84c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 84f:	85 c9                	test   %ecx,%ecx
 851:	74 cd                	je     820 <printf+0x30>
      }
    } else if(state == '%'){
 853:	83 f9 25             	cmp    $0x25,%ecx
 856:	75 ea                	jne    842 <printf+0x52>
      if(c == 'd'){
 858:	83 f8 25             	cmp    $0x25,%eax
 85b:	0f 84 07 01 00 00    	je     968 <printf+0x178>
 861:	83 e8 63             	sub    $0x63,%eax
 864:	83 f8 15             	cmp    $0x15,%eax
 867:	77 17                	ja     880 <printf+0x90>
 869:	ff 24 85 60 0b 00 00 	jmp    *0xb60(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 870:	8d 65 f4             	lea    -0xc(%ebp),%esp
 873:	5b                   	pop    %ebx
 874:	5e                   	pop    %esi
 875:	5f                   	pop    %edi
 876:	5d                   	pop    %ebp
 877:	c3                   	ret    
 878:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 87f:	90                   	nop
  write(fd, &c, 1);
 880:	83 ec 04             	sub    $0x4,%esp
 883:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 886:	6a 01                	push   $0x1
 888:	57                   	push   %edi
 889:	56                   	push   %esi
 88a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 88e:	e8 f9 fd ff ff       	call   68c <write>
        putc(fd, c);
 893:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 897:	83 c4 0c             	add    $0xc,%esp
 89a:	88 55 e7             	mov    %dl,-0x19(%ebp)
 89d:	6a 01                	push   $0x1
 89f:	57                   	push   %edi
 8a0:	56                   	push   %esi
 8a1:	e8 e6 fd ff ff       	call   68c <write>
        putc(fd, c);
 8a6:	83 c4 10             	add    $0x10,%esp
      state = 0;
 8a9:	31 c9                	xor    %ecx,%ecx
 8ab:	eb 95                	jmp    842 <printf+0x52>
 8ad:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 8b0:	83 ec 0c             	sub    $0xc,%esp
 8b3:	b9 10 00 00 00       	mov    $0x10,%ecx
 8b8:	6a 00                	push   $0x0
 8ba:	8b 45 d0             	mov    -0x30(%ebp),%eax
 8bd:	8b 10                	mov    (%eax),%edx
 8bf:	89 f0                	mov    %esi,%eax
 8c1:	e8 7a fe ff ff       	call   740 <printint>
        ap++;
 8c6:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 8ca:	83 c4 10             	add    $0x10,%esp
      state = 0;
 8cd:	31 c9                	xor    %ecx,%ecx
 8cf:	e9 6e ff ff ff       	jmp    842 <printf+0x52>
 8d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 8d8:	8b 45 d0             	mov    -0x30(%ebp),%eax
 8db:	8b 10                	mov    (%eax),%edx
        ap++;
 8dd:	83 c0 04             	add    $0x4,%eax
 8e0:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 8e3:	85 d2                	test   %edx,%edx
 8e5:	0f 84 8d 00 00 00    	je     978 <printf+0x188>
        while(*s != 0){
 8eb:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 8ee:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 8f0:	84 c0                	test   %al,%al
 8f2:	0f 84 4a ff ff ff    	je     842 <printf+0x52>
 8f8:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 8fb:	89 d3                	mov    %edx,%ebx
 8fd:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 900:	83 ec 04             	sub    $0x4,%esp
          s++;
 903:	83 c3 01             	add    $0x1,%ebx
 906:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 909:	6a 01                	push   $0x1
 90b:	57                   	push   %edi
 90c:	56                   	push   %esi
 90d:	e8 7a fd ff ff       	call   68c <write>
        while(*s != 0){
 912:	0f b6 03             	movzbl (%ebx),%eax
 915:	83 c4 10             	add    $0x10,%esp
 918:	84 c0                	test   %al,%al
 91a:	75 e4                	jne    900 <printf+0x110>
      state = 0;
 91c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 91f:	31 c9                	xor    %ecx,%ecx
 921:	e9 1c ff ff ff       	jmp    842 <printf+0x52>
 926:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 92d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 930:	83 ec 0c             	sub    $0xc,%esp
 933:	b9 0a 00 00 00       	mov    $0xa,%ecx
 938:	6a 01                	push   $0x1
 93a:	e9 7b ff ff ff       	jmp    8ba <printf+0xca>
 93f:	90                   	nop
        putc(fd, *ap);
 940:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 943:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 946:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 948:	6a 01                	push   $0x1
 94a:	57                   	push   %edi
 94b:	56                   	push   %esi
        putc(fd, *ap);
 94c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 94f:	e8 38 fd ff ff       	call   68c <write>
        ap++;
 954:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 958:	83 c4 10             	add    $0x10,%esp
      state = 0;
 95b:	31 c9                	xor    %ecx,%ecx
 95d:	e9 e0 fe ff ff       	jmp    842 <printf+0x52>
 962:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 968:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 96b:	83 ec 04             	sub    $0x4,%esp
 96e:	e9 2a ff ff ff       	jmp    89d <printf+0xad>
 973:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 977:	90                   	nop
          s = "(null)";
 978:	ba 58 0b 00 00       	mov    $0xb58,%edx
        while(*s != 0){
 97d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 980:	b8 28 00 00 00       	mov    $0x28,%eax
 985:	89 d3                	mov    %edx,%ebx
 987:	e9 74 ff ff ff       	jmp    900 <printf+0x110>
 98c:	66 90                	xchg   %ax,%ax
 98e:	66 90                	xchg   %ax,%ax

00000990 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 990:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 991:	a1 a0 13 00 00       	mov    0x13a0,%eax
{
 996:	89 e5                	mov    %esp,%ebp
 998:	57                   	push   %edi
 999:	56                   	push   %esi
 99a:	53                   	push   %ebx
 99b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 99e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 9a8:	89 c2                	mov    %eax,%edx
 9aa:	8b 00                	mov    (%eax),%eax
 9ac:	39 ca                	cmp    %ecx,%edx
 9ae:	73 30                	jae    9e0 <free+0x50>
 9b0:	39 c1                	cmp    %eax,%ecx
 9b2:	72 04                	jb     9b8 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 9b4:	39 c2                	cmp    %eax,%edx
 9b6:	72 f0                	jb     9a8 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 9b8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 9bb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 9be:	39 f8                	cmp    %edi,%eax
 9c0:	74 30                	je     9f2 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 9c2:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 9c5:	8b 42 04             	mov    0x4(%edx),%eax
 9c8:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 9cb:	39 f1                	cmp    %esi,%ecx
 9cd:	74 3a                	je     a09 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 9cf:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 9d1:	5b                   	pop    %ebx
  freep = p;
 9d2:	89 15 a0 13 00 00    	mov    %edx,0x13a0
}
 9d8:	5e                   	pop    %esi
 9d9:	5f                   	pop    %edi
 9da:	5d                   	pop    %ebp
 9db:	c3                   	ret    
 9dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 9e0:	39 c2                	cmp    %eax,%edx
 9e2:	72 c4                	jb     9a8 <free+0x18>
 9e4:	39 c1                	cmp    %eax,%ecx
 9e6:	73 c0                	jae    9a8 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 9e8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 9eb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 9ee:	39 f8                	cmp    %edi,%eax
 9f0:	75 d0                	jne    9c2 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 9f2:	03 70 04             	add    0x4(%eax),%esi
 9f5:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 9f8:	8b 02                	mov    (%edx),%eax
 9fa:	8b 00                	mov    (%eax),%eax
 9fc:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 9ff:	8b 42 04             	mov    0x4(%edx),%eax
 a02:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 a05:	39 f1                	cmp    %esi,%ecx
 a07:	75 c6                	jne    9cf <free+0x3f>
    p->s.size += bp->s.size;
 a09:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 a0c:	89 15 a0 13 00 00    	mov    %edx,0x13a0
    p->s.size += bp->s.size;
 a12:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 a15:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 a18:	89 0a                	mov    %ecx,(%edx)
}
 a1a:	5b                   	pop    %ebx
 a1b:	5e                   	pop    %esi
 a1c:	5f                   	pop    %edi
 a1d:	5d                   	pop    %ebp
 a1e:	c3                   	ret    
 a1f:	90                   	nop

00000a20 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 a20:	55                   	push   %ebp
 a21:	89 e5                	mov    %esp,%ebp
 a23:	57                   	push   %edi
 a24:	56                   	push   %esi
 a25:	53                   	push   %ebx
 a26:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a29:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 a2c:	8b 3d a0 13 00 00    	mov    0x13a0,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a32:	8d 70 07             	lea    0x7(%eax),%esi
 a35:	c1 ee 03             	shr    $0x3,%esi
 a38:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 a3b:	85 ff                	test   %edi,%edi
 a3d:	0f 84 9d 00 00 00    	je     ae0 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a43:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 a45:	8b 4a 04             	mov    0x4(%edx),%ecx
 a48:	39 f1                	cmp    %esi,%ecx
 a4a:	73 6a                	jae    ab6 <malloc+0x96>
 a4c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 a51:	39 de                	cmp    %ebx,%esi
 a53:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 a56:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 a5d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 a60:	eb 17                	jmp    a79 <malloc+0x59>
 a62:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a68:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 a6a:	8b 48 04             	mov    0x4(%eax),%ecx
 a6d:	39 f1                	cmp    %esi,%ecx
 a6f:	73 4f                	jae    ac0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 a71:	8b 3d a0 13 00 00    	mov    0x13a0,%edi
 a77:	89 c2                	mov    %eax,%edx
 a79:	39 d7                	cmp    %edx,%edi
 a7b:	75 eb                	jne    a68 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 a7d:	83 ec 0c             	sub    $0xc,%esp
 a80:	ff 75 e4             	push   -0x1c(%ebp)
 a83:	e8 6c fc ff ff       	call   6f4 <sbrk>
  if(p == (char*)-1)
 a88:	83 c4 10             	add    $0x10,%esp
 a8b:	83 f8 ff             	cmp    $0xffffffff,%eax
 a8e:	74 1c                	je     aac <malloc+0x8c>
  hp->s.size = nu;
 a90:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 a93:	83 ec 0c             	sub    $0xc,%esp
 a96:	83 c0 08             	add    $0x8,%eax
 a99:	50                   	push   %eax
 a9a:	e8 f1 fe ff ff       	call   990 <free>
  return freep;
 a9f:	8b 15 a0 13 00 00    	mov    0x13a0,%edx
      if((p = morecore(nunits)) == 0)
 aa5:	83 c4 10             	add    $0x10,%esp
 aa8:	85 d2                	test   %edx,%edx
 aaa:	75 bc                	jne    a68 <malloc+0x48>
        return 0;
  }
}
 aac:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 aaf:	31 c0                	xor    %eax,%eax
}
 ab1:	5b                   	pop    %ebx
 ab2:	5e                   	pop    %esi
 ab3:	5f                   	pop    %edi
 ab4:	5d                   	pop    %ebp
 ab5:	c3                   	ret    
    if(p->s.size >= nunits){
 ab6:	89 d0                	mov    %edx,%eax
 ab8:	89 fa                	mov    %edi,%edx
 aba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 ac0:	39 ce                	cmp    %ecx,%esi
 ac2:	74 4c                	je     b10 <malloc+0xf0>
        p->s.size -= nunits;
 ac4:	29 f1                	sub    %esi,%ecx
 ac6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 ac9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 acc:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 acf:	89 15 a0 13 00 00    	mov    %edx,0x13a0
}
 ad5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 ad8:	83 c0 08             	add    $0x8,%eax
}
 adb:	5b                   	pop    %ebx
 adc:	5e                   	pop    %esi
 add:	5f                   	pop    %edi
 ade:	5d                   	pop    %ebp
 adf:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 ae0:	c7 05 a0 13 00 00 a4 	movl   $0x13a4,0x13a0
 ae7:	13 00 00 
    base.s.size = 0;
 aea:	bf a4 13 00 00       	mov    $0x13a4,%edi
    base.s.ptr = freep = prevp = &base;
 aef:	c7 05 a4 13 00 00 a4 	movl   $0x13a4,0x13a4
 af6:	13 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 af9:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 afb:	c7 05 a8 13 00 00 00 	movl   $0x0,0x13a8
 b02:	00 00 00 
    if(p->s.size >= nunits){
 b05:	e9 42 ff ff ff       	jmp    a4c <malloc+0x2c>
 b0a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 b10:	8b 08                	mov    (%eax),%ecx
 b12:	89 0a                	mov    %ecx,(%edx)
 b14:	eb b9                	jmp    acf <malloc+0xaf>
