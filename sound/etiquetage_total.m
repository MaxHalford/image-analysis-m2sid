function etiquetage_total(taille_fenetre, nbe_loc, nbe_fic, threshold)
    basepath = 'APP';
    output_path = 'LABELS';
    % Loop through nbe_loc
    for i=1:nbe_loc
        % And then loop through nbe_fic
        for j=1:nbe_fic
            % Generate audio filename
            input_file = sprintf('%s/L%d_fic%d.wav', basepath, i, j);
            [signal, fs] = lecture(input_file);
            [etiq_parole] = etiquetage(signal, taille_fenetre, threshold);
            output_file = sprintf('%s/L%d_fic%d.lab', output_path, i, j);
            save(output_file,'etiq_parole','-ASCII');
        end
    end
end