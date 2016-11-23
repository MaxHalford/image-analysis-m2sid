function [etiq_parole] = etiquetage(signal, taille_fenetre)
    etiq_parole = [];
    [energies] = energie(signal, taille_fenetre);
    % TODO: change threshold constant (define some min windows)
    threshold = 0.0001;
    for i=1:length(energies)
       if energies(i) >= threshold
           etiq_parole = [etiq_parole, 1];
       else
           etiq_parole = [etiq_parole, 0];
       end
    end
end