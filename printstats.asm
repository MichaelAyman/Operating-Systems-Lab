
_printstats:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
    }
    return maxi;
  
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
  11:	83 ec 28             	sub    $0x28,%esp
  14:	8b 01                	mov    (%ecx),%eax
  16:	8b 79 04             	mov    0x4(%ecx),%edi
    if (argc == 1) {
  19:	83 f8 01             	cmp    $0x1,%eax
  1c:	0f 84 5d 01 00 00    	je     17f <main+0x17f>
        printf(2, "Incorrect format. Try: printstats x y z\n");
        exit();
    }

    int arr[argc-1];
  22:	83 e8 01             	sub    $0x1,%eax
  25:	89 e1                	mov    %esp,%ecx
  27:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  2a:	c1 e0 02             	shl    $0x2,%eax
  2d:	89 45 e0             	mov    %eax,-0x20(%ebp)
  30:	83 c0 0f             	add    $0xf,%eax
  33:	89 c2                	mov    %eax,%edx
  35:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  3a:	83 e2 f0             	and    $0xfffffff0,%edx
  3d:	29 c1                	sub    %eax,%ecx
  3f:	39 cc                	cmp    %ecx,%esp
  41:	74 10                	je     53 <main+0x53>
  43:	81 ec 00 10 00 00    	sub    $0x1000,%esp
  49:	83 8c 24 fc 0f 00 00 	orl    $0x0,0xffc(%esp)
  50:	00 
  51:	eb ec                	jmp    3f <main+0x3f>
  53:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
  59:	29 d4                	sub    %edx,%esp
  5b:	85 d2                	test   %edx,%edx
  5d:	0f 85 2f 01 00 00    	jne    192 <main+0x192>
  63:	8d 5c 24 03          	lea    0x3(%esp),%ebx
  67:	89 d8                	mov    %ebx,%eax
  69:	83 e3 fc             	and    $0xfffffffc,%ebx
  6c:	c1 e8 02             	shr    $0x2,%eax

    for (int i = 0; i < argc-1; i++) {
  6f:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    int arr[argc-1];
  73:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    for (int i = 0; i < argc-1; i++) {
  76:	0f 8e 20 01 00 00    	jle    19c <main+0x19c>
  7c:	31 f6                	xor    %esi,%esi
  7e:	66 90                	xchg   %ax,%ax
        arr[i] = atoi(argv[i+1]);
  80:	83 ec 0c             	sub    $0xc,%esp
  83:	ff 74 b7 04          	push   0x4(%edi,%esi,4)
  87:	e8 a4 04 00 00       	call   530 <atoi>
    for (int i = 0; i < argc-1; i++) {
  8c:	83 c4 10             	add    $0x10,%esp
        arr[i] = atoi(argv[i+1]);
  8f:	89 04 b3             	mov    %eax,(%ebx,%esi,4)
    for (int i = 0; i < argc-1; i++) {
  92:	83 c6 01             	add    $0x1,%esi
  95:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
  98:	75 e6                	jne    80 <main+0x80>
    }

    // need to sort array

    int med = median(arr, argc-1);
  9a:	83 ec 08             	sub    $0x8,%esp
  9d:	ff 75 e4             	push   -0x1c(%ebp)
  a0:	53                   	push   %ebx
  a1:	e8 6a 01 00 00       	call   210 <median>
  a6:	8b 75 e0             	mov    -0x20(%ebp),%esi
  a9:	83 c4 10             	add    $0x10,%esp
  ac:	89 da                	mov    %ebx,%edx
  ae:	89 45 dc             	mov    %eax,-0x24(%ebp)
  b1:	31 c0                	xor    %eax,%eax
  b3:	01 de                	add    %ebx,%esi
  b5:	8d 76 00             	lea    0x0(%esi),%esi
      sum += arr[i];
  b8:	03 02                	add    (%edx),%eax
    for (i = 0; i < n; i++){
  ba:	83 c2 04             	add    $0x4,%edx
  bd:	39 f2                	cmp    %esi,%edx
  bf:	75 f7                	jne    b8 <main+0xb8>
    return sum / n;
  c1:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  c4:	99                   	cltd   
    int avg = average(arr, argc-1);
    int standard = std(arr, argc-1);
  c5:	83 ec 08             	sub    $0x8,%esp
    return sum / n;
  c8:	f7 f9                	idiv   %ecx
    int standard = std(arr, argc-1);
  ca:	51                   	push   %ecx
  cb:	53                   	push   %ebx
    return sum / n;
  cc:	89 45 d8             	mov    %eax,-0x28(%ebp)
    int standard = std(arr, argc-1);
  cf:	e8 7c 01 00 00       	call   250 <std>
    for (int i = 1; i < n; i++) {
  d4:	83 c4 10             	add    $0x10,%esp
  d7:	83 7d e4 01          	cmpl   $0x1,-0x1c(%ebp)
    int standard = std(arr, argc-1);
  db:	89 45 e0             	mov    %eax,-0x20(%ebp)
    int mini = arr[0];
  de:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  e1:	8b 3c 85 00 00 00 00 	mov    0x0(,%eax,4),%edi
    for (int i = 1; i < n; i++) {
  e8:	0f 84 e4 00 00 00    	je     1d2 <main+0x1d2>
  ee:	83 c3 04             	add    $0x4,%ebx
    int mini = arr[0];
  f1:	89 fa                	mov    %edi,%edx
    for (int i = 1; i < n; i++) {
  f3:	89 d8                	mov    %ebx,%eax
  f5:	8d 76 00             	lea    0x0(%esi),%esi
      if (arr[i] < mini) {
  f8:	8b 08                	mov    (%eax),%ecx
  fa:	39 ca                	cmp    %ecx,%edx
  fc:	0f 4f d1             	cmovg  %ecx,%edx
    for (int i = 1; i < n; i++) {
  ff:	83 c0 04             	add    $0x4,%eax
 102:	39 f0                	cmp    %esi,%eax
 104:	75 f2                	jne    f8 <main+0xf8>
 106:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 10d:	8d 76 00             	lea    0x0(%esi),%esi
      if (arr[i] > maxi) {
 110:	8b 03                	mov    (%ebx),%eax
 112:	39 c7                	cmp    %eax,%edi
 114:	0f 4c f8             	cmovl  %eax,%edi
    for (int i = 1; i < n; i++) {
 117:	83 c3 04             	add    $0x4,%ebx
 11a:	39 f3                	cmp    %esi,%ebx
 11c:	75 f2                	jne    110 <main+0x110>
    int mini = min(arr, argc-1);
    int maxi = max(arr, argc-1);

    printf(1, "Average: %d\n", avg);
 11e:	83 ec 04             	sub    $0x4,%esp
 121:	ff 75 d8             	push   -0x28(%ebp)
 124:	68 21 0b 00 00       	push   $0xb21
 129:	6a 01                	push   $0x1
 12b:	89 55 e4             	mov    %edx,-0x1c(%ebp)
 12e:	e8 9d 06 00 00       	call   7d0 <printf>
    printf(1, "Standard Deviation: %d\n", standard);
 133:	83 c4 0c             	add    $0xc,%esp
 136:	ff 75 e0             	push   -0x20(%ebp)
 139:	68 2e 0b 00 00       	push   $0xb2e
 13e:	6a 01                	push   $0x1
 140:	e8 8b 06 00 00       	call   7d0 <printf>
    printf(1, "Median: %d\n", med);
 145:	83 c4 0c             	add    $0xc,%esp
 148:	ff 75 dc             	push   -0x24(%ebp)
 14b:	68 46 0b 00 00       	push   $0xb46
 150:	6a 01                	push   $0x1
 152:	e8 79 06 00 00       	call   7d0 <printf>
    printf(1, "Minimum: %d\n", mini);
 157:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 15a:	83 c4 0c             	add    $0xc,%esp
 15d:	52                   	push   %edx
 15e:	68 52 0b 00 00       	push   $0xb52
 163:	6a 01                	push   $0x1
 165:	e8 66 06 00 00       	call   7d0 <printf>
    printf(1, "Maximum: %d\n", maxi);
 16a:	83 c4 0c             	add    $0xc,%esp
 16d:	57                   	push   %edi
 16e:	68 5f 0b 00 00       	push   $0xb5f
 173:	6a 01                	push   $0x1
 175:	e8 56 06 00 00       	call   7d0 <printf>
    exit();
 17a:	e8 cd 04 00 00       	call   64c <exit>
        printf(2, "Incorrect format. Try: printstats x y z\n");
 17f:	53                   	push   %ebx
 180:	53                   	push   %ebx
 181:	68 f8 0a 00 00       	push   $0xaf8
 186:	6a 02                	push   $0x2
 188:	e8 43 06 00 00       	call   7d0 <printf>
        exit();
 18d:	e8 ba 04 00 00       	call   64c <exit>
    int arr[argc-1];
 192:	83 4c 14 fc 00       	orl    $0x0,-0x4(%esp,%edx,1)
 197:	e9 c7 fe ff ff       	jmp    63 <main+0x63>
    int med = median(arr, argc-1);
 19c:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 19f:	50                   	push   %eax
 1a0:	50                   	push   %eax
 1a1:	57                   	push   %edi
 1a2:	53                   	push   %ebx
 1a3:	e8 68 00 00 00       	call   210 <median>
 1a8:	5a                   	pop    %edx
 1a9:	59                   	pop    %ecx
    int standard = std(arr, argc-1);
 1aa:	57                   	push   %edi
 1ab:	53                   	push   %ebx
    int med = median(arr, argc-1);
 1ac:	89 45 dc             	mov    %eax,-0x24(%ebp)
    int standard = std(arr, argc-1);
 1af:	e8 9c 00 00 00       	call   250 <std>
    return sum / n;
 1b4:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
    int mini = arr[0];
 1bb:	83 c4 10             	add    $0x10,%esp
    int standard = std(arr, argc-1);
 1be:	89 45 e0             	mov    %eax,-0x20(%ebp)
    int mini = arr[0];
 1c1:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 1c4:	8b 3c 85 00 00 00 00 	mov    0x0(,%eax,4),%edi
 1cb:	89 fa                	mov    %edi,%edx
 1cd:	e9 4c ff ff ff       	jmp    11e <main+0x11e>
 1d2:	89 fa                	mov    %edi,%edx
 1d4:	e9 45 ff ff ff       	jmp    11e <main+0x11e>
 1d9:	66 90                	xchg   %ax,%ax
 1db:	66 90                	xchg   %ax,%ax
 1dd:	66 90                	xchg   %ax,%ax
 1df:	90                   	nop

000001e0 <average>:
int average(int *arr, int n) {
 1e0:	55                   	push   %ebp
      return 0;
 1e1:	31 c0                	xor    %eax,%eax
int average(int *arr, int n) {
 1e3:	89 e5                	mov    %esp,%ebp
 1e5:	53                   	push   %ebx
 1e6:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    if (n == 0) {
 1e9:	85 db                	test   %ebx,%ebx
 1eb:	74 17                	je     204 <average+0x24>
    for (i = 0; i < n; i++){
 1ed:	7e 15                	jle    204 <average+0x24>
 1ef:	8b 55 08             	mov    0x8(%ebp),%edx
 1f2:	8d 0c 9a             	lea    (%edx,%ebx,4),%ecx
 1f5:	8d 76 00             	lea    0x0(%esi),%esi
      sum += arr[i];
 1f8:	03 02                	add    (%edx),%eax
    for (i = 0; i < n; i++){
 1fa:	83 c2 04             	add    $0x4,%edx
 1fd:	39 ca                	cmp    %ecx,%edx
 1ff:	75 f7                	jne    1f8 <average+0x18>
    return sum / n;
 201:	99                   	cltd   
 202:	f7 fb                	idiv   %ebx
}
 204:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 207:	c9                   	leave  
 208:	c3                   	ret    
 209:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000210 <median>:
int median(int *arr, int n) {
 210:	55                   	push   %ebp
      return 0;
 211:	31 c0                	xor    %eax,%eax
int median(int *arr, int n) {
 213:	89 e5                	mov    %esp,%ebp
 215:	53                   	push   %ebx
 216:	8b 55 0c             	mov    0xc(%ebp),%edx
 219:	8b 4d 08             	mov    0x8(%ebp),%ecx
    if (n <= 0)  {
 21c:	85 d2                	test   %edx,%edx
 21e:	7e 20                	jle    240 <median+0x30>
      return (arr[n/2 - 1] + arr[n/2]) / 2;
 220:	89 d0                	mov    %edx,%eax
 222:	d1 f8                	sar    %eax
    if (n % 2 == 0) {
 224:	83 e2 01             	and    $0x1,%edx
      return (arr[n/2 - 1] + arr[n/2]) / 2;
 227:	8d 1c 85 00 00 00 00 	lea    0x0(,%eax,4),%ebx
 22e:	8b 04 81             	mov    (%ecx,%eax,4),%eax
    if (n % 2 == 0) {
 231:	75 0d                	jne    240 <median+0x30>
      return (arr[n/2 - 1] + arr[n/2]) / 2;
 233:	03 44 19 fc          	add    -0x4(%ecx,%ebx,1),%eax
 237:	89 c2                	mov    %eax,%edx
 239:	c1 ea 1f             	shr    $0x1f,%edx
 23c:	01 d0                	add    %edx,%eax
 23e:	d1 f8                	sar    %eax
}
 240:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 243:	c9                   	leave  
 244:	c3                   	ret    
 245:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 24c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000250 <std>:
int std(int *arr, int n) {
 250:	55                   	push   %ebp
    if (n <= 1) return 0;
 251:	31 c0                	xor    %eax,%eax
int std(int *arr, int n) {
 253:	89 e5                	mov    %esp,%ebp
 255:	57                   	push   %edi
 256:	56                   	push   %esi
 257:	53                   	push   %ebx
 258:	83 ec 1c             	sub    $0x1c,%esp
 25b:	8b 75 0c             	mov    0xc(%ebp),%esi
    if (n <= 1) return 0;
 25e:	83 fe 01             	cmp    $0x1,%esi
 261:	7e 56                	jle    2b9 <std+0x69>
 263:	8b 4d 08             	mov    0x8(%ebp),%ecx
 266:	8d 1c b1             	lea    (%ecx,%esi,4),%ebx
 269:	89 ca                	mov    %ecx,%edx
 26b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 26f:	90                   	nop
      sum += arr[i];
 270:	03 02                	add    (%edx),%eax
    for (i = 0; i < n; i++){
 272:	83 c2 04             	add    $0x4,%edx
 275:	39 d3                	cmp    %edx,%ebx
 277:	75 f7                	jne    270 <std+0x20>
    return sum / n;
 279:	99                   	cltd   
 27a:	f7 fe                	idiv   %esi
 27c:	89 c7                	mov    %eax,%edi
    int sum = 0;
 27e:	31 c0                	xor    %eax,%eax
        sum += ((arr[i]-m) * (arr[i]-m));
 280:	8b 11                	mov    (%ecx),%edx
    for (i = 0; i < n; i++){
 282:	83 c1 04             	add    $0x4,%ecx
        sum += ((arr[i]-m) * (arr[i]-m));
 285:	29 fa                	sub    %edi,%edx
 287:	0f af d2             	imul   %edx,%edx
 28a:	01 d0                	add    %edx,%eax
    for (i = 0; i < n; i++){
 28c:	39 cb                	cmp    %ecx,%ebx
 28e:	75 f0                	jne    280 <std+0x30>
    return (int) sqrt(sum / n);
 290:	99                   	cltd   
 291:	83 ec 0c             	sub    $0xc,%esp
 294:	f7 fe                	idiv   %esi
 296:	50                   	push   %eax
 297:	e8 04 03 00 00       	call   5a0 <sqrt>
 29c:	83 c4 10             	add    $0x10,%esp
 29f:	d9 7d e6             	fnstcw -0x1a(%ebp)
 2a2:	0f b7 45 e6          	movzwl -0x1a(%ebp),%eax
 2a6:	80 cc 0c             	or     $0xc,%ah
 2a9:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
 2ad:	d9 6d e4             	fldcw  -0x1c(%ebp)
 2b0:	db 5d e0             	fistpl -0x20(%ebp)
 2b3:	d9 6d e6             	fldcw  -0x1a(%ebp)
 2b6:	8b 45 e0             	mov    -0x20(%ebp),%eax
}
 2b9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2bc:	5b                   	pop    %ebx
 2bd:	5e                   	pop    %esi
 2be:	5f                   	pop    %edi
 2bf:	5d                   	pop    %ebp
 2c0:	c3                   	ret    
 2c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2c8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2cf:	90                   	nop

000002d0 <min>:
int min(int *arr, int n) {
 2d0:	55                   	push   %ebp
 2d1:	89 e5                	mov    %esp,%ebp
 2d3:	53                   	push   %ebx
 2d4:	8b 4d 08             	mov    0x8(%ebp),%ecx
 2d7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    int mini = arr[0];
 2da:	8b 11                	mov    (%ecx),%edx
    for (int i = 1; i < n; i++) {
 2dc:	83 fb 01             	cmp    $0x1,%ebx
 2df:	7e 1d                	jle    2fe <min+0x2e>
 2e1:	8d 41 04             	lea    0x4(%ecx),%eax
 2e4:	8d 1c 99             	lea    (%ecx,%ebx,4),%ebx
 2e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2ee:	66 90                	xchg   %ax,%ax
      if (arr[i] < mini) {
 2f0:	8b 08                	mov    (%eax),%ecx
 2f2:	39 ca                	cmp    %ecx,%edx
 2f4:	0f 4f d1             	cmovg  %ecx,%edx
    for (int i = 1; i < n; i++) {
 2f7:	83 c0 04             	add    $0x4,%eax
 2fa:	39 d8                	cmp    %ebx,%eax
 2fc:	75 f2                	jne    2f0 <min+0x20>
}
 2fe:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 301:	89 d0                	mov    %edx,%eax
 303:	c9                   	leave  
 304:	c3                   	ret    
 305:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 30c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000310 <max>:
int max(int *arr, int n) {
 310:	55                   	push   %ebp
 311:	89 e5                	mov    %esp,%ebp
 313:	53                   	push   %ebx
 314:	8b 4d 08             	mov    0x8(%ebp),%ecx
 317:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    int maxi = arr[0];
 31a:	8b 11                	mov    (%ecx),%edx
    for (int i = 1; i < n; i++) {
 31c:	83 fb 01             	cmp    $0x1,%ebx
 31f:	7e 1d                	jle    33e <max+0x2e>
 321:	8d 41 04             	lea    0x4(%ecx),%eax
 324:	8d 1c 99             	lea    (%ecx,%ebx,4),%ebx
 327:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 32e:	66 90                	xchg   %ax,%ax
      if (arr[i] > maxi) {
 330:	8b 08                	mov    (%eax),%ecx
 332:	39 ca                	cmp    %ecx,%edx
 334:	0f 4c d1             	cmovl  %ecx,%edx
    for (int i = 1; i < n; i++) {
 337:	83 c0 04             	add    $0x4,%eax
 33a:	39 d8                	cmp    %ebx,%eax
 33c:	75 f2                	jne    330 <max+0x20>
}
 33e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 341:	89 d0                	mov    %edx,%eax
 343:	c9                   	leave  
 344:	c3                   	ret    
 345:	66 90                	xchg   %ax,%ax
 347:	66 90                	xchg   %ax,%ax
 349:	66 90                	xchg   %ax,%ax
 34b:	66 90                	xchg   %ax,%ax
 34d:	66 90                	xchg   %ax,%ax
 34f:	90                   	nop

00000350 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 350:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 351:	31 c0                	xor    %eax,%eax
{
 353:	89 e5                	mov    %esp,%ebp
 355:	53                   	push   %ebx
 356:	8b 4d 08             	mov    0x8(%ebp),%ecx
 359:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 35c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 360:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 364:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 367:	83 c0 01             	add    $0x1,%eax
 36a:	84 d2                	test   %dl,%dl
 36c:	75 f2                	jne    360 <strcpy+0x10>
    ;
  return os;
}
 36e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 371:	89 c8                	mov    %ecx,%eax
 373:	c9                   	leave  
 374:	c3                   	ret    
 375:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 37c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000380 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 380:	55                   	push   %ebp
 381:	89 e5                	mov    %esp,%ebp
 383:	53                   	push   %ebx
 384:	8b 55 08             	mov    0x8(%ebp),%edx
 387:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 38a:	0f b6 02             	movzbl (%edx),%eax
 38d:	84 c0                	test   %al,%al
 38f:	75 17                	jne    3a8 <strcmp+0x28>
 391:	eb 3a                	jmp    3cd <strcmp+0x4d>
 393:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 397:	90                   	nop
 398:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 39c:	83 c2 01             	add    $0x1,%edx
 39f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 3a2:	84 c0                	test   %al,%al
 3a4:	74 1a                	je     3c0 <strcmp+0x40>
    p++, q++;
 3a6:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 3a8:	0f b6 19             	movzbl (%ecx),%ebx
 3ab:	38 c3                	cmp    %al,%bl
 3ad:	74 e9                	je     398 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 3af:	29 d8                	sub    %ebx,%eax
}
 3b1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3b4:	c9                   	leave  
 3b5:	c3                   	ret    
 3b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3bd:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 3c0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 3c4:	31 c0                	xor    %eax,%eax
 3c6:	29 d8                	sub    %ebx,%eax
}
 3c8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3cb:	c9                   	leave  
 3cc:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 3cd:	0f b6 19             	movzbl (%ecx),%ebx
 3d0:	31 c0                	xor    %eax,%eax
 3d2:	eb db                	jmp    3af <strcmp+0x2f>
 3d4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3df:	90                   	nop

000003e0 <strlen>:

uint
strlen(const char *s)
{
 3e0:	55                   	push   %ebp
 3e1:	89 e5                	mov    %esp,%ebp
 3e3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 3e6:	80 3a 00             	cmpb   $0x0,(%edx)
 3e9:	74 15                	je     400 <strlen+0x20>
 3eb:	31 c0                	xor    %eax,%eax
 3ed:	8d 76 00             	lea    0x0(%esi),%esi
 3f0:	83 c0 01             	add    $0x1,%eax
 3f3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 3f7:	89 c1                	mov    %eax,%ecx
 3f9:	75 f5                	jne    3f0 <strlen+0x10>
    ;
  return n;
}
 3fb:	89 c8                	mov    %ecx,%eax
 3fd:	5d                   	pop    %ebp
 3fe:	c3                   	ret    
 3ff:	90                   	nop
  for(n = 0; s[n]; n++)
 400:	31 c9                	xor    %ecx,%ecx
}
 402:	5d                   	pop    %ebp
 403:	89 c8                	mov    %ecx,%eax
 405:	c3                   	ret    
 406:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 40d:	8d 76 00             	lea    0x0(%esi),%esi

00000410 <memset>:

void*
memset(void *dst, int c, uint n)
{
 410:	55                   	push   %ebp
 411:	89 e5                	mov    %esp,%ebp
 413:	57                   	push   %edi
 414:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 417:	8b 4d 10             	mov    0x10(%ebp),%ecx
 41a:	8b 45 0c             	mov    0xc(%ebp),%eax
 41d:	89 d7                	mov    %edx,%edi
 41f:	fc                   	cld    
 420:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 422:	8b 7d fc             	mov    -0x4(%ebp),%edi
 425:	89 d0                	mov    %edx,%eax
 427:	c9                   	leave  
 428:	c3                   	ret    
 429:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000430 <strchr>:

char*
strchr(const char *s, char c)
{
 430:	55                   	push   %ebp
 431:	89 e5                	mov    %esp,%ebp
 433:	8b 45 08             	mov    0x8(%ebp),%eax
 436:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 43a:	0f b6 10             	movzbl (%eax),%edx
 43d:	84 d2                	test   %dl,%dl
 43f:	75 12                	jne    453 <strchr+0x23>
 441:	eb 1d                	jmp    460 <strchr+0x30>
 443:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 447:	90                   	nop
 448:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 44c:	83 c0 01             	add    $0x1,%eax
 44f:	84 d2                	test   %dl,%dl
 451:	74 0d                	je     460 <strchr+0x30>
    if(*s == c)
 453:	38 d1                	cmp    %dl,%cl
 455:	75 f1                	jne    448 <strchr+0x18>
      return (char*)s;
  return 0;
}
 457:	5d                   	pop    %ebp
 458:	c3                   	ret    
 459:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 460:	31 c0                	xor    %eax,%eax
}
 462:	5d                   	pop    %ebp
 463:	c3                   	ret    
 464:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 46b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 46f:	90                   	nop

00000470 <gets>:

char*
gets(char *buf, int max)
{
 470:	55                   	push   %ebp
 471:	89 e5                	mov    %esp,%ebp
 473:	57                   	push   %edi
 474:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 475:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 478:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 479:	31 db                	xor    %ebx,%ebx
{
 47b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 47e:	eb 27                	jmp    4a7 <gets+0x37>
    cc = read(0, &c, 1);
 480:	83 ec 04             	sub    $0x4,%esp
 483:	6a 01                	push   $0x1
 485:	57                   	push   %edi
 486:	6a 00                	push   $0x0
 488:	e8 d7 01 00 00       	call   664 <read>
    if(cc < 1)
 48d:	83 c4 10             	add    $0x10,%esp
 490:	85 c0                	test   %eax,%eax
 492:	7e 1d                	jle    4b1 <gets+0x41>
      break;
    buf[i++] = c;
 494:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 498:	8b 55 08             	mov    0x8(%ebp),%edx
 49b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 49f:	3c 0a                	cmp    $0xa,%al
 4a1:	74 1d                	je     4c0 <gets+0x50>
 4a3:	3c 0d                	cmp    $0xd,%al
 4a5:	74 19                	je     4c0 <gets+0x50>
  for(i=0; i+1 < max; ){
 4a7:	89 de                	mov    %ebx,%esi
 4a9:	83 c3 01             	add    $0x1,%ebx
 4ac:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 4af:	7c cf                	jl     480 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 4b1:	8b 45 08             	mov    0x8(%ebp),%eax
 4b4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 4b8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4bb:	5b                   	pop    %ebx
 4bc:	5e                   	pop    %esi
 4bd:	5f                   	pop    %edi
 4be:	5d                   	pop    %ebp
 4bf:	c3                   	ret    
  buf[i] = '\0';
 4c0:	8b 45 08             	mov    0x8(%ebp),%eax
 4c3:	89 de                	mov    %ebx,%esi
 4c5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 4c9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4cc:	5b                   	pop    %ebx
 4cd:	5e                   	pop    %esi
 4ce:	5f                   	pop    %edi
 4cf:	5d                   	pop    %ebp
 4d0:	c3                   	ret    
 4d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4d8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4df:	90                   	nop

000004e0 <stat>:

int
stat(const char *n, struct stat *st)
{
 4e0:	55                   	push   %ebp
 4e1:	89 e5                	mov    %esp,%ebp
 4e3:	56                   	push   %esi
 4e4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4e5:	83 ec 08             	sub    $0x8,%esp
 4e8:	6a 00                	push   $0x0
 4ea:	ff 75 08             	push   0x8(%ebp)
 4ed:	e8 9a 01 00 00       	call   68c <open>
  if(fd < 0)
 4f2:	83 c4 10             	add    $0x10,%esp
 4f5:	85 c0                	test   %eax,%eax
 4f7:	78 27                	js     520 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 4f9:	83 ec 08             	sub    $0x8,%esp
 4fc:	ff 75 0c             	push   0xc(%ebp)
 4ff:	89 c3                	mov    %eax,%ebx
 501:	50                   	push   %eax
 502:	e8 9d 01 00 00       	call   6a4 <fstat>
  close(fd);
 507:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 50a:	89 c6                	mov    %eax,%esi
  close(fd);
 50c:	e8 63 01 00 00       	call   674 <close>
  return r;
 511:	83 c4 10             	add    $0x10,%esp
}
 514:	8d 65 f8             	lea    -0x8(%ebp),%esp
 517:	89 f0                	mov    %esi,%eax
 519:	5b                   	pop    %ebx
 51a:	5e                   	pop    %esi
 51b:	5d                   	pop    %ebp
 51c:	c3                   	ret    
 51d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 520:	be ff ff ff ff       	mov    $0xffffffff,%esi
 525:	eb ed                	jmp    514 <stat+0x34>
 527:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 52e:	66 90                	xchg   %ax,%ax

00000530 <atoi>:

int
atoi(const char *s)
{
 530:	55                   	push   %ebp
 531:	89 e5                	mov    %esp,%ebp
 533:	53                   	push   %ebx
 534:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 537:	0f be 02             	movsbl (%edx),%eax
 53a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 53d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 540:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 545:	77 1e                	ja     565 <atoi+0x35>
 547:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 54e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 550:	83 c2 01             	add    $0x1,%edx
 553:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 556:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 55a:	0f be 02             	movsbl (%edx),%eax
 55d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 560:	80 fb 09             	cmp    $0x9,%bl
 563:	76 eb                	jbe    550 <atoi+0x20>
  return n;
}
 565:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 568:	89 c8                	mov    %ecx,%eax
 56a:	c9                   	leave  
 56b:	c3                   	ret    
 56c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000570 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 570:	55                   	push   %ebp
 571:	89 e5                	mov    %esp,%ebp
 573:	57                   	push   %edi
 574:	8b 45 10             	mov    0x10(%ebp),%eax
 577:	8b 55 08             	mov    0x8(%ebp),%edx
 57a:	56                   	push   %esi
 57b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 57e:	85 c0                	test   %eax,%eax
 580:	7e 13                	jle    595 <memmove+0x25>
 582:	01 d0                	add    %edx,%eax
  dst = vdst;
 584:	89 d7                	mov    %edx,%edi
 586:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 58d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 590:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 591:	39 f8                	cmp    %edi,%eax
 593:	75 fb                	jne    590 <memmove+0x20>
  return vdst;
}
 595:	5e                   	pop    %esi
 596:	89 d0                	mov    %edx,%eax
 598:	5f                   	pop    %edi
 599:	5d                   	pop    %ebp
 59a:	c3                   	ret    
 59b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 59f:	90                   	nop

000005a0 <sqrt>:


// https://www.geeksforgeeks.org/c-program-to-find-square-root-of-a-given-number/
float sqrt(int num) {
 5a0:	55                   	push   %ebp
 5a1:	89 e5                	mov    %esp,%ebp
 5a3:	56                   	push   %esi
 5a4:	53                   	push   %ebx
 5a5:	83 ec 04             	sub    $0x4,%esp
 5a8:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int end = num;
  int middle;

  float solution = 0.0;

  while (start <= end) {
 5ab:	85 db                	test   %ebx,%ebx
 5ad:	0f 88 8d 00 00 00    	js     640 <sqrt+0xa0>
    middle = (start + end) / 2;
 5b3:	89 d8                	mov    %ebx,%eax
 5b5:	d1 f8                	sar    %eax
    if (middle * middle == num) {
 5b7:	89 c2                	mov    %eax,%edx
 5b9:	0f af d0             	imul   %eax,%edx
 5bc:	39 d3                	cmp    %edx,%ebx
 5be:	74 78                	je     638 <sqrt+0x98>
 5c0:	89 de                	mov    %ebx,%esi
  float solution = 0.0;
 5c2:	d9 ee                	fldz   
  int start = 0;
 5c4:	31 c9                	xor    %ecx,%ecx
 5c6:	eb 25                	jmp    5ed <sqrt+0x4d>
 5c8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5cf:	90                   	nop
 5d0:	dd d8                	fstp   %st(0)
      solution = middle;
      break;
    }
    if (middle * middle < num) {
      solution = start;
 5d2:	89 4d f4             	mov    %ecx,-0xc(%ebp)
      start = middle + 1;
 5d5:	8d 48 01             	lea    0x1(%eax),%ecx
      solution = start;
 5d8:	db 45 f4             	fildl  -0xc(%ebp)
  while (start <= end) {
 5db:	39 ce                	cmp    %ecx,%esi
 5dd:	7c 19                	jl     5f8 <sqrt+0x58>
    middle = (start + end) / 2;
 5df:	8d 04 0e             	lea    (%esi,%ecx,1),%eax
 5e2:	d1 f8                	sar    %eax
    if (middle * middle == num) {
 5e4:	89 c2                	mov    %eax,%edx
 5e6:	0f af d0             	imul   %eax,%edx
 5e9:	39 da                	cmp    %ebx,%edx
 5eb:	74 49                	je     636 <sqrt+0x96>
    if (middle * middle < num) {
 5ed:	39 d3                	cmp    %edx,%ebx
 5ef:	7f df                	jg     5d0 <sqrt+0x30>
    }
    else {
      end = middle - 1;
 5f1:	8d 70 ff             	lea    -0x1(%eax),%esi
  while (start <= end) {
 5f4:	39 ce                	cmp    %ecx,%esi
 5f6:	7d e7                	jge    5df <sqrt+0x3f>

  float eps = 0.1;
  int i;

  for (i = 0; i < 5; i++) {
    while (solution * solution <= num) {
 5f8:	89 5d f4             	mov    %ebx,-0xc(%ebp)
 5fb:	b8 05 00 00 00       	mov    $0x5,%eax
 600:	db 45 f4             	fildl  -0xc(%ebp)
 603:	d9 05 6c 0b 00 00    	flds   0xb6c
 609:	eb 07                	jmp    612 <sqrt+0x72>
 60b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 60f:	90                   	nop
      solution += eps;
 610:	dc c2                	fadd   %st,%st(2)
    while (solution * solution <= num) {
 612:	d9 c2                	fld    %st(2)
 614:	d8 cb                	fmul   %st(3),%st
 616:	d9 ca                	fxch   %st(2)
 618:	db f2                	fcomi  %st(2),%st
 61a:	dd da                	fstp   %st(2)
 61c:	73 f2                	jae    610 <sqrt+0x70>
    }
    solution = solution - eps;
 61e:	dc ea                	fsubr  %st,%st(2)
    eps = eps / 10;
 620:	d8 35 70 0b 00 00    	fdivs  0xb70
  for (i = 0; i < 5; i++) {
 626:	83 e8 01             	sub    $0x1,%eax
 629:	75 e7                	jne    612 <sqrt+0x72>
 62b:	dd d8                	fstp   %st(0)
 62d:	dd d8                	fstp   %st(0)
  }
  return solution;

}
 62f:	83 c4 04             	add    $0x4,%esp
 632:	5b                   	pop    %ebx
 633:	5e                   	pop    %esi
 634:	5d                   	pop    %ebp
 635:	c3                   	ret    
 636:	dd d8                	fstp   %st(0)
      solution = middle;
 638:	89 45 f4             	mov    %eax,-0xc(%ebp)
 63b:	db 45 f4             	fildl  -0xc(%ebp)
      break;
 63e:	eb b8                	jmp    5f8 <sqrt+0x58>
  float solution = 0.0;
 640:	d9 ee                	fldz   
 642:	eb b4                	jmp    5f8 <sqrt+0x58>

00000644 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 644:	b8 01 00 00 00       	mov    $0x1,%eax
 649:	cd 40                	int    $0x40
 64b:	c3                   	ret    

0000064c <exit>:
SYSCALL(exit)
 64c:	b8 02 00 00 00       	mov    $0x2,%eax
 651:	cd 40                	int    $0x40
 653:	c3                   	ret    

00000654 <wait>:
SYSCALL(wait)
 654:	b8 03 00 00 00       	mov    $0x3,%eax
 659:	cd 40                	int    $0x40
 65b:	c3                   	ret    

0000065c <pipe>:
SYSCALL(pipe)
 65c:	b8 04 00 00 00       	mov    $0x4,%eax
 661:	cd 40                	int    $0x40
 663:	c3                   	ret    

00000664 <read>:
SYSCALL(read)
 664:	b8 05 00 00 00       	mov    $0x5,%eax
 669:	cd 40                	int    $0x40
 66b:	c3                   	ret    

0000066c <write>:
SYSCALL(write)
 66c:	b8 10 00 00 00       	mov    $0x10,%eax
 671:	cd 40                	int    $0x40
 673:	c3                   	ret    

00000674 <close>:
SYSCALL(close)
 674:	b8 15 00 00 00       	mov    $0x15,%eax
 679:	cd 40                	int    $0x40
 67b:	c3                   	ret    

0000067c <kill>:
SYSCALL(kill)
 67c:	b8 06 00 00 00       	mov    $0x6,%eax
 681:	cd 40                	int    $0x40
 683:	c3                   	ret    

00000684 <exec>:
SYSCALL(exec)
 684:	b8 07 00 00 00       	mov    $0x7,%eax
 689:	cd 40                	int    $0x40
 68b:	c3                   	ret    

0000068c <open>:
SYSCALL(open)
 68c:	b8 0f 00 00 00       	mov    $0xf,%eax
 691:	cd 40                	int    $0x40
 693:	c3                   	ret    

00000694 <mknod>:
SYSCALL(mknod)
 694:	b8 11 00 00 00       	mov    $0x11,%eax
 699:	cd 40                	int    $0x40
 69b:	c3                   	ret    

0000069c <unlink>:
SYSCALL(unlink)
 69c:	b8 12 00 00 00       	mov    $0x12,%eax
 6a1:	cd 40                	int    $0x40
 6a3:	c3                   	ret    

000006a4 <fstat>:
SYSCALL(fstat)
 6a4:	b8 08 00 00 00       	mov    $0x8,%eax
 6a9:	cd 40                	int    $0x40
 6ab:	c3                   	ret    

000006ac <link>:
SYSCALL(link)
 6ac:	b8 13 00 00 00       	mov    $0x13,%eax
 6b1:	cd 40                	int    $0x40
 6b3:	c3                   	ret    

000006b4 <mkdir>:
SYSCALL(mkdir)
 6b4:	b8 14 00 00 00       	mov    $0x14,%eax
 6b9:	cd 40                	int    $0x40
 6bb:	c3                   	ret    

000006bc <chdir>:
SYSCALL(chdir)
 6bc:	b8 09 00 00 00       	mov    $0x9,%eax
 6c1:	cd 40                	int    $0x40
 6c3:	c3                   	ret    

000006c4 <dup>:
SYSCALL(dup)
 6c4:	b8 0a 00 00 00       	mov    $0xa,%eax
 6c9:	cd 40                	int    $0x40
 6cb:	c3                   	ret    

000006cc <getpid>:
SYSCALL(getpid)
 6cc:	b8 0b 00 00 00       	mov    $0xb,%eax
 6d1:	cd 40                	int    $0x40
 6d3:	c3                   	ret    

000006d4 <sbrk>:
SYSCALL(sbrk)
 6d4:	b8 0c 00 00 00       	mov    $0xc,%eax
 6d9:	cd 40                	int    $0x40
 6db:	c3                   	ret    

000006dc <sleep>:
SYSCALL(sleep)
 6dc:	b8 0d 00 00 00       	mov    $0xd,%eax
 6e1:	cd 40                	int    $0x40
 6e3:	c3                   	ret    

000006e4 <uptime>:
SYSCALL(uptime)
 6e4:	b8 0e 00 00 00       	mov    $0xe,%eax
 6e9:	cd 40                	int    $0x40
 6eb:	c3                   	ret    

000006ec <gettid>:
SYSCALL(gettid)
 6ec:	b8 16 00 00 00       	mov    $0x16,%eax
 6f1:	cd 40                	int    $0x40
 6f3:	c3                   	ret    

000006f4 <getpgid>:
SYSCALL(getpgid)
 6f4:	b8 17 00 00 00       	mov    $0x17,%eax
 6f9:	cd 40                	int    $0x40
 6fb:	c3                   	ret    

000006fc <setpgid>:
SYSCALL(setpgid)
 6fc:	b8 18 00 00 00       	mov    $0x18,%eax
 701:	cd 40                	int    $0x40
 703:	c3                   	ret    

00000704 <getppid>:
SYSCALL(getppid)
 704:	b8 19 00 00 00       	mov    $0x19,%eax
 709:	cd 40                	int    $0x40
 70b:	c3                   	ret    

0000070c <uptime_ms>:
SYSCALL(uptime_ms)
 70c:	b8 1a 00 00 00       	mov    $0x1a,%eax
 711:	cd 40                	int    $0x40
 713:	c3                   	ret    
 714:	66 90                	xchg   %ax,%ax
 716:	66 90                	xchg   %ax,%ax
 718:	66 90                	xchg   %ax,%ax
 71a:	66 90                	xchg   %ax,%ax
 71c:	66 90                	xchg   %ax,%ax
 71e:	66 90                	xchg   %ax,%ax

00000720 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 720:	55                   	push   %ebp
 721:	89 e5                	mov    %esp,%ebp
 723:	57                   	push   %edi
 724:	56                   	push   %esi
 725:	53                   	push   %ebx
 726:	83 ec 3c             	sub    $0x3c,%esp
 729:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 72c:	89 d1                	mov    %edx,%ecx
{
 72e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 731:	85 d2                	test   %edx,%edx
 733:	0f 89 7f 00 00 00    	jns    7b8 <printint+0x98>
 739:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 73d:	74 79                	je     7b8 <printint+0x98>
    neg = 1;
 73f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 746:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 748:	31 db                	xor    %ebx,%ebx
 74a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 74d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 750:	89 c8                	mov    %ecx,%eax
 752:	31 d2                	xor    %edx,%edx
 754:	89 cf                	mov    %ecx,%edi
 756:	f7 75 c4             	divl   -0x3c(%ebp)
 759:	0f b6 92 d4 0b 00 00 	movzbl 0xbd4(%edx),%edx
 760:	89 45 c0             	mov    %eax,-0x40(%ebp)
 763:	89 d8                	mov    %ebx,%eax
 765:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 768:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 76b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 76e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 771:	76 dd                	jbe    750 <printint+0x30>
  if(neg)
 773:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 776:	85 c9                	test   %ecx,%ecx
 778:	74 0c                	je     786 <printint+0x66>
    buf[i++] = '-';
 77a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 77f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 781:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 786:	8b 7d b8             	mov    -0x48(%ebp),%edi
 789:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 78d:	eb 07                	jmp    796 <printint+0x76>
 78f:	90                   	nop
    putc(fd, buf[i]);
 790:	0f b6 13             	movzbl (%ebx),%edx
 793:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 796:	83 ec 04             	sub    $0x4,%esp
 799:	88 55 d7             	mov    %dl,-0x29(%ebp)
 79c:	6a 01                	push   $0x1
 79e:	56                   	push   %esi
 79f:	57                   	push   %edi
 7a0:	e8 c7 fe ff ff       	call   66c <write>
  while(--i >= 0)
 7a5:	83 c4 10             	add    $0x10,%esp
 7a8:	39 de                	cmp    %ebx,%esi
 7aa:	75 e4                	jne    790 <printint+0x70>
}
 7ac:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7af:	5b                   	pop    %ebx
 7b0:	5e                   	pop    %esi
 7b1:	5f                   	pop    %edi
 7b2:	5d                   	pop    %ebp
 7b3:	c3                   	ret    
 7b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 7b8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 7bf:	eb 87                	jmp    748 <printint+0x28>
 7c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7c8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7cf:	90                   	nop

000007d0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 7d0:	55                   	push   %ebp
 7d1:	89 e5                	mov    %esp,%ebp
 7d3:	57                   	push   %edi
 7d4:	56                   	push   %esi
 7d5:	53                   	push   %ebx
 7d6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 7d9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 7dc:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 7df:	0f b6 13             	movzbl (%ebx),%edx
 7e2:	84 d2                	test   %dl,%dl
 7e4:	74 6a                	je     850 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 7e6:	8d 45 10             	lea    0x10(%ebp),%eax
 7e9:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 7ec:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 7ef:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 7f1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 7f4:	eb 36                	jmp    82c <printf+0x5c>
 7f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7fd:	8d 76 00             	lea    0x0(%esi),%esi
 800:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 803:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 808:	83 f8 25             	cmp    $0x25,%eax
 80b:	74 15                	je     822 <printf+0x52>
  write(fd, &c, 1);
 80d:	83 ec 04             	sub    $0x4,%esp
 810:	88 55 e7             	mov    %dl,-0x19(%ebp)
 813:	6a 01                	push   $0x1
 815:	57                   	push   %edi
 816:	56                   	push   %esi
 817:	e8 50 fe ff ff       	call   66c <write>
 81c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 81f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 822:	0f b6 13             	movzbl (%ebx),%edx
 825:	83 c3 01             	add    $0x1,%ebx
 828:	84 d2                	test   %dl,%dl
 82a:	74 24                	je     850 <printf+0x80>
    c = fmt[i] & 0xff;
 82c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 82f:	85 c9                	test   %ecx,%ecx
 831:	74 cd                	je     800 <printf+0x30>
      }
    } else if(state == '%'){
 833:	83 f9 25             	cmp    $0x25,%ecx
 836:	75 ea                	jne    822 <printf+0x52>
      if(c == 'd'){
 838:	83 f8 25             	cmp    $0x25,%eax
 83b:	0f 84 07 01 00 00    	je     948 <printf+0x178>
 841:	83 e8 63             	sub    $0x63,%eax
 844:	83 f8 15             	cmp    $0x15,%eax
 847:	77 17                	ja     860 <printf+0x90>
 849:	ff 24 85 7c 0b 00 00 	jmp    *0xb7c(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 850:	8d 65 f4             	lea    -0xc(%ebp),%esp
 853:	5b                   	pop    %ebx
 854:	5e                   	pop    %esi
 855:	5f                   	pop    %edi
 856:	5d                   	pop    %ebp
 857:	c3                   	ret    
 858:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 85f:	90                   	nop
  write(fd, &c, 1);
 860:	83 ec 04             	sub    $0x4,%esp
 863:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 866:	6a 01                	push   $0x1
 868:	57                   	push   %edi
 869:	56                   	push   %esi
 86a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 86e:	e8 f9 fd ff ff       	call   66c <write>
        putc(fd, c);
 873:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 877:	83 c4 0c             	add    $0xc,%esp
 87a:	88 55 e7             	mov    %dl,-0x19(%ebp)
 87d:	6a 01                	push   $0x1
 87f:	57                   	push   %edi
 880:	56                   	push   %esi
 881:	e8 e6 fd ff ff       	call   66c <write>
        putc(fd, c);
 886:	83 c4 10             	add    $0x10,%esp
      state = 0;
 889:	31 c9                	xor    %ecx,%ecx
 88b:	eb 95                	jmp    822 <printf+0x52>
 88d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 890:	83 ec 0c             	sub    $0xc,%esp
 893:	b9 10 00 00 00       	mov    $0x10,%ecx
 898:	6a 00                	push   $0x0
 89a:	8b 45 d0             	mov    -0x30(%ebp),%eax
 89d:	8b 10                	mov    (%eax),%edx
 89f:	89 f0                	mov    %esi,%eax
 8a1:	e8 7a fe ff ff       	call   720 <printint>
        ap++;
 8a6:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 8aa:	83 c4 10             	add    $0x10,%esp
      state = 0;
 8ad:	31 c9                	xor    %ecx,%ecx
 8af:	e9 6e ff ff ff       	jmp    822 <printf+0x52>
 8b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 8b8:	8b 45 d0             	mov    -0x30(%ebp),%eax
 8bb:	8b 10                	mov    (%eax),%edx
        ap++;
 8bd:	83 c0 04             	add    $0x4,%eax
 8c0:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 8c3:	85 d2                	test   %edx,%edx
 8c5:	0f 84 8d 00 00 00    	je     958 <printf+0x188>
        while(*s != 0){
 8cb:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 8ce:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 8d0:	84 c0                	test   %al,%al
 8d2:	0f 84 4a ff ff ff    	je     822 <printf+0x52>
 8d8:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 8db:	89 d3                	mov    %edx,%ebx
 8dd:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 8e0:	83 ec 04             	sub    $0x4,%esp
          s++;
 8e3:	83 c3 01             	add    $0x1,%ebx
 8e6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 8e9:	6a 01                	push   $0x1
 8eb:	57                   	push   %edi
 8ec:	56                   	push   %esi
 8ed:	e8 7a fd ff ff       	call   66c <write>
        while(*s != 0){
 8f2:	0f b6 03             	movzbl (%ebx),%eax
 8f5:	83 c4 10             	add    $0x10,%esp
 8f8:	84 c0                	test   %al,%al
 8fa:	75 e4                	jne    8e0 <printf+0x110>
      state = 0;
 8fc:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 8ff:	31 c9                	xor    %ecx,%ecx
 901:	e9 1c ff ff ff       	jmp    822 <printf+0x52>
 906:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 90d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 910:	83 ec 0c             	sub    $0xc,%esp
 913:	b9 0a 00 00 00       	mov    $0xa,%ecx
 918:	6a 01                	push   $0x1
 91a:	e9 7b ff ff ff       	jmp    89a <printf+0xca>
 91f:	90                   	nop
        putc(fd, *ap);
 920:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 923:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 926:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 928:	6a 01                	push   $0x1
 92a:	57                   	push   %edi
 92b:	56                   	push   %esi
        putc(fd, *ap);
 92c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 92f:	e8 38 fd ff ff       	call   66c <write>
        ap++;
 934:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 938:	83 c4 10             	add    $0x10,%esp
      state = 0;
 93b:	31 c9                	xor    %ecx,%ecx
 93d:	e9 e0 fe ff ff       	jmp    822 <printf+0x52>
 942:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 948:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 94b:	83 ec 04             	sub    $0x4,%esp
 94e:	e9 2a ff ff ff       	jmp    87d <printf+0xad>
 953:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 957:	90                   	nop
          s = "(null)";
 958:	ba 74 0b 00 00       	mov    $0xb74,%edx
        while(*s != 0){
 95d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 960:	b8 28 00 00 00       	mov    $0x28,%eax
 965:	89 d3                	mov    %edx,%ebx
 967:	e9 74 ff ff ff       	jmp    8e0 <printf+0x110>
 96c:	66 90                	xchg   %ax,%ax
 96e:	66 90                	xchg   %ax,%ax

00000970 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 970:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 971:	a1 70 0f 00 00       	mov    0xf70,%eax
{
 976:	89 e5                	mov    %esp,%ebp
 978:	57                   	push   %edi
 979:	56                   	push   %esi
 97a:	53                   	push   %ebx
 97b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 97e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 981:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 988:	89 c2                	mov    %eax,%edx
 98a:	8b 00                	mov    (%eax),%eax
 98c:	39 ca                	cmp    %ecx,%edx
 98e:	73 30                	jae    9c0 <free+0x50>
 990:	39 c1                	cmp    %eax,%ecx
 992:	72 04                	jb     998 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 994:	39 c2                	cmp    %eax,%edx
 996:	72 f0                	jb     988 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 998:	8b 73 fc             	mov    -0x4(%ebx),%esi
 99b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 99e:	39 f8                	cmp    %edi,%eax
 9a0:	74 30                	je     9d2 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 9a2:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 9a5:	8b 42 04             	mov    0x4(%edx),%eax
 9a8:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 9ab:	39 f1                	cmp    %esi,%ecx
 9ad:	74 3a                	je     9e9 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 9af:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 9b1:	5b                   	pop    %ebx
  freep = p;
 9b2:	89 15 70 0f 00 00    	mov    %edx,0xf70
}
 9b8:	5e                   	pop    %esi
 9b9:	5f                   	pop    %edi
 9ba:	5d                   	pop    %ebp
 9bb:	c3                   	ret    
 9bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 9c0:	39 c2                	cmp    %eax,%edx
 9c2:	72 c4                	jb     988 <free+0x18>
 9c4:	39 c1                	cmp    %eax,%ecx
 9c6:	73 c0                	jae    988 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 9c8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 9cb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 9ce:	39 f8                	cmp    %edi,%eax
 9d0:	75 d0                	jne    9a2 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 9d2:	03 70 04             	add    0x4(%eax),%esi
 9d5:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 9d8:	8b 02                	mov    (%edx),%eax
 9da:	8b 00                	mov    (%eax),%eax
 9dc:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 9df:	8b 42 04             	mov    0x4(%edx),%eax
 9e2:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 9e5:	39 f1                	cmp    %esi,%ecx
 9e7:	75 c6                	jne    9af <free+0x3f>
    p->s.size += bp->s.size;
 9e9:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 9ec:	89 15 70 0f 00 00    	mov    %edx,0xf70
    p->s.size += bp->s.size;
 9f2:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 9f5:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 9f8:	89 0a                	mov    %ecx,(%edx)
}
 9fa:	5b                   	pop    %ebx
 9fb:	5e                   	pop    %esi
 9fc:	5f                   	pop    %edi
 9fd:	5d                   	pop    %ebp
 9fe:	c3                   	ret    
 9ff:	90                   	nop

00000a00 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 a00:	55                   	push   %ebp
 a01:	89 e5                	mov    %esp,%ebp
 a03:	57                   	push   %edi
 a04:	56                   	push   %esi
 a05:	53                   	push   %ebx
 a06:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a09:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 a0c:	8b 3d 70 0f 00 00    	mov    0xf70,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a12:	8d 70 07             	lea    0x7(%eax),%esi
 a15:	c1 ee 03             	shr    $0x3,%esi
 a18:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 a1b:	85 ff                	test   %edi,%edi
 a1d:	0f 84 9d 00 00 00    	je     ac0 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a23:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 a25:	8b 4a 04             	mov    0x4(%edx),%ecx
 a28:	39 f1                	cmp    %esi,%ecx
 a2a:	73 6a                	jae    a96 <malloc+0x96>
 a2c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 a31:	39 de                	cmp    %ebx,%esi
 a33:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 a36:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 a3d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 a40:	eb 17                	jmp    a59 <malloc+0x59>
 a42:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a48:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 a4a:	8b 48 04             	mov    0x4(%eax),%ecx
 a4d:	39 f1                	cmp    %esi,%ecx
 a4f:	73 4f                	jae    aa0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 a51:	8b 3d 70 0f 00 00    	mov    0xf70,%edi
 a57:	89 c2                	mov    %eax,%edx
 a59:	39 d7                	cmp    %edx,%edi
 a5b:	75 eb                	jne    a48 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 a5d:	83 ec 0c             	sub    $0xc,%esp
 a60:	ff 75 e4             	push   -0x1c(%ebp)
 a63:	e8 6c fc ff ff       	call   6d4 <sbrk>
  if(p == (char*)-1)
 a68:	83 c4 10             	add    $0x10,%esp
 a6b:	83 f8 ff             	cmp    $0xffffffff,%eax
 a6e:	74 1c                	je     a8c <malloc+0x8c>
  hp->s.size = nu;
 a70:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 a73:	83 ec 0c             	sub    $0xc,%esp
 a76:	83 c0 08             	add    $0x8,%eax
 a79:	50                   	push   %eax
 a7a:	e8 f1 fe ff ff       	call   970 <free>
  return freep;
 a7f:	8b 15 70 0f 00 00    	mov    0xf70,%edx
      if((p = morecore(nunits)) == 0)
 a85:	83 c4 10             	add    $0x10,%esp
 a88:	85 d2                	test   %edx,%edx
 a8a:	75 bc                	jne    a48 <malloc+0x48>
        return 0;
  }
}
 a8c:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 a8f:	31 c0                	xor    %eax,%eax
}
 a91:	5b                   	pop    %ebx
 a92:	5e                   	pop    %esi
 a93:	5f                   	pop    %edi
 a94:	5d                   	pop    %ebp
 a95:	c3                   	ret    
    if(p->s.size >= nunits){
 a96:	89 d0                	mov    %edx,%eax
 a98:	89 fa                	mov    %edi,%edx
 a9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 aa0:	39 ce                	cmp    %ecx,%esi
 aa2:	74 4c                	je     af0 <malloc+0xf0>
        p->s.size -= nunits;
 aa4:	29 f1                	sub    %esi,%ecx
 aa6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 aa9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 aac:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 aaf:	89 15 70 0f 00 00    	mov    %edx,0xf70
}
 ab5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 ab8:	83 c0 08             	add    $0x8,%eax
}
 abb:	5b                   	pop    %ebx
 abc:	5e                   	pop    %esi
 abd:	5f                   	pop    %edi
 abe:	5d                   	pop    %ebp
 abf:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 ac0:	c7 05 70 0f 00 00 74 	movl   $0xf74,0xf70
 ac7:	0f 00 00 
    base.s.size = 0;
 aca:	bf 74 0f 00 00       	mov    $0xf74,%edi
    base.s.ptr = freep = prevp = &base;
 acf:	c7 05 74 0f 00 00 74 	movl   $0xf74,0xf74
 ad6:	0f 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 ad9:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 adb:	c7 05 78 0f 00 00 00 	movl   $0x0,0xf78
 ae2:	00 00 00 
    if(p->s.size >= nunits){
 ae5:	e9 42 ff ff ff       	jmp    a2c <malloc+0x2c>
 aea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 af0:	8b 08                	mov    (%eax),%ecx
 af2:	89 0a                	mov    %ecx,(%edx)
 af4:	eb b9                	jmp    aaf <malloc+0xaf>
