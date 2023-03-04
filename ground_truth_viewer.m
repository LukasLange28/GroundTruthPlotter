import java.util.*;
ground_truth_plotter()

function ground_truth_plotter()
    [file,path] = uigetfile('*.xml');
    if isequal(file,0)
       disp('User selected Cancel');
    else
       disp(['User selected ', fullfile(path,file)]);
    end
    try
       tree = xmlread('test1.xml');
    catch
       error('Failed to read XML file %s.',fullfile(path,file));
    end
    try
       elements = tree.getElementsByTagName('Point');
    catch
       error('Unable to parse XML file %s.',fullfile(path,file));
    end
    x = zeros((elements.getLength-1)*2);
    y = zeros((elements.getLength-1)*2);
    for i = 0:(elements.getLength-1)
        x(i*2+1) = str2num(elements.item(i).getAttribute('x_1'));
        y(i*2+1) = str2num(elements.item(i).getAttribute('y_1'));
        x(i*2+2) = str2num(elements.item(i).getAttribute('x_2'));
        y(i*2+2) = str2num(elements.item(i).getAttribute('y_2'));
    end
    figure
    hold on
    axis equal
    plot(x, y, '.', 'markersize', 8);
    hold off
end