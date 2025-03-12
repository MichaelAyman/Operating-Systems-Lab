#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"

	int
main(int argc, char *argv[])
{
	int i = 1;
	printf(2,"%d",gettid());
	if(argc < 2){
		printf(2, "Usage: enter filename followed by string to be written to file\n");
		printf(2, "For Example: save /foo.txt bar\n");
		exit();
	}
	//create the open and or create the file
	int fo = open(argv[1], O_CREATE | O_WRONLY);
	if(fo < 0) {
		printf(2,"Failed to create");
		exit();
	}

	//Writes the String to the file
	for(i = 2; i < argc; i++){
		write(fo, argv[i], strlen(argv[i]));
		write(fo, " ", strlen(" "));
	}
	close(fo);

	exit();
}
