function a = fun(f) % 밴드패스 크기응답
    if (f >= 0.2) & (f <= 0.6), a = 1; else, a = 0; end
end