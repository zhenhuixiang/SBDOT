function [ EI_val, grad_EI ] = Obj_func_EI( obj, x_test )

    %EI_UNCONSTRAINED
    % Compute the Expected Improvement value for unconstrained case at x_test

    
    % Prediction value and error at test poin
    EI_val = zeros(size(x_test,1),prod(obj.prob.m_t));
    
    for i = 1 : prod(obj.prob.m_t)

        [ y_pred, MSE_pred ] = obj.meta_y.Predict( x_test, repmat(i, size(x_test, 1), 1) );

        EI_val(:,i) = -stk_sampcrit_ei_eval(y_pred, sqrt(abs( MSE_pred )), obj.y_ref_temp(i));

    end

    grad_EI=[];

end





% ==========================================================================
%
%    This file is part of SBDOT.
%
%    SBDOT is free software: you can redistribute it and/or modify
%    it under the terms of the GNU General Public License as published by
%    the Free Software Foundation, either version 3 of the License, or
%    (at your option) any later version.
%
%    SBDOT is distributed in the hope that it will be useful,
%    but WITHOUT ANY WARRANTY; without even the implied warranty of
%    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%    GNU General Public License for more details.
%
%    You should have received a copy of the GNU General Public License
%    along with SBDOT.  If not, see <http://www.gnu.org/licenses/>.
%
%    Use of SBDOT is free for personal, non-profit, pure academic research
%    and educational purposes. Restrictions apply on commercial or funded
%    research use. Please read the IMPORTANT_LICENCE_NOTICE file.
%
% ==========================================================================


