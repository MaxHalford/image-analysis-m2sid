function [m, v, w, m_l, v_l, w_l] = apprentissage(fic_monde, fic_locuteur, n)
    monde = load(fic_monde);
    [m, v, w] = gaussmix(monde, 1, 10.001, n);
    locuteur = load(fic_locuteur);
    [m_l, v_l, w_l] = gaussmix(locuteur, 1, 10.001, m, v, w);
end