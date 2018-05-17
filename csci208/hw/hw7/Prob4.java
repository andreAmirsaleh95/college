public class Prob4 {
    public static int a = 3;
    
    public static int dbl(int x) {
        a = a + 1;
        System.out.println(a);
        return x + x;
    }
    
    public static int sqr(int x) {
        System.out.println(a);
        return x * x;
    }
    
    public static void main(String[] args) {
        System.out.println(sqr(dbl(a)));
    }
}