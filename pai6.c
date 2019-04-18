/*06*/
#include<stdio.h>
#include<stdlib.h>
#include<dos.h>
#include<conio.h>


int crefile();
int delfile();
int credir();
int deldir();

int crefile()
{
	char fname[50];
	union REGS inreg;
	union REGS outreg;
	struct SREGS segreg;
	printf("\nEnter The File Name: ");
	scanf("%s",fname);
	inreg.h.ah= 0x3c;
	inreg.x.dx=FP_OFF(fname);
	segreg.ds=FP_SEG(fname);
	int 86x(0x21,&inreg,&outreg,&segreg);
	if(outreg.x.cflag)
		printf("\nError... ");
	else
		printf("\nFile Created Succesfully...");

}

int delfile()
{
	char fname[50];
	union REGS inreg;
	union REGS outreg;
	struct SREGS segreg;
	printf("\nEnter The File Name To Be Deleted: ");
	scanf("%s",fname);
	inreg.h.ah= 0x41;
	inreg.x.dx=FP_OFF(fname);
	segreg.ds=FP_SEG(fname);
	int 86x(0x21,&inreg,&outreg,&segreg);
	if(outreg.x.cflag)
		printf("\nError... ");
	else
		printf("\nFile Is Deleted Succesfully...");

}

int credir()
{
	char dname[50];
	union REGS inreg;
	union REGS outreg;
	struct SREGS segreg;
	printf("\nEnter The Directory Name: ");
	scanf("%s",dname);
	inreg.h.ah= 0x39;
	inreg.x.dx=FP_OFF(dname);
	segreg.ds=FP_SEG(dname);
	int 86x(0x21,&inreg,&outreg,&segreg);
	if(outreg.x.cflag)
		printf("\nError... ");
	else
		printf("\nDirectory Created Succesfully...");

}

int deldir()
{
	char dname[50];
	union REGS inreg;
	union REGS outreg;
	struct SREGS segreg;
	printf("\nEnter The Directory Name To Be Deleted: ");
	scanf("%s",dname);
	inreg.h.ah= 0x3a;
	inreg.x.dx=FP_OFF(dname);
	segreg.ds=FP_SEG(dname);
	int 86x(0x21,&inreg,&outreg,&segreg);
	if(outreg.x.cflag)
		printf("\nError... ");
	else
		printf("\nDirectory Is Deleted Succesfully...");

}

int main()
{
	int ch,ch1,*file,*dir;
	do
	{
		printf("Menu:\n1.Create a File\n2.Delete a File\n3.Create a Directory\n4.Delete a Directory\n5.Exit");
		printf("\nEnter your choice: ");
		scanf("%d",&ch);
		switch(ch)
		{
			case 1: crefile();
				break;

			case 2: delfile();
				break;

			case 3: credir();
				break;
			
			case 4: deldir();
				break;
			
			case 5: break;
		}
		printf("\nDo you want to Continue...(1/0): ");
		scanf("%d",&ch1);
		
	}while(ch1==1);
	return 0;
}
