function [ result ] = rectangle_method( f, a, b )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%     interval_pts = linspace(a, b, 1000);
% 
%     result = 0;
%     interval_length = interval_pts(2) - interval_pts(1);
% 
%     for i = 1:999
% %         mid_pt = interval_pts(i) + (interval_pts(i + 1) - interval_pts(i)) / 2;
%         result = result + f(interval_pts(i)) * interval_length; 
%     end

    result = f(a) * (b - a);

end

