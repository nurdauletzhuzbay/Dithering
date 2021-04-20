dither('puppy.jpg', 'output2.png', 1)

function f = dither(input_file_name, output_file_name, part)
    if part == 0
        img = imread(input_file_name);
        a=rgb2gray(img);
        s = size(a);
        error=ones(s(1),s(2));
        for i = 1 : s(1)
           for j = 1 : s(2)
               if(a(i,j) < 127 )
                   b(i,j)=0;
               else 
                   b(i,j) = 255;
               end;
               qerror = a(i,j) - b(i,j);
           if(j < s(2))
               a(i,j+1) =  ((7/16 * qerror)+a(i,j+1)); 
           end;
           if(i<s(1) && j > 1)
               a(i+1,j-1) = a(i+1,j-1) + (3/16 * qerror);
               a(i+1,j) = a(i+1,j) + (5/16 * qerror);
           end;
           if(j<s(2) && i<s(1))
               a(i+1,j+1) = a(i+1,j+1) + (1/16 * qerror);
           end;
           end;
        end;
        imwrite(a, output_file_name);
        figure(1)
        subplot(1,2,1)
        imshow('output2.png');
        title('After')
        axis([0,s(1),0,s(2)])
        subplot(1,2,2)
        imshow(input_file_name);
        title('Before')
        axis([0,s(1),0,s(2)])       
        
    elseif part == 1
        img = imread(input_file_name);
        s = size(img);
        dither_matrix = [64 128 ;192 0];
        
        [row, col] = size(img);
        dithered_img = zeros([row, col]);

        for x = 1:row
            for y = 1:col
                i = mod(x, 2) + 1;
                j = mod(y, 2) + 1;
                if img(x,y) > dither_matrix(i,j)
                    dithered_img(x,y) = 1;
                end
            end
        end
        
        imwrite(dithered_img, output_file_name);
        figure(1)
        subplot(1,2,1)
        imshow('output2.png');
        title('After')
        axis([0,s(1),0,s(2)])
        subplot(1,2,2)
        imshow(input_file_name);
        title('Before')
        axis([0,s(1),0,s(2)])
        
    end
    
end
