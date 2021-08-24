# instrumentariumxxi
## Código de ejemplo del capítulo "La programación informática en el aula de música"

###########################################
# Ejemplos elaborados por Jesús Jara      #
# Para ejecutar copia el bloque de código #
# en el programa Sonic Pi y pulsa run.    #
###########################################

# Ejemplo 1
serie_dod = (ring 64, 65, 67, 61, 66, 63, 68, 62, 71, 72, 69)
play_pattern_timed serie_dod, 1

# Ejemplo 2
serie_dod = (ring 64, 65, 67, 61, 66, 63, 68, 62, 71, 72, 69)
play_pattern_timed serie_dod.reverse, 1
