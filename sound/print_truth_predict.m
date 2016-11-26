function print_truth_predict(taux_reco)
    files = cell(20,1);
    locutor_truth = cell(20,1);
    basepath = 'RECO';
    index = 1;
    for i=1:10
        for j=9:10
            % Save the filename
            files{index} = sprintf('%s/L%d_fic%d.wav', basepath, i, j);
            % Save the real locutor
            locutor_truth{index} = sprintf('L%d', i);
            index = index+1;
        end
    end
    
    for i=1:length(taux_reco)
        if taux_reco(i) > 0.5
            locutor_pred = 'locutor';
        else
            locutor_pred = 'monde';
        end
        disp(sprintf('[%s] Truth: %s - Predict: %s (score: %d)', files{i}, locutor_truth{i}, locutor_pred, taux_reco(i)));
    end
end