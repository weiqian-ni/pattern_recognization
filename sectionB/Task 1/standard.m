function m = standard(m)
    k = size(m);
    row = k(1);
    for i = 1:row
        range = max(m(i,:)) - min(m(i,:));
        m(i,:) = (m(i,:) - min(m(i,:))) / range;
        m(i,:) = 2 * m(i,:) - 1;
    end
end

