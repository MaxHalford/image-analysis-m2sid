function [mfcc] = parametrisation(signal, taille_fenetre, nbe_coef)
    mfcc = []; % Initialize matrix
    n = length(signal);
    pas = floor(taille_fenetre / 2);
    for i=1:pas:n
        cepstre_real = real(ifft(log(abs(fft(signal(i:(i+pas-1)) .* hamming(pas)))))); 
        calc_mfcc = cepstre_real(2:nbe_coef);
        mfcc = [mfcc; calc_mfcc']; % Transpose calc_mfcc
    end
end