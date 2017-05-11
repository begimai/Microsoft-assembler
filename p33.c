#include <stdio.h>
#include <string.h> // for strcmp

char a[] = {'c', 'a', 'z'};
int b[] = {4, 6, 3, 2};
char* c[] = {"Java", "Python", "C++", "C", "ASM"};

int cmpChars(void* p1, void* p2)
{
	return *((char*) p1) - *((char*) p2);
}

int cmpInts(void* p1, void* p2)
{
	return *((int*) p1) - *((int*) p2);	
}

int cmpStrs(void* p1, void* p2)
{
	return strcmp(*(char**)p1, *(char**)p2); // char** p1 we get char, not address
}

void* minElement(void* arr, int elementSize, int length, int cmp(void*, void*))
{
	char* pMin = arr;
	char* pCur = pMin + elementSize;
	
	for(int i = 1; i < length; ++i)
	{
		if(cmp(pCur, pMin) < 0)
		{
			pMin = pCur;
		}
		
		pCur += elementSize;
	}
	
	return pMin;
}

int main(void)
{
	char* p1;
	int* p2;
	char** p3;
	
	p1 = minElement(a, sizeof(char), 3, cmpChars);
	p2 = minElement(b, sizeof(int), 4, cmpInts);
	p3 = minElement(c, sizeof(char*), 5, cmpStrs);
	
	printf("min char: %c\n", *p1);
	printf("min int: %d\n", *p2);
	printf("min str: %s\n", *p3);
	
	return 0;
}
