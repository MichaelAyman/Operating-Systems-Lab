
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
  14:	8b 19                	mov    (%ecx),%ebx
  16:	8b 49 04             	mov    0x4(%ecx),%ecx
    if (argc == 1) {
  19:	83 fb 01             	cmp    $0x1,%ebx
  1c:	0f 84 51 01 00 00    	je     173 <main+0x173>
        printf(2, "Incorrect format. Try: printstats x y z\n");
        exit();
    }

    int arr[argc-1];
  22:	83 eb 01             	sub    $0x1,%ebx
  25:	8d 04 9d 00 00 00 00 	lea    0x0(,%ebx,4),%eax
  2c:	89 45 e0             	mov    %eax,-0x20(%ebp)
  2f:	83 c0 0f             	add    $0xf,%eax
  32:	83 e0 f0             	and    $0xfffffff0,%eax
  35:	29 c4                	sub    %eax,%esp
  37:	8d 74 24 03          	lea    0x3(%esp),%esi
  3b:	89 f0                	mov    %esi,%eax
  3d:	83 e6 fc             	and    $0xfffffffc,%esi
  40:	c1 e8 02             	shr    $0x2,%eax
  43:	89 45 d4             	mov    %eax,-0x2c(%ebp)

    for (int i = 0; i < argc-1; i++) {
  46:	85 db                	test   %ebx,%ebx
  48:	0f 8e 38 01 00 00    	jle    186 <main+0x186>
  4e:	31 ff                	xor    %edi,%edi
  50:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
  53:	89 fb                	mov    %edi,%ebx
  55:	89 cf                	mov    %ecx,%edi
  57:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  5e:	00 
  5f:	90                   	nop
        arr[i] = atoi(argv[i+1]);
  60:	83 ec 0c             	sub    $0xc,%esp
  63:	ff 74 9f 04          	push   0x4(%edi,%ebx,4)
  67:	e8 f4 04 00 00       	call   560 <atoi>
    for (int i = 0; i < argc-1; i++) {
  6c:	83 c4 10             	add    $0x10,%esp
        arr[i] = atoi(argv[i+1]);
  6f:	89 04 9e             	mov    %eax,(%esi,%ebx,4)
    for (int i = 0; i < argc-1; i++) {
  72:	83 c3 01             	add    $0x1,%ebx
  75:	39 5d e4             	cmp    %ebx,-0x1c(%ebp)
  78:	75 e6                	jne    60 <main+0x60>
  7a:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
    }

    // need to sort array

    int med = median(arr, argc-1);
  7d:	83 ec 08             	sub    $0x8,%esp
  80:	53                   	push   %ebx
  81:	56                   	push   %esi
  82:	e8 79 01 00 00       	call   200 <median>
  87:	8b 4d e0             	mov    -0x20(%ebp),%ecx
  8a:	83 c4 10             	add    $0x10,%esp
  8d:	89 f2                	mov    %esi,%edx
  8f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    int sum = 0;
  92:	31 c0                	xor    %eax,%eax
  94:	01 f1                	add    %esi,%ecx
  96:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  9d:	00 
  9e:	66 90                	xchg   %ax,%ax
      sum += arr[i];
  a0:	03 02                	add    (%edx),%eax
    for (i = 0; i < n; i++){
  a2:	83 c2 04             	add    $0x4,%edx
  a5:	39 ca                	cmp    %ecx,%edx
  a7:	75 f7                	jne    a0 <main+0xa0>
    return sum / n;
  a9:	99                   	cltd
    int avg = average(arr, argc-1);
    int standard = std(arr, argc-1);
  aa:	83 ec 08             	sub    $0x8,%esp
    return sum / n;
  ad:	89 4d d0             	mov    %ecx,-0x30(%ebp)
  b0:	f7 fb                	idiv   %ebx
    int standard = std(arr, argc-1);
  b2:	53                   	push   %ebx
  b3:	56                   	push   %esi
    return sum / n;
  b4:	89 45 d8             	mov    %eax,-0x28(%ebp)
    int standard = std(arr, argc-1);
  b7:	e8 84 01 00 00       	call   240 <std>
  bc:	89 45 e0             	mov    %eax,-0x20(%ebp)
    int mini = min(arr, argc-1);
  bf:	58                   	pop    %eax
  c0:	5a                   	pop    %edx
  c1:	53                   	push   %ebx
  c2:	56                   	push   %esi
  c3:	e8 f8 01 00 00       	call   2c0 <min>
  c8:	83 c4 10             	add    $0x10,%esp
  cb:	89 45 dc             	mov    %eax,-0x24(%ebp)
    int maxi = arr[0];
  ce:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  d1:	8b 3c 85 00 00 00 00 	mov    0x0(,%eax,4),%edi
    for (int i = 1; i < n; i++) {
  d8:	83 fb 01             	cmp    $0x1,%ebx
  db:	74 39                	je     116 <main+0x116>
  dd:	8b 4d d0             	mov    -0x30(%ebp),%ecx
  e0:	8d 56 04             	lea    0x4(%esi),%edx
  e3:	89 cb                	mov    %ecx,%ebx
  e5:	29 d3                	sub    %edx,%ebx
  e7:	80 e3 04             	and    $0x4,%bl
  ea:	74 14                	je     100 <main+0x100>
      if (arr[i] > maxi) {
  ec:	8b 12                	mov    (%edx),%edx
  ee:	39 d7                	cmp    %edx,%edi
  f0:	0f 4c fa             	cmovl  %edx,%edi
    for (int i = 1; i < n; i++) {
  f3:	8d 56 08             	lea    0x8(%esi),%edx
  f6:	39 ca                	cmp    %ecx,%edx
  f8:	74 1c                	je     116 <main+0x116>
  fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if (arr[i] > maxi) {
 100:	8b 02                	mov    (%edx),%eax
 102:	39 c7                	cmp    %eax,%edi
 104:	0f 4c f8             	cmovl  %eax,%edi
 107:	8b 42 04             	mov    0x4(%edx),%eax
 10a:	39 c7                	cmp    %eax,%edi
 10c:	0f 4c f8             	cmovl  %eax,%edi
    for (int i = 1; i < n; i++) {
 10f:	83 c2 08             	add    $0x8,%edx
 112:	39 ca                	cmp    %ecx,%edx
 114:	75 ea                	jne    100 <main+0x100>
    int maxi = max(arr, argc-1);

    printf(1, "Average: %d\n", avg);
 116:	83 ec 04             	sub    $0x4,%esp
 119:	ff 75 d8             	push   -0x28(%ebp)
 11c:	68 b1 0b 00 00       	push   $0xbb1
 121:	6a 01                	push   $0x1
 123:	e8 f8 06 00 00       	call   820 <printf>
    printf(1, "Standard Deviation: %d\n", standard);
 128:	83 c4 0c             	add    $0xc,%esp
 12b:	ff 75 e0             	push   -0x20(%ebp)
 12e:	68 be 0b 00 00       	push   $0xbbe
 133:	6a 01                	push   $0x1
 135:	e8 e6 06 00 00       	call   820 <printf>
    printf(1, "Median: %d\n", med);
 13a:	83 c4 0c             	add    $0xc,%esp
 13d:	ff 75 e4             	push   -0x1c(%ebp)
 140:	68 d6 0b 00 00       	push   $0xbd6
 145:	6a 01                	push   $0x1
 147:	e8 d4 06 00 00       	call   820 <printf>
    printf(1, "Minimum: %d\n", mini);
 14c:	83 c4 0c             	add    $0xc,%esp
 14f:	ff 75 dc             	push   -0x24(%ebp)
 152:	68 e2 0b 00 00       	push   $0xbe2
 157:	6a 01                	push   $0x1
 159:	e8 c2 06 00 00       	call   820 <printf>
    printf(1, "Maximum: %d\n", maxi);
 15e:	83 c4 0c             	add    $0xc,%esp
 161:	57                   	push   %edi
 162:	68 ef 0b 00 00       	push   $0xbef
 167:	6a 01                	push   $0x1
 169:	e8 b2 06 00 00       	call   820 <printf>
    exit();
 16e:	e8 03 05 00 00       	call   676 <exit>
        printf(2, "Incorrect format. Try: printstats x y z\n");
 173:	50                   	push   %eax
 174:	50                   	push   %eax
 175:	68 88 0b 00 00       	push   $0xb88
 17a:	6a 02                	push   $0x2
 17c:	e8 9f 06 00 00       	call   820 <printf>
        exit();
 181:	e8 f0 04 00 00       	call   676 <exit>
    int med = median(arr, argc-1);
 186:	51                   	push   %ecx
 187:	51                   	push   %ecx
 188:	53                   	push   %ebx
 189:	56                   	push   %esi
 18a:	e8 71 00 00 00       	call   200 <median>
 18f:	5f                   	pop    %edi
 190:	5a                   	pop    %edx
    int standard = std(arr, argc-1);
 191:	53                   	push   %ebx
 192:	56                   	push   %esi
    int med = median(arr, argc-1);
 193:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    int standard = std(arr, argc-1);
 196:	e8 a5 00 00 00       	call   240 <std>
    int mini = min(arr, argc-1);
 19b:	59                   	pop    %ecx
 19c:	5f                   	pop    %edi
 19d:	53                   	push   %ebx
 19e:	56                   	push   %esi
    if (n <= 0) return 0;
 19f:	31 ff                	xor    %edi,%edi
    int standard = std(arr, argc-1);
 1a1:	89 45 e0             	mov    %eax,-0x20(%ebp)
    int mini = min(arr, argc-1);
 1a4:	e8 17 01 00 00       	call   2c0 <min>
 1a9:	83 c4 10             	add    $0x10,%esp
 1ac:	89 45 dc             	mov    %eax,-0x24(%ebp)
    return sum / n;
 1af:	31 c0                	xor    %eax,%eax
 1b1:	89 45 d8             	mov    %eax,-0x28(%ebp)
 1b4:	e9 5d ff ff ff       	jmp    116 <main+0x116>
 1b9:	66 90                	xchg   %ax,%ax
 1bb:	66 90                	xchg   %ax,%ax
 1bd:	66 90                	xchg   %ax,%ax
 1bf:	90                   	nop

000001c0 <average>:
int average(int *arr, int n) {
 1c0:	55                   	push   %ebp
      return 0;
 1c1:	31 c0                	xor    %eax,%eax
int average(int *arr, int n) {
 1c3:	89 e5                	mov    %esp,%ebp
 1c5:	53                   	push   %ebx
 1c6:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    if (n == 0) {
 1c9:	85 db                	test   %ebx,%ebx
 1cb:	74 1f                	je     1ec <average+0x2c>
    for (i = 0; i < n; i++){
 1cd:	7e 1d                	jle    1ec <average+0x2c>
 1cf:	8b 55 08             	mov    0x8(%ebp),%edx
 1d2:	8d 0c 9a             	lea    (%edx,%ebx,4),%ecx
 1d5:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 1dc:	00 
 1dd:	8d 76 00             	lea    0x0(%esi),%esi
      sum += arr[i];
 1e0:	03 02                	add    (%edx),%eax
    for (i = 0; i < n; i++){
 1e2:	83 c2 04             	add    $0x4,%edx
 1e5:	39 ca                	cmp    %ecx,%edx
 1e7:	75 f7                	jne    1e0 <average+0x20>
    return sum / n;
 1e9:	99                   	cltd
 1ea:	f7 fb                	idiv   %ebx
}
 1ec:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1ef:	c9                   	leave
 1f0:	c3                   	ret
 1f1:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 1f8:	00 
 1f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000200 <median>:
int median(int *arr, int n) {
 200:	55                   	push   %ebp
      return 0;
 201:	31 c0                	xor    %eax,%eax
int median(int *arr, int n) {
 203:	89 e5                	mov    %esp,%ebp
 205:	53                   	push   %ebx
 206:	8b 55 0c             	mov    0xc(%ebp),%edx
 209:	8b 4d 08             	mov    0x8(%ebp),%ecx
    if (n <= 0)  {
 20c:	85 d2                	test   %edx,%edx
 20e:	7e 20                	jle    230 <median+0x30>
      return (arr[n/2 - 1] + arr[n/2]) / 2;
 210:	89 d0                	mov    %edx,%eax
 212:	d1 f8                	sar    $1,%eax
    if (n % 2 == 0) {
 214:	83 e2 01             	and    $0x1,%edx
      return (arr[n/2 - 1] + arr[n/2]) / 2;
 217:	8d 1c 85 00 00 00 00 	lea    0x0(,%eax,4),%ebx
 21e:	8b 04 81             	mov    (%ecx,%eax,4),%eax
    if (n % 2 == 0) {
 221:	75 0d                	jne    230 <median+0x30>
      return (arr[n/2 - 1] + arr[n/2]) / 2;
 223:	03 44 19 fc          	add    -0x4(%ecx,%ebx,1),%eax
 227:	89 c2                	mov    %eax,%edx
 229:	c1 ea 1f             	shr    $0x1f,%edx
 22c:	01 d0                	add    %edx,%eax
 22e:	d1 f8                	sar    $1,%eax
}
 230:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 233:	c9                   	leave
 234:	c3                   	ret
 235:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 23c:	00 
 23d:	8d 76 00             	lea    0x0(%esi),%esi

00000240 <std>:
int std(int *arr, int n) {
 240:	55                   	push   %ebp
    if (n <= 1) return 0;
 241:	31 c0                	xor    %eax,%eax
int std(int *arr, int n) {
 243:	89 e5                	mov    %esp,%ebp
 245:	57                   	push   %edi
 246:	56                   	push   %esi
 247:	53                   	push   %ebx
 248:	83 ec 1c             	sub    $0x1c,%esp
 24b:	8b 75 0c             	mov    0xc(%ebp),%esi
    if (n <= 1) return 0;
 24e:	83 fe 01             	cmp    $0x1,%esi
 251:	7e 56                	jle    2a9 <std+0x69>
 253:	8b 4d 08             	mov    0x8(%ebp),%ecx
 256:	8d 1c b1             	lea    (%ecx,%esi,4),%ebx
 259:	89 ca                	mov    %ecx,%edx
 25b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
      sum += arr[i];
 260:	03 02                	add    (%edx),%eax
    for (i = 0; i < n; i++){
 262:	83 c2 04             	add    $0x4,%edx
 265:	39 d3                	cmp    %edx,%ebx
 267:	75 f7                	jne    260 <std+0x20>
    return sum / n;
 269:	99                   	cltd
 26a:	f7 fe                	idiv   %esi
 26c:	89 c7                	mov    %eax,%edi
    int sum = 0;
 26e:	31 c0                	xor    %eax,%eax
        sum += ((arr[i]-m) * (arr[i]-m));
 270:	8b 11                	mov    (%ecx),%edx
    for (i = 0; i < n; i++){
 272:	83 c1 04             	add    $0x4,%ecx
        sum += ((arr[i]-m) * (arr[i]-m));
 275:	29 fa                	sub    %edi,%edx
 277:	0f af d2             	imul   %edx,%edx
 27a:	01 d0                	add    %edx,%eax
    for (i = 0; i < n; i++){
 27c:	39 cb                	cmp    %ecx,%ebx
 27e:	75 f0                	jne    270 <std+0x30>
    return (int) sqrt(sum / n);
 280:	99                   	cltd
 281:	83 ec 0c             	sub    $0xc,%esp
 284:	f7 fe                	idiv   %esi
 286:	50                   	push   %eax
 287:	e8 44 03 00 00       	call   5d0 <sqrt>
 28c:	83 c4 10             	add    $0x10,%esp
 28f:	d9 7d e6             	fnstcw -0x1a(%ebp)
 292:	0f b7 45 e6          	movzwl -0x1a(%ebp),%eax
 296:	80 cc 0c             	or     $0xc,%ah
 299:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
 29d:	d9 6d e4             	fldcw  -0x1c(%ebp)
 2a0:	db 5d e0             	fistpl -0x20(%ebp)
 2a3:	d9 6d e6             	fldcw  -0x1a(%ebp)
 2a6:	8b 45 e0             	mov    -0x20(%ebp),%eax
}
 2a9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2ac:	5b                   	pop    %ebx
 2ad:	5e                   	pop    %esi
 2ae:	5f                   	pop    %edi
 2af:	5d                   	pop    %ebp
 2b0:	c3                   	ret
 2b1:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 2b8:	00 
 2b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000002c0 <min>:
int min(int *arr, int n) {
 2c0:	55                   	push   %ebp
    if (n <= 0) return 0;
 2c1:	31 c0                	xor    %eax,%eax
int min(int *arr, int n) {
 2c3:	89 e5                	mov    %esp,%ebp
 2c5:	56                   	push   %esi
 2c6:	53                   	push   %ebx
 2c7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 2ca:	8b 4d 08             	mov    0x8(%ebp),%ecx
    if (n <= 0) return 0;
 2cd:	85 db                	test   %ebx,%ebx
 2cf:	7e 45                	jle    316 <min+0x56>
    if (arr != 0) {
 2d1:	85 c9                	test   %ecx,%ecx
 2d3:	74 02                	je     2d7 <min+0x17>
      mini = arr[0];
 2d5:	8b 01                	mov    (%ecx),%eax
    for (int i = 1; i < n; i++) {
 2d7:	83 fb 01             	cmp    $0x1,%ebx
 2da:	74 3a                	je     316 <min+0x56>
 2dc:	8d 1c 99             	lea    (%ecx,%ebx,4),%ebx
 2df:	8d 51 04             	lea    0x4(%ecx),%edx
 2e2:	89 de                	mov    %ebx,%esi
 2e4:	29 d6                	sub    %edx,%esi
 2e6:	83 e6 04             	and    $0x4,%esi
 2e9:	74 15                	je     300 <min+0x40>
      if (arr[i] < mini) {
 2eb:	8b 12                	mov    (%edx),%edx
 2ed:	39 d0                	cmp    %edx,%eax
 2ef:	0f 4f c2             	cmovg  %edx,%eax
    for (int i = 1; i < n; i++) {
 2f2:	8d 51 08             	lea    0x8(%ecx),%edx
 2f5:	39 da                	cmp    %ebx,%edx
 2f7:	74 1d                	je     316 <min+0x56>
 2f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if (arr[i] < mini) {
 300:	8b 0a                	mov    (%edx),%ecx
 302:	39 c8                	cmp    %ecx,%eax
 304:	0f 4f c1             	cmovg  %ecx,%eax
 307:	8b 4a 04             	mov    0x4(%edx),%ecx
 30a:	39 c8                	cmp    %ecx,%eax
 30c:	0f 4f c1             	cmovg  %ecx,%eax
    for (int i = 1; i < n; i++) {
 30f:	83 c2 08             	add    $0x8,%edx
 312:	39 da                	cmp    %ebx,%edx
 314:	75 ea                	jne    300 <min+0x40>
}
 316:	5b                   	pop    %ebx
 317:	5e                   	pop    %esi
 318:	5d                   	pop    %ebp
 319:	c3                   	ret
 31a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000320 <max>:
int max(int *arr, int n) {
 320:	55                   	push   %ebp
    if (n <= 0) return 0;
 321:	31 c0                	xor    %eax,%eax
int max(int *arr, int n) {
 323:	89 e5                	mov    %esp,%ebp
 325:	56                   	push   %esi
 326:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 329:	8b 75 08             	mov    0x8(%ebp),%esi
 32c:	53                   	push   %ebx
    if (n <= 0) return 0;
 32d:	85 c9                	test   %ecx,%ecx
 32f:	7e 45                	jle    376 <max+0x56>
    int maxi = arr[0];
 331:	8b 06                	mov    (%esi),%eax
    for (int i = 1; i < n; i++) {
 333:	83 f9 01             	cmp    $0x1,%ecx
 336:	74 3e                	je     376 <max+0x56>
 338:	8d 1c 8e             	lea    (%esi,%ecx,4),%ebx
 33b:	8d 56 04             	lea    0x4(%esi),%edx
 33e:	89 d9                	mov    %ebx,%ecx
 340:	29 d1                	sub    %edx,%ecx
 342:	83 e1 04             	and    $0x4,%ecx
 345:	74 19                	je     360 <max+0x40>
      if (arr[i] > maxi) {
 347:	8b 12                	mov    (%edx),%edx
 349:	39 d0                	cmp    %edx,%eax
 34b:	0f 4c c2             	cmovl  %edx,%eax
    for (int i = 1; i < n; i++) {
 34e:	8d 56 08             	lea    0x8(%esi),%edx
 351:	39 da                	cmp    %ebx,%edx
 353:	74 21                	je     376 <max+0x56>
 355:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 35c:	00 
 35d:	8d 76 00             	lea    0x0(%esi),%esi
      if (arr[i] > maxi) {
 360:	8b 0a                	mov    (%edx),%ecx
 362:	39 c8                	cmp    %ecx,%eax
 364:	0f 4c c1             	cmovl  %ecx,%eax
 367:	8b 4a 04             	mov    0x4(%edx),%ecx
 36a:	39 c8                	cmp    %ecx,%eax
 36c:	0f 4c c1             	cmovl  %ecx,%eax
    for (int i = 1; i < n; i++) {
 36f:	83 c2 08             	add    $0x8,%edx
 372:	39 da                	cmp    %ebx,%edx
 374:	75 ea                	jne    360 <max+0x40>
}
 376:	5b                   	pop    %ebx
 377:	5e                   	pop    %esi
 378:	5d                   	pop    %ebp
 379:	c3                   	ret
 37a:	66 90                	xchg   %ax,%ax
 37c:	66 90                	xchg   %ax,%ax
 37e:	66 90                	xchg   %ax,%ax

00000380 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 380:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 381:	31 c0                	xor    %eax,%eax
{
 383:	89 e5                	mov    %esp,%ebp
 385:	53                   	push   %ebx
 386:	8b 4d 08             	mov    0x8(%ebp),%ecx
 389:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 38c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 390:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 394:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 397:	83 c0 01             	add    $0x1,%eax
 39a:	84 d2                	test   %dl,%dl
 39c:	75 f2                	jne    390 <strcpy+0x10>
    ;
  return os;
}
 39e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3a1:	89 c8                	mov    %ecx,%eax
 3a3:	c9                   	leave
 3a4:	c3                   	ret
 3a5:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 3ac:	00 
 3ad:	8d 76 00             	lea    0x0(%esi),%esi

000003b0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 3b0:	55                   	push   %ebp
 3b1:	89 e5                	mov    %esp,%ebp
 3b3:	53                   	push   %ebx
 3b4:	8b 55 08             	mov    0x8(%ebp),%edx
 3b7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 3ba:	0f b6 02             	movzbl (%edx),%eax
 3bd:	84 c0                	test   %al,%al
 3bf:	75 2f                	jne    3f0 <strcmp+0x40>
 3c1:	eb 4a                	jmp    40d <strcmp+0x5d>
 3c3:	eb 1b                	jmp    3e0 <strcmp+0x30>
 3c5:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 3cc:	00 
 3cd:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 3d4:	00 
 3d5:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 3dc:	00 
 3dd:	8d 76 00             	lea    0x0(%esi),%esi
 3e0:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 3e4:	83 c2 01             	add    $0x1,%edx
 3e7:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 3ea:	84 c0                	test   %al,%al
 3ec:	74 12                	je     400 <strcmp+0x50>
 3ee:	89 d9                	mov    %ebx,%ecx
 3f0:	0f b6 19             	movzbl (%ecx),%ebx
 3f3:	38 c3                	cmp    %al,%bl
 3f5:	74 e9                	je     3e0 <strcmp+0x30>
  return (uchar)*p - (uchar)*q;
 3f7:	29 d8                	sub    %ebx,%eax
}
 3f9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3fc:	c9                   	leave
 3fd:	c3                   	ret
 3fe:	66 90                	xchg   %ax,%ax
  return (uchar)*p - (uchar)*q;
 400:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 404:	31 c0                	xor    %eax,%eax
 406:	29 d8                	sub    %ebx,%eax
}
 408:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 40b:	c9                   	leave
 40c:	c3                   	ret
  return (uchar)*p - (uchar)*q;
 40d:	0f b6 19             	movzbl (%ecx),%ebx
 410:	31 c0                	xor    %eax,%eax
 412:	eb e3                	jmp    3f7 <strcmp+0x47>
 414:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 41b:	00 
 41c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000420 <strlen>:

uint
strlen(const char *s)
{
 420:	55                   	push   %ebp
 421:	89 e5                	mov    %esp,%ebp
 423:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 426:	80 3a 00             	cmpb   $0x0,(%edx)
 429:	74 15                	je     440 <strlen+0x20>
 42b:	31 c0                	xor    %eax,%eax
 42d:	8d 76 00             	lea    0x0(%esi),%esi
 430:	83 c0 01             	add    $0x1,%eax
 433:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 437:	89 c1                	mov    %eax,%ecx
 439:	75 f5                	jne    430 <strlen+0x10>
    ;
  return n;
}
 43b:	89 c8                	mov    %ecx,%eax
 43d:	5d                   	pop    %ebp
 43e:	c3                   	ret
 43f:	90                   	nop
  for(n = 0; s[n]; n++)
 440:	31 c9                	xor    %ecx,%ecx
}
 442:	5d                   	pop    %ebp
 443:	89 c8                	mov    %ecx,%eax
 445:	c3                   	ret
 446:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 44d:	00 
 44e:	66 90                	xchg   %ax,%ax

00000450 <memset>:

void*
memset(void *dst, int c, uint n)
{
 450:	55                   	push   %ebp
 451:	89 e5                	mov    %esp,%ebp
 453:	57                   	push   %edi
 454:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 457:	8b 4d 10             	mov    0x10(%ebp),%ecx
 45a:	8b 45 0c             	mov    0xc(%ebp),%eax
 45d:	89 d7                	mov    %edx,%edi
 45f:	fc                   	cld
 460:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 462:	8b 7d fc             	mov    -0x4(%ebp),%edi
 465:	89 d0                	mov    %edx,%eax
 467:	c9                   	leave
 468:	c3                   	ret
 469:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000470 <strchr>:

char*
strchr(const char *s, char c)
{
 470:	55                   	push   %ebp
 471:	89 e5                	mov    %esp,%ebp
 473:	8b 45 08             	mov    0x8(%ebp),%eax
 476:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 47a:	0f b6 10             	movzbl (%eax),%edx
 47d:	84 d2                	test   %dl,%dl
 47f:	75 1a                	jne    49b <strchr+0x2b>
 481:	eb 25                	jmp    4a8 <strchr+0x38>
 483:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 48a:	00 
 48b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 490:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 494:	83 c0 01             	add    $0x1,%eax
 497:	84 d2                	test   %dl,%dl
 499:	74 0d                	je     4a8 <strchr+0x38>
    if(*s == c)
 49b:	38 d1                	cmp    %dl,%cl
 49d:	75 f1                	jne    490 <strchr+0x20>
      return (char*)s;
  return 0;
}
 49f:	5d                   	pop    %ebp
 4a0:	c3                   	ret
 4a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 4a8:	31 c0                	xor    %eax,%eax
}
 4aa:	5d                   	pop    %ebp
 4ab:	c3                   	ret
 4ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000004b0 <gets>:

char*
gets(char *buf, int max)
{
 4b0:	55                   	push   %ebp
 4b1:	89 e5                	mov    %esp,%ebp
 4b3:	57                   	push   %edi
 4b4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 4b5:	8d 75 e7             	lea    -0x19(%ebp),%esi
{
 4b8:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 4b9:	31 db                	xor    %ebx,%ebx
{
 4bb:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 4be:	eb 27                	jmp    4e7 <gets+0x37>
    cc = read(0, &c, 1);
 4c0:	83 ec 04             	sub    $0x4,%esp
 4c3:	6a 01                	push   $0x1
 4c5:	56                   	push   %esi
 4c6:	6a 00                	push   $0x0
 4c8:	e8 c1 01 00 00       	call   68e <read>
    if(cc < 1)
 4cd:	83 c4 10             	add    $0x10,%esp
 4d0:	85 c0                	test   %eax,%eax
 4d2:	7e 1d                	jle    4f1 <gets+0x41>
      break;
    buf[i++] = c;
 4d4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 4d8:	8b 55 08             	mov    0x8(%ebp),%edx
 4db:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 4df:	3c 0a                	cmp    $0xa,%al
 4e1:	74 10                	je     4f3 <gets+0x43>
 4e3:	3c 0d                	cmp    $0xd,%al
 4e5:	74 0c                	je     4f3 <gets+0x43>
  for(i=0; i+1 < max; ){
 4e7:	89 df                	mov    %ebx,%edi
 4e9:	83 c3 01             	add    $0x1,%ebx
 4ec:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 4ef:	7c cf                	jl     4c0 <gets+0x10>
 4f1:	89 fb                	mov    %edi,%ebx
      break;
  }
  buf[i] = '\0';
 4f3:	8b 45 08             	mov    0x8(%ebp),%eax
 4f6:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
 4fa:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4fd:	5b                   	pop    %ebx
 4fe:	5e                   	pop    %esi
 4ff:	5f                   	pop    %edi
 500:	5d                   	pop    %ebp
 501:	c3                   	ret
 502:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 509:	00 
 50a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000510 <stat>:

int
stat(const char *n, struct stat *st)
{
 510:	55                   	push   %ebp
 511:	89 e5                	mov    %esp,%ebp
 513:	56                   	push   %esi
 514:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 515:	83 ec 08             	sub    $0x8,%esp
 518:	6a 00                	push   $0x0
 51a:	ff 75 08             	push   0x8(%ebp)
 51d:	e8 94 01 00 00       	call   6b6 <open>
  if(fd < 0)
 522:	83 c4 10             	add    $0x10,%esp
 525:	85 c0                	test   %eax,%eax
 527:	78 27                	js     550 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 529:	83 ec 08             	sub    $0x8,%esp
 52c:	ff 75 0c             	push   0xc(%ebp)
 52f:	89 c3                	mov    %eax,%ebx
 531:	50                   	push   %eax
 532:	e8 97 01 00 00       	call   6ce <fstat>
  close(fd);
 537:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 53a:	89 c6                	mov    %eax,%esi
  close(fd);
 53c:	e8 5d 01 00 00       	call   69e <close>
  return r;
 541:	83 c4 10             	add    $0x10,%esp
}
 544:	8d 65 f8             	lea    -0x8(%ebp),%esp
 547:	89 f0                	mov    %esi,%eax
 549:	5b                   	pop    %ebx
 54a:	5e                   	pop    %esi
 54b:	5d                   	pop    %ebp
 54c:	c3                   	ret
 54d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 550:	be ff ff ff ff       	mov    $0xffffffff,%esi
 555:	eb ed                	jmp    544 <stat+0x34>
 557:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 55e:	00 
 55f:	90                   	nop

00000560 <atoi>:

int
atoi(const char *s)
{
 560:	55                   	push   %ebp
 561:	89 e5                	mov    %esp,%ebp
 563:	53                   	push   %ebx
 564:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 567:	0f be 02             	movsbl (%edx),%eax
 56a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 56d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 570:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 575:	77 1e                	ja     595 <atoi+0x35>
 577:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 57e:	00 
 57f:	90                   	nop
    n = n*10 + *s++ - '0';
 580:	83 c2 01             	add    $0x1,%edx
 583:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 586:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 58a:	0f be 02             	movsbl (%edx),%eax
 58d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 590:	80 fb 09             	cmp    $0x9,%bl
 593:	76 eb                	jbe    580 <atoi+0x20>
  return n;
}
 595:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 598:	89 c8                	mov    %ecx,%eax
 59a:	c9                   	leave
 59b:	c3                   	ret
 59c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000005a0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 5a0:	55                   	push   %ebp
 5a1:	89 e5                	mov    %esp,%ebp
 5a3:	57                   	push   %edi
 5a4:	8b 45 10             	mov    0x10(%ebp),%eax
 5a7:	8b 55 08             	mov    0x8(%ebp),%edx
 5aa:	56                   	push   %esi
 5ab:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 5ae:	85 c0                	test   %eax,%eax
 5b0:	7e 13                	jle    5c5 <memmove+0x25>
 5b2:	01 d0                	add    %edx,%eax
  dst = vdst;
 5b4:	89 d7                	mov    %edx,%edi
 5b6:	66 90                	xchg   %ax,%ax
 5b8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 5bf:	00 
    *dst++ = *src++;
 5c0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 5c1:	39 f8                	cmp    %edi,%eax
 5c3:	75 fb                	jne    5c0 <memmove+0x20>
  return vdst;
}
 5c5:	5e                   	pop    %esi
 5c6:	89 d0                	mov    %edx,%eax
 5c8:	5f                   	pop    %edi
 5c9:	5d                   	pop    %ebp
 5ca:	c3                   	ret
 5cb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

000005d0 <sqrt>:


// https://www.geeksforgeeks.org/c-program-to-find-square-root-of-a-given-number/
float sqrt(int num) {
 5d0:	55                   	push   %ebp
 5d1:	89 e5                	mov    %esp,%ebp
 5d3:	56                   	push   %esi
 5d4:	53                   	push   %ebx
 5d5:	83 ec 04             	sub    $0x4,%esp
 5d8:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int end = num;
  int middle;

  float solution = 0.0;

  while (start <= end) {
 5db:	85 db                	test   %ebx,%ebx
 5dd:	0f 88 87 00 00 00    	js     66a <sqrt+0x9a>
  int end = num;
 5e3:	89 d9                	mov    %ebx,%ecx
  float solution = 0.0;
 5e5:	d9 ee                	fldz
  int start = 0;
 5e7:	31 d2                	xor    %edx,%edx
 5e9:	eb 14                	jmp    5ff <sqrt+0x2f>
 5eb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 5f0:	dd d8                	fstp   %st(0)
    if (middle * middle == num) {
      solution = middle;
      break;
    }
    if (middle * middle < num) {
      solution = start;
 5f2:	89 55 f4             	mov    %edx,-0xc(%ebp)
      start = middle + 1;
 5f5:	8d 50 01             	lea    0x1(%eax),%edx
      solution = start;
 5f8:	db 45 f4             	fildl  -0xc(%ebp)
  while (start <= end) {
 5fb:	39 ca                	cmp    %ecx,%edx
 5fd:	7f 1e                	jg     61d <sqrt+0x4d>
    middle = (start + end) / 2;
 5ff:	8d 34 0a             	lea    (%edx,%ecx,1),%esi
 602:	89 f0                	mov    %esi,%eax
 604:	c1 e8 1f             	shr    $0x1f,%eax
 607:	01 f0                	add    %esi,%eax
 609:	d1 f8                	sar    $1,%eax
    if (middle * middle == num) {
 60b:	89 c6                	mov    %eax,%esi
 60d:	0f af f0             	imul   %eax,%esi
 610:	39 de                	cmp    %ebx,%esi
 612:	74 4c                	je     660 <sqrt+0x90>
    if (middle * middle < num) {
 614:	7c da                	jl     5f0 <sqrt+0x20>
    }
    else {
      end = middle - 1;
 616:	8d 48 ff             	lea    -0x1(%eax),%ecx
  while (start <= end) {
 619:	39 ca                	cmp    %ecx,%edx
 61b:	7e e2                	jle    5ff <sqrt+0x2f>

  float eps = 0.1;
  int i;

  for (i = 0; i < 5; i++) {
    while (solution * solution <= num) {
 61d:	89 5d f4             	mov    %ebx,-0xc(%ebp)
 620:	b8 05 00 00 00       	mov    $0x5,%eax
 625:	db 45 f4             	fildl  -0xc(%ebp)
 628:	d9 05 04 0c 00 00    	flds   0xc04
 62e:	eb 02                	jmp    632 <sqrt+0x62>
      solution += eps;
 630:	dc c2                	fadd   %st,%st(2)
    while (solution * solution <= num) {
 632:	d9 c2                	fld    %st(2)
 634:	d8 cb                	fmul   %st(3),%st
 636:	d9 ca                	fxch   %st(2)
 638:	db f2                	fcomi  %st(2),%st
 63a:	dd da                	fstp   %st(2)
 63c:	73 f2                	jae    630 <sqrt+0x60>
    }
    solution = solution - eps;
 63e:	dc ea                	fsubr  %st,%st(2)
    eps = eps / 10;
 640:	d8 35 08 0c 00 00    	fdivs  0xc08
  for (i = 0; i < 5; i++) {
 646:	83 e8 01             	sub    $0x1,%eax
 649:	75 e7                	jne    632 <sqrt+0x62>
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
 656:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 65d:	00 
 65e:	66 90                	xchg   %ax,%ax
 660:	dd d8                	fstp   %st(0)
      solution = middle;
 662:	89 45 f4             	mov    %eax,-0xc(%ebp)
 665:	db 45 f4             	fildl  -0xc(%ebp)
      break;
 668:	eb b3                	jmp    61d <sqrt+0x4d>
  float solution = 0.0;
 66a:	d9 ee                	fldz
 66c:	eb af                	jmp    61d <sqrt+0x4d>

0000066e <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 66e:	b8 01 00 00 00       	mov    $0x1,%eax
 673:	cd 40                	int    $0x40
 675:	c3                   	ret

00000676 <exit>:
SYSCALL(exit)
 676:	b8 02 00 00 00       	mov    $0x2,%eax
 67b:	cd 40                	int    $0x40
 67d:	c3                   	ret

0000067e <wait>:
SYSCALL(wait)
 67e:	b8 03 00 00 00       	mov    $0x3,%eax
 683:	cd 40                	int    $0x40
 685:	c3                   	ret

00000686 <pipe>:
SYSCALL(pipe)
 686:	b8 04 00 00 00       	mov    $0x4,%eax
 68b:	cd 40                	int    $0x40
 68d:	c3                   	ret

0000068e <read>:
SYSCALL(read)
 68e:	b8 05 00 00 00       	mov    $0x5,%eax
 693:	cd 40                	int    $0x40
 695:	c3                   	ret

00000696 <write>:
SYSCALL(write)
 696:	b8 10 00 00 00       	mov    $0x10,%eax
 69b:	cd 40                	int    $0x40
 69d:	c3                   	ret

0000069e <close>:
SYSCALL(close)
 69e:	b8 15 00 00 00       	mov    $0x15,%eax
 6a3:	cd 40                	int    $0x40
 6a5:	c3                   	ret

000006a6 <kill>:
SYSCALL(kill)
 6a6:	b8 06 00 00 00       	mov    $0x6,%eax
 6ab:	cd 40                	int    $0x40
 6ad:	c3                   	ret

000006ae <exec>:
SYSCALL(exec)
 6ae:	b8 07 00 00 00       	mov    $0x7,%eax
 6b3:	cd 40                	int    $0x40
 6b5:	c3                   	ret

000006b6 <open>:
SYSCALL(open)
 6b6:	b8 0f 00 00 00       	mov    $0xf,%eax
 6bb:	cd 40                	int    $0x40
 6bd:	c3                   	ret

000006be <mknod>:
SYSCALL(mknod)
 6be:	b8 11 00 00 00       	mov    $0x11,%eax
 6c3:	cd 40                	int    $0x40
 6c5:	c3                   	ret

000006c6 <unlink>:
SYSCALL(unlink)
 6c6:	b8 12 00 00 00       	mov    $0x12,%eax
 6cb:	cd 40                	int    $0x40
 6cd:	c3                   	ret

000006ce <fstat>:
SYSCALL(fstat)
 6ce:	b8 08 00 00 00       	mov    $0x8,%eax
 6d3:	cd 40                	int    $0x40
 6d5:	c3                   	ret

000006d6 <link>:
SYSCALL(link)
 6d6:	b8 13 00 00 00       	mov    $0x13,%eax
 6db:	cd 40                	int    $0x40
 6dd:	c3                   	ret

000006de <mkdir>:
SYSCALL(mkdir)
 6de:	b8 14 00 00 00       	mov    $0x14,%eax
 6e3:	cd 40                	int    $0x40
 6e5:	c3                   	ret

000006e6 <chdir>:
SYSCALL(chdir)
 6e6:	b8 09 00 00 00       	mov    $0x9,%eax
 6eb:	cd 40                	int    $0x40
 6ed:	c3                   	ret

000006ee <dup>:
SYSCALL(dup)
 6ee:	b8 0a 00 00 00       	mov    $0xa,%eax
 6f3:	cd 40                	int    $0x40
 6f5:	c3                   	ret

000006f6 <getpid>:
SYSCALL(getpid)
 6f6:	b8 0b 00 00 00       	mov    $0xb,%eax
 6fb:	cd 40                	int    $0x40
 6fd:	c3                   	ret

000006fe <sbrk>:
SYSCALL(sbrk)
 6fe:	b8 0c 00 00 00       	mov    $0xc,%eax
 703:	cd 40                	int    $0x40
 705:	c3                   	ret

00000706 <sleep>:
SYSCALL(sleep)
 706:	b8 0d 00 00 00       	mov    $0xd,%eax
 70b:	cd 40                	int    $0x40
 70d:	c3                   	ret

0000070e <uptime>:
SYSCALL(uptime)
 70e:	b8 0e 00 00 00       	mov    $0xe,%eax
 713:	cd 40                	int    $0x40
 715:	c3                   	ret

00000716 <gettid>:
SYSCALL(gettid)
 716:	b8 16 00 00 00       	mov    $0x16,%eax
 71b:	cd 40                	int    $0x40
 71d:	c3                   	ret

0000071e <getpgid>:
SYSCALL(getpgid)
 71e:	b8 17 00 00 00       	mov    $0x17,%eax
 723:	cd 40                	int    $0x40
 725:	c3                   	ret

00000726 <setpgid>:
SYSCALL(setpgid)
 726:	b8 18 00 00 00       	mov    $0x18,%eax
 72b:	cd 40                	int    $0x40
 72d:	c3                   	ret

0000072e <getppid>:
SYSCALL(getppid)
 72e:	b8 19 00 00 00       	mov    $0x19,%eax
 733:	cd 40                	int    $0x40
 735:	c3                   	ret

00000736 <uptime_ms>:
SYSCALL(uptime_ms)
 736:	b8 1a 00 00 00       	mov    $0x1a,%eax
 73b:	cd 40                	int    $0x40
 73d:	c3                   	ret

0000073e <setpriority>:
 73e:	b8 1b 00 00 00       	mov    $0x1b,%eax
 743:	cd 40                	int    $0x40
 745:	c3                   	ret
 746:	66 90                	xchg   %ax,%ax
 748:	66 90                	xchg   %ax,%ax
 74a:	66 90                	xchg   %ax,%ax
 74c:	66 90                	xchg   %ax,%ax
 74e:	66 90                	xchg   %ax,%ax
 750:	66 90                	xchg   %ax,%ax
 752:	66 90                	xchg   %ax,%ax
 754:	66 90                	xchg   %ax,%ax
 756:	66 90                	xchg   %ax,%ax
 758:	66 90                	xchg   %ax,%ax
 75a:	66 90                	xchg   %ax,%ax
 75c:	66 90                	xchg   %ax,%ax
 75e:	66 90                	xchg   %ax,%ax

00000760 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 760:	55                   	push   %ebp
 761:	89 e5                	mov    %esp,%ebp
 763:	57                   	push   %edi
 764:	56                   	push   %esi
 765:	53                   	push   %ebx
 766:	89 cb                	mov    %ecx,%ebx
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 768:	89 d1                	mov    %edx,%ecx
{
 76a:	83 ec 3c             	sub    $0x3c,%esp
 76d:	89 45 c4             	mov    %eax,-0x3c(%ebp)
  if(sgn && xx < 0){
 770:	85 d2                	test   %edx,%edx
 772:	0f 89 98 00 00 00    	jns    810 <printint+0xb0>
 778:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 77c:	0f 84 8e 00 00 00    	je     810 <printint+0xb0>
    x = -xx;
 782:	f7 d9                	neg    %ecx
    neg = 1;
 784:	b8 01 00 00 00       	mov    $0x1,%eax
  } else {
    x = xx;
  }

  i = 0;
 789:	89 45 c0             	mov    %eax,-0x40(%ebp)
 78c:	31 f6                	xor    %esi,%esi
 78e:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 795:	00 
 796:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 79d:	00 
 79e:	66 90                	xchg   %ax,%ax
  do{
    buf[i++] = digits[x % base];
 7a0:	89 c8                	mov    %ecx,%eax
 7a2:	31 d2                	xor    %edx,%edx
 7a4:	89 f7                	mov    %esi,%edi
 7a6:	f7 f3                	div    %ebx
 7a8:	8d 76 01             	lea    0x1(%esi),%esi
 7ab:	0f b6 92 64 0c 00 00 	movzbl 0xc64(%edx),%edx
 7b2:	88 54 35 d7          	mov    %dl,-0x29(%ebp,%esi,1)
  }while((x /= base) != 0);
 7b6:	89 ca                	mov    %ecx,%edx
 7b8:	89 c1                	mov    %eax,%ecx
 7ba:	39 da                	cmp    %ebx,%edx
 7bc:	73 e2                	jae    7a0 <printint+0x40>
  if(neg)
 7be:	8b 45 c0             	mov    -0x40(%ebp),%eax
 7c1:	85 c0                	test   %eax,%eax
 7c3:	74 07                	je     7cc <printint+0x6c>
    buf[i++] = '-';
 7c5:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)
 7ca:	89 f7                	mov    %esi,%edi

  while(--i >= 0)
 7cc:	8d 5d d8             	lea    -0x28(%ebp),%ebx
 7cf:	8b 75 c4             	mov    -0x3c(%ebp),%esi
 7d2:	01 df                	add    %ebx,%edi
 7d4:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 7db:	00 
 7dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    putc(fd, buf[i]);
 7e0:	0f b6 07             	movzbl (%edi),%eax
  write(fd, &c, 1);
 7e3:	83 ec 04             	sub    $0x4,%esp
 7e6:	88 45 d7             	mov    %al,-0x29(%ebp)
 7e9:	8d 45 d7             	lea    -0x29(%ebp),%eax
 7ec:	6a 01                	push   $0x1
 7ee:	50                   	push   %eax
 7ef:	56                   	push   %esi
 7f0:	e8 a1 fe ff ff       	call   696 <write>
  while(--i >= 0)
 7f5:	89 f8                	mov    %edi,%eax
 7f7:	83 c4 10             	add    $0x10,%esp
 7fa:	83 ef 01             	sub    $0x1,%edi
 7fd:	39 d8                	cmp    %ebx,%eax
 7ff:	75 df                	jne    7e0 <printint+0x80>
}
 801:	8d 65 f4             	lea    -0xc(%ebp),%esp
 804:	5b                   	pop    %ebx
 805:	5e                   	pop    %esi
 806:	5f                   	pop    %edi
 807:	5d                   	pop    %ebp
 808:	c3                   	ret
 809:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 810:	31 c0                	xor    %eax,%eax
 812:	e9 72 ff ff ff       	jmp    789 <printint+0x29>
 817:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 81e:	00 
 81f:	90                   	nop

00000820 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 820:	55                   	push   %ebp
 821:	89 e5                	mov    %esp,%ebp
 823:	57                   	push   %edi
 824:	56                   	push   %esi
 825:	53                   	push   %ebx
 826:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 829:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 82c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 82f:	0f b6 13             	movzbl (%ebx),%edx
 832:	83 c3 01             	add    $0x1,%ebx
 835:	84 d2                	test   %dl,%dl
 837:	0f 84 a0 00 00 00    	je     8dd <printf+0xbd>
 83d:	8d 45 10             	lea    0x10(%ebp),%eax
 840:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    c = fmt[i] & 0xff;
 843:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 846:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 849:	eb 28                	jmp    873 <printf+0x53>
 84b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 850:	83 ec 04             	sub    $0x4,%esp
 853:	8d 45 e7             	lea    -0x19(%ebp),%eax
 856:	88 55 e7             	mov    %dl,-0x19(%ebp)
  for(i = 0; fmt[i]; i++){
 859:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 85c:	6a 01                	push   $0x1
 85e:	50                   	push   %eax
 85f:	56                   	push   %esi
 860:	e8 31 fe ff ff       	call   696 <write>
  for(i = 0; fmt[i]; i++){
 865:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 869:	83 c4 10             	add    $0x10,%esp
 86c:	84 d2                	test   %dl,%dl
 86e:	74 6d                	je     8dd <printf+0xbd>
    c = fmt[i] & 0xff;
 870:	0f b6 c2             	movzbl %dl,%eax
      if(c == '%'){
 873:	83 f8 25             	cmp    $0x25,%eax
 876:	75 d8                	jne    850 <printf+0x30>
  for(i = 0; fmt[i]; i++){
 878:	0f b6 13             	movzbl (%ebx),%edx
 87b:	84 d2                	test   %dl,%dl
 87d:	74 5e                	je     8dd <printf+0xbd>
    c = fmt[i] & 0xff;
 87f:	0f b6 c2             	movzbl %dl,%eax
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
 882:	80 fa 25             	cmp    $0x25,%dl
 885:	0f 84 1d 01 00 00    	je     9a8 <printf+0x188>
 88b:	83 e8 63             	sub    $0x63,%eax
 88e:	83 f8 15             	cmp    $0x15,%eax
 891:	77 0d                	ja     8a0 <printf+0x80>
 893:	ff 24 85 0c 0c 00 00 	jmp    *0xc0c(,%eax,4)
 89a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 8a0:	83 ec 04             	sub    $0x4,%esp
 8a3:	8d 4d e7             	lea    -0x19(%ebp),%ecx
 8a6:	88 55 d0             	mov    %dl,-0x30(%ebp)
        ap++;
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 8a9:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
  write(fd, &c, 1);
 8ad:	6a 01                	push   $0x1
 8af:	51                   	push   %ecx
 8b0:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
 8b3:	56                   	push   %esi
 8b4:	e8 dd fd ff ff       	call   696 <write>
        putc(fd, c);
 8b9:	0f b6 55 d0          	movzbl -0x30(%ebp),%edx
  write(fd, &c, 1);
 8bd:	83 c4 0c             	add    $0xc,%esp
 8c0:	88 55 e7             	mov    %dl,-0x19(%ebp)
 8c3:	6a 01                	push   $0x1
 8c5:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
 8c8:	51                   	push   %ecx
 8c9:	56                   	push   %esi
 8ca:	e8 c7 fd ff ff       	call   696 <write>
  for(i = 0; fmt[i]; i++){
 8cf:	0f b6 53 01          	movzbl 0x1(%ebx),%edx
 8d3:	83 c3 02             	add    $0x2,%ebx
 8d6:	83 c4 10             	add    $0x10,%esp
 8d9:	84 d2                	test   %dl,%dl
 8db:	75 93                	jne    870 <printf+0x50>
      }
      state = 0;
    }
  }
}
 8dd:	8d 65 f4             	lea    -0xc(%ebp),%esp
 8e0:	5b                   	pop    %ebx
 8e1:	5e                   	pop    %esi
 8e2:	5f                   	pop    %edi
 8e3:	5d                   	pop    %ebp
 8e4:	c3                   	ret
 8e5:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 8e8:	83 ec 0c             	sub    $0xc,%esp
 8eb:	8b 17                	mov    (%edi),%edx
 8ed:	b9 10 00 00 00       	mov    $0x10,%ecx
 8f2:	89 f0                	mov    %esi,%eax
 8f4:	6a 00                	push   $0x0
        ap++;
 8f6:	83 c7 04             	add    $0x4,%edi
        printint(fd, *ap, 16, 0);
 8f9:	e8 62 fe ff ff       	call   760 <printint>
  for(i = 0; fmt[i]; i++){
 8fe:	eb cf                	jmp    8cf <printf+0xaf>
        s = (char*)*ap;
 900:	8b 07                	mov    (%edi),%eax
        ap++;
 902:	83 c7 04             	add    $0x4,%edi
        if(s == 0)
 905:	85 c0                	test   %eax,%eax
 907:	0f 84 b3 00 00 00    	je     9c0 <printf+0x1a0>
        while(*s != 0){
 90d:	0f b6 10             	movzbl (%eax),%edx
 910:	84 d2                	test   %dl,%dl
 912:	0f 84 ba 00 00 00    	je     9d2 <printf+0x1b2>
 918:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 91b:	89 c7                	mov    %eax,%edi
 91d:	89 d0                	mov    %edx,%eax
 91f:	8d 4d e7             	lea    -0x19(%ebp),%ecx
 922:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 925:	89 fb                	mov    %edi,%ebx
 927:	89 cf                	mov    %ecx,%edi
 929:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 930:	83 ec 04             	sub    $0x4,%esp
 933:	88 45 e7             	mov    %al,-0x19(%ebp)
          s++;
 936:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 939:	6a 01                	push   $0x1
 93b:	57                   	push   %edi
 93c:	56                   	push   %esi
 93d:	e8 54 fd ff ff       	call   696 <write>
        while(*s != 0){
 942:	0f b6 03             	movzbl (%ebx),%eax
 945:	83 c4 10             	add    $0x10,%esp
 948:	84 c0                	test   %al,%al
 94a:	75 e4                	jne    930 <printf+0x110>
 94c:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  for(i = 0; fmt[i]; i++){
 94f:	0f b6 53 01          	movzbl 0x1(%ebx),%edx
 953:	83 c3 02             	add    $0x2,%ebx
 956:	84 d2                	test   %dl,%dl
 958:	0f 85 e5 fe ff ff    	jne    843 <printf+0x23>
 95e:	e9 7a ff ff ff       	jmp    8dd <printf+0xbd>
 963:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 968:	83 ec 0c             	sub    $0xc,%esp
 96b:	8b 17                	mov    (%edi),%edx
 96d:	b9 0a 00 00 00       	mov    $0xa,%ecx
 972:	89 f0                	mov    %esi,%eax
 974:	6a 01                	push   $0x1
        ap++;
 976:	83 c7 04             	add    $0x4,%edi
        printint(fd, *ap, 10, 1);
 979:	e8 e2 fd ff ff       	call   760 <printint>
  for(i = 0; fmt[i]; i++){
 97e:	e9 4c ff ff ff       	jmp    8cf <printf+0xaf>
 983:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 988:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
 98a:	83 ec 04             	sub    $0x4,%esp
 98d:	8d 4d e7             	lea    -0x19(%ebp),%ecx
        ap++;
 990:	83 c7 04             	add    $0x4,%edi
        putc(fd, *ap);
 993:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 996:	6a 01                	push   $0x1
 998:	51                   	push   %ecx
 999:	56                   	push   %esi
 99a:	e8 f7 fc ff ff       	call   696 <write>
  for(i = 0; fmt[i]; i++){
 99f:	e9 2b ff ff ff       	jmp    8cf <printf+0xaf>
 9a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 9a8:	83 ec 04             	sub    $0x4,%esp
 9ab:	88 55 e7             	mov    %dl,-0x19(%ebp)
 9ae:	8d 4d e7             	lea    -0x19(%ebp),%ecx
 9b1:	6a 01                	push   $0x1
 9b3:	e9 10 ff ff ff       	jmp    8c8 <printf+0xa8>
 9b8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 9bf:	00 
          s = "(null)";
 9c0:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 9c3:	b8 28 00 00 00       	mov    $0x28,%eax
 9c8:	bf fc 0b 00 00       	mov    $0xbfc,%edi
 9cd:	e9 4d ff ff ff       	jmp    91f <printf+0xff>
  for(i = 0; fmt[i]; i++){
 9d2:	0f b6 53 01          	movzbl 0x1(%ebx),%edx
 9d6:	83 c3 02             	add    $0x2,%ebx
 9d9:	84 d2                	test   %dl,%dl
 9db:	0f 85 8f fe ff ff    	jne    870 <printf+0x50>
 9e1:	e9 f7 fe ff ff       	jmp    8dd <printf+0xbd>
 9e6:	66 90                	xchg   %ax,%ax
 9e8:	66 90                	xchg   %ax,%ax
 9ea:	66 90                	xchg   %ax,%ax
 9ec:	66 90                	xchg   %ax,%ax
 9ee:	66 90                	xchg   %ax,%ax
 9f0:	66 90                	xchg   %ax,%ax
 9f2:	66 90                	xchg   %ax,%ax
 9f4:	66 90                	xchg   %ax,%ax
 9f6:	66 90                	xchg   %ax,%ax
 9f8:	66 90                	xchg   %ax,%ax
 9fa:	66 90                	xchg   %ax,%ax
 9fc:	66 90                	xchg   %ax,%ax
 9fe:	66 90                	xchg   %ax,%ax

00000a00 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 a00:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a01:	a1 78 0c 00 00       	mov    0xc78,%eax
{
 a06:	89 e5                	mov    %esp,%ebp
 a08:	57                   	push   %edi
 a09:	56                   	push   %esi
 a0a:	53                   	push   %ebx
 a0b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 a0e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a11:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 a18:	00 
 a19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 a20:	89 c2                	mov    %eax,%edx
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a22:	8b 00                	mov    (%eax),%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a24:	39 ca                	cmp    %ecx,%edx
 a26:	73 30                	jae    a58 <free+0x58>
 a28:	39 c1                	cmp    %eax,%ecx
 a2a:	72 04                	jb     a30 <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a2c:	39 c2                	cmp    %eax,%edx
 a2e:	72 f0                	jb     a20 <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
 a30:	8b 73 fc             	mov    -0x4(%ebx),%esi
 a33:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 a36:	39 f8                	cmp    %edi,%eax
 a38:	74 36                	je     a70 <free+0x70>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 a3a:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 a3d:	8b 42 04             	mov    0x4(%edx),%eax
 a40:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 a43:	39 f1                	cmp    %esi,%ecx
 a45:	74 40                	je     a87 <free+0x87>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 a47:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 a49:	5b                   	pop    %ebx
  freep = p;
 a4a:	89 15 78 0c 00 00    	mov    %edx,0xc78
}
 a50:	5e                   	pop    %esi
 a51:	5f                   	pop    %edi
 a52:	5d                   	pop    %ebp
 a53:	c3                   	ret
 a54:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a58:	39 c2                	cmp    %eax,%edx
 a5a:	72 c4                	jb     a20 <free+0x20>
 a5c:	39 c1                	cmp    %eax,%ecx
 a5e:	73 c0                	jae    a20 <free+0x20>
  if(bp + bp->s.size == p->s.ptr){
 a60:	8b 73 fc             	mov    -0x4(%ebx),%esi
 a63:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 a66:	39 f8                	cmp    %edi,%eax
 a68:	75 d0                	jne    a3a <free+0x3a>
 a6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    bp->s.size += p->s.ptr->s.size;
 a70:	03 70 04             	add    0x4(%eax),%esi
 a73:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 a76:	8b 02                	mov    (%edx),%eax
 a78:	8b 00                	mov    (%eax),%eax
 a7a:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 a7d:	8b 42 04             	mov    0x4(%edx),%eax
 a80:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 a83:	39 f1                	cmp    %esi,%ecx
 a85:	75 c0                	jne    a47 <free+0x47>
    p->s.size += bp->s.size;
 a87:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 a8a:	89 15 78 0c 00 00    	mov    %edx,0xc78
    p->s.size += bp->s.size;
 a90:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 a93:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 a96:	89 0a                	mov    %ecx,(%edx)
}
 a98:	5b                   	pop    %ebx
 a99:	5e                   	pop    %esi
 a9a:	5f                   	pop    %edi
 a9b:	5d                   	pop    %ebp
 a9c:	c3                   	ret
 a9d:	8d 76 00             	lea    0x0(%esi),%esi

00000aa0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 aa0:	55                   	push   %ebp
 aa1:	89 e5                	mov    %esp,%ebp
 aa3:	57                   	push   %edi
 aa4:	56                   	push   %esi
 aa5:	53                   	push   %ebx
 aa6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 aa9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 aac:	8b 15 78 0c 00 00    	mov    0xc78,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 ab2:	8d 78 07             	lea    0x7(%eax),%edi
 ab5:	c1 ef 03             	shr    $0x3,%edi
 ab8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 abb:	85 d2                	test   %edx,%edx
 abd:	0f 84 8d 00 00 00    	je     b50 <malloc+0xb0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 ac3:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 ac5:	8b 48 04             	mov    0x4(%eax),%ecx
 ac8:	39 f9                	cmp    %edi,%ecx
 aca:	73 64                	jae    b30 <malloc+0x90>
  if(nu < 4096)
 acc:	bb 00 10 00 00       	mov    $0x1000,%ebx
 ad1:	39 df                	cmp    %ebx,%edi
 ad3:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 ad6:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 add:	eb 0a                	jmp    ae9 <malloc+0x49>
 adf:	90                   	nop
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 ae0:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 ae2:	8b 48 04             	mov    0x4(%eax),%ecx
 ae5:	39 f9                	cmp    %edi,%ecx
 ae7:	73 47                	jae    b30 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 ae9:	89 c2                	mov    %eax,%edx
 aeb:	39 05 78 0c 00 00    	cmp    %eax,0xc78
 af1:	75 ed                	jne    ae0 <malloc+0x40>
  p = sbrk(nu * sizeof(Header));
 af3:	83 ec 0c             	sub    $0xc,%esp
 af6:	56                   	push   %esi
 af7:	e8 02 fc ff ff       	call   6fe <sbrk>
  if(p == (char*)-1)
 afc:	83 c4 10             	add    $0x10,%esp
 aff:	83 f8 ff             	cmp    $0xffffffff,%eax
 b02:	74 1c                	je     b20 <malloc+0x80>
  hp->s.size = nu;
 b04:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 b07:	83 ec 0c             	sub    $0xc,%esp
 b0a:	83 c0 08             	add    $0x8,%eax
 b0d:	50                   	push   %eax
 b0e:	e8 ed fe ff ff       	call   a00 <free>
  return freep;
 b13:	8b 15 78 0c 00 00    	mov    0xc78,%edx
      if((p = morecore(nunits)) == 0)
 b19:	83 c4 10             	add    $0x10,%esp
 b1c:	85 d2                	test   %edx,%edx
 b1e:	75 c0                	jne    ae0 <malloc+0x40>
        return 0;
  }
}
 b20:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 b23:	31 c0                	xor    %eax,%eax
}
 b25:	5b                   	pop    %ebx
 b26:	5e                   	pop    %esi
 b27:	5f                   	pop    %edi
 b28:	5d                   	pop    %ebp
 b29:	c3                   	ret
 b2a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 b30:	39 cf                	cmp    %ecx,%edi
 b32:	74 4c                	je     b80 <malloc+0xe0>
        p->s.size -= nunits;
 b34:	29 f9                	sub    %edi,%ecx
 b36:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 b39:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 b3c:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 b3f:	89 15 78 0c 00 00    	mov    %edx,0xc78
}
 b45:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 b48:	83 c0 08             	add    $0x8,%eax
}
 b4b:	5b                   	pop    %ebx
 b4c:	5e                   	pop    %esi
 b4d:	5f                   	pop    %edi
 b4e:	5d                   	pop    %ebp
 b4f:	c3                   	ret
    base.s.ptr = freep = prevp = &base;
 b50:	c7 05 78 0c 00 00 7c 	movl   $0xc7c,0xc78
 b57:	0c 00 00 
    base.s.size = 0;
 b5a:	b8 7c 0c 00 00       	mov    $0xc7c,%eax
    base.s.ptr = freep = prevp = &base;
 b5f:	c7 05 7c 0c 00 00 7c 	movl   $0xc7c,0xc7c
 b66:	0c 00 00 
    base.s.size = 0;
 b69:	c7 05 80 0c 00 00 00 	movl   $0x0,0xc80
 b70:	00 00 00 
    if(p->s.size >= nunits){
 b73:	e9 54 ff ff ff       	jmp    acc <malloc+0x2c>
 b78:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 b7f:	00 
        prevp->s.ptr = p->s.ptr;
 b80:	8b 08                	mov    (%eax),%ecx
 b82:	89 0a                	mov    %ecx,(%edx)
 b84:	eb b9                	jmp    b3f <malloc+0x9f>
