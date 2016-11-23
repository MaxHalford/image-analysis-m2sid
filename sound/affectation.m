function affectation(repertoire_labels, repertoire_mfcc, nb_locuteurs, nb_fichiers, locuteur)
% Affectation des coefficients cepstraux du repertoire "MFCC"
% suivant les labels
% 2 fichiers en sortie : 
%   --> MFCC pour le modele "monde"
%   --> MFCC pour le modele du "locuteur"

% Initialisation de "param" (MFCC du "monde")
param=[];

% Boucle sur tous les fichiers
for x=1:nb_locuteurs

    % Initialisation de "param_indices" (MFCC du "locuteur")
    param_loc=[];
    
    for y=1:nb_fichiers
        
        % Nom des fichiers LAB et MFCC
        fichier_lab = sprintf('%s/L%d_fic%d.lab', repertoire_labels, x, y);
        fichier_mfcc = sprintf('%s/L%d_fic%d.mfcc', repertoire_mfcc, x, y);
        
        % Lecture des 2 fichiers
        lab=load(fichier_lab);
        mfcc=load(fichier_mfcc);
        
        
        % Verification des fichiers
        if (length(lab) ~= size(mfcc,1))
            fichier_lab
            fichier_mfcc
            
            disp('Erreur : les fichiers ont des tailles differentes');
            return;
        end
        
        % Recuperation des labels 1
        indices=(lab==1);
        
        % Concatenation des mfcc correspondant aux labels 1
        param_loc=[param_loc ; mfcc(indices,:)];
        
    end
    
    % Test sur le numero du locuteur
    if (x == locuteur)
        % Nom du fichier MFCC locuteur
        fichier_loc = sprintf('%s/L%d.mfcc', repertoire_mfcc, x);
        % Enregistrement dans un fichier texte des MFCC pour le modele "locuteur"
        save(fichier_loc,'param_loc','-ASCII');
    end
    
    % Concatenation des mfcc du locuteur "x" aux autres
    param=[param ; param_loc];
end

% Enregistrement dans un fichier texte des MFCC pour le modele "monde"
save('MFCC/monde.mfcc','param','-ASCII');
