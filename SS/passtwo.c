// run passone.c executable file before this,in order to obtain the input files for this

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void main()
{
    char addr[10],label[10],opcode[10],operand[10],code[10],mnemonics[10],saddr[10],slabel[10],length;
    int start,locctr,i,len;

    FILE *fin,*fop,*flen,*fs;

    fin=fopen("output.txt","r");
    fop=fopen("optab.txt","r");
    flen=fopen("length.txt","r");
    fs=fopen("symtab.txt","r");

    fscanf(fin,"%s%s%s%s",addr,label,opcode,operand);

    if(strcmp(opcode,"START")==0)
    {
        start=atoi(operand);
        fscanf(flen,"%d",&length);
    }
    printf("H^%s^00%d^00%d\n",label,start,length);
    fscanf(fin,"%s%s%s%s",addr,label,opcode,operand);
    printf("T^00%s^%x",addr,length);
    while(strcmp(opcode,"END")!=0)
    {
        fscanf(fop,"%s%s",code,mnemonics);
        while(!feof(fop))
        {
            if(strcmp(opcode,code)==0)
            {
                fscanf(fs,"%s%s",saddr,slabel);
                while(!feof(fs))
                {
                    if(strcmp(operand,slabel)==0)
                    {
                        fclose(fop);
                        printf("^%s%s",mnemonics,saddr);
                        break;
                    }
                    else
                    {
                        fscanf(fs,"%s%s",saddr,slabel);
                    }
                }
                fseek(fs,0,SEEK_SET);
                break;
            }
            else
            {
                fscanf(fop,"%s%s",code,mnemonics);
            }
        }
        if(strcmp(opcode,"BYTE")==0 || strcmp(opcode,"WORD")==0)
        {
            if(strcmp(opcode,"WORD")==0)
            {
                printf("^0000%s",operand);
            }
            else if(strcmp(opcode,"BYTE")==0)
            {
                int len=strlen(operand);
                printf("^");
                for(i=2;i<len-1;i++)
                {
                    printf("%x",operand[i]);
                }
            }
        }
        fscanf(fin,"%s%s%s%s",addr,label,opcode,operand);
        fop=fopen("optab.txt","r");
        fseek(fop,0,SEEK_SET);
    }
    printf("$");
    printf("\nE^00%d\n",start);
    fclose(fin);
    fclose(fop);
    fclose(flen);
    fclose(fs);
}

// it doesnot require any input files because the pass one will automaticaly generate the required files for this


