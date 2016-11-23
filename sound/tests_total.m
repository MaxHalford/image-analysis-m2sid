function [taux_reco] = tests_total(taille_fenetre, nbe_coef, m, v, w, m_l, v_l, w_l)
    reco_path = 'RECO';
    taux_reco = [];
	for i=1:10
		for j=9:10
            input_file = sprintf('%s/L%d_fic%d.wav', reco_path, i, j);
            [signal, fs] = lecture(input_file);
			% Compute MFCC for test files
			mfcc = parametrisation(signal, taille_fenetre, nbe_coef);
			% Compute probabilities for each window
            prob_monde = gmmlpdf(mfcc, m, v, w);
			prob_locu = gmmlpdf(mfcc, m_l, v_l, w_l);
            % Create a new vector with 1 if locutor wins, else 0
			prob_tot = prob_monde > prob_locu;
            % Compute the sum for non-locutor
			monde_gagne = sum(prob_tot);
            % Compute the final score
			score = monde_gagne / length(prob_tot);
			taux_reco = [taux_reco, score];
		end
	end
end