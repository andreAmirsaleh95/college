#include <stdio.h>

int sumNum(int n)
{
  int i;
  int retVal = 0;
  for (i=0;i<(n+1); i++ ){
    retVal += i;
  }
  return retVal;

}

void main(){
  int j = sumNum(10);
}
