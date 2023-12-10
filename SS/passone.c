#include <stdio.h>
#include <string.h>
#include <stdlib.h>

void  main()
{
    char label[10],opcode[10],operand[10],code[10],mnemonics[10];
    int locctr,length,start,op;

    FILE *fin,*fop,*fout,*fs,*flen;

    fin=fopen("input.txt","r");
    fop=fopen("optab.txt","r");
    fout=fopen("output.txt","w");
    fs=fopen("symtab.txt","w");
    flen=fopen("length.txt","w");

    fscanf(fin,"%s%s%s",label,opcode,operand);
    if(strcmp(opcode,"START")==0)
    {
        start=atoi(operand);
        locctr=start;
        fprintf(fout,"-\t\t%s\t%s\t%s\n",label,opcode,operand);
        fscanf(fin,"%s%s%s",label,opcode,operand);
    }
    else
    {
        locctr=0;
    }

    while(strcmp(opcode,"END")!=0)
    {
        fprintf(fout,"%d\t",locctr);

        if(strcmp(label,"-")!=0)
        {
            fprintf(fs,"%d\t%s\n",locctr,label);
        }

        fscanf(fop,"%s%s",code,mnemonics);

        while(!feof(fop))
        {
            if(strcmp(opcode,code)==0)
            {
                locctr+=3;
                break;
            }
            fscanf(fop,"%s%s",code,mnemonics);
        }
        fseek(fop,0,SEEK_SET);

        if(strcmp(opcode,"WORD")==0)
        {
            locctr+=3;
        }
        else if(strcmp(opcode,"RESW")==0)
        {
            locctr+=(3*(atoi(operand)));
        }
        else if(strcmp(opcode,"BYTE")==0)
        {
            locctr+=strlen(operand)-3;
        }
        else if(strcmp(opcode,"RESB")==0)
        {
            locctr+=(atoi(operand));
        }

        fprintf(fout,"%s\t%s\t%s\n",label,opcode,operand);
        fscanf(fin,"%s%s%s",label,opcode,operand);
    }
    length=locctr-start;
    fprintf(flen,"%d",length);
    fprintf(fout,"%d\t%s\t%s\t%s",locctr,label,opcode,operand);
    printf("Length Of The Code : %d",length);
}

// required input files , same as in the repository

/*
input.txt

COPY       START   2000
-       LDA     FIVE
-       STA     ALPHA
-       LDCH    CHARZ
-       STCH    C1
ALPHA   RESW    2
FIVE    WORD    5
CHARZ   BYTE    C'hello'
C1      RESB    2
-       END     -

optab.txt

LDCH    53
STCH    57
LDA     03
STA     0f

this pass one will generate symtab.txt,length.txt,output.txt for the passtwo.c
*/
