%% Constants
nb_gauss = 4; % nombre de lois gaussiennes,
nbe_coef = 32; % nombre de parametres (coefficients cepstraux),
taille_fenetre = 512; % la taille de la fenetre d'analyse,
% le nombre de fichiers d'apprentissage et de tests.
nbe_loc = 10;
nbe_fic = 8;
loc_n = 1;

%% Labelize data
etiquetage_total(taille_fenetre, nbe_loc, nbe_fic);
%% Compute MFCC
parametrisation_total(taille_fenetre, nbe_loc, nbe_fic, nbe_coef);
%% Affectation step
affectation('LABELS', 'MFCC', nbe_loc, nbe_fic, loc_n);
%% Learning step
[m, v, w, m_l, v_l, w_l] = apprentissage('MFCC/monde.mfcc', 'MFCC/L1.mfcc', nb_gauss);
%% Test total
taux_reco = tests_total(taille_fenetre, nbe_coef, m, v, w, m_l, v_l, w_l);
print_truth_predict(taux_reco, nbe_loc, nbe_fic);