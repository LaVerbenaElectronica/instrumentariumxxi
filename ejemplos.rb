# instrumentariumxxi
## Código de ejemplo del capítulo "La programación informática en el aula de música"

###########################################
# Ejemplos elaborados por Jesús Jara      #
# Para ejecutar copia el bloque de código #
# en el programa Sonic Pi y pulsa run.    #
###########################################

# Ejemplo 1. Serie dodecafónica
serie_dod = [:E4,:F4,:G4,:Db4,:Gb4,:Eb4,:Ab4,:D4,:B4,:C5,:A4,:Bb4]
play_pattern_timed serie_dod, 0.5

# Ejemplo 2. Reversión de la serie.
serie_dod = [:E4,:F4,:G4,:Db4,:Gb4,:Eb4,:Ab4,:D4,:B4,:C5,:A4,:Bb4]
play_pattern_timed serie_dod.reverse, 0.5

# Ejemplo 3. Inversión de la serie.
serie_dod = [:E4,:F4,:G4,:Db4,:Gb4,:Eb4,:Ab4,:D4,:B4,:C5,:A4,:Bb4]
serie_inv = [serie_dod[11]]
12.times do |i|
  serie_inv[i] = ((serie_dod[i] - serie_dod[i-1])*(-1)) + serie_inv[i-1]
  puts serie_inv[i]
end
play_pattern_timed serie_inv, 0.5
sleep 2
12.times do
  play [serie_inv.tick, serie_dod.look]
  sleep 0.5
end

# Ejemplo 3. Serialismo
serie_dod = [:E4,:F4,:G4,:Db4,:Gb4,:Eb4,:Ab4,:D4,:B4,:C5,:A4,:Bb4]
serie_inv = [serie_dod[11]]
12.times do |i|
  serie_inv[i] = ((serie_dod[i] - serie_dod[i-1])*(-1)) + serie_inv[i-1]
  puts serie_inv[i]
end
serie_dis = [0.5, 0.25, 0.125, 0.75, 1, 1.5, 1.25, 0.5, 0.25, 0.125, 0.75]
serie_dur = serie_dis.shuffle
loop do
  play [serie_dod.tick, serie_inv.look], sustain: serie_dur.look, amp: serie_dis.look
  sleep serie_dis.look
end

# Ejemplo 4. Aleatoriedad controlada.
serie_dod   = [:E4,:F4,:G4,:Db4,:Gb4,:Eb4,:Ab4,:D4,:B4,:C5,:A4,:Bb4]
frecuencias = [1, 6, 2, 8, 9, 10, 11, 4, 3, 5, 12, 7]
loop do
  play serie_dod.tick if one_in(frecuencias.look)
  sleep 0.125
end

# Ejemplo 5. Wendy Carlos Alpha scale.
16.times do |i|
  sample :perc_bell, rate: ((0.1666*(i+1))/2), amp: 0.5
  sleep 0.25
end

# Ejemplo 6. Objetos sonoros
sample :perc_bell, rate: -1
sample :loop_amen_full, start: 0.25, finish: 0.3
sample :ambi_lunar_land, rate: -1.5, start: 0.1, finish: 0.3
sample :perc_door, rate: 0.2, finish: 0.2
