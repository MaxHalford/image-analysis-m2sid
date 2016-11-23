function [signal, fs, nb_bits, duration] = lecture(fichier)
    [signal, fs] = audioread(fichier);
    %sound(signal, fs);
    nb_bits = 8;
    duration = nb_bits * fs;
    %plot(signal);
end