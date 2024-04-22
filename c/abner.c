//Abner Giron Torres
//Realiza un programa en C, que lea un archivo fuente de x lenguaje 
//y genere un segundo archivo con los componentes léxico guardados en el.

#include <stdio.h>
#include <string.h>
#include <conio.h>

int main() {
	int i,j;
	//Definir el lexico con arrays.
	char lexico[10][8] = {"while","for","include","stdio","int","main","char","string","return","get"};
	/*
	for( i=0; i<10; i++)
	{
		for(j=0; j<8; j++)
		{
		printf("%c",lexico[i][j]);
		}
	}
	*/
	
	//Abrir el documento y leerlo.
	FILE * flujo = fopen ("nombres.txt", "rb"); //Aqui tiene que ingresar el archivo del cual quiere checar si corresponde al lexico
    FILE * archivo=fopen("Lexico.txt","a");     //Profe se le va a crear un archivo con este nombre que tendra las palabras que corresponden al lexico 
    if (flujo == NULL || archivo == NULL){
        perror("error en ka aoertura del archivo");
        return 1;
    }
    
    
    char palabra[50];
    
    //Comparar el documento con el lexico definido.
    while (fscanf(flujo,"%s", palabra )!=EOF)
	{
    	
    	
    	for(i=0;i<10;i++)
    	{
             if(strcmp(palabra,lexico[i])==0)
             {
              //crear un segundo archivo con el lexico del documento leido.
              fprintf(archivo,"%s\n",palabra);
              printf("la palabra 's' fue encotrada en el lexico\n", palabra);
              break;
             
             }                                           
        }
        if(i==10)
        {
               printf("la palabra '%s' no se encuentra en el lexico.\n", palabra);
        }                        
        
    }
    
   
    fclose(archivo);
    fclose(flujo);
    
    printf("\n se ha leido el archivo..");
    
    getch();
    return 0;
}