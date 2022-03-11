function m = standardize(m)
    S = size(m);
    row = S(1);
    for i = 1:row()
        m(i,:) = m(i,:) - mean(m(i,:)); % subtract mean
        m(i,:) = m(i,:) / std(m(i,:)); % make unit standard distribution
    end
end