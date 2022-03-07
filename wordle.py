import math
import random

from pyparsing import empty

def choose_secret(filename):
    """Dado un nombre de fichero, esta función devuelve una palabra aleatoria de este fichero transformada a mayúsculas.
    Args:
      filename: El nombre del fichero. Ej. "palabras_reduced.txt"
    Returns:
      secret: Palabra elegida aleatoriamente del fichero transformada a mayúsculas. Ej. "CREMA"
    """
    f = open(filename, mode="rt", encoding="utf-8")
    lista_lineas = f.readlines()
    secret = random.choice(lista_lineas) 
    f.close()

    return secret.upper()


    
def compare_words(word, secret):
    """Dadas dos palabras en mayúsculas (word y secret), esta función calcula las posiciones de las letras de word que aparecen en la misma posición en secret, y las posiciones de las letras de word que aparecen en secret pero en una posición distinta.
    Args:
      word: Una palabra. Ej. "CAMPO"
      secret: Una palabra. Ej. "CREMA"
    Returns:
      same_position: Lista de posiciones de word cuyas letras coinciden en la misma posición en secret. En el caso anterior: [0]
      same_letter: Lista de posiciones de word cuyas letras están en secret pero en posiciones distintas. En el caso anterior: [1,2]
    """
    same_position = []
    same_letter = []
    if (len(secret) is not len(word)): raise ValueError("Las palabras no tienen el mismo tamaño")
    for i in range(len(secret)):
      if(secret[i]==word[i]):
        same_position.append(i)

    for i in range(len(word)):
      for j in range(len(secret)):
        if(secret[j]==word[i] and i!=j):
          same_letter.append(i)

    return same_position, same_letter


def print_word(word, same_position, same_letter):
    """Dada una palabra, una lista same_position y otra lista same_letter, esta función creará un string donde aparezcan en mayúsculas las letras de la palabra que ocupen las posiciones de same_position, en minúsculas las letras de la palabra que ocupen las posiciones de same_letter y un guión (-) en el resto de posiciones
    Args:
      word: Una palabra. Ej. "CAMPO"
      same_position: Lista de posiciones. Ej. [0]
      same_letter: Lista de posiciones. Ej. [1,2]
    Returns:
      transformed: La palabra aplicando las transformaciones. En el caso anterior: "Cam--"
    """
    transformed = ""
    for i in same_position:
      if i<0: raise ValueError("Los valores de posicion son negativos")

    for i in same_letter:
      if i<0: raise ValueError("Los valores de letras son negativos")

    for i in range(len(word)):
      transformed = transformed + "-"
      print(transformed)
      for j in same_position:
        if(i==j):
          transformed = transformed[:j] + word[i] + transformed[j+1:]
      for j in same_letter:
        if(i==j):
          transformed = transformed[:j] + word[i].lower() + transformed[j+1:]

    print(transformed)
    return transformed
    
def choose_secret_advanced():
    """Dado un nombre de fichero, esta función filtra solo las palabras de 5 letras que no tienen acentos (á,é,í,ó,ú). De estas palabras, la función devuelve una lista de 15 aleatorias no repetidas y una de estas 15, se selecciona aleatoriamente como palabra secret.
    Args:
      filename: El nombre del fichero. Ej. "palabras_extended.txt"
    Returns:
      selected: Lista de 15 palabras aleatorias no repetidas que tienen 5 letras y no tienen acentos
      secret: Palabra elegida aleatoriamente de la lista de 15 seleccionadas transformada a mayúsculas
    """
 
def check_valid_word():
    """Dada una lista de palabras, esta función pregunta al usuario que introduzca una palabra hasta que introduzca una que esté en la lista. Esta palabra es la que devolverá la función.
    Args:
      selected: Lista de palabras.
    Returns:
      word: Palabra introducida por el usuario que está en la lista.
    """

if __name__ == "__main__":
    try: 
      secret=choose_secret("palabras_reduced.txt")
      print("Palabra a adivinar: "+secret)#Debug: esto es para que sepas la palabra que debes adivinar
      for repeticiones in range(0,6):
          word = input("Introduce una nueva palabra: ")
          try: 
            same_position, same_letter = compare_words(word, secret)
            try:
              resultado=print_word(word, same_position, same_letter)
              print(resultado)
              if word == secret:
                print("HAS GANADO!!")
                exit()
            except ValueError:
              print("Los valores son negativos")
             
          except ValueError:
            print("Introduce una palabra del mismo tamaño")
          

      print("LO SIENTO, NO LA HAS ADIVINIDADO. LA PALABRA ERA "+secret)
            
    except IndexError:
      print("El fichero está vacío")
    
