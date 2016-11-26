% Nombre de fichiers d'apprentissage et de tests.
nbe_loc = 10;
nbe_fic = 8;
nbe_coef = 32; % number of cepstral coefficient,
threshold = 0.0001;
taille_fenetre = 512; % frame width,

%% Preprocessing
% Labelize data
etiquetage_total(taille_fenetre, nbe_loc, nbe_fic, threshold);

% Compute MFCC
parametrisation_total(taille_fenetre, nbe_loc, nbe_fic, nbe_coef);

%% Learning

% Constants
nb_gauss = 4; % number of gaussian,
locutor = 1; % locuteur id

% Affectation step
affectation('LABELS', 'MFCC', nbe_loc, nbe_fic, locutor);

% Learning step
[m, v, w, m_l, v_l, w_l] = apprentissage('MFCC/monde.mfcc', sprintf('MFCC/L%d.mfcc', locutor), nb_gauss);

% Test total
taux_reco = tests_total(taille_fenetre, nbe_coef, m, v, w, m_l, v_l, w_l);
disp(sprintf('Locutor tested: L%d', locutor))
print_truth_predict(taux_reco);