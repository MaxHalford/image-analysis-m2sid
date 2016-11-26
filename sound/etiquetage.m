function [etiq_parole] = etiquetage(signal, taille_fenetre, threshold)
    etiq_parole = [];
    [energies] = energie(signal, taille_fenetre);
    for i=1:length(energies)
       if energies(i) >= threshold
           etiq_parole = [etiq_parole, 1];
       else
           etiq_parole = [etiq_parole, 0];
       end
    end
end