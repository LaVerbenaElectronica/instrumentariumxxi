# instrumentariumxxi
## Código de ejemplo del capítulo "Código informático y algoritmos como instrumentos musicales en educación"

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

# Ejemplo 6. Objetos sonoros. Collage de sonidos.
sample :perc_bell, rate: -1
sample :loop_amen_full, start: 0.25, finish: 0.3
sample :ambi_lunar_land, rate: -1.5, start: 0.1, finish: 0.3
sample :perc_door, rate: 0.2, finish: 0.2

# Ejemplo 7. Repetición de fragmentos de audio
live_loop :bucle do
  inicio = rand(0.75)
  5.times do
    sample :loop_industrial, start: inicio, finish: inicio + 0.25
    sleep 0.25
  end
end

# Ejemplo 8. Sonidos electrónicos
loop do
  use_synth_defaults attack: 1, cutoff: 60, release: 1, amp: 0.25, sustain: 4
  with_fx :reverb, room: 0.5 do
    3.times do
      synth :prophet, note: scale(:f3, :aeolian, num_octaves: 3).choose, pan: rrand(-1,1)
      sleep rrand(0.5, 1)
    end
    sleep 3
  end
end

# Ejemplo 9. Ejemplo control sonido con motion
live_loop :motion do
  a, b, c = sync "/osc:192.168.1.90:64392/syntien/motion/1/scope2"
  nota = a.abs*30+50
  dura = b.abs*10
  reve = c.abs*30+50
  with_fx :ring_mod, freq: reve do
    synth :dull_bell, note: nota, sustain: dura, amp: 0.2
  end
  sleep 0.25
end

# Ejemplo 10. Live electronics.
#este programa cuenta 3 segundos hacia atrás y luego graba lo que
#entre por el micrófono del ordenador durante dos segundos
puts 3
sleep 1
puts 2
sleep 1
puts 1
sleep 1

with_fx :record, buffer: buffer("grabacion-sonicpi", 4) do
  with_fx :flanger, phase: 4 do
    with_fx :echo, phase: 2 do
      live_audio :hola
    end
  end
end

sleep 2

stop
