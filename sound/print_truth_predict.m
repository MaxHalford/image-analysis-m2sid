function print_truth_predict(taux_reco)
    files = cell(20,1);
    locutor_truth = cell(20,1);
    basepath = 'RECO';
    index = 1;
    for i=1:10
        for j=9:10
            files{index} = sprintf('%s/L%d_fic%d.wav', basepath, i, j);
            locutor_truth{index} = sprintf('L%d', i);
            index = index+1;
        end
    end
    
    for i=1:length(taux_reco)
        if taux_reco(i) > 0.5
            disp(sprintf('[%s] Truth: %s - Predict: %s (score: %d)', files{i}, locutor_truth{i}, 'locutor', taux_reco(i)));
        else
            disp(sprintf('[%s] Truth: %s - Predict: %s (score: %d)', files{i}, locutor_truth{i}, 'monde', taux_reco(i)));
        end
    end
end