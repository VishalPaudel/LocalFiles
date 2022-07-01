clear
clc
close all

x_limit = 50;
y_limit = 50;

initial_x = 20;
initial_y = 20;

num_iteration = 300;

[X_main, Y_main] = meshgrid((1:x_limit), (1:y_limit));  % for the surf() command

if (x_limit > 3) && (y_limit > 3)

    m_main = zeros(y_limit, x_limit);  % The order (y, x) is switched (why?) 

    surf(X_main, Y_main, m_main)

    if (y_limit > initial_y && initial_y > 1) && (x_limit > initial_x && initial_x > 1)
        m_main(initial_x, initial_y) = 1;

    else
        disp('The initial position needs to be inside the bounds')
        return
    end

    for step_iterator = (1:num_iteration)

        m_temp = zeros(y_limit, x_limit);  % A 3D array depicting the temporary calculations
        
        % Now we start the diffusion by going at each location and extracting
        % the 0.25 of densities of nearby
        for row_iterator = (1:y_limit)
    
            for coloumn_iterator = (1:x_limit)
    
                if row_iterator > 1 && row_iterator < y_limit && coloumn_iterator > 1 && coloumn_iterator < x_limit
                    
                    up = 0.25 * m_main(row_iterator - 1, coloumn_iterator);
                    right = 0.25 * m_main(row_iterator, coloumn_iterator + 1);
                    down = 0.25 * m_main(row_iterator + 1, coloumn_iterator);
                    left = 0.25 * m_main(row_iterator, coloumn_iterator - 1);
        
        
                    if row_iterator == 2
        
                        if coloumn_iterator == 2
        
                            m_temp(row_iterator, coloumn_iterator) = right + down;
        
                        elseif coloumn_iterator == x_limit - 1
                            
                            m_temp(row_iterator, coloumn_iterator) = left + down;
        
                        else
        
                            m_temp(row_iterator, coloumn_iterator) = left + right + down;
        
                        end
        
                    elseif row_iterator == y_limit - 1
        
                        if coloumn_iterator == 2
        
                            m_temp(row_iterator, coloumn_iterator) = up + right;
        
                        elseif coloumn_iterator == x_limit - 1
        
                            m_temp(row_iterator, coloumn_iterator) = up + left;
        
                        else
        
                            m_temp(row_iterator, coloumn_iterator) = up + left + right;
        
                        end
                        
                    else
        
                        if coloumn_iterator == 2
        
                            m_temp(row_iterator, coloumn_iterator) = up + right + down;
                            
        
                        elseif coloumn_iterator == x_limit - 1
                            
                            m_temp(row_iterator, coloumn_iterator) = up + left + down;
        
                        else
                            m_temp(row_iterator, coloumn_iterator) = up + right + down + left;
        
                        end
        
                    end
    
                else
    
                    if row_iterator == 1
                        
                        if coloumn_iterator == 1 || coloumn_iterator == x_limit
    
                            continue
    
                        else
    
                            m_temp(row_iterator, coloumn_iterator) = 0.25 * m_main(row_iterator + 1, coloumn_iterator);
    
                        end
    
                    elseif row_iterator == y_limit
    
                        if coloumn_iterator == 1 || coloumn_iterator == x_limit
                            
                            continue
    
                        else
                            
                            m_temp(row_iterator, coloumn_iterator) = 0.25 * m_main(row_iterator - 1, coloumn_iterator);
    
                        end
                        
                    else
                        
                        if coloumn_iterator == 1
    
                            m_temp(row_iterator, coloumn_iterator) = 0.25 * m_main(row_iterator, coloumn_iterator + 1);
    
                        elseif coloumn_iterator == x_limit
    
                            m_temp(row_iterator, coloumn_iterator) = 0.25 * m_main(row_iterator, coloumn_iterator - 1);
                        
                        else
    
                            disp("This was not supposed to happen")
                            return
    
                        end
                    end
                end
    
            end
    
        end
    
        m_side = m_main(:, :);
        m_side(2 : y_limit - 1, 2 : x_limit - 1) = 0;

        m_main = m_side + m_temp;
        
        M(:) = getframe;
        surf(X_main, Y_main, m_main)

        xlim([0 x_limit])
        ylim([0 y_limit])

    end

else

    disp("The minimum size should be 4 X 4 because of the semantics of Vishal's Approach!")
    return
    
end

disp("The code was executed, with sum of probability of all resulting positions:")
disp(sum(sum(m_main)))
