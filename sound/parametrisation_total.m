function parametrisation_total(taille_fenetre, nbe_loc, nbe_fic, nbe_coef)
    basepath = 'APP';
    output_path = 'MFCC';
    % Loop through nbe_loc
    for i=1:nbe_loc
        % And then loop through nbe_fic
        for j=1:nbe_fic
            % Generate audio filename
            input_file = sprintf('%s/L%d_fic%d.wav', basepath, i, j);
            [signal, fs] = lecture(input_file);
            mfcc = parametrisation(signal, taille_fenetre, nbe_coef);
            output_file = sprintf('%s/L%d_fic%d.mfcc', output_path, i, j);
            save(output_file,'mfcc','-ASCII');
        end
    end
end