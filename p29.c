#include <stdio.h>

void sayGoodMorning()
{
	puts("Good Morning");
}

void sayGoodAfternoon()
{
	puts("Good Afternoon");
}

void sayGoodEvening()
{
	puts("Good Evening");
}

void sayGreeting(int t)
{
	void (*fp)(void) = sayGoodEvening; // fp is a variable which is a pointer to the function
	
	if (t < 12)
	{
		fp = sayGoodMorning; // when function name is used without brackets we are taking the address of that function
	}
	else if (t < 18)
	{
		fp = sayGoodAfternoon;
	}
	fp();
}


int main(void)
{
	int t;
	scanf("%d", &t);
	sayGreeting(t);
	
	return 0;
}
