function [signal, fs, nb_bits, duration] = lecture(fichier)
    [signal, fs] = audioread(fichier);
    nb_bits = 8;
    duration = nb_bits * fs;
end