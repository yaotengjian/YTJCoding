//《程序员的自我修养》
#include <stdio.h>  
#include <stdlib.h>  
int count = 0;
void *p = NULL;
int main(int argc, char *argv[])
{
	int blocksize[4] = { 1024 * 1024 * 1024, 1024 * 1024, 1024, 1 };
	int i, j;
	for (i = 0; i<4; ++i)
	{
		for (j = 1; ; ++j)
		{
			if (NULL == (p = malloc(count + blocksize[i])))
			{
				printf("%d\n", j); break;
			}
			count += blocksize[i];
			free(p);
		}
	}
	printf("mallocmaxmemory:%d\n", count);
	return 0;
}