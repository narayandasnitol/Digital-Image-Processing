I = [2,1,2,7,6; 1,0,1,4,1; 2,1,3,1,2; 1,1,1,0,1; 2,2,3,1,2];
I2 = I;

%left = (x-1),y
%right = (x+1),y
%up = x,(y-1)
%down = x,(y+1)


temp = [];
for x = 1:5
    for y = 1:5
        if x == 1 && y == 1
            if I(x,y) == 1
                temp = [temp; I(x+1,y)];
                temp = [temp; I(x, y+1)];
                temp = [temp; 0];
                temp = [temp; 0];
                I2(x,y) = median(temp);
                temp = [];
            end
        end
        if x == 5 && y == 5
            if I(x,y) == 1
                temp = [temp; I(x-1,y)];
                temp = [temp; I(x, y-1)];
                temp = [temp; 0];
                temp = [temp; 0];
                I2(x,y) = median(temp);
                temp = [];
            end
        end
        if x == 1 && y == 5
            if I(x,y) == 1
                temp = [temp; I(x,y-1)];            
                temp = [temp; I(x+1,y)];
                temp = [temp; 0];
                temp = [temp; 0];
                I2(x,y) = median(temp);
                temp = [];
            end
        end
        if x == 5 && y == 1
            if I(x,y) == 1
                temp = [temp; I(x-1,y)];            
                temp = [temp; I(x,y+1)];       
                temp = [temp; 0];
                temp = [temp; 0];
                I2(x,y) = median(temp);
                temp = [];
            end
        end
        
        
        if x == 1 && (y == 2 || y == 3 || y == 4)
            if I(x,y) == 1
                temp = [temp; I(x,y-1)];
                temp = [temp; I(x,y+1)];
                temp = [temp; I(x+1,y)];
                temp = [temp; 0];
                I2(x,y) = median(temp);
                temp = [];
            end
        end
        
        
        if (x == 2 || x == 3 || x == 4) && y == 1
            if I(x,y) == 1
                temp = [temp; I(x-1,y)];            
                temp = [temp; I(x,y+1)];
                temp = [temp; I(x+1,y)];
                temp = [temp; 0];
                I2(x,y) = median(temp);
                temp = [];
            end
        end
        
        
        if (x == 2 && y == 2) || (x == 2 && y == 3) || (x == 2 && y == 4)
            if I(x,y) == 1
                temp = [temp; I(x-1,y-1)];            
                temp = [temp; I(x,y+1)];
                temp = [temp; I(x-1,y)];
                temp = [temp; I(x+1,y)];
                I2(x,y) = median(temp);
                temp = [];
            end
        end
        if (x == 3 && y == 2) || (x == 3 && y == 3) || (x == 3 && y == 4)
            if I(x,y) == 1
                temp = [temp; I(x,y-1)];           
                temp = [temp; I(x,y+1)];
                temp = [temp; I(x-1,y)];
                temp = [temp; I(x+1,y)];                           
                I2(x,y) = median(temp);
                temp = [];
            end
        end
       
        if (x == 4 && y == 2) || (x == 4 && y == 3) || (x == 4 && y == 4)
            if I(x,y) == 1
                temp = [temp; I(x,y-1)];            
                temp = [temp; I(x,y+1)];
                temp = [temp; I(x-1,y)];
                temp = [temp; I(x+1,y)];                          
                I2(x,y) = median(temp);          
                temp = [];
            end
        end
        
        if (x == 2 || x == 3 || x == 4) && y == 5
            if I(x,y) == 1
                temp = [temp; I(x-1,y)];            
                temp = [temp; I(x+1,y)];
                temp = [temp; I(x,y-1)];
                temp = [temp; 0];
                I2(x,y) = median(temp);
                temp = [];
            end
        end
        
        if (y == 2 || y == 3 || y == 4) && x == 5
            if I(x,y) == 1
                temp = [temp; I(x,y-1)];            
                temp = [temp; I(x-1,y)];
                temp = [temp; I(x,y+1)];
                temp = [temp; 0];
                I2(x,y) = median(temp);
                temp = [];
            end
        end
                      
     
    end
end

