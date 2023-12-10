// run (( passone,passtwo )) before this in order to obtain the objectcode.txt for this [it is generated after executing the pass two]

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void main()
{
    FILE *fin;
    int i,j,staddr;
    char name[10],line[50],objname[10],staddrc[10];

    printf("Enter Program Name : ");
    scanf("%s",&name);

    fin=fopen("objectcode.txt","r");
    fscanf(fin,"%s",line);

    for(i=2,j=0;i<6;i++,j++)
    {
        objname[j]=line[i];
    }

    objname[j]='\0';

    printf("Name From Object Program : %s\n",objname);

    if(strcmp(name,objname)==0)
    {
        do
        {
            fscanf(fin,"%s",line);
            if(line[0]=='T')
            {
                for(i=4,j=0;i<8;i++,j++)
                {
                    staddrc[j]=line[i];
                }
                staddrc[j]='\0';
                staddr=atoi(staddrc);
                i=12;
                while(line[i]!='$')
                {
                    if(line[i]!='^')
                    {
                        printf("00%d \t %c%c\n",staddr,line[i],line[i+1]);
                        staddr++;
                        i=i+2;
                    }
                    else
                    {
                        i++;
                    }
                }

            }
            else if(line[0]!='E')
            {
                ;
            }
        }
        while(!feof(fin));
        fclose(fin);
    }
}
