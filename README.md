# studylist

#include<stdio.h>
int main(void)
{
	int x, y;
	int a;

	printf("가로>>");
	scanf("%d", &x);
	printf("세로>>");
	scanf("%d", &y);
	a = x * y;

	printf("가로:%d, 세로:%d 인 직사각형의 넓이 = %d\n", x,y,a);

	return 0;

}
