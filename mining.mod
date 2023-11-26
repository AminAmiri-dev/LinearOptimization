/*********************************************
 * OPL 22.1.0.0 Model
 * Author: 4021321115
 * Creation Date: Nov 15, 2023 at 12:07:27 PM
 *********************************************/
int n= ...;
range I = 1..n;
dvar float+ delta[I][I][I];
float cost[I] = ...;
float profit = ...;
float coefficients[I][I][I] = ...;

maximize sum(i in I,j in I,k in I) ((coefficients[k][i][j]/100)*profit - cost[k])*delta[k][i][j];

subject to {
  forall(k in I,i in I,j in I){
    if(i <= k && j <= k && k < n){
      delta[k][i][j] <= 1;
	  delta[k][i][j] - delta[k+1][i+1][j  ] <= 0;
	  delta[k][i][j] - delta[k+1][i  ][j+1] <= 0;
	  delta[k][i][j] - delta[k+1][i+1][j+1] <= 0;
	  delta[k][i][j] - delta[k+1][i  ][j  ] <= 0;
    }else 
    if(k==n){
      delta[k][i][j] <= 1;
    }
  }
}  
