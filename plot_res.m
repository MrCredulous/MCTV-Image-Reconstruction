function [] = plot_res(I_org, R_0, I_res, I_res2)
% Plot reconstruction results and error images.
% Yilin Liu, Aug 7, 2018

    set(gcf,'unit','normalized','position',[0.4 0.1 0.25 0.75]);

    p_vec = [0.03 0.72 0.42 0.25];
    subplot('Position', p_vec);
    imshow(abs(I_org));
    xlb = xlabel('(a)', 'FontSize', 10, 'FontName', 'Times New Roman');
    pos = get(xlb, 'Position');
    set(xlb, 'Position', [pos(1) pos(2) - 30]);

    p_vec = [0.55 0.72 0.42 0.25];
    subplot('Position', p_vec);
    imshow(abs(R_0));
    xlb = xlabel('(b)', 'FontSize', 10, 'FontName', 'Times New Roman');
    pos = get(xlb, 'Position');
    set(xlb, 'Position', [pos(1) pos(2) - 30]);

    p_vec = [0.03 0.42 0.42 0.25];
    subplot('Position', p_vec);
    imshow(abs(I_res));
    xlb = xlabel('(c)', 'FontSize', 10, 'FontName', 'Times New Roman');
    pos = get(xlb, 'Position');
    set(xlb, 'Position', [pos(1) pos(2) - 30]);

    p_vec = [0.55 0.42 0.42 0.25];
    subplot('Position', p_vec);
    imshow(abs(I_res2));
    xlb = xlabel('(d)', 'FontSize', 10, 'FontName', 'Times New Roman');
    pos = get(xlb, 'Position');
    set(xlb, 'Position', [pos(1) pos(2) - 30]);

    p_vec = [0.03 0.12 0.42 0.25];
    subplot('Position', p_vec);
    imshow(abs(I_res - I_org));
    xlb = xlabel('(e)', 'FontSize', 10, 'FontName', 'Times New Roman');
    pos = get(xlb, 'Position');
    set(xlb, 'Position', [pos(1) pos(2) + 40]);
    caxis([0,0.2])
    clb = colorbar('SouthOutside');
    set(clb, 'Position', [0.03 0.08 0.42 0.02])

    p_vec = [0.55 0.12 0.42 0.25];
    subplot('Position',p_vec);
    imshow(abs(I_res2 - I_org));
    xlb = xlabel('(f)', 'FontSize', 10, 'FontName', 'Times New Roman');
    pos = get(xlb, 'Position');
    set(xlb, 'Position', [pos(1) pos(2) + 40]);
    caxis([0,0.2])
    clb = colorbar('SouthOutside');
    set(clb, 'Position', [0.55 0.08 0.42 0.02])
    
end