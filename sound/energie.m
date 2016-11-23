function [energies] = energie(signal, taille_fenetre)
    energies = [];
    n = length(signal);
    pas = floor(taille_fenetre / 2);
    for i = 1:pas:n
        energie = sum(signal(i:(i+pas-1)) .^2) / taille_fenetre;
        %fprintf('from: %d | until: %d | energie: %d.\n', from, until, energie);
        energies = [energies, energie];
    end
end