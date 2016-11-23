function [] = write_file(filename, content)
    disp(filename);
    fileID = fopen(filename,'w');
    fprintf(fileID, '%d', content);
    fclose(fileID);
end